--[[
	* ReaScript Name: 'TikiPhonic: Library: MIDIFighter Twister - Select Bank'
	* Description: Helper - MIDIFighter Twister - Select Bank
	* Lua script for Cockos REAPER
	* Author: chrislundeen
	* Author URI: https://github.com/chrislundeen/
	* Licence: GPL v3
	* Version: 1.0
]]

function InitMidiFighterTwisterSelectBank(bank)
	device_name = 'DJ Tech Tools - Midi Fighter Twister 4'
	channel = 4
	bank = bank or 1 --(1-4)

	function setBank(device_name, channel, bank)
		-- get id
		for i =0,  reaper.GetNumMIDIOutputs() do
			local retval, name = reaper.GetMIDIOutputName( i, '' )
			s =  string.match(name, device_name)         
			if (tostring(name) == tostring(device_name)) then                    
				dev_id = i
				--reaper.ShowConsoleMsg(tostring(name).."\n" )
			end
		end
		if not dev_id then return end
		--[[
		8 = Note Off
		9 = Note On
		10 = AfterTouch (ie, key pressure)
		11 = Control Change
		12 = Program (patch) change
		13 = Channel Pressure
		14 = Pitch Wheel
		]]
		msg_type = 11 -- Control Change
		device = dev_id + 16
		reaper.StuffMIDIMessage(device, msg_type * 16 + channel-1, bank-1, 127);
	end
	setBank(device_name,channel, bank)

end

-- @description TikiPhonic: Library: Hardware: MIDIFighter Twister: Select Bank
-- @author: chrislundeen
-- @website https://github.com/chrislundeen/
-- @provides [nomain] .
-- @noindex
-- @version 0.0.1
-- @about
--   Library Function: Selects numbered bank for DJ TechTools MidiFighter Twister

function InitMidiFighterTwisterSelectBank(bank)
  bank = bank or 1 --(1-4)
  local device_name = 'DJ Tech Tools - Midi Fighter Twister 4'
  local channel = 4

  -- get id
  for i = 0, reaper.GetNumMIDIOutputs() do
    local retval, name = reaper.GetMIDIOutputName(i, '')
    s = string.match(name, device_name)
    if (tostring(name) == tostring(device_name)) then
      dev_id = i
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
  local msg_type = 11 -- Control Change
  local device = dev_id + 16
  reaper.StuffMIDIMessage(device, msg_type * 16 + channel - 1, bank - 1, 127);


end

--[[
	* ReaScript Name: 'TikiPhonic: MIDIFighter Twister - Select Bank -> 1'
	* Description: MIDIFighter Twister - Select Bank -> 1
	* Lua script for Cockos REAPER
	* Author: chrislundeen
	* Author URI: https://github.com/chrislundeen/
	* Licence: GPL v3
	* Version: 1.0
	* Instructions:
	*   helper script inspiration from X-Raym - https://gist.github.com/X-Raym/f7f6328b82fe37e5ecbb3b81aff0b744
]]
-- Set Helper Script --------------------------------------------
local script = "helpers/Tikiphonic Helper MIDIFighter Twister Select Bank.lua"
local script_folder = debug.getinfo(1).source:match("@?(.*[\\|/])")
local script_path = script_folder .. script
preset_file_init = true
if reaper.file_exists( script_path ) then
  dofile( script_path )
else
  reaper.MB("Missing helper script.\n" .. script_path, "Error", 0)
  return
end
-- End Set Helper Script ----------------------------------------


-- Params -------------------------------------------------------
bank = 1
-- End Params ---------------------------------------------------

Init()

-- @description TikiPhonic: Hardware: MIDIFighter Twister: (Select Bank 3)
-- @author chrislundeen
-- @website https://github.com/chrislundeen/
-- @version 0.0.1

--[[ 
  Selects Bank 1 for DJ TechTools MidiFighter Twister
]]

-- Init TikiPhonic --------------------------------------------
local library_files = {
  'Hardware Control/MidiFighter/Twister/Select Bank.lua'
}
function InitTikiPhonic(library_files) local library_path = reaper.GetResourcePath() .. '/Scripts/TikiPhonic-ReaScripts/_library/'; local library_filename; for library_file in ipairs(library_files) do library_filename = library_path .. library_files[library_file]; if reaper.file_exists(library_filename) then dofile(library_filename); else reaper.MB("Missing TikiPhonic library.\n" .. library_filename, "Error", 0); return; end end end; InitTikiPhonic(library_files);
-- End Init TikiPhonic ----------------------------------------

InitMidiFighterTwisterSelectBank(3)

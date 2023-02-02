-- @description TikiPhonic: Hardware: MIDIFighter Twister: (Select Bank 1)
-- @author: chrislundeen
-- @website https://github.com/chrislundeen/
-- @version 0.0.1
-- @about
--   Selects Bank 1 for DJ TechTools MidiFighter Twister

-- Init TikiPhonic --------------------------------------------
function InitTikiPhonic() local _library = reaper.GetResourcePath() .. '/Scripts/TikiPhonic-ReaScripts/_library/init.lua'; if reaper.file_exists(_library) then dofile(_library); else reaper.MB("Missing TikiPhonic library.\n" .. _library, "Error", 0); return; end end; InitTikiPhonic();
-- End Init TikiPhonic ----------------------------------------

InitMidiFighterTwisterSelectBank(1)

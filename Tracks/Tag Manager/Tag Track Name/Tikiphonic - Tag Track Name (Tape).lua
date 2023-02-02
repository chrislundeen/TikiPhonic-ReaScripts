-- @description TikiPhonic: Tag Track Name: [tape]
-- @author: chrislundeen
-- @website https://github.com/chrislundeen/
-- @version 0.0.1
-- @about
--   Tag Track Name: [tape]
--   - Tags follow format [tag] or {customtag}
--   - Tags are added at the end of track name
--   - Manages tags via toggle in track name

-- Init TikiPhonic --------------------------------------------
function InitTikiPhonic() local _library = reaper.GetResourcePath() .. '/Scripts/TikiPhonic-ReaScripts/_library/init.lua'; if reaper.file_exists(_library) then dofile(_library); else reaper.MB("Missing TikiPhonic library.\n" .. _library, "Error", 0); return; end end; InitTikiPhonic();
-- End Init TikiPhonic ----------------------------------------

InitTrackTagName('[tape]', false)

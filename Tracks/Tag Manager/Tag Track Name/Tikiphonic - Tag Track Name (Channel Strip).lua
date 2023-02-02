-- @description TikiPhonic: Tag Track Name: [channelstrip]
-- @author: chrislundeen
-- @website https://github.com/chrislundeen/
-- @version 0.0.1
-- @about
--   Tag Track Name: [channelstrip]
--   - Tags follow format [tag] or {customtag}
--   - Tags are added at the end of track name
--   - Manages tags via toggle in track name
--   - Passes in FXChain 'Channel Strip'

-- Init TikiPhonic --------------------------------------------
function InitTikiPhonic() local _library = reaper.GetResourcePath() .. '/Scripts/TikiPhonic-ReaScripts/_library/init.lua'; if reaper.file_exists(_library) then dofile(_library); else reaper.MB("Missing TikiPhonic library.\n" .. _library, "Error", 0); return; end end; InitTikiPhonic();
-- End Init TikiPhonic ----------------------------------------

InitTrackTagName('[channelstrip]', 'Channel Strip')

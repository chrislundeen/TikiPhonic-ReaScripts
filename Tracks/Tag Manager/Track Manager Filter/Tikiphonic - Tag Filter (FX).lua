-- @description TikiPhonic: Tag Filter: [fx]
-- @author: chrislundeen
-- @website https://github.com/chrislundeen/
-- @version 0.0.1
-- @about
--   Tag Filter Tracks: [fx]
--   - Filters Visible Tracks by Selected Tags
--   - Tags follow format [tag] or {customtag}
--   - Tags are found at the end of track name
--   - Manages visibility of tags via Track Manager filter field

-- Init TikiPhonic --------------------------------------------
function InitTikiPhonic() local _library = reaper.GetResourcePath() .. '/Scripts/TikiPhonic-ReaScripts/_library/init.lua'; if reaper.file_exists(_library) then dofile(_library); else reaper.MB("Missing TikiPhonic library.\n" .. _library, "Error", 0); return; end end; InitTikiPhonic();
-- End Init TikiPhonic ----------------------------------------

InitTagFilter('[fx]', false)

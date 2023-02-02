-- @description TikiPhonic: Tag Track Name: {user_defined_custom_tag}
-- @author: chrislundeen
-- @website https://github.com/chrislundeen/
-- @version 0.0.1
-- @about
--   Tag Track Name: {user_defined_custom_tag}
--   - Tags follow format [tag] or {customtag}
--   - Tags are added at the end of track name
--   - Manages tags via toggle in track name

-- Init TikiPhonic --------------------------------------------
function InitTikiPhonic() local _library = reaper.GetResourcePath() .. '/Scripts/TikiPhonic-ReaScripts/_library/init.lua'; if reaper.file_exists(_library) then dofile(_library); else reaper.MB("Missing TikiPhonic library.\n" .. _library, "Error", 0); return; end end; InitTikiPhonic();
-- End Init TikiPhonic ----------------------------------------

local retval_inputs, retvals_csv = reaper.GetUserInputs("Add Custom Track Tag", 1, "Tag", 'custom')
InitTrackTagName('{' .. retvals_csv .. '}', false)

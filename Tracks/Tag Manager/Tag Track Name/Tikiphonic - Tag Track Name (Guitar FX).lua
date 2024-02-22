-- @description TikiPhonic: Tag Track Name: [gfx]
-- @author chrislundeen
-- @website https://github.com/chrislundeen/
-- @version 0.0.1

--[[
  Tags follow format [tag] or {customtag}
  Tags are added at the end of track name
  Manages tags via toggle in track name
]]

-- Init TikiPhonic --------------------------------------------
local library_files = {
  'Tracks/Tag Manager/Tag Track Name.lua',
  'Tracks/Tag Manager/FXChain Toggle for Selected Track.lua'
}
function InitTikiPhonic(library_files) local library_path = reaper.GetResourcePath() .. '/Scripts/TikiPhonic-ReaScripts/_library/'; local library_filename; for library_file in ipairs(library_files) do library_filename = library_path .. library_files[library_file]; if reaper.file_exists(library_filename) then dofile(library_filename); else reaper.MB("Missing TikiPhonic library.\n" .. library_filename, "Error", 0); return; end end end; InitTikiPhonic(library_files);
-- End Init TikiPhonic ----------------------------------------

InitTrackTagName('[gfx]', false)

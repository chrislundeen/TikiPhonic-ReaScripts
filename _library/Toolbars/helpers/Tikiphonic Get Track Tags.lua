-- @description TikiPhonic: Get Filter Tags
-- @author chrislundeen
-- @website https://github.com/chrislundeen/
-- @version 0.0.1

--[[
  Gets Filter Tags from Track Manager, returns as object with "isChanged" flag
]]

--------------------------------------------
local library_files = {
  'Toolbars/helpers/Tikiphonic Get Tags From String.lua'
}
function InitTikiPhonic(library_files) local library_path = reaper.GetResourcePath() .. '/Scripts/TikiPhonic-ReaScripts/_library/'; local library_filename; for library_file in ipairs(library_files) do library_filename = library_path .. library_files[library_file]; if reaper.file_exists(library_filename) then dofile(library_filename); else reaper.MB("Missing TikiPhonic library.\n" .. library_filename, "Error", 0); return; end end end; InitTikiPhonic(library_files);
-- End Init TikiPhonic ----------------------------------------
-- global cache, last saved track manager filter value
cache_lastSelectedTrackTags = ""

function getTrackTags()
  local trackTags = {}

  -- Get number of selected tracks
  local selNum = reaper.CountSelectedTracks(0)

  -- Loop through selected tracks
  for i = 0, selNum - 1 do
    -- Get track
    track = reaper.GetSelectedTrack(0, i)

    if track then
      -- Get old name
      retval, content = reaper.GetTrackName(track, "")

      trackTags = getTagsFromString(content, cache_lastSelectedTrackTags)

      if (trackTags.isChanged) then
        cache_lastSelectedTrackTags = content
      end
    end
  end

  return trackTags
end

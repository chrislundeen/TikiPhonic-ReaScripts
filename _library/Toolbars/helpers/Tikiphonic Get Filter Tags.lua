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
cache_lastTrackManagerFilter = ""

function getFilterTags()
  local tm = reaper.JS_Window_Find('Track Manager', true)
  local filterTags = {}

--  if not tm or not reaper.JS_Window_IsVisible(tm) then
--    reaper.Main_OnCommand(40906, 0) -- View: Show track manager window
--    tm = reaper.JS_Window_Find('Track Manager', true)
--  end

  if tm then
    local filter = reaper.JS_Window_FindChildByID(tm, 0x3EF)
    local content = ''

    if filter then
      -- Get Contents of track manager filter
      content = reaper.JS_Window_GetTitle(filter)

      filterTags = getTagsFromString(content, cache_lastTrackManagerFilter)

      if (filterTags.isChanged) then
        cache_lastTrackManagerFilter = content
      end
    else
      return
    end
  end
  return filterTags
end

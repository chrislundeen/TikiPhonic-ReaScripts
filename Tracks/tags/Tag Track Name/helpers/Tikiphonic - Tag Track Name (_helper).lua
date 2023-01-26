--[[
    * ReaScript Name: 'TikiPhonic: Tag Track Name (_helper)'
    * Description: Helper - Tag Track Name - (Manage tags on Tracks)
    * Lua script for Cockos REAPER
    * Author: chrislundeen
    * Author URI: https://github.com/chrislundeen/
    * Licence: GPL v3
    * Version: 1.0
    * Instructions:
    *   parent script helper inspiration from X-Raym - https://gist.github.com/X-Raym/f7f6328b82fe37e5ecbb3b81aff0b744
]]

-- Global Parameter Defaults:
tagName = ''
isCustomTag = false

function Init()

    SCRIPT_NAME = "TikiPhonic: Tag Track Name (_helper)"
    
    -- Get number of selected tracks
    selNum = reaper.CountSelectedTracks(0)

    -- Begin undo-block
    reaper.Undo_BeginBlock2(0)

    -- Loop through selected tracks
    for i = 0, selNum-1 do
        -- Get track
        track = reaper.GetSelectedTrack(0, i)
        
        if track then 
            -- Get old name
            retval, content = reaper.GetTrackName(track, "")
            
            newDescription = content

            tags = {}
            for tag in content:gmatch('(%[%w+%])') do
                tags[string.lower(tag)] = 1
                removeTag = tag
                removeTag = removeTag:gsub("%[", "%%["):gsub("%]", "%%]")
                newDescription = newDescription:gsub(removeTag, "")
            end

            customTags = {}
            for ctag in content:gmatch('({%w+})') do
                customTags[string.lower(ctag)] = 1
                removeCTag = ctag
                newDescription = newDescription:gsub(removeCTag, "")
            end

            if isCustomTag then
                if customTags[string.lower(tagName)] == 1 then 
                    customTags[string.lower(tagName)] = nil
                else
                    customTags[string.lower(tagName)] = 1
                end
            else
                if tags[string.lower(tagName)] == 1 then 
                    tags[string.lower(tagName)] = nil
                else
                    tags[string.lower(tagName)] = 1
                end
            end

            tagCount = 0
            newTags = ''
            newCustomTags = ''
            for j,_ in pairs(tags) do
                newTags = newTags .. j
                tagCount = tagCount + 1
            end
            for k,_ in pairs(customTags) do
                newCustomTags = newCustomTags .. k
                tagCount = tagCount + 1
            end

            newDescription = newDescription:gsub("^%s*(.-)%s*$", "%1")

            -- Set new name
            retval, stringNeedBig = reaper.GetSetMediaTrackInfo_String(track, "P_NAME", newDescription .. " " .. newCustomTags .. newTags, true)
            
        end
        
    end

    -- End undo-block
    reaper.Undo_EndBlock2(0,SCRIPT_NAME,-1)

end

if not preset_file_init then -- If the file is run directly, it will execute Init(), else it will wait for Init() to be called explicitely from the preset scripts (usually after having modified some global variable states).
  Init()
end







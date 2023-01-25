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
filterAction = 'toggle' -- 'toggle', 'add', 'remove', 'clear'

function Init()

    SCRIPT_NAME = "TikiPhonic: Tag Track Name (_helper)"
    
    -- Get number of selected tracks
    selNum = reaper.CountSelectedTracks(0)

    -- Begin undo-block
    reaper.Undo_BeginBlock2(0)

    -- Loop through selected tracks
    renameNum = 0
    for i = 0, selNum-1 do
        -- Get track
        track = reaper.GetSelectedTrack(0, i)
        
        if track then 
            -- Get old name
            retval, oldName = reaper.GetTrackName(track, "")

            if oldName:find("%[") then
                trackDesc = string.gsub(oldName:match("([^%[]*)%["), "^%s*(.-)%s*$", "%1")
            else
                trackDesc = string.gsub(oldName, "^%s*(.-)%s*$", "%1")
            end

            newTags = ''
            tags = {}
            tagExists = false
            for tag in oldName:gmatch('(%[%w+%])') do
                if string.lower(tag) == string.lower(tagName) then
                    tagExists = true
                else
                    table.insert(tags, string.lower(tag))
                end
            end
            if not tagExists then 
                table.insert(tags, string.lower(tagName))
            end

            for _, tag in ipairs(tags) do
                newTags = newTags .. tag
            end

            -- Set new name
            retval, stringNeedBig = reaper.GetSetMediaTrackInfo_String(track, "P_NAME", trackDesc .. " " .. newTags, true)
            
        end

        renameNum = i + 1
        
    end

    -- Notify how many tracks were renamed
    -- str = renameNum .. " track(s) were renamed to " .. newTags .. " from " .. trackDesc .. ".\n"
    -- reaper.ShowMessageBox(str, SCRIPT_NAME, 0)

    -- End undo-block
    reaper.Undo_EndBlock2(0,SCRIPT_NAME,-1)

end

if not preset_file_init then -- If the file is run directly, it will execute Init(), else it will wait for Init() to be called explicitely from the preset scripts (usually after having modified some global variable states).
  Init()
end







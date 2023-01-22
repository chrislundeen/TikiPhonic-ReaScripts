--[[
    * ReaScript Name: 'TikiPhonic: Helper = Filter Tracks'
    * Description: Helper - Filter Tracks - (Manage tags on Track Manager filter field)
    * Lua script for Cockos REAPER
    * Author: chrislundeen
    * Author URI: https://github.com/chrislundeen/
    * Licence: GPL v3
    * Version: 1.0
    * Instructions:
    *   parent script helper inspiration from X-Raym - https://gist.github.com/X-Raym/f7f6328b82fe37e5ecbb3b81aff0b744
]]

-- Global Parameter Defaults:
filterText = ''
filterAction = 'toggle' -- 'toggle', 'add', 'remove', 'clear'

function Init()

    -- Track Manager Filter Enhancements

    local tm = reaper.JS_Window_Find('Track Manager', true)
    -- local filterText = ''

    -- filterText = '©'
    -- filterText = 'ß' -- Section
    -- filterText = 'å' -- Audio
    -- filterText = 'ƒ' -- FX
    -- filterText = 'µ' -- MIDI
    -- filterText = 'ø' -- xxxxxxx
    -- filterText = '√' -- xxxxxxx
    -- filterText = '' -- CLEAR

    if not tm or not reaper.JS_Window_IsVisible(tm) then
        reaper.Main_OnCommand(40906, 0) -- View: Show track manager window
        tm = reaper.JS_Window_Find('Track Manager', true)
    end 

    if tm then
        local filter = reaper.JS_Window_FindChildByID(tm, 0x3EF)
        local content = ''
        
        -- Get Contents of track manager filter
        if filter then 
            content = reaper.JS_Window_GetTitle(filter) 
        end
        
        -- Clear track manager filter
        if filter then 
            reaper.JS_Window_SetTitle(filter, filterText)
        end
        
        -- Set focus on track manager filter
        if filter then 
            reaper.JS_Window_SetFocus(filter) 
        end
    end


end

if not preset_file_init then -- If the file is run directly, it will execute Init(), else it will wait for Init() to be called explicitely from the preset scripts (usually after having modified some global variable states).
  Init()
end







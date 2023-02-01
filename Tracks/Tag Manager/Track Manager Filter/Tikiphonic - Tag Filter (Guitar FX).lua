--[[
  * ReaScript Name: 'TikiPhonic: Tag Filter (Guitar FX)'
  * Description: Tag Filter Tracks - Guitar FX ([gfx] tag on Track Manager filter field)
  * Lua script for Cockos REAPER
  * Author: chrislundeen
  * Author URI: https://github.com/chrislundeen/
  * Licence: GPL v3
  * Version: 1.0
]]
-- Init TikiPhonic --------------------------------------------
function InitTikiPhonic() local _library = reaper.GetResourcePath() .. '/Scripts/TikiPhonic-ReaScripts/_library/init.lua'; if reaper.file_exists(_library) then dofile(_library); else reaper.MB("Missing TikiPhonic library.\n" .. _library, "Error", 0); return; end end; InitTikiPhonic();
-- End Init TikiPhonic ----------------------------------------

InitTagFilter('[gfx]', false)

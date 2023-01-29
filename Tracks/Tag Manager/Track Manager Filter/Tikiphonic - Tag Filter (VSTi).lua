--[[
  * ReaScript Name: 'TikiPhonic: Tag Filter (VSTi)'
  * Description: Tag Filter Tracks - Instrument ([vsti] tag on Track Manager filter field)
  * Lua script for Cockos REAPER
  * Author: chrislundeen
  * Author URI: https://github.com/chrislundeen/
  * Licence: GPL v3
  * Version: 1.0
]]
-- Init TikiPhonic --------------------------------------------
function initTikiPhonic() local _library = reaper.GetResourcePath()..'/Scripts/TikiPhonic-ReaScripts/_library/init.lua'; if reaper.file_exists( _library ) then dofile( _library ); else reaper.MB("Missing TikiPhonic library.\n" .. _library, "Error", 0); return; end end;  initTikiPhonic();
-- End Init TikiPhonic ----------------------------------------

InitTagFilter('[vsti]', false)

--[[
  * ReaScript Name: 'TikiPhonic: Tag Track Name (Custom)'
  * Description: - Tag Track Name - (Manage tags on Tracks) - User Input Custom Tag
  * Lua script for Cockos REAPER
  * Author: chrislundeen
  * Author URI: https://github.com/chrislundeen/
  * Licence: GPL v3
  * Version: 1.0
]]
-- Init TikiPhonic --------------------------------------------
function InitTikiPhonic() local _library = reaper.GetResourcePath() .. '/Scripts/TikiPhonic-ReaScripts/_library/init.lua'; if reaper.file_exists(_library) then dofile(_library); else reaper.MB("Missing TikiPhonic library.\n" .. _library, "Error", 0); return; end end; InitTikiPhonic();
-- End Init TikiPhonic ----------------------------------------

local retval_inputs, retvals_csv = reaper.GetUserInputs("Add Custom Track Tag", 1, "Tag", 'custom')
InitTrackTagName('{' .. retvals_csv .. '}', false)

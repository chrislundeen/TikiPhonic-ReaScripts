--[[
  * ReaScript Name: 'TikiPhonicReaScripts'
  * Description: TikiPhonic ReaScripts
  * Lua scripts for Cockos REAPER
  * Author: chrislundeen
  * Author URI: https://github.com/chrislundeen/
  * Licence: GPL v3
  * Version: 1.0
  * Instructions:
  *   helper script inspiration from X-Raym - https://gist.github.com/X-Raym/f7f6328b82fe37e5ecbb3b81aff0b744
  *   rgbToHsv and hsvToRgb from Airon - Colour Swatch Window  https://forum.cockos.com/member.php?u=62784
]]

function ReaperIncludeLibraryFile(script)
  local script_path = reaper.GetResourcePath() .. '/Scripts/TikiPhonic-ReaScripts/_library/' .. script
  if reaper.file_exists(script_path) then
    dofile(script_path);
  else
    reaper.MB("Missing script.\n" .. script_path, "Error", 0);
    return;
  end
end

ReaperIncludeLibraryFile("Tracks/Tag Manager/Tag Filter.lua")
ReaperIncludeLibraryFile("Tracks/Tag Manager/Tag Track Name.lua")
ReaperIncludeLibraryFile("Tracks/Tag Manager/FXChain to Tagged Track.lua")
ReaperIncludeLibraryFile("Hardware Control/MidiFighter/Twister/Select Bank.lua")

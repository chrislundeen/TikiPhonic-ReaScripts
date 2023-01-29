--[[
  * ReaScript Name: 'TikiPhonic: FXChain to Tagged Track (Channel Strip)'
  * Description: - FXChain to Tagged Track (Channel Strip)
  * Lua script for Cockos REAPER
  * Author: chrislundeen
  * Author URI: https://github.com/chrislundeen/
  * Licence: GPL v3
  * Version: 1.0
]]
-- Init TikiPhonic --------------------------------------------
function initTikiPhonic() local _library = reaper.GetResourcePath()..'/Scripts/TikiPhonic-ReaScripts/_library/init.lua'; if reaper.file_exists( _library ) then dofile( _library ); else reaper.MB("Missing TikiPhonic library.\n" .. _library, "Error", 0); return; end end;  initTikiPhonic();
-- End Init TikiPhonic ----------------------------------------

InitFXChainToTaggedTrack('[channelstrip]', 'Channel Strip')

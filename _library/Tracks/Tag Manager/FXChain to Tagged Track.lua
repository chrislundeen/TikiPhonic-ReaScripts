--[[
    * ReaScript Name: 'TikiPhonic: Tag Track Name (_helper)'
    * Description: Helper - Tag Track Name - (Manage tags on Tracks)
    * Lua script for Cockos REAPER
    * Author: chrislundeen
    * Author URI: https://github.com/chrislundeen/
    * Licence: GPL v3
    * Version: 1.0
    * Instructions:
    *   http://forum.cockos.com/showthread.php?t=188335
]]


function AddChunkToTrack(tr, chunk) -- add empty fx chain chunk if not exists
    local _, chunk_ch = reaper.GetTrackStateChunk(tr, '', false)
    if not chunk_ch:match('FXCHAIN') then chunk_ch = chunk_ch:sub(0,-3)..'<FXCHAIN\nSHOW 0\nLASTSEL 0\n DOCKED 0\n>\n>\n' end
    if chunk then chunk_ch = chunk_ch:gsub('DOCKED %d', chunk) end
    reaper.SetTrackStateChunk(tr, chunk_ch, false)
end 

function removeFXChain(chunk)
    lines = {}
    for s in chunk:gmatch("[^\r\n]+") do
        if string.sub(s, 1, 1) == "<" then
        
          fxname = string.match(s, '%b""')
          fxname = string.gsub(fxname, '"', "")
          
          
          for fx = reaper.TrackFX_GetCount( track ), 1, -1 do
            local retval, buf = reaper.TrackFX_GetFXName( track, fx )
            match  = buf:lower():match(fxname:lower())
            if not match then           
              reaper.ShowMessageBox("Will Remove.", fxname, 0)
              --reaper.TrackFX_Delete(track, fx-1) 
            end
          end

          
          table.insert(lines, s)
        end
    end
end 

function InitFXChainToTaggedTrack(tagName, FXChain)
  -- Global Parameter Defaults:
  tagName = tagName or '[channelstrip]'
  FXChain = FXChain or 'Channel Strip'

    SCRIPT_NAME = "TikiPhonic: Tag Track Name (_helper)"
    
    -- Get number of selected tracks
    selNum = reaper.CountSelectedTracks(0)

    -- Begin undo-block
    reaper.Undo_BeginBlock2(0)

    -- Loop through selected tracks (make this all tracks next)
    for i = 0, selNum-1 do
        -- Get track
        track = reaper.GetSelectedTrack(0, i)
        
        if track then 

            -- Get name
            retval, content = reaper.GetTrackName(track, "")
            
            newDescription = content

            -- collect tags and custom tags
            tags = {}
            for tag in content:gmatch('(%[%w+%])') do

                -- here we go, add FXChain if tag matched
                if tagName == string.lower(tag) then 

                    local FXPath = reaper.GetResourcePath()..'/FXChains/'
                    local FXChainInstance = FXPath .. FXChain .. ".RfxChain"

                    -- retval, filenameNeed4096 = reaper.GetUserFileNameForRead(FXPath, '', '' )
                    -- reaper.ShowMessageBox("tagName: " .. tagName, "name! " .. FXChainInstance, 0)
                    
                    --if retval and FXChainInstance then
                      local f = io.open(FXChainInstance,'r')
                      if f then
                        chunkContent = f:read('a')
                        f:close()
                        removeFXChain(chunkContent)
                        --AddChunkToTrack(track, chunkContent)
                      end
                    --end

                end

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

            --for j,_ in pairs(tags) do
            --    newTags = newTags .. j
            --    tagCount = tagCount + 1
            --end
            --for k,_ in pairs(customTags) do
            --    newCustomTags = newCustomTags .. k
            --    tagCount = tagCount + 1
            --end

            -- newDescription = newDescription:gsub("^%s*(.-)%s*$", "%1")

            -- Set new name
            -- retval, stringNeedBig = reaper.GetSetMediaTrackInfo_String(track, "P_NAME", newDescription .. " " .. newCustomTags .. newTags, true)
            
        end
        
    end

    -- End undo-block
    reaper.Undo_EndBlock2(0,SCRIPT_NAME,-1)

end

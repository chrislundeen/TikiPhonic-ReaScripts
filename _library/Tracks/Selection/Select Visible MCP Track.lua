-- @description TikiPhonic: Select Visible MCP Track
-- @author chrislundeen
-- @website https://github.com/chrislundeen/
-- @provides [nomain] .
-- @noindex
-- @version 0.0.1

--[[
  Selects Visible Track in MCP
]]

function SelectVisibleMCPTrack(direction)
  local CountTrack = reaper.CountTracks(0);
  if CountTrack == 0 then return; end

  local function isTrackVisible(track)
    if reaper.GetMediaTrackInfo_Value(track, 'B_SHOWINMIXER') > 0 then
      return true;
    end
    return false;
  end

  reaper.Undo_BeginBlock();
  reaper.PreventUIRefresh(1);
  local visibleTracks = {}
  local selectedTrack
  local iVisible = 0

  for i = 1, CountTrack do
    local track = reaper.GetTrack(0, i - 1);
    local sel = reaper.GetMediaTrackInfo_Value(track, 'I_SELECTED');
    if sel > 0 then
      selectedTrack = track;
    end
    reaper.SetTrackSelected(track, false)
    local isVisible = isTrackVisible(track);
    if isVisible then
      iVisible = iVisible + 1
      visibleTracks[iVisible] = track;
    end
  end

  local MasterTrack = reaper.GetMasterTrack(0);

  if iVisible > 0 then
    local iSelected = 0
    local iPrev = 0
    local iNext = 0
    local PrevTrack
    local NextTrack
    for j, _ in pairs(visibleTracks) do
      local checkTrack = visibleTracks[j];
      if checkTrack == selectedTrack then
        iSelected = j
        iPrev = j - 1
        iNext = j + 1
      end
    end
    reaper.SetTrackSelected(MasterTrack, false)

    if selectedTrack == MasterTrack then
      -- On master track, keep PrevTrack as Master, set NextTrack as first visible
      PrevTrack = MasterTrack
      NextTrack = visibleTracks[1]
    else
      if iPrev < 1 then
        -- prev track before beginning, select master track
        PrevTrack = MasterTrack
      else
        PrevTrack = visibleTracks[iPrev]
        retval, prevTrackName = reaper.GetTrackName(PrevTrack, "")
      end
      if iNext > iVisible then
        -- next track after end, select last track
        iNext = iVisible
      end
      if iNext == 0 then
        -- Master track selected, set iNext to first visible track
        iNext = 1
      end
      NextTrack = visibleTracks[iNext]
      retval, nextTrackName = reaper.GetTrackName(NextTrack, "")
    end

    if direction == 'previous' then
      reaper.SetTrackSelected(PrevTrack, true)
      reaper.SetMixerScroll(PrevTrack)
    else
      reaper.SetTrackSelected(NextTrack, true)
      reaper.SetMixerScroll(NextTrack)
    end
  else
    -- no visible tracks, we should select master track!
    reaper.SetTrackSelected(MasterTrack, true)
  end

  reaper.PreventUIRefresh(-1);
  reaper.Undo_EndBlock('Reset height unselected tracks MCP by master track', -1);
end

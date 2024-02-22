-- @description TikiPhonic: Get Filter Tags
-- @author chrislundeen
-- @website https://github.com/chrislundeen/
-- @version 0.0.1

--[[
  Gets Filter Tags from string, returns as object with "isChanged" flag
]]
function getTagsFromString(content, compare)
  local isChanged = false

  if (content ~= compare) then
    --savedTrackManagerFilter = content
    isChanged = true
  end

  local tags = {}
  for tag in content:gmatch('(%[%w+%])') do
    tags[string.lower(tag)] = string.lower(tag)
  end

  local customTags = {}
  for ctag in content:gmatch('({%w+})') do
    customTags[string.lower(ctag)] = string.lower(ctag)
  end

  return {
    tags = tags,
    customTags = customTags,
    isChanged = isChanged
  }
end

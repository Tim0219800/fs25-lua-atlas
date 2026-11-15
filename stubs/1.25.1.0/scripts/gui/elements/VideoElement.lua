---@meta
-- FS25 1.25.1.0 : gui/elements/VideoElement.lua (generated stub, FS25 Lua Atlas)

---@class VideoElement : GuiElement
VideoElement = {}

---@param target any
---@param custom_mt any
function VideoElement.new(target, custom_mt) end

---@param xmlFile any
---@param key any
function VideoElement:loadFromXML(xmlFile, key) end

---@param profile any
---@param applyProfile any
function VideoElement:loadProfile(profile, applyProfile) end

---@param src any
function VideoElement:copyAttributes(src) end

function VideoElement:delete() end

---@param filename any
function VideoElement:loadSubtitles(filename) end

---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param button any
---@param eventUsed any
function VideoElement:mouseEvent(posX, posY, isDown, isUp, button, eventUsed) end

---@param unicode any
---@param sym any
---@param modifier any
---@param isDown any
---@param eventUsed any
function VideoElement:keyEvent(unicode, sym, modifier, isDown, eventUsed) end

---@param dt any
function VideoElement:update(dt) end

---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
function VideoElement:draw(clipX1, clipY1, clipX2, clipY2) end

function VideoElement:onEndVideo() end

function VideoElement:disposeVideo() end

function VideoElement:getIsActive() end

function VideoElement:playVideo() end

function VideoElement:stopVideo() end

---@param newVideoFilename any
---@param volume any
---@param duration any
function VideoElement:changeVideo(newVideoFilename, volume, duration) end

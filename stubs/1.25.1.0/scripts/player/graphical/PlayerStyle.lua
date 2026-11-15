---@meta
-- FS25 1.25.1.0 : player/graphical/PlayerStyle.lua (stub généré, atlas Lua FS25)

---@class PlayerStyle
PlayerStyle = {}

---@param customMt any
---@return table
function PlayerStyle.new(customMt) end

---@param streamId integer
---@param connection table
function PlayerStyle:writeStream(streamId, connection) end

---@param streamId integer
---@param connection table
function PlayerStyle:readStream(streamId, connection) end

---@param other PlayerStyle
function PlayerStyle:copyFrom(other) end

---@param other PlayerStyle
function PlayerStyle:copyConfigurationFrom(other) end

---@param other PlayerStyle
function PlayerStyle:copySelectionFrom(other) end

---@param xmlFilename any
function PlayerStyle:loadConfigurationXML(xmlFilename) end

---@param x number
---@param y number
---@param textSize number
---@return number
function PlayerStyle:debugDraw(x, y, textSize) end

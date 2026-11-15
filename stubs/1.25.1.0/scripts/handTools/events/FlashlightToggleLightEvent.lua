---@meta
-- FS25 1.25.1.0 : handTools/events/FlashlightToggleLightEvent.lua (stub généré, atlas Lua FS25)

---@class FlashlightToggleLightEvent : Event
FlashlightToggleLightEvent = {}

---@return table
function FlashlightToggleLightEvent.emptyNew() end

---@param flashlight HandTool
---@param isActive boolean
---@return table
function FlashlightToggleLightEvent.new(flashlight, isActive) end

---@param streamId integer
---@param connection table
function FlashlightToggleLightEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection table
function FlashlightToggleLightEvent:writeStream(streamId, connection) end

---@param connection table
function FlashlightToggleLightEvent:run(connection) end

---@param flashlight any
---@param isActive any
---@param noEventSend any
function FlashlightToggleLightEvent.sendEvent(flashlight, isActive, noEventSend) end

---@meta
-- FS25 1.25.1.0 : objects/PackedBale.lua (generated stub, FS25 Lua Atlas)

---@class PackedBale : Bale
PackedBale = {}

---@class PackedBaleActivatable
PackedBaleActivatable = {}

---@param isServer boolean
---@param isClient boolean
---@param customMt table?
---@return table
function PackedBale.new(isServer, isClient, customMt) end

function PackedBale:delete() end

---@param xmlFile table
function PackedBale:loadBaleAttributesFromXML(xmlFile) end

---@param noEventSend boolean
function PackedBale:unpack(noEventSend) end

function PackedBale:getCanInteract() end

function PackedBale:getInteractionPosition() end

---@param packedBale any
function PackedBaleActivatable.new(packedBale) end

function PackedBaleActivatable:getIsActivatable() end

function PackedBaleActivatable:run() end

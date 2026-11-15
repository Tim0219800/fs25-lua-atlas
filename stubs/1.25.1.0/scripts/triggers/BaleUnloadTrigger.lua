---@meta
-- FS25 1.25.1.0 : triggers/BaleUnloadTrigger.lua (generated stub, FS25 Lua Atlas)

---@class BaleUnloadTrigger : UnloadTrigger
BaleUnloadTrigger = {}

---@param schema any
---@param basePath any
function BaleUnloadTrigger.registerXMLPaths(schema, basePath) end

---@param isServer boolean
---@param isClient boolean
---@param customMt table?
---@return table
function BaleUnloadTrigger.new(isServer, isClient, customMt) end

---@param components table
---@param xmlFile table
---@param xmlNode string
---@param target table
---@param extraAttributes table
---@param i3dMappings table
---@return boolean
function BaleUnloadTrigger:load(components, xmlFile, xmlNode, target, extraAttributes, i3dMappings) end

function BaleUnloadTrigger:delete() end

---@param dt number
function BaleUnloadTrigger:update(dt) end

---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
---@param otherShapeId integer
function BaleUnloadTrigger:baleTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay, otherShapeId) end

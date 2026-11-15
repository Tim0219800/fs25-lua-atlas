---@meta
-- FS25 1.25.1.0 : triggers/PalletUnloadTrigger.lua (stub généré, atlas Lua FS25)

---@class PalletUnloadTrigger : UnloadTrigger
PalletUnloadTrigger = {}

---@param schema any
---@param basePath any
function PalletUnloadTrigger.registerXMLPaths(schema, basePath) end

---@param isServer boolean
---@param isClient boolean
---@param customMt table?
---@return table
function PalletUnloadTrigger.new(isServer, isClient, customMt) end

---@param components table
---@param xmlFile table
---@param xmlNode string
---@param target table
---@param extraAttributes table
---@param i3dMappings table
---@return boolean
function PalletUnloadTrigger:load(components, xmlFile, xmlNode, target, extraAttributes, i3dMappings) end

function PalletUnloadTrigger:delete() end

---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
---@param otherShapeId integer
function PalletUnloadTrigger:palletTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay, otherShapeId) end

---@meta
-- FS25 1.25.1.0 : triggers/UnloadTrigger.lua (generated stub, FS25 Lua Atlas)

---@class UnloadTrigger : Object
UnloadTrigger = {}

---@param schema any
---@param basePath any
function UnloadTrigger.registerXMLPaths(schema, basePath) end

---@param isServer boolean
---@param isClient boolean
---@param customMt table?
---@return table
function UnloadTrigger.new(isServer, isClient, customMt) end

---@param components table
---@param xmlFile table
---@param xmlNode string
---@param target table
---@param extraAttributes table
---@param i3dMappings table
---@return boolean
function UnloadTrigger:load(components, xmlFile, xmlNode, target, extraAttributes, i3dMappings) end

function UnloadTrigger:delete() end

---@param xmlFile XMLFile
---@param xmlNode string
function UnloadTrigger:loadAcceptedToolType(xmlFile, xmlNode) end

---@param xmlFile XMLFile
---@param xmlNode string
function UnloadTrigger:loadFillTypes(xmlFile, xmlNode) end

---@param object table
function UnloadTrigger:setTarget(object) end

---@param node integer
function UnloadTrigger:getFillUnitIndexFromNode(node) end

---@param fillUnitIndex integer
function UnloadTrigger:getFillUnitExactFillRootNode(fillUnitIndex) end

---@param farmId integer
---@param fillUnitIndex integer
---@param fillLevelDelta number
---@param fillTypeIndex integer
---@param toolType table
---@param fillPositionData table
---@param extraAttributes any
---@return number
function UnloadTrigger:addFillUnitFillLevel(farmId, fillUnitIndex, fillLevelDelta, fillTypeIndex, toolType, fillPositionData, extraAttributes) end

---@param fillUnitIndex integer
---@param fillType integer
---@return boolean
function UnloadTrigger:getFillUnitAllowsFillType(fillUnitIndex, fillType) end

---@param fillType integer
---@return boolean
function UnloadTrigger:getIsFillTypeAllowed(fillType) end

---@param fillType integer
---@return boolean
function UnloadTrigger:getIsFillTypeSupported(fillType) end

---@param fillUnitIndex integer
---@param fillTypeIndex integer
---@param farmId any
---@return number
function UnloadTrigger:getFillUnitFreeCapacity(fillUnitIndex, fillTypeIndex, farmId) end

---@param toolType integer
---@return boolean
function UnloadTrigger:getIsToolTypeAllowed(toolType) end

function UnloadTrigger:getCustomDischargeNotAllowedWarning() end

---@param xmlFile XMLFile
---@param xmlPath string
---@param customEnvironment string?
---@param baseDir string?
---@return table?
function UnloadTrigger.loadSpecValueFillTypes(xmlFile, xmlPath, customEnvironment, baseDir) end

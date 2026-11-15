---@meta
-- FS25 1.25.1.0 : vehicles/VehicleCharacter.lua (generated stub, FS25 Lua Atlas)

---@class VehicleCharacter
VehicleCharacter = {}

---@param vehicle any
---@param customMt any
function VehicleCharacter.new(vehicle, customMt) end

---@param xmlFile any
---@param xmlNode any
function VehicleCharacter:load(xmlFile, xmlNode) end

function VehicleCharacter:getParentComponent() end

---@param playerStyle any
---@param asyncCallbackObject any
---@param asyncCallbackFunction any
---@param asyncCallbackArguments any
function VehicleCharacter:loadCharacter(playerStyle, asyncCallbackObject, asyncCallbackFunction, asyncCallbackArguments) end

---@param loadingState any
---@param arguments any
function VehicleCharacter:characterLoaded(loadingState, arguments) end

function VehicleCharacter:delete() end

function VehicleCharacter:unloadCharacter() end

---@param setAllDirty any
function VehicleCharacter:setDirty(setAllDirty) end

function VehicleCharacter:updateIKChains() end

---@param target any
---@param poseId any
function VehicleCharacter:setIKChainPoseByTarget(target, poseId) end

---@param acc any
function VehicleCharacter:setSpineDirty(acc) end

function VehicleCharacter:updateVisibility() end

---@param isVisible any
function VehicleCharacter:setCharacterVisibility(isVisible) end

---@param state any
function VehicleCharacter:setAllowCharacterUpdate(state) end

function VehicleCharacter:getAllowCharacterUpdate() end

---@param dt any
function VehicleCharacter:update(dt) end

function VehicleCharacter:getIKChainTargets() end

---@param targets any
---@param force any
function VehicleCharacter:setIKChainTargets(targets, force) end

function VehicleCharacter:getPlayerStyle() end

---@param schema any
---@param basePath any
---@param name any
function VehicleCharacter.registerCharacterXMLPaths(schema, basePath, name) end

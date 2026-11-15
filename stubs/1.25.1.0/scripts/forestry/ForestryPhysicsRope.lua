---@meta
-- FS25 1.25.1.0 : forestry/ForestryPhysicsRope.lua (stub généré, atlas Lua FS25)

---@class ForestryPhysicsRope
ForestryPhysicsRope = {}

---@param vehicle any
---@param linkActor any
---@param linkNode any
---@param isServer any
---@param customMt any
function ForestryPhysicsRope.new(vehicle, linkActor, linkNode, isServer, customMt) end

---@param schema any
---@param baseKey any
function ForestryPhysicsRope.registerXMLPaths(schema, baseKey) end

---@param schema any
---@param baseKey any
function ForestryPhysicsRope.registerSavegameXMLPaths(schema, baseKey) end

---@param xmlFile any
---@param key any
---@param minLength any
---@param maxLength any
---@param baseDirectory any
function ForestryPhysicsRope:loadFromXML(xmlFile, key, minLength, maxLength, baseDirectory) end

---@param linkActor integer?
---@param linkNode integer?
---@param maxLength number?
---@return ForestryPhysicsRope?
function ForestryPhysicsRope:clone(linkActor, linkNode, maxLength) end

---@param xmlFile any
---@param key any
function ForestryPhysicsRope:saveToXMLFile(xmlFile, key) end

---@param xmlFile any
---@param key any
function ForestryPhysicsRope.loadPositionDataFromSavegame(xmlFile, key) end

function ForestryPhysicsRope:delete() end

---@param streamId any
function ForestryPhysicsRope:writeStream(streamId) end

---@param streamId any
---@param invert any
function ForestryPhysicsRope.readStream(streamId, invert) end

---@param streamId any
function ForestryPhysicsRope:writeUpdateStream(streamId) end

---@param streamId any
function ForestryPhysicsRope:readUpdateStream(streamId) end

---@param dt any
function ForestryPhysicsRope:update(dt) end

function ForestryPhysicsRope:updateAnchorNodes() end

---@param useDynamicLength any
function ForestryPhysicsRope:setUseDynamicLength(useDynamicLength) end

---@param savegamePositions any
function ForestryPhysicsRope:applySavegamePositions(savegamePositions) end

---@param otherRope any
---@param invert any
function ForestryPhysicsRope:copyNodePositions(otherRope, invert) end

---@param targetActor any
---@param targetNode any
---@param linkActor any
---@param linkNode any
---@param inverted any
---@param useNodePositions any
---@param callback any
---@param callbackTarget any
function ForestryPhysicsRope:create(targetActor, targetNode, linkActor, linkNode, inverted, useNodePositions, callback, callbackTarget) end

---@param targetNode any
---@param linkNode any
function ForestryPhysicsRope:setCustomVisualNodes(targetNode, linkNode) end

function ForestryPhysicsRope:destroy() end

---@param maxLength any
function ForestryPhysicsRope:setMaxLength(maxLength) end

function ForestryPhysicsRope:generateNodes() end

---@param referenceMaxLength any
function ForestryPhysicsRope:getRopeDirectLengthPercentage(referenceMaxLength) end

function ForestryPhysicsRope:getLength() end

---@param length any
function ForestryPhysicsRope:setLength(length) end

---@param lengthDelta any
---@param sumUp any
function ForestryPhysicsRope:adjustLength(lengthDelta, sumUp) end

---@param visibility any
function ForestryPhysicsRope:setVisibility(visibility) end

---@param r any
---@param g any
---@param b any
---@param a any
function ForestryPhysicsRope:setEmissiveColor(r, g, b, a) end

---@param i3dNode any
---@param failedReason any
function ForestryPhysicsRope:onI3DLoaded(i3dNode, failedReason) end

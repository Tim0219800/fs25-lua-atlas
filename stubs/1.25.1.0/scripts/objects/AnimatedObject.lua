---@meta
-- FS25 1.25.1.0 : objects/AnimatedObject.lua (generated stub, FS25 Lua Atlas)

---@class AnimatedObject : Object
AnimatedObject = {}

---@class AnimatedObjectBuilder
AnimatedObjectBuilder = {}

---@param isServer boolean
---@param isClient boolean
---@param customMt table?
---@return table
function AnimatedObject.new(isServer, isClient, customMt) end

---@param rootNode integer|table
---@param xmlFile XMLFile
---@param key string
---@param xmlFilename string
---@param i3dMappings table?
---@return boolean
function AnimatedObject:load(rootNode, xmlFile, key, xmlFilename, i3dMappings) end

---@param xmlFile XMLFile
---@param key string
---@param node integer
---@return number
---@return number
---@return number
---@return number
---@return number
---@return number
---@return number
---@return number
---@return number
---@return integer
function AnimatedObject:loadFrameValues(xmlFile, key, node) end

function AnimatedObject:delete() end

---@param streamId integer
---@param connection table
function AnimatedObject:readStream(streamId, connection) end

---@param streamId integer
---@param connection table
function AnimatedObject:writeStream(streamId, connection) end

---@param streamId integer
---@param timestamp integer
---@param connection table
function AnimatedObject:readUpdateStream(streamId, timestamp, connection) end

---@param streamId integer
---@param connection table
---@param dirtyMask integer
function AnimatedObject:writeUpdateStream(streamId, connection, dirtyMask) end

---@param xmlFile XMLFile
---@param key string
---@return boolean
function AnimatedObject:loadFromXMLFile(xmlFile, key) end

---@param dt number
function AnimatedObject:update(dt) end

---@param t number
---@param omitSound any
function AnimatedObject:setAnimTime(t, omitSound) end

---@param node integer
---@param v table
function AnimatedObject:setFrameValues(node, v) end

function AnimatedObject:hourChanged() end

---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
function AnimatedObject:triggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end

---@param schema any
---@param basePath any
function AnimatedObject.registerXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function AnimatedObject.registerSavegameXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function AnimatedObjectBuilder.registerXMLPaths(schema, basePath) end

---@param animatedObject any
---@param xmlFilename any
---@param saveId any
function AnimatedObjectBuilder.new(animatedObject, xmlFilename, saveId) end

---@param rootNodeId any
function AnimatedObjectBuilder:build(rootNodeId) end

---@param node any
function AnimatedObjectBuilder:setTrigger(node) end

---@param posAction any
---@param posText any
---@param negAction any
---@param negText any
function AnimatedObjectBuilder:setActions(posAction, posText, negAction, negText) end

---@param node any
---@param openRotation any
---@param openTranslation any
function AnimatedObjectBuilder:addSimplePart(node, openRotation, openTranslation) end

---@param duration any
function AnimatedObjectBuilder:setDuration(duration) end

---@param xmlFile any
---@param key any
---@param rootNode any
function AnimatedObjectBuilder:setSounds(xmlFile, key, rootNode) end

---@param startTime any
---@param endTime any
---@param disableIfClosed any
---@param closedText any
function AnimatedObjectBuilder:setOpeningTimes(startTime, endTime, disableIfClosed, closedText) end

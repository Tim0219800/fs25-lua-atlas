---@meta
-- FS25 1.25.1.0 : objects/AnimatedObject.lua (generated stub, FS25 Lua Atlas)

--- Networked Object subclass for placeable or map animated objects such as doors, gates and barriers. An animation has a normalised time from 0 to 1 and a direction (-1, 0, 1) driven by the server: node keyframes (translation, rotation, scale, visibility), shader parameter keyframes, an optional i3d clip and rolling gate animations. Optional features: player trigger with input actions, opening hours linked to the hour-changed message, moving and end sounds. The file also holds AnimatedObjectBuilder, a helper to build an animated object from code, and the XML schema registration.
---@class AnimatedObject : Object
AnimatedObject = {}

--- Networked Object subclass for placeable or map animated objects such as doors, gates and barriers. An animation has a normalised time from 0 to 1 and a direction (-1, 0, 1) driven by the server: node keyframes (translation, rotation, scale, visibility), shader parameter keyframes, an optional i3d clip and rolling gate animations. Optional features: player trigger with input actions, opening hours linked to the hour-changed message, moving and end sounds. The file also holds AnimatedObjectBuilder, a helper to build an animated object from code, and the XML schema registration.
---@class AnimatedObjectBuilder
AnimatedObjectBuilder = {}

--- Constructor: creates the Object with its server/client flags and initialises the controls table, network time and animation-time interpolators, and an AnimatedObjectActivatable bound to this object.
---@param isServer boolean
---@param isClient boolean
---@param customMt table?
---@return table
function AnimatedObject.new(isServer, isClient, customMt) end

--- Loads the object from an XML key: reads saveId, animation duration, part and shader keyframes (normalised by the largest key time into animation curves), optional clip (shared i3d loaded asynchronously), rolling gates, initialTime, openingHours, trigger node with posAction/negAction controls, and sounds on clients. Static rigid-body parts are skipped with a warning. Calls applyAnimation and onSharedAnimationFileLoaded, which are not defined in this file (UNVERIFIED). Returns true.
---@param rootNode integer|table
---@param xmlFile XMLFile
---@param key string
---@param xmlFilename string
---@param i3dMappings table?
---@return boolean
function AnimatedObject:load(rootNode, xmlFile, key, xmlFilename, i3dMappings) end

--- Reads one keyframe from XML and returns ten values (translation, rotation, scale, visibility 1 or 0). Any missing component defaults to the node's current transform; visibility defaults to visible.
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

--- Releases everything the object owns: trigger callbacks, sounds, the shared i3d request, the activatable registration and message-center subscriptions, flags it deleted, then calls the parent delete.
function AnimatedObject:delete() end

--- Client side, when joining: after the parent read, reads the animation time (float32) and direction (2 bits, stored as direction + 1), applies the time at once and resets the network interpolators.
---@param streamId integer
---@param connection table
function AnimatedObject:readStream(streamId, connection) end

--- Server side, when a client joins: after the parent write, sends the current animation time (float32) and direction (2 bits, direction + 1).
---@param streamId integer
---@param connection table
function AnimatedObject:writeStream(streamId, connection) end

--- Client side: when the dirty bit is set, starts a new network interpolation phase and reads the target animation time and direction sent by the server.
---@param streamId integer
---@param timestamp integer
---@param connection table
function AnimatedObject:readUpdateStream(streamId, timestamp, connection) end

--- Server side: writes a bool for the object's dirty flag, and if set, the last sent animation time (animation.timeSend) and the direction.
---@param streamId integer
---@param connection table
---@param dirtyMask integer
function AnimatedObject:writeUpdateStream(streamId, connection, dirtyMask) end

--- Restores state from a savegame key: if #time exists, applies it (and #direction, default 0), then re-evaluates the opening hours. Returns true.
---@param xmlFile XMLFile
---@param key string
---@return boolean
function AnimatedObject:loadFromXMLFile(xmlFile, key) end

--- Per-frame update. Server: advances the animation time by direction * dt / duration (ms), stops at 0 or 1, reopens the AI blocking region when it ends, and raises the dirty flag when time changed. Client: interpolates toward the network time. Both manage moving and end sounds and keep the object active while moving.
---@param dt number
function AnimatedObject:update(dt) end

--- Clamps t to 0..1 and applies it to every part (translation, rotation, scale, visibility), shader parameter, i3d clip and rolling gate, then stores the time and flags the object as moving. Returns the clamped time. The omitSound argument is not used in the body.
---@param t number
---@param omitSound any
function AnimatedObject:setAnimTime(t, omitSound) end

--- Applies a table of ten values (translation, rotation, scale, visibility flag) directly to a node.
---@param node integer
---@param v table
function AnimatedObject:setFrameValues(node, v) end

--- Server only. Compares the environment's current hour with the opening hours: starts opening (direction 1) or closing (direction -1) once on each transition and, if disableIfClosed is set, toggles isEnabled. Does nothing without opening hours or an environment.
function AnimatedObject:hourChanged() end

--- Trigger callback. In career savegames only, when the local player's root node enters or leaves the trigger, adds or removes the activatable from the activatable objects system and keeps the object active.
---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
function AnimatedObject:triggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end

--- Registers the XML schema paths of an animatedObject entry: saveId, animation (parts, shaders, clip, rolling gate, duration, initialTime), openingHours, controls and sounds.
---@param schema any
---@param basePath any
function AnimatedObject.registerXMLPaths(schema, basePath) end

--- Registers the savegame XML attributes #time (float) and #direction (int, default 0).
---@param schema any
---@param basePath any
function AnimatedObject.registerSavegameXMLPaths(schema, basePath) end

--- Registers only the sound sample paths (moving, posEnd, negEnd) under the given base path for builder-created objects.
---@param schema any
---@param basePath any
function AnimatedObjectBuilder.registerXMLPaths(schema, basePath) end

--- Creates a builder for an existing animated object: sets its base directory, mod name and saveId, and gives it an empty animation (duration 1000 ms, time 0, direction 0) and isEnabled = true.
---@param animatedObject any
---@param xmlFilename any
---@param saveId any
function AnimatedObjectBuilder.new(animatedObject, xmlFilename, saveId) end

--- Finalises construction: applies animation time 0, subscribes to the hour-changed message if opening hours exist, registers trigger callbacks on the trigger node and its children, and allocates the dirty flag. Returns true. The rootNodeId argument is unused.
---@param rootNodeId any
function AnimatedObjectBuilder:build(rootNodeId) end

--- Stores the player trigger node on the animated object.
---@param node any
function AnimatedObjectBuilder:setTrigger(node) end

--- Sets the positive and optional negative input actions and their texts (translated when a matching l10n entry exists). Unknown action names produce a warning and are ignored.
---@param posAction any
---@param posText any
---@param negAction any
---@param negText any
function AnimatedObjectBuilder:setActions(posAction, posText, negAction, negText) end

--- Adds a node animated between its current transform (time 0) and the given open rotation and/or translation (time 1), with scale unchanged and visibility on.
---@param node any
---@param openRotation any
---@param openTranslation any
function AnimatedObjectBuilder:addSimplePart(node, openRotation, openTranslation) end

--- Sets the animation duration. The value is stored as is; elsewhere in the file it is treated in milliseconds (the builder default is 1000).
---@param duration any
function AnimatedObjectBuilder:setDuration(duration) end

--- On clients only, loads the moving, posEnd and negEnd samples from an XML key, attached to the given root node (i3d mappings are not supported here).
---@param xmlFile any
---@param key any
---@param rootNode any
function AnimatedObjectBuilder:setSounds(xmlFile, key, rootNode) end

--- Stores opening hours (start, end, disableIfClosed, closed text) when both start and end are given; without them the object is always usable.
---@param startTime any
---@param endTime any
---@param disableIfClosed any
---@param closedText any
function AnimatedObjectBuilder:setOpeningTimes(startTime, endTime, disableIfClosed, closedText) end

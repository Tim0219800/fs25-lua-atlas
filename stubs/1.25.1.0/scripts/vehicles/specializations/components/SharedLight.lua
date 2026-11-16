---@meta
-- FS25 1.25.1.0 : vehicles/specializations/components/SharedLight.lua (generated stub, FS25 Lua Atlas)

--- A reusable light model loaded from a shared XML/i3d asset (`data/shared/assets/lights`) and linked to a vehicle node. On load it distributes the lights found in the asset (default, top, bottom, brake, reverse, day-time, left and right turn) into the vehicle's `staticLights` tables as `StaticLight` objects, optionally builds a `StaticLightCompound`, and applies base and glass materials. Light role flags (reverse, turn left/right) and rotation presets come from the vehicle XML. Client-side visual; ships a debug console command that spawns every shared light.
---@class SharedLight
SharedLight = {}

--- Creates a shared light bound to a vehicle and to the vehicle's `staticLights` category tables; reverse and turn role flags start false.
---@param vehicle any
---@param staticLights any
---@param customMt any
function SharedLight.new(vehicle, staticLights, customMt) end

--- Deletes the pending XML file, the light node and releases the shared i3d request.
function SharedLight:delete() end

--- Stores a callback (and optional target) called with the success flag after loading.
---@param callback any
---@param callbackTarget any
function SharedLight:setCallback(callback, callbackTarget) end

--- Invokes the registered callback, with or without target, passing the success flag.
---@param success any
function SharedLight:onFinished(success) end

--- Stores a table mapping rotation node names to rotation vectors, applied when the asset loads.
---@param rotationNodes any
function SharedLight:setRotationNodes(rotationNodes) end

--- Stores the light types and excluded light types handed to the compound light.
---@param lightTypes any
---@param excludedLightTypes any
function SharedLight:setLightTypes(lightTypes, excludedLightTypes) end

--- Reads one shared light entry in the vehicle XML (`#filename`, `#linkNode`, rotation nodes, light types, reverse/turn flags, function mapping, extra attributes) and starts loading. Refuses hidden or runtime-loaded reference link nodes. The result goes through `callback(success, self or nil)`.
---@param key any
---@param baseDirectory any
---@param callback any
function SharedLight:loadFromVehicleXML(key, baseDirectory, callback) end

--- Loads the shared light XML and starts the async shared i3d load. When the XML is missing it checks `FS22_RENAMED_LIGHTS` to warn about renamed assets. Returns false (after `onFinished(false)`) on failure.
---@param linkNode any
---@param xmlFilename any
---@param baseDirectory any
function SharedLight:loadFromXML(linkNode, xmlFilename, baseDirectory) end

--- Async callback: loads the lights of every category into the vehicle tables (the default category is redirected to reverse or turn lists depending on the role flags), applies rotation presets, builds the optional compound, applies base and glass materials and links the node under the link node.
---@param i3dNode any
---@param failedReason any
---@param args any
function SharedLight:onI3DLoaded(i3dNode, failedReason, args) end

--- Debug console command: loads every shared light XML in the game's lights folder in rows in front of the player using a dummy vehicle, switches on the light types given as `true` strings and logs how many loaded. It also spawns the debug beacons.
---@param _ any
---@param defaultLight any
---@param brakeLight any
---@param highBeam any
---@param workLightBack any
---@param workLightFront any
---@param turnLightLeft any
---@param turnLeftRight any
---@param reverseLight any
function SharedLight.consoleCommandDebug(_, defaultLight, brakeLight, highBeam, workLightBack, workLightFront, turnLightLeft, turnLeftRight, reverseLight) end

--- Empty; registers no XML paths.
---@param schema any
---@param basePath any
function SharedLight.registerXMLPaths(schema, basePath) end

--- Registers the XML paths of the shared light asset: each static light category, base and glass materials and the static light compound.
---@param schema any
function SharedLight.registerExternalXMLPaths(schema) end

---@meta
-- FS25 1.25.1.0 : vehicles/specializations/components/BeaconLight.lua (generated stub, FS25 Lua Atlas)

--- Rotating or blinking beacon light for vehicles. It is loaded either from a shared beacon XML/i3d asset (with selectable variation and mount type) or from inline `staticLight` entries in the vehicle XML. It drives a rotator node, a real light source, and shader-based static lights whose intensity can depend on camera distance; the real light follows the `REAL_BEACON_LIGHTS` game setting. Client-side visual object; the vehicle calls `setIsActive`. Device data comes from `BeaconLightManager` (defined elsewhere, UNVERIFIED).
---@class BeaconLight
BeaconLight = {}

--- Creates a beacon light for a vehicle (may be nil for debug use) with default speed 1, intensity 1, real light range scale 1, inactive.
---@param vehicle any
---@param customMt any
function BeaconLight.new(vehicle, customMt) end

--- Deletes the beacon node, releases the shared i3d request and removes the object from the mission updateables.
function BeaconLight:delete() end

--- Stores a callback (and optional target) called with the success flag once loading is done.
---@param callback any
---@param callbackTarget any
function BeaconLight:setCallback(callback, callbackTarget) end

--- Creates a beacon light from a vehicle XML key and, on success, appends it to `targetTable`. With `#filename` it loads the shared asset at `#node` (refusing runtime-loaded reference nodes); without it, it reads inline `staticLight` entries. Returns the object or nil.
---@param targetTable any
---@param xmlFile any
---@param key any
---@param vehicle any
function BeaconLight.loadFromVehicleXML(targetTable, xmlFile, key, vehicle) end

--- Stores speed, intensity, mount type and variation name from the XML; nil speed or intensity keep the current values.
---@param speed any
---@param intensity any
---@param mountType any
---@param variationName any
function BeaconLight:setXMLSettings(speed, intensity, mountType, variationName) end

--- Sets whether a real light is used, an optional external light node replacing the asset's one, and the range scale applied to it.
---@param useRealLights any
---@param customRealLight any
---@param realLightRangeScale any
function BeaconLight:setRealLight(useRealLights, customRealLight, realLightRangeScale) end

--- Loads the beacon asset XML and starts the asynchronous shared i3d load, linking later to `linkNode`. Returns false and calls `onFinished(false)` when the XML or the i3d filename is missing.
---@param linkNode any
---@param xmlFilename any
---@param baseDirectory any
function BeaconLight:loadFromXML(linkNode, xmlFilename, baseDirectory) end

--- Async callback: picks the requested variation and mount type, deletes the unused variation and mount nodes, loads variation settings, links the root under the link node with the mount y offset. Note: success is reported as node present AND has static lights, so assets without static lights count as failed.
---@param i3dNode any
---@param failedReason any
---@param args any
function BeaconLight:onI3DLoaded(i3dNode, failedReason, args) end

--- Initialises shader parameters of static lights, randomises the rotator start angle, sets up or removes the real light node (range scaling, shadow priority 0.25, hidden), then calls the callback.
---@param success any
function BeaconLight:onFinished(success) end

--- Reads rotator, real light, static lights, device (via `BeaconLightManager`) and an optional material from one XML key (base or a variation) and applies the material to the node.
---@param xmlFile any
---@param key any
function BeaconLight:loadVariationFromXML(xmlFile, key) end

--- Spins the rotator, animates the real light colour for multi-blink patterns, and refreshes distance-dependent intensity and minimum-distance visibility of static lights when the camera distance changed by more than 1.
---@param dt any
function BeaconLight:update(dt) end

--- Turns the beacon on or off: registers or unregisters per-frame updates if needed, toggles the real light (only when the beacon real-light setting is on) and sets each static light's shader intensity.
---@param isActive any
function BeaconLight:setIsActive(isActive) end

--- Reacts to a change of the real beacon light game setting by updating the visibility of the real light node.
function BeaconLight:onLightsRealBeaconLightChanged() end

--- Debug helper: scans the `data/shared/assets/beaconLights` folder, spawns every mount type and variation of each XML in a grid under `rootNode`, labels them and logs how many loaded or failed.
---@param rootNode any
function BeaconLight.spawnDebugBeacons(rootNode) end

--- Registers the XML paths of the beacon asset: base and per-variation settings plus i3d mappings.
---@param schema any
function BeaconLight.registerXMLPaths(schema) end

--- Registers the material and device XML paths for a beacon variation key.
---@param schema any
---@param basePath any
function BeaconLight.registerVariationPaths(schema, basePath) end

--- Registers the vehicle-side XML paths for a beacon light (filename, node, speed, real light, intensity, mount type, variation, inline static lights).
---@param schema any
---@param basePath any
function BeaconLight.registerVehicleXMLPaths(schema, basePath) end

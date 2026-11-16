---@meta
-- FS25 1.25.1.0 : triggers/LoadTrigger.lua (generated stub, FS25 Lua Atlas)

--- Network Object (subclass of Object) for a loading station that fills vehicles' fill units from a source object, such as a silo or production point. Vehicles are tracked through a physics trigger; the player (or an automatic timer when the platform enables automatic filling) starts and stops loading. The server transfers liters in update, the client plays effects, sounds and a scrolling shader. Also defines LoadTriggerActivatable, the activatable that exposes the start/stop action. Depends on EffectManager, SoundManager and SiloDialog, which are not in the dump (UNVERIFIED).
---@class LoadTrigger : Object
LoadTrigger = {}

--- Network Object (subclass of Object) for a loading station that fills vehicles' fill units from a source object, such as a silo or production point. Vehicles are tracked through a physics trigger; the player (or an automatic timer when the platform enables automatic filling) starts and stops loading. The server transfers liters in update, the client plays effects, sounds and a scrolling shader. Also defines LoadTriggerActivatable, the activatable that exposes the start/stop action. Depends on EffectManager, SoundManager and SiloDialog, which are not in the dump (UNVERIFIED).
---@class LoadTriggerActivatable
LoadTriggerActivatable = {}

--- Registers the XML attributes of a load trigger: triggerNode, fillLitersPerSecond, useTimeScale, discharge node and size, sound identifiers and sounds, scroller node/shader/speed, fillTypes or fillTypeCategories, autoStart, infiniteCapacity, start/stop texts and aiNode. Also registers effect and sample paths.
---@param schema any
---@param basePath any
function LoadTrigger.registerXMLPaths(schema, basePath) end

--- Creates the load trigger as a network Object with the given server/client flags and an empty table of fillable objects. Call load next to configure it from XML.
---@param isServer any
---@param isClient any
---@param customMt any
function LoadTrigger.new(isServer, isClient, customMt) end

--- Reads the configuration from XML and returns false if the root node or triggerNode is missing. Registers the physics trigger and node object, reads fill rate, optional AI node and discharge info, and on clients loads effects, samples and the scroller. Restricts fill types by list or category, creates the activatable and sets automatic filling from Platform.gameplay.
---@param components any
---@param xmlFile any
---@param xmlNode any
---@param i3dMappings any
---@param rootNode any
function LoadTrigger:load(components, xmlFile, xmlNode, i3dMappings, rootNode) end

--- Unregisters delete listeners on tracked objects, removes the physics trigger and node object, deletes samples and effects, removes the activatable, then calls the parent delete.
function LoadTrigger:delete() end

--- Sets the source object that supplies the fill levels. Asserts that it implements getSupportedFillTypes, getAllFillLevels, addFillLevelToFillableObject and getIsFillAllowedToFarm; it errors otherwise.
---@param object any
function LoadTrigger:setSource(object) end

--- Keeps this object in the update loop by calling the parent raiseActive, and also raises the source object active if it has that method.
function LoadTrigger:raiseActive() end

--- Physics callback for enter/leave. Finds a fill unit of the vehicle that accepts a fill type offered by the source (matching the node, else a unit with no exact fill root node), and tracks the object with a delete listener and in-range flag. Then starts auto loading or adds/removes the activatable.
---@param triggerId any
---@param otherId any
---@param onEnter any
---@param onLeave any
---@param onStay any
---@param otherShapeId any
function LoadTrigger:loadTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay, otherShapeId) end

--- Returns the farm id of a fillable object: its active farm if available, else its owner farm, falling back to the spectator farm id when none is found.
---@param fillableObject any
function LoadTrigger:farmIdForFillableObject(fillableObject) end

--- Returns true if a tracked object can be loaded now. While loading it checks the current object; otherwise it picks a valid target (activation allowed, TRIGGER tool supported, free capacity, farm allowed), rotating priority away from the last filled one, and stores it as validFillableObject.
function LoadTrigger:getIsFillableObjectAvailable() end

--- Stops loading if running. Otherwise collects the source's fill levels (for the current farm) allowed by the target unit; unless autoStart is set it opens SiloDialog for type selection (brakes the vehicle in automatic mode), else starts with the first type. Uses the local player's vehicle.
function LoadTrigger:toggleLoading() end

--- Callback of the type selection: if the type is valid and the target still allows activation, starts loading it on the validated object and unit via setIsLoading. Ignored for nil or unknown types.
---@param fillType any
function LoadTrigger:onFillTypeSelection(fillType) end

--- Sends LoadTriggerSetIsLoadingEvent (unless noEventSend), then starts loading and the fill sound, or stops the sound and loading. Entry point used to synchronize loading state between server and clients.
---@param isLoading any
---@param targetObject any
---@param fillUnitIndex any
---@param fillType any
---@param noEventSend any
function LoadTrigger:setIsLoading(isLoading, targetObject, fillUnitIndex, fillType, noEventSend) end

--- Returns true if no active vehicle is required (automatic filling), or if the object reports getAllowLoadTriggerActivation as true; false otherwise.
---@param fillableObject any
function LoadTrigger:getAllowsActivation(fillableObject) end

--- Marks loading as started (once only): stores fill type, target object and unit, switches the activatable text to the stop text, and on clients starts effects, both samples and the scroller speed. Does not move any liters itself.
---@param fillType any
---@param fillableObject any
---@param fillUnitIndex any
function LoadTrigger:startLoading(fillType, fillableObject, fillUnitIndex) end

--- Ends loading: resets type and text, notifies the target through aiStoppedLoadingFromTrigger if present, records which object was filled last for priority, and on clients stops effects, samples and the scroller.
function LoadTrigger:stopLoading() end

--- Server only. While loading, transfers liters per frame from the source to the target (rate times dt, capped by the target's getLoadTriggerMaxFillSpeed, scaled by effective time scale if enabled) and stops when nothing more is transferred. In automatic mode, tries to start every 10 seconds.
---@param dt any
function LoadTrigger:update(dt) end

--- Returns the fill type currently being loaded (FillType.UNKNOWN when idle).
function LoadTrigger:getCurrentFillType() end

--- Returns the root node of the target fill unit being loaded, or nil if no object is currently being filled.
function LoadTrigger:getFillTargetNode() end

--- Without discharge info, moves the sound node to the target position when starting. If no custom `load` sample exists it delegates to FillTrigger.setFillSoundIsPlaying, and it also forwards the state to the target object's setFillSoundIsPlaying if present. Note: reads self.samples, which exists only on clients.
---@param state any
function LoadTrigger:setFillSoundIsPlaying(state) end

--- Delete-listener callback: removes the deleted vehicle from the tracked objects and, if it was the one being loaded, stops loading.
---@param vehicle any
function LoadTrigger:onDeleteObject(vehicle) end

--- Returns true if the fill type is in this trigger's allowed list. Note: it indexes self.fillTypes without a nil check, but load sets it to nil when no restriction is configured, which would raise an error.
---@param fillType any
function LoadTrigger:getIsFillTypeSupported(fillType) end

--- Returns whether AI loading is supported, which is true when an aiNode was defined in the XML.
function LoadTrigger:getSupportAILoading() end

--- Returns world x and z of the AI node plus the x and z of its local forward (+Z) direction, as the AI approach target.
function LoadTrigger:getAITargetPositionAndDirection() end

--- Creates the activatable bound to a load trigger, with an empty action text.
---@param loadTrigger any
function LoadTriggerActivatable.new(loadTrigger) end

--- Sets the text shown for the activation action.
---@param text any
function LoadTriggerActivatable:setText(text) end

--- Returns whether the owning load trigger currently has a fillable object available.
function LoadTriggerActivatable:getIsActivatable() end

--- Runs the action by toggling loading on the owning load trigger.
function LoadTriggerActivatable:run() end

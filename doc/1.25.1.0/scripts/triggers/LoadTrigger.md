# triggers/LoadTrigger.lua

*[Version française](../../fr/scripts/triggers/LoadTrigger.md)*

Source: `dataS/scripts/triggers/LoadTrigger.lua` — FS25 1.25.1.0

✍ Network Object (subclass of Object) for a loading station that fills vehicles' fill units from a source object, such as a silo or production point. Vehicles are tracked through a physics trigger; the player (or an automatic timer when the platform enables automatic filling) starts and stops loading. The server transfers liters in update, the client plays effects, sounds and a scrolling shader. Also defines LoadTriggerActivatable, the activatable that exposes the start/stop action. Depends on EffectManager, SoundManager and SiloDialog, which are not in the dump (UNVERIFIED).

- **LoadTrigger** inherits from `Object` (l.13)
- **LoadTriggerActivatable** (l.699)

## Functions

| Function | Line | Description |
|---|---|---|
| `LoadTrigger.registerXMLPaths(schema: any, basePath: any)` | 19 | ✍ Registers the XML attributes of a load trigger: triggerNode, fillLitersPerSecond, useTimeScale, discharge node and size, sound identifiers and sounds, scroller node/shader/speed, fillTypes or fillTypeCategories, autoStart, infiniteCapacity, start/stop texts and aiNode. Also registers effect and sample paths. |
| `LoadTrigger.new(isServer: any, isClient: any, customMt: any)` | 51 | ✍ Creates the load trigger as a network Object with the given server/client flags and an empty table of fillable objects. Call load next to configure it from XML. |
| `LoadTrigger:load(components: any, xmlFile: any, xmlNode: any, i3dMappings: any, rootNode: any)` | 61 | ✍ Reads the configuration from XML and returns false if the root node or triggerNode is missing. Registers the physics trigger and node object, reads fill rate, optional AI node and discharge info, and on clients loads effects, samples and the scroller. Restricts fill types by list or category, creates the activatable and sets automatic filling from Platform.gameplay. |
| `LoadTrigger:delete()` | 209 | ✍ Unregisters delete listeners on tracked objects, removes the physics trigger and node object, deletes samples and effects, removes the activatable, then calls the parent delete. |
| `LoadTrigger:setSource(object: any)` | 242 | ✍ Sets the source object that supplies the fill levels. Asserts that it implements getSupportedFillTypes, getAllFillLevels, addFillLevelToFillableObject and getIsFillAllowedToFarm; it errors otherwise. |
| `LoadTrigger:raiseActive()` | 253 | ✍ Keeps this object in the update loop by calling the parent raiseActive, and also raises the source object active if it has that method. |
| `LoadTrigger:loadTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 263 | ✍ Physics callback for enter/leave. Finds a fill unit of the vehicle that accepts a fill type offered by the source (matching the node, else a unit with no exact fill root node), and tracks the object with a delete listener and in-range flag. Then starts auto loading or adds/removes the activatable. |
| `LoadTrigger:farmIdForFillableObject(fillableObject: any)` | 369 | ✍ Returns the farm id of a fillable object: its active farm if available, else its owner farm, falling back to the spectator farm id when none is found. |
| `LoadTrigger:getIsFillableObjectAvailable()` | 384 | ✍ Returns true if a tracked object can be loaded now. While loading it checks the current object; otherwise it picks a valid target (activation allowed, TRIGGER tool supported, free capacity, farm allowed), rotating priority away from the last filled one, and stores it as validFillableObject. |
| `LoadTrigger:toggleLoading()` | 432 | ✍ Stops loading if running. Otherwise collects the source's fill levels (for the current farm) allowed by the target unit; unless autoStart is set it opens SiloDialog for type selection (brakes the vehicle in automatic mode), else starts with the first type. Uses the local player's vehicle. |
| `LoadTrigger:onFillTypeSelection(fillType: any)` | 486 | ✍ Callback of the type selection: if the type is valid and the target still allows activation, starts loading it on the validated object and unit via setIsLoading. Ignored for nil or unknown types. |
| `LoadTrigger:setIsLoading(isLoading: any, targetObject: any, fillUnitIndex: any, fillType: any, noEventSend: any)` | 498 | ✍ Sends LoadTriggerSetIsLoadingEvent (unless noEventSend), then starts loading and the fill sound, or stops the sound and loading. Entry point used to synchronize loading state between server and clients. |
| `LoadTrigger:getAllowsActivation(fillableObject: any)` | 512 | ✍ Returns true if no active vehicle is required (automatic filling), or if the object reports getAllowLoadTriggerActivation as true; false otherwise. |
| `LoadTrigger:startLoading(fillType: any, fillableObject: any, fillUnitIndex: any)` | 526 | ✍ Marks loading as started (once only): stores fill type, target object and unit, switches the activatable text to the stop text, and on clients starts effects, both samples and the scroller speed. Does not move any liters itself. |
| `LoadTrigger:stopLoading()` | 550 | ✍ Ends loading: resets type and text, notifies the target through aiStoppedLoadingFromTrigger if present, records which object was filled last for priority, and on clients stops effects, samples and the scroller. |
| `LoadTrigger:update(dt: any)` | 579 | ✍ Server only. While loading, transfers liters per frame from the source to the target (rate times dt, capped by the target's getLoadTriggerMaxFillSpeed, scaled by effective time scale if enabled) and stops when nothing more is transferred. In automatic mode, tries to start every 10 seconds. |
| `LoadTrigger:getCurrentFillType()` | 622 | ✍ Returns the fill type currently being loaded (FillType.UNKNOWN when idle). |
| `LoadTrigger:getFillTargetNode()` | 628 | ✍ Returns the root node of the target fill unit being loaded, or nil if no object is currently being filled. |
| `LoadTrigger:setFillSoundIsPlaying(state: any)` | 638 | ✍ Without discharge info, moves the sound node to the target position when starting. If no custom `load` sample exists it delegates to FillTrigger.setFillSoundIsPlaying, and it also forwards the state to the target object's setFillSoundIsPlaying if present. Note: reads self.samples, which exists only on clients. |
| `LoadTrigger:onDeleteObject(vehicle: any)` | 661 | ✍ Delete-listener callback: removes the deleted vehicle from the tracked objects and, if it was the one being loaded, stops loading. |
| `LoadTrigger:getIsFillTypeSupported(fillType: any)` | 677 | ✍ Returns true if the fill type is in this trigger's allowed list. Note: it indexes self.fillTypes without a nil check, but load sets it to nil when no restriction is configured, which would raise an error. |
| `LoadTrigger:getSupportAILoading()` | 683 | ✍ Returns whether AI loading is supported, which is true when an aiNode was defined in the XML. |
| `LoadTrigger:getAITargetPositionAndDirection()` | 689 | ✍ Returns world x and z of the AI node plus the x and z of its local forward (+Z) direction, as the AI approach target. |
| `LoadTriggerActivatable.new(loadTrigger: any)` | 703 | ✍ Creates the activatable bound to a load trigger, with an empty action text. |
| `LoadTriggerActivatable:setText(text: any)` | 714 | ✍ Sets the text shown for the activation action. |
| `LoadTriggerActivatable:getIsActivatable()` | 720 | ✍ Returns whether the owning load trigger currently has a fillable object available. |
| `LoadTriggerActivatable:run()` | 726 | ✍ Runs the action by toggling loading on the owning load trigger. |

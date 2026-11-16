# missions/field/AbstractFieldMission.lua

*[Version française](../../../fr/scripts/missions/field/AbstractFieldMission.md)*

Source: `dataS/scripts/missions/field/AbstractFieldMission.lua` — FS25 1.25.1.0

✍ Base class of all field contracts (plow, sow, stone pick, harvest and so on), a subclass of AbstractMission. It binds a mission to a Field, creates the map hotspot, prepares and finishes the field through FieldUpdateTask objects (server), measures progress with density map modifiers split into partitions, registers the field polygon in the MissionManager mission map, computes the reward per hectare and handles save, load and network streams. Subclasses override createModifier, getRewardPerHa, getMissionTypeName and so on.

- **AbstractFieldMission** inherits from `AbstractMission` (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `AbstractFieldMission.new(isServer: any, isClient: any, title: any, description: any, customMt: any)` | 31 | ✍ Constructor. Calls AbstractMission.new, then initialises empty work area types, money multiplier 1, not in the mission map, 0 percent done and no modifier, filter or hotspot. |
| `AbstractFieldMission:init(field: any)` | 50 | ✍ Binds the mission to the given field with setField, then calls the parent init and returns its result. |
| `AbstractFieldMission:setField(field: any)` | 57 | ✍ Stores the field, tells the field about the mission, builds the progress title with the field id, notifies g_fieldManager:onFieldMissionStarted and creates the map hotspot. |
| `AbstractFieldMission:createMapHotspot()` | 73 | ✍ Creates an AbstractFieldMissionHotspot if needed, points it at the field and stores it as the only entry of mapHotspots. |
| `AbstractFieldMission:getField()` | 86 | ✍ Returns the Field this mission works on. |
| `AbstractFieldMission:getMapHotspots()` | 92 | ✍ Returns the list of map hotspots of this mission. |
| `AbstractFieldMission:getWorldPosition()` | 98 | ✍ Returns the field indicator world position (the two values from field:getIndicatorPosition). |
| `AbstractFieldMission:getLocation()` | 104 | ✍ Returns the localized text contract_farmland formatted with the field name. |
| `AbstractFieldMission:reactivate()` | 111 | ✍ Recreates the completion modifier with createModifier, then calls the parent reactivate. Used when a saved mission becomes active again. |
| `AbstractFieldMission:delete()` | 119 | ✍ Removes the field from the mission map and the hotspot, deletes the hotspot, detaches the mission from the field, notifies g_fieldManager:onFieldMissionDeleted and calls the parent delete. |
| `AbstractFieldMission:saveToXMLFile(xmlFile: any, key: any)` | 141 | ✍ Calls the parent, writes the field id, and while PREPARING with a finished preparing task also saves that task with its class name under field.preparingTask. |
| `AbstractFieldMission:loadFromXMLFile(xmlFile: any, key: any)` | 154 | ✍ Looks up the saved field id (returns false with a warning if missing), binds it, calls the parent load, restores and enqueues a saved preparing task, and re-adds the field to the mission map if PREPARING or RUNNING. |
| `AbstractFieldMission:writeStream(streamId: any, connection: any)` | 194 | ✍ Network: writes the field id as int32, then the parent stream data. |
| `AbstractFieldMission:readStream(streamId: any, connection: any)` | 202 | ✍ Network: reads the field id, binds the field, reads the parent data and adds the field to the mission map if PREPARING or RUNNING. Would fail on a nil field if the id is unknown. |
| `AbstractFieldMission:update(dt: any)` | 217 | ✍ Calls the parent update; when RUNNING for the local player farm and the hotspot is not yet added, adds the hotspots. |
| `AbstractFieldMission:start(spawnVehicles: any)` | 227 | ✍ Calls the parent start (with or without leased vehicles); on success registers the field in the mission map. Returns false if the parent refuses. |
| `AbstractFieldMission:prepare(spawnVehicles: any)` | 239 | ✍ Calls the parent prepare, then prepareField (server) and createModifier. |
| `AbstractFieldMission:prepareField()` | 248 | ✍ Server only: builds the preparing task via getFieldPreparingTask, marks it as not saved and queues it with g_fieldManager:addFieldUpdateTask. |
| `AbstractFieldMission:getFieldPreparingTask()` | 260 | ✍ Default preparing task: a FieldUpdateTask created from the current field state with height cleared. Returns nil if the field state is not valid. Subclasses override it. |
| `AbstractFieldMission:getIsPrepared()` | 275 | ✍ True when the parent says prepared and the preparing task is absent or finished. |
| `AbstractFieldMission:finishField()` | 289 | ✍ Server only: gets the finish task from getFieldFinishTask, assigns the field and queues it in the field manager. |
| `AbstractFieldMission:getFieldFinishTask()` | 301 | ✍ Default finish task: a FieldUpdateTask from the current field state, or nil if the state is not valid. Subclasses set state values before calling it. |
| `AbstractFieldMission:started()` | 312 | ✍ Callback when the mission has started: adds the field to the mission map. |
| `AbstractFieldMission:finish(finishState: any)` | 318 | ✍ Calls the parent finish, removes the hotspot and, for the mission farm, shows an in-game notification for success, failure or timeout with the field id. |
| `AbstractFieldMission:dismiss()` | 337 | ✍ Called when a finished mission leaves the board: queues the field finish task, then calls the parent dismiss. |
| `AbstractFieldMission:removeAccess()` | 344 | ✍ Removes the field from the mission map, then calls the parent removeAccess. |
| `AbstractFieldMission:validate()` | 351 | ✍ Returns false if the parent validation fails, the field is nil, or the field now has an owner; true otherwise. |
| `AbstractFieldMission:createModifier()` | 365 | ✍ Empty hook; subclasses create completionModifier and completionFilter here. |
| `AbstractFieldMission:initializeModifier()` | 370 | ✍ Applies the field polygon to the completion modifier and splits the field along Z into partitions of about SQM_PER_PARTITION square metres, each with its own result cache. Does nothing without a modifier. |
| `AbstractFieldMission:setPartitionRegion(partitionIndex: any)` | 425 | ✍ Clips the completion modifier to the Z range of the given partition. Does nothing with a single partition or no partitions. |
| `AbstractFieldMission:getPartitionCompletion(partitionIndex: any)` | 438 | ✍ Sets the partition region and returns summed pixels, area and total area from the completion filter. Returns 0, 0, 0 without modifier. |
| `AbstractFieldMission:getCompletion()` | 452 | ✍ Returns the field completion divided by AbstractMission.SUCCESS_FACTOR, so reaching the success factor counts as complete. |
| `AbstractFieldMission:getFieldCompletion()` | 460 | ✍ Measures one partition per call (round robin) to spread the density map cost over updates, stores its result, updates fieldPercentageDone and returns it. Initialises the modifier on first call. updateFieldPercentageDone is not in this file: UNVERIFIED. |
| `AbstractFieldMission:getVehicleSize()` | 519 | ✍ Returns "small", "medium" or "large" from the field area compared with the FIELD_SIZE_MEDIUM and FIELD_SIZE_LARGE constants, used to pick leased vehicle groups. |
| `AbstractFieldMission:getDetails()` | 533 | ✍ Returns the parent details list plus two rows: field name and formatted field area. |
| `AbstractFieldMission:getRewardPerHa()` | 544 | ✍ Default reward per hectare (1); subclasses override it with the value from the map XML. |
| `AbstractFieldMission:getReward()` | 550 | ✍ Returns the parent reward plus reward per hectare times field area, scaled by a difficulty factor 1.3 minus 0.1 times economicDifficulty. |
| `AbstractFieldMission:getFarmlandId()` | 565 | ✍ Note: returns the field id (field:getId), not a farmland id, despite the name. Returns nil if there is no field. |
| `AbstractFieldMission:addToMissionMap()` | 577 | ✍ Writes this mission active id into the mission map over the field polygon, once (tracked by isInMissionMap). Used to find the mission from an x/z position. |
| `AbstractFieldMission:removeFromMissionMap()` | 586 | ✍ Clears the field polygon from the mission map (id 0) if it was added. |
| `AbstractFieldMission:updateMissionMap(missionId: any)` | 595 | ✍ Calls g_missionManager:setMissionMapActiveMissionId with the field density map polygon and the given mission id. |
| `AbstractFieldMission:getNPC()` | 602 | ✍ Returns the NPC of the field farmland (self.field.farmland:getNPC; getNPC is not defined in Farmland.lua of this dump). |
| `AbstractFieldMission:getIsWorkAllowed(farmId: any, x: any, z: any, workAreaType: any, vehicle: any)` | 608 | ✍ True when the mission is running and the work area type is nil or one of its workAreaTypes. Position, farm and vehicle arguments are not used. |
| `AbstractFieldMission:addHotspots()` | 614 | ✍ Adds the mission map hotspot to the current mission and sets isHotspotAdded. |
| `AbstractFieldMission:removeHotspot()` | 623 | ✍ Removes the map hotspot from the current mission and clears isHotspotAdded. |

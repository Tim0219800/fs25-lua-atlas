---@meta
-- FS25 1.25.1.0 : missions/field/AbstractFieldMission.lua (generated stub, FS25 Lua Atlas)

--- Base class of all field contracts (plow, sow, stone pick, harvest and so on), a subclass of AbstractMission. It binds a mission to a Field, creates the map hotspot, prepares and finishes the field through FieldUpdateTask objects (server), measures progress with density map modifiers split into partitions, registers the field polygon in the MissionManager mission map, computes the reward per hectare and handles save, load and network streams. Subclasses override createModifier, getRewardPerHa, getMissionTypeName and so on.
---@class AbstractFieldMission : AbstractMission
AbstractFieldMission = {}

--- Constructor. Calls AbstractMission.new, then initialises empty work area types, money multiplier 1, not in the mission map, 0 percent done and no modifier, filter or hotspot.
---@param isServer any
---@param isClient any
---@param title any
---@param description any
---@param customMt any
function AbstractFieldMission.new(isServer, isClient, title, description, customMt) end

--- Binds the mission to the given field with setField, then calls the parent init and returns its result.
---@param field any
function AbstractFieldMission:init(field) end

--- Stores the field, tells the field about the mission, builds the progress title with the field id, notifies g_fieldManager:onFieldMissionStarted and creates the map hotspot.
---@param field any
function AbstractFieldMission:setField(field) end

--- Creates an AbstractFieldMissionHotspot if needed, points it at the field and stores it as the only entry of mapHotspots.
function AbstractFieldMission:createMapHotspot() end

--- Returns the Field this mission works on.
function AbstractFieldMission:getField() end

--- Returns the list of map hotspots of this mission.
function AbstractFieldMission:getMapHotspots() end

--- Returns the field indicator world position (the two values from field:getIndicatorPosition).
function AbstractFieldMission:getWorldPosition() end

--- Returns the localized text contract_farmland formatted with the field name.
function AbstractFieldMission:getLocation() end

--- Recreates the completion modifier with createModifier, then calls the parent reactivate. Used when a saved mission becomes active again.
function AbstractFieldMission:reactivate() end

--- Removes the field from the mission map and the hotspot, deletes the hotspot, detaches the mission from the field, notifies g_fieldManager:onFieldMissionDeleted and calls the parent delete.
function AbstractFieldMission:delete() end

--- Calls the parent, writes the field id, and while PREPARING with a finished preparing task also saves that task with its class name under field.preparingTask.
---@param xmlFile any
---@param key any
function AbstractFieldMission:saveToXMLFile(xmlFile, key) end

--- Looks up the saved field id (returns false with a warning if missing), binds it, calls the parent load, restores and enqueues a saved preparing task, and re-adds the field to the mission map if PREPARING or RUNNING.
---@param xmlFile any
---@param key any
function AbstractFieldMission:loadFromXMLFile(xmlFile, key) end

--- Network: writes the field id as int32, then the parent stream data.
---@param streamId any
---@param connection any
function AbstractFieldMission:writeStream(streamId, connection) end

--- Network: reads the field id, binds the field, reads the parent data and adds the field to the mission map if PREPARING or RUNNING. Would fail on a nil field if the id is unknown.
---@param streamId any
---@param connection any
function AbstractFieldMission:readStream(streamId, connection) end

--- Calls the parent update; when RUNNING for the local player farm and the hotspot is not yet added, adds the hotspots.
---@param dt any
function AbstractFieldMission:update(dt) end

--- Calls the parent start (with or without leased vehicles); on success registers the field in the mission map. Returns false if the parent refuses.
---@param spawnVehicles any
function AbstractFieldMission:start(spawnVehicles) end

--- Calls the parent prepare, then prepareField (server) and createModifier.
---@param spawnVehicles any
function AbstractFieldMission:prepare(spawnVehicles) end

--- Server only: builds the preparing task via getFieldPreparingTask, marks it as not saved and queues it with g_fieldManager:addFieldUpdateTask.
function AbstractFieldMission:prepareField() end

--- Default preparing task: a FieldUpdateTask created from the current field state with height cleared. Returns nil if the field state is not valid. Subclasses override it.
function AbstractFieldMission:getFieldPreparingTask() end

--- True when the parent says prepared and the preparing task is absent or finished.
function AbstractFieldMission:getIsPrepared() end

--- Server only: gets the finish task from getFieldFinishTask, assigns the field and queues it in the field manager.
function AbstractFieldMission:finishField() end

--- Default finish task: a FieldUpdateTask from the current field state, or nil if the state is not valid. Subclasses set state values before calling it.
function AbstractFieldMission:getFieldFinishTask() end

--- Callback when the mission has started: adds the field to the mission map.
function AbstractFieldMission:started() end

--- Calls the parent finish, removes the hotspot and, for the mission farm, shows an in-game notification for success, failure or timeout with the field id.
---@param finishState any
function AbstractFieldMission:finish(finishState) end

--- Called when a finished mission leaves the board: queues the field finish task, then calls the parent dismiss.
function AbstractFieldMission:dismiss() end

--- Removes the field from the mission map, then calls the parent removeAccess.
function AbstractFieldMission:removeAccess() end

--- Returns false if the parent validation fails, the field is nil, or the field now has an owner; true otherwise.
function AbstractFieldMission:validate() end

--- Empty hook; subclasses create completionModifier and completionFilter here.
function AbstractFieldMission:createModifier() end

--- Applies the field polygon to the completion modifier and splits the field along Z into partitions of about SQM_PER_PARTITION square metres, each with its own result cache. Does nothing without a modifier.
function AbstractFieldMission:initializeModifier() end

--- Clips the completion modifier to the Z range of the given partition. Does nothing with a single partition or no partitions.
---@param partitionIndex any
function AbstractFieldMission:setPartitionRegion(partitionIndex) end

--- Sets the partition region and returns summed pixels, area and total area from the completion filter. Returns 0, 0, 0 without modifier.
---@param partitionIndex any
function AbstractFieldMission:getPartitionCompletion(partitionIndex) end

--- Returns the field completion divided by AbstractMission.SUCCESS_FACTOR, so reaching the success factor counts as complete.
function AbstractFieldMission:getCompletion() end

--- Measures one partition per call (round robin) to spread the density map cost over updates, stores its result, updates fieldPercentageDone and returns it. Initialises the modifier on first call. updateFieldPercentageDone is not in this file: UNVERIFIED.
function AbstractFieldMission:getFieldCompletion() end

--- Returns "small", "medium" or "large" from the field area compared with the FIELD_SIZE_MEDIUM and FIELD_SIZE_LARGE constants, used to pick leased vehicle groups.
function AbstractFieldMission:getVehicleSize() end

--- Returns the parent details list plus two rows: field name and formatted field area.
function AbstractFieldMission:getDetails() end

--- Default reward per hectare (1); subclasses override it with the value from the map XML.
function AbstractFieldMission:getRewardPerHa() end

--- Returns the parent reward plus reward per hectare times field area, scaled by a difficulty factor 1.3 minus 0.1 times economicDifficulty.
function AbstractFieldMission:getReward() end

--- Note: returns the field id (field:getId), not a farmland id, despite the name. Returns nil if there is no field.
function AbstractFieldMission:getFarmlandId() end

--- Writes this mission active id into the mission map over the field polygon, once (tracked by isInMissionMap). Used to find the mission from an x/z position.
function AbstractFieldMission:addToMissionMap() end

--- Clears the field polygon from the mission map (id 0) if it was added.
function AbstractFieldMission:removeFromMissionMap() end

--- Calls g_missionManager:setMissionMapActiveMissionId with the field density map polygon and the given mission id.
---@param missionId any
function AbstractFieldMission:updateMissionMap(missionId) end

--- Returns the NPC of the field farmland (self.field.farmland:getNPC; getNPC is not defined in Farmland.lua of this dump).
function AbstractFieldMission:getNPC() end

--- True when the mission is running and the work area type is nil or one of its workAreaTypes. Position, farm and vehicle arguments are not used.
---@param farmId any
---@param x any
---@param z any
---@param workAreaType any
---@param vehicle any
function AbstractFieldMission:getIsWorkAllowed(farmId, x, z, workAreaType, vehicle) end

--- Adds the mission map hotspot to the current mission and sets isHotspotAdded.
function AbstractFieldMission:addHotspots() end

--- Removes the map hotspot from the current mission and clears isHotspotAdded.
function AbstractFieldMission:removeHotspot() end

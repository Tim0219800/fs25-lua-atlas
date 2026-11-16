---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableLights.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization that drives light groups on buildings: shared light i3d models, self-illuminated shapes and real light nodes (low/high profile). Groups can be switched manually via a trigger and an activatable, or automatically through time-of-day and weather visibility conditions. State is synchronised through PlaceableLightsStateEvent; it depends on the environment mask system of the current mission (class not in the dump).
---@class PlaceableLights
PlaceableLights = {}

--- Placeable specialization that drives light groups on buildings: shared light i3d models, self-illuminated shapes and real light nodes (low/high profile). Groups can be switched manually via a trigger and an activatable, or automatically through time-of-day and weather visibility conditions. State is synchronised through PlaceableLightsStateEvent; it depends on the environment mask system of the current mission (class not in the dump).
---@class PlaceableLightsActivatable
PlaceableLightsActivatable = {}

--- Always returns true: this specialization has no prerequisite on other specializations.
---@param specializations table
---@return boolean
function PlaceableLights.prerequisitesPresent(specializations) end

--- Registers the placeable functions lightSetupChanged, getUseHighProfile, setGroupIsActive, lightsTriggerCallback, sharedLightLoaded and updateLightState on the placeable type.
---@param placeableType any
function PlaceableLights.registerFunctions(placeableType) end

--- Subscribes the specialization to onLoad, onDelete, onWriteStream, onReadStream and onFinalizePlacement.
---@param placeableType any
function PlaceableLights.registerEventListeners(placeableType) end

--- Declares the XML schema under lights: sharedLight, lightShape, realLights.low/high, and group entries (trigger, input action, texts, activate/deactivate time, weather flags, toggle sound).
---@param schema any
---@param basePath any
function PlaceableLights.registerXMLPaths(schema, basePath) end

--- Reads light groups, shared lights (loaded asynchronously), light shapes and real lights from the XML, and applies time/weather visibility conditions to non-manual groups. Subscribes to the lightsProfile setting change; max group count is PlaceableLights.MAX_NUM_GROUPS. Note: the incomplete-time check on line 143 only warns when activateTime is set without deactivateTime, not the reverse.
---@param savegame table
function PlaceableLights:onLoad(savegame) end

--- Once the placement is final, applies the current light setup by calling lightSetupChanged.
function PlaceableLights:onFinalizePlacement() end

--- Async callback for a shared light i3d: configures its lightControl shapes (manual or visibility-condition mode), colour scale and rotation nodes, links it to the link node, then frees the temporary i3d root and XML and finishes the loading task.
---@param i3dNode any
---@param failedReason any
---@param args any
function PlaceableLights:sharedLightLoaded(i3dNode, failedReason, args) end

--- Releases shared light XML files and i3d requests, unsubscribes from messages, removes the activatable, removes the group triggers and deletes the toggle sound samples.
function PlaceableLights:onDelete() end

--- Client side on join: reads one bool per manually controlled group and applies it with setGroupIsActive without re-sending an event.
---@param streamId integer
---@param connection table
function PlaceableLights:onReadStream(streamId, connection) end

--- Server side on join: writes the active state of each manually controlled group, in the order read by onReadStream.
---@param streamId integer
---@param connection table
function PlaceableLights:onWriteStream(streamId, connection) end

--- Returns true if the lights profile (platform override if present, otherwise the game setting) is at least GS_PROFILE_HIGH.
function PlaceableLights:getUseHighProfile() end

--- Sets or toggles (isActive nil) a group's state, refreshes the lights, sends PlaceableLightsStateEvent unless noEventSend is set, and plays the toggle sound on clients.
---@param groupIndex any
---@param isActive any
---@param noEventSend any
function PlaceableLights:setGroupIsActive(groupIndex, isActive, noEventSend) end

--- Applies a group's state: sets lightControl on shared lights and shapes for manual groups, then shows the real lights of the profile in use and hides those of the other profile.
---@param groupIndex any
---@param isActive any
function PlaceableLights:updateLightState(groupIndex, isActive) end

--- Trigger callback: when the local player enters a group trigger, registers the activatable for that group; on leave, removes it if the player is in no other group's range.
---@param triggerId any
---@param otherId any
---@param onEnter any
---@param onLeave any
---@param onStay any
function PlaceableLights:lightsTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end

--- Re-applies the state of every group, for example after the lights profile setting changed.
function PlaceableLights:lightSetupChanged() end

--- Creates the activatable object linked to a placeable, with group index 1 and empty text.
---@param placeable any
function PlaceableLightsActivatable.new(placeable) end

--- Selects which light group the activatable controls (defaults to 1) and refreshes its prompt text.
---@param groupIndex any
function PlaceableLightsActivatable:setGroupIndex(groupIndex) end

--- Called when the player triggers the action: toggles the selected group on the placeable and refreshes the text.
function PlaceableLightsActivatable:run() end

--- Builds the prompt from the group's activate or deactivate text and name, depending on whether the group is currently active.
function PlaceableLightsActivatable:updateActivateText() end

--- Returns the distance from the given point to the group's trigger node, or math.huge if the group has no trigger node.
---@param x any
---@param y any
---@param z any
function PlaceableLightsActivatable:getDistance(x, y, z) end

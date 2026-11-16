---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableCartridgePlayer.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization for the in-game computer that cycles through game cartridges. Cartridges are the visible children of an items node; activating the player moves the cartridge content onto a connector node and shows the matching monitor child and light. A trigger node with the player collision bit makes it usable by the local player.
---@class PlaceableCartridgePlayer
PlaceableCartridgePlayer = {}

--- Placeable specialization for the in-game computer that cycles through game cartridges. Cartridges are the visible children of an items node; activating the player moves the cartridge content onto a connector node and shows the matching monitor child and light. A trigger node with the player collision bit makes it usable by the local player.
---@class PlaceableCartridgePlayerActivatable
PlaceableCartridgePlayerActivatable = {}

--- Always returns true: no prerequisite specializations.
---@param specializations table
---@return boolean
function PlaceableCartridgePlayer.prerequisitesPresent(specializations) end

--- Registers `cartridgePlayerTriggerCallback` and `activatePlayer`.
---@param placeableType any
function PlaceableCartridgePlayer.registerFunctions(placeableType) end

--- Subscribes to `onLoad` and `onDelete`.
---@param placeableType any
function PlaceableCartridgePlayer.registerEventListeners(placeableType) end

--- Declares the `cartridgePlayer` node keys `itemsNode`, `monitorNode`, `monitorLightNode`, `connectorNode`, `triggerNode` and a `play` sound sample.
---@param schema any
---@param basePath any
function PlaceableCartridgePlayer.registerXMLPaths(schema, basePath) end

--- Loads the nodes and, if a trigger exists, checks it has the player collision bit (logs an error and returns nil otherwise) before registering the trigger and activatable. Loads the play sound on clients. Returns self.
---@param savegame any
function PlaceableCartridgePlayer:onLoad(savegame) end

--- Removes the activatable and the trigger node, and deletes the sound samples on clients.
function PlaceableCartridgePlayer:onDelete() end

--- Trigger callback: when the local player enters, adds the activatable to the activatable system; when leaving, removes it.
---@param triggerId any
---@param otherId any
---@param onEnter any
---@param onLeave any
---@param onStay any
function PlaceableCartridgePlayer:cartridgePlayerTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end

--- Puts the current cartridge back, picks the next visible cartridge (wrapping around), then moves its content to the connector and shows its monitor. Shows a message if there are no cartridges and plays a sound on clients when the selection changed.
function PlaceableCartridgePlayer:activatePlayer() end

--- Creates the activatable for a cartridge player placeable, with the 'change cartridge' action text.
---@param placeable any
function PlaceableCartridgePlayerActivatable.new(placeable) end

--- Activation handler: calls `activatePlayer` on the owning placeable.
function PlaceableCartridgePlayerActivatable:run() end

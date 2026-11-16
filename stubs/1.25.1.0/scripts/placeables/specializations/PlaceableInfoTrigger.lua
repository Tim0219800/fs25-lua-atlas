---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableInfoTrigger.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization that shows an info box on the HUD while the local player stands in a trigger. It raises the onInfoTriggerEnter and onInfoTriggerLeave events, and calls updateInfo each frame so other specializations can append lines. The box is shown to the owner farm, or to everyone if showAllPlayers is set, and only on platforms enabling placeable info.
---@class PlaceableInfoTrigger
PlaceableInfoTrigger = {}

--- No prerequisite: always returns true.
---@param specializations table
---@return boolean
function PlaceableInfoTrigger.prerequisitesPresent(specializations) end

--- Declares the onInfoTriggerEnter and onInfoTriggerLeave events.
---@param placeableType any
function PlaceableInfoTrigger.registerEvents(placeableType) end

--- Subscribes to load, delete, finalize-placement and draw events.
---@param placeableType any
function PlaceableInfoTrigger.registerEventListeners(placeableType) end

--- Registers updateInfo and onInfoTriggerCallback on the placeable type.
---@param placeableType any
function PlaceableInfoTrigger.registerFunctions(placeableType) end

--- Declares infoTrigger#triggerNode and infoTrigger#showAllPlayers.
---@param schema any
---@param basePath any
function PlaceableInfoTrigger.registerXMLPaths(schema, basePath) end

--- Reads the trigger node (warns if its collision mask lacks the player bit) and showAllPlayers, and creates the HUD key-value box when the platform shows placeable info.
---@param savegame table
function PlaceableInfoTrigger:onLoad(savegame) end

--- Removes the trigger, stops showing info, removes the drawable and destroys the HUD box.
function PlaceableInfoTrigger:onDelete() end

--- Registers the trigger callback on the trigger node once the placeable is placed.
function PlaceableInfoTrigger:onFinalizePlacement() end

--- While the player is inside and allowed to see it, collects lines via updateInfo and fills the HUD box (title is the placeable name, lines can be accentuated), then shows it for the next frame. The info list is emptied each frame.
function PlaceableInfoTrigger:onDraw() end

--- Trigger callback reacting only to the local player root node: on enter sets showInfo, registers drawing and raises onInfoTriggerEnter; on leave undoes this and raises onInfoTriggerLeave. Ignored on a dedicated server.
---@param triggerId any
---@param otherId any
---@param onEnter any
---@param onLeave any
---@param onStay any
function PlaceableInfoTrigger:onInfoTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end

--- Empty hook: other specializations override it to add entries (title, text, accentuate) to the info table.
---@param info any
function PlaceableInfoTrigger:updateInfo(info) end

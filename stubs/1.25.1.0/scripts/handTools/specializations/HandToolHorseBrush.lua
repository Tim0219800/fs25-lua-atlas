---@meta
-- FS25 1.25.1.0 : handTools/specializations/HandToolHorseBrush.lua (generated stub, FS25 Lua Atlas)

--- Hand tool specialization for the horse brush. The owning player targets animals (collision flag ANIMAL, 3 m range) and, while the activate input is held, brushes the animal under the crosshair; cleaning is sent to the server as AnimalCleanEvent with an accumulated amount. Needs the husbandry system and farm access rights. Note: `onHeldEnd` is registered as a listener but no such function exists in this file, and `treeTypeCrosshair` used in `onDraw` is never assigned here.
---@class HandToolHorseBrush
HandToolHorseBrush = {}

--- Registers `handTool.horseBrush#node` (the brush node) and the `cleaning` sound samples.
---@param xmlSchema any
function HandToolHorseBrush.registerXMLPaths(xmlSchema) end

--- Subscribes to `onLoad`, `onDelete`, `onUpdate`, `onDraw`, `onHeldStart`, `onHeldEnd` and `onRegisterActionEvents`.
---@param handToolType any
function HandToolHorseBrush.registerEventListeners(handToolType) end

--- Always returns true: no prerequisite.
---@param specializations any
function HandToolHorseBrush.prerequisitesPresent(specializations) end

--- Initialises detection distance (3), brush node and rest position, client sound and crosshairs, a dirty flag, a cleaning rate of 0.01 per millisecond and the action text.
---@param xmlFile any
function HandToolHorseBrush:onLoad(xmlFile) end

--- Frees the sound samples and both crosshair overlays.
function HandToolHorseBrush:onDelete() end

--- For the owner, finds the targeted husbandry cluster, enables the action, animates the brush node while cleaning and raises a dirty flag when the target changes. Clients play or stop the sound; while a target is set it accumulates time and sends AnimalCleanEvent to the server each time the sum exceeds 5.
---@param dt any
function HandToolHorseBrush:onUpdate(dt) end

--- Renders the brush crosshair when an animal is targeted, otherwise the default crosshair; also renders `treeTypeCrosshair` if set (never set in this file).
function HandToolHorseBrush:onDraw() end

--- Registers the ACTIVATE_HANDTOOL input with `onBrushAction`, very high priority, initially inactive and with empty text. Skipped when the tool is not active for input.
function HandToolHorseBrush:onRegisterActionEvents() end

--- Input callback: sets the cleaning flag to true while the input value is positive.
---@param _ any
---@param inputValue any
function HandToolHorseBrush:onBrushAction(_, inputValue) end

--- For the owning player only, adds an ANIMAL target type to the player's targeter, with minimum 0.5 and the detection distance.
function HandToolHorseBrush:onHeldStart() end

--- Maps a targeted collision node to its animal husbandry and animal cluster. Returns both only if the farm may access the husbandry and the cluster supports dirt change and a name; otherwise returns nil, nil.
---@param carryingPlayer any
---@param node any
function HandToolHorseBrush.getHusbandryAndClusterFromNode(carryingPlayer, node) end

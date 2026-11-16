---@meta
-- FS25 1.25.1.0 : graphics/HumanGraphicsComponent.lua (generated stub, FS25 Lua Atlas)

--- Visual side of a human character (player or NPC). It owns the scene root node, a shoulder camera node, a foliage bending node, the HumanModel, the PlayerStyle objects, an optional facial animation, the sounds object and a ConditionalAnimation with its registered parameters (speed, grounded, swimming, crouching, chainsaw...). The model, style and facial animation classes are defined elsewhere (UNVERIFIED).
---@class HumanGraphicsComponent
HumanGraphicsComponent = {}

--- Builds the component with empty model, two PlayerStyle objects (current and base), sounds, and a ConditionalAnimation registering about twenty typed parameters. Then calls defaultAllParameters, which is not defined in this file (UNVERIFIED).
---@return HumanGraphicsComponent
function HumanGraphicsComponent.new() end

--- Creates the scene nodes under the root node: graphics root, right shoulder camera node (fixed local offset) and foliage bending node. Call once when the character enters the map.
function HumanGraphicsComponent:initialize() end

--- Makes the character model visible by calling setModelVisibility(true).
function HumanGraphicsComponent:show() end

--- Hides the character model by calling setModelVisibility(false), which also removes foliage bending.
function HumanGraphicsComponent:hide() end

--- Releases everything: facial animation, sounds, animation, model, the graphics root node and the foliage bending object registered in the mission's foliageBendingSystem.
function HumanGraphicsComponent:delete() end

--- Replaces the current model by another with a root node (logs an error and returns if absent). Deletes the old model, links the new root under the graphics node, then calls loadAnimation and loadSounds (not defined in this file, UNVERIFIED) and shows it.
---@param model HumanModel
function HumanGraphicsComponent:setModel(model) end

--- Shows or hides the model, re-applies the root node visibility, and creates or destroys the foliage bending rectangle (about 1 m square) depending on visibility or the optional override.
---@param visibility boolean
---@param overrideFoliageBending any
function HumanGraphicsComponent:setModelVisibility(visibility, overrideFoliageBending) end

--- Applies a named style preset (for example work clothes) on a copy of the base style, as a temporary style. With an empty or unknown preset name it goes back to the base style. Style loading is asynchronous.
---@param presetName string
---@param isOwner any
function HumanGraphicsComponent:applyCustomWorkStyle(presetName, isOwner) end

--- Returns the current style if the flag is true, otherwise the base style (falling back to the current one if no base exists).
---@param currentStyle boolean?
---@return PlayerStyle
function HumanGraphicsComponent:getStyle(currentStyle) end

--- Returns true if the style uses a different model XML than the current model, meaning the model is reloaded and its node ids become invalid.
---@param style PlayerStyle
---@return boolean
function HumanGraphicsComponent:getRequiresModelReload(style) end

--- Applies a style, either by updating the existing model parts or by loading a new model first, then optionally loads facial animation. The callback receives the loading state and whether a new model was loaded; per its own doc it may not run in multiplayer. A failed model load only logs a warning.
---@param style PlayerStyle
---@param callback function?
---@param callbackObject table?
---@param callbackArgs table?
---@param isTempStyle boolean?
---@param xmlFile XMLFile?
---@param isOwner boolean?
function HumanGraphicsComponent:setStyleAsync(style, callback, callbackObject, callbackArgs, isTempStyle, xmlFile, isOwner) end

--- Per-frame update (dt in ms) of the animation, the sounds and, if present, the facial animation and its emotions.
---@param dt number
function HumanGraphicsComponent:update(dt) end

--- Draws debug overlays: the model (unless disabled), the root and shoulder camera nodes, a header, the yaw of the root node and the style info. Returns the next y screen position.
---@param x number
---@param y number
---@param textSize number
---@param debugDrawModel boolean?
---@return number
function HumanGraphicsComponent:debugDraw(x, y, textSize, debugDrawModel) end

--- Draws the animation debug info at the given position and returns the new y position.
---@param x number
---@param y number
---@param textSize number
---@return number
function HumanGraphicsComponent:debugDrawAnimator(x, y, textSize) end

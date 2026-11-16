---@meta
-- FS25 1.25.1.0 : objects/AnimatedObjectActivatable.lua (generated stub, FS25 Lua Atlas)

--- Activatable wrapper that lets the player operate an AnimatedObject through the activatable objects system. It registers the input action events defined in the object's controls table (a toggle, or continuous positive/negative actions) and shows the action text and, if closed, the closing text. The object's getCanBeTriggered method is called but not defined in the dumped files (UNVERIFIED).
---@class AnimatedObjectActivatable
AnimatedObjectActivatable = {}

--- Creates the activatable bound to an animated object, with an empty activate text.
---@param animatedObject table
---@return table
function AnimatedObjectActivatable.new(animatedObject) end

--- Registers input events from the object's controls: one toggle event if only posAction exists, one continuous axis event if both actions are identical, or two continuous events otherwise. Sets very high text priority, visibility and configured texts, then refreshes the texts.
---@param inputContext any
function AnimatedObjectActivatable:registerCustomInput(inputContext) end

--- Removes all action events registered by this activatable and clears the stored event ids in the object's controls.
---@param inputContext any
function AnimatedObjectActivatable:removeCustomInput(inputContext) end

--- Input callback for hold-to-move: while the positive or negative input is active it sets the animation direction (unless already moving that way or at the end), and sets direction 0 on release if it had been pressed.
---@param actionName any
---@param inputValue any
function AnimatedObjectActivatable:onAnimationInputContinuous(actionName, inputValue) end

--- Input callback for toggle mode: reverses the current animation direction through setDirection and updates the displayed action text. Note: if the direction is 0 (idle), the result stays 0 because 0 * -1 = 0, so setDirection is called with 0.
function AnimatedObjectActivatable:onAnimationInputToggle() end

--- In toggle mode with both texts defined, shows the positive text when the animation is closed or closing and the negative text otherwise.
function AnimatedObjectActivatable:updateActionEventTexts() end

--- Returns whether the animated object can currently be triggered, by delegating to its getCanBeTriggered method (not defined in the dump, UNVERIFIED).
function AnimatedObjectActivatable:getIsActivatable() end

--- Registers this activatable as a drawable on the mission so that draw is called each frame.
function AnimatedObjectActivatable:activate() end

--- Removes this activatable from the mission's drawables.
function AnimatedObjectActivatable:deactivate() end

--- Returns the distance from a world position to the object's trigger node, or math.huge if the object has no trigger node.
---@param x any
---@param y any
---@param z any
function AnimatedObjectActivatable:getDistance(x, y, z) end

--- When the object has opening hours with a closed text, adds that text as extra on-screen text for the mission.
function AnimatedObjectActivatable:draw() end

---@meta
-- FS25 1.25.1.0 : objects/AnimatedObjectActivatable.lua (stub généré, atlas Lua FS25)

---@class AnimatedObjectActivatable
AnimatedObjectActivatable = {}

---@param animatedObject table
---@return table
function AnimatedObjectActivatable.new(animatedObject) end

---@param inputContext any
function AnimatedObjectActivatable:registerCustomInput(inputContext) end

---@param inputContext any
function AnimatedObjectActivatable:removeCustomInput(inputContext) end

---@param actionName any
---@param inputValue any
function AnimatedObjectActivatable:onAnimationInputContinuous(actionName, inputValue) end

function AnimatedObjectActivatable:onAnimationInputToggle() end

function AnimatedObjectActivatable:updateActionEventTexts() end

function AnimatedObjectActivatable:getIsActivatable() end

function AnimatedObjectActivatable:activate() end

function AnimatedObjectActivatable:deactivate() end

---@param x any
---@param y any
---@param z any
function AnimatedObjectActivatable:getDistance(x, y, z) end

function AnimatedObjectActivatable:draw() end

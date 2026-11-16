---@meta
-- FS25 1.25.1.0 : gui/hud/InfoDisplayBox.lua (generated stub, FS25 Lua Atlas)

--- Abstract base for one box inside an InfoDisplay. It stores the owning InfoDisplay and UI scale and defines no-op hooks (delete, storeScaledValues) plus default canDraw and draw that subclasses such as InfoDisplayKeyValueBox override. Client-side only.
---@class InfoDisplayBox
InfoDisplayBox = {}

--- Creates a box referencing its info display and UI scale; an optional metatable lets subclasses extend it.
---@param infoDisplay any
---@param uiScale any
---@param customMt any
function InfoDisplayBox.new(infoDisplay, uiScale, customMt) end

--- Empty hook for subclasses to release resources.
function InfoDisplayBox:delete() end

--- Stores the new UI scale and recomputes scaled values by calling storeScaledValues.
---@param uiScale any
function InfoDisplayBox:setScale(uiScale) end

--- Empty hook, overridden by subclasses to cache scaled sizes.
function InfoDisplayBox:storeScaledValues() end

--- Returns true by default; subclasses return whether the box has something to show.
function InfoDisplayBox:canDraw() end

--- Default draw that renders nothing and returns the position unchanged; subclasses return the next free position.
---@param posX any
---@param posY any
function InfoDisplayBox:draw(posX, posY) end

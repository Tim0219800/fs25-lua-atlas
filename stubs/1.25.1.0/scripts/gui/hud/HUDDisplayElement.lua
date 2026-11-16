---@meta
-- FS25 1.25.1.0 : gui/hud/HUDDisplayElement.lua (generated stub, FS25 Lua Atlas)

--- Base class for the larger HUD display blocks, derived from HUDElement. It adds remembered original position and optional slide animations (tween sequence) to show or hide the element by translating it, by default half a screen downwards. Subclasses can override getHidingTranslation.
---@class HUDDisplayElement : HUDElement
HUDDisplayElement = {}

--- Constructor taking the overlay, an optional parent HUD element and an optional metatable; initialises the stored original position to 0,0 and no animation state.
---@param overlay table
---@param parentHudElement table?
---@param customMt table?
---@return table
function HUDDisplayElement.new(overlay, parentHudElement, customMt) end

--- Sets visibility. With animate true and no animation running it plays the show/hide slide; otherwise it stops any animation and applies the change immediately, moving the element to its original position or to its hidden offset.
---@param isVisible boolean
---@param animate boolean
function HUDDisplayElement:setVisible(isVisible, animate) end

--- Sets a uniform scale by passing the same value for both axes to the parent.
---@param uiScale any
function HUDDisplayElement:setScale(uiScale) end

--- Remembers the current position as the visible (original) position used by the animations.
function HUDDisplayElement:storeOriginalPosition() end

--- Returns the screen-space translation applied when hidden: 0 horizontally and -0.5 vertically by default. Override in subclasses.
---@return number
---@return number
function HUDDisplayElement:getHidingTranslation() end

--- Tween setter that changes only the X position.
---@param x any
function HUDDisplayElement:animationSetPositionX(x) end

--- Tween setter that changes only the Y position.
---@param y any
function HUDDisplayElement:animationSetPositionY(y) end

--- Starts a tween sequence moving the element by the hiding translation over HUDDisplayElement.MOVE_ANIMATION_DURATION; when it ends the element is really hidden.
function HUDDisplayElement:animateHide() end

--- Makes the element visible and starts a tween sequence moving it back to its original position over MOVE_ANIMATION_DURATION.
function HUDDisplayElement:animateShow() end

--- Animation end callback: after a hide animation it applies the hidden state; nothing to do after a show.
---@param isVisible any
function HUDDisplayElement:onAnimateVisibilityFinished(isVisible) end

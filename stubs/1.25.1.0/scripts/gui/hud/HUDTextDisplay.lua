---@meta
-- FS25 1.25.1.0 : gui/hud/HUDTextDisplay.lua (generated stub, FS25 Lua Atlas)

--- Single-line HUD text element (extends HUDDisplayElement) with optional shadow and tween animation. The element size is recomputed from the text width and height each time setText is called, then placed at the initial position. Rendering uses RenderText functions with the overlay alpha multiplied into the text alpha. Client-side only.
---@class HUDTextDisplay : HUDDisplayElement
HUDTextDisplay = {}

--- Creates an empty text display with a text size in reference pixels, alignment (default left), color (default white) and bold flag. The text must be set later with setText, which sets bounds and position.
---@param posX number
---@param posY number
---@param textSize number
---@param textAlignment integer?
---@param textColor table?
---@param textBold boolean?
---@return table
function HUDTextDisplay.new(posX, posY, textSize, textAlignment, textColor, textBold) end

--- Updates the text and any provided style fields (others keep their value), recomputes the screen text size, resizes the element to the text and puts it at the initial position. Note: textBold uses 'or', so bold cannot be switched off by passing false.
---@param text string
---@param textSize number
---@param textAlignment integer
---@param textColor table
---@param textBold boolean
function HUDTextDisplay:setText(text, textSize, textAlignment, textColor, textBold) end

--- Applies the UI scale through the parent class and recomputes the on-screen text size.
---@param uiScale number
function HUDTextDisplay:setScale(uiScale) end

--- Sets visibility without the parent's repositioning; with animate true it resets the animation when hiding or still running, and starts it when showing.
---@param isVisible boolean
---@param animate boolean
function HUDTextDisplay:setVisible(isVisible, animate) end

--- Sets the overlay alpha, which is multiplied with the text color alpha at draw time.
---@param alpha number
function HUDTextDisplay:setAlpha(alpha) end

--- Writes the four text color channels in place, intended for per-frame changes such as animation.
---@param r number
---@param g number
---@param b number
---@param a number
function HUDTextDisplay:setTextColorChannels(r, g, b, a) end

--- Enables the drop shadow and/or sets its color. Note: 'isShadowEnabled or self.hasShadow' means passing false never disables a shadow already enabled.
---@param isShadowEnabled boolean
---@param shadowColor table
function HUDTextDisplay:setTextShadow(isShadowEnabled, shadowColor) end

--- Stores the element's original position and assigns a tween sequence (or the empty NO_SEQUENCE). It is played by setVisible with animate true.
---@param animationTween table
function HUDTextDisplay:setAnimation(animationTween) end

--- Steps the animation through the parent update, but only while the element is visible.
---@param dt number
function HUDTextDisplay:update(dt) end

--- Renders the text with the stored alignment, bold flag and baseline alignment, preceded by a shadow copy offset by a size factor when enabled. Skipped when empty or hidden. Resets text state afterwards.
function HUDTextDisplay:draw() end

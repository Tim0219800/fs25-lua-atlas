---@meta
-- FS25 1.25.1.0 : gui/hud/HUDTextButtonElement.lua (generated stub, FS25 Lua Atlas)

--- Minimal text button for the HUD. This file only defines setText, which forwards to a textDisplay member; the constructor and the code that creates that member are not in the file (UNVERIFIED). It is not derived from HUDElement here (plain Class).
---@class HUDTextButtonElement
HUDTextButtonElement = {}

--- Forwards text, size, alignment, color and bold flag to the internal textDisplay:setText. Requires self.textDisplay to exist.
---@param text string
---@param textSize number
---@param textAlignment integer
---@param textColor table
---@param textBold boolean
function HUDTextButtonElement:setText(text, textSize, textAlignment, textColor, textBold) end

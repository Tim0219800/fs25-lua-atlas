---@meta
-- FS25 1.25.1.0 : gui/hud/ingameMap/IngameMapMobile.lua (generated stub, FS25 Lua Atlas)

--- Mobile subclass of IngameMap (the HUD/menu map display). It only overrides the scaling behaviour so the element is repositioned to its base position after a scale change.
---@class IngameMapMobile : IngameMap
IngameMapMobile = {}

--- Applies the uiScale through the IngameMap parent implementation, then moves the element to the background position computed for that scale.
---@param uiScale any
function IngameMapMobile:setScale(uiScale) end

---@meta
-- FS25 1.25.1.0 : gui/ConstructionScreen.lua (generated stub, FS25 Lua Atlas)

---@class ConstructionScreen : ScreenElement
ConstructionScreen = {}

---@param target table
---@param custom_mt table
---@return ConstructionScreen
function ConstructionScreen.new(target, custom_mt) end

function ConstructionScreen:onOpen() end

---@param element table
function ConstructionScreen:onClose(element) end

function ConstructionScreen:registerBrushActionEvents() end

function ConstructionScreen:removeBrushActionEvents() end

function ConstructionScreen:buildCellDatabase() end

---@param name string
---@return table
function ConstructionScreen:dequeueDetailsCell(name) end

---@param cell table
function ConstructionScreen:queueDetailsCell(cell) end

---@meta
-- FS25 1.25.1.0 : gui/base/GuiDataSource.lua (stub généré, atlas Lua FS25)

---@class GuiDataSource
GuiDataSource = {}

---@param subclass_mt any
function GuiDataSource.new(subclass_mt) end

---@param data any
function GuiDataSource:setData(data) end

---@param target any
---@param callback any
function GuiDataSource:addChangeListener(target, callback) end

---@param target any
function GuiDataSource:removeChangeListener(target) end

function GuiDataSource:notifyChange() end

function GuiDataSource:getCount() end

---@param index any
function GuiDataSource:getItem(index) end

---@param index any
---@param value any
---@param needsNotification any
function GuiDataSource:setItem(index, value, needsNotification) end

---@param startIndex any
---@param endIndex any
function GuiDataSource:iterateRange(startIndex, endIndex) end

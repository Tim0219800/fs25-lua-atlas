---@meta
-- FS25 1.25.1.0 : gui/elements/IndexStateElement.lua (generated stub, FS25 Lua Atlas)

---@class IndexStateElement : BoxLayoutElement
IndexStateElement = {}

---@param target any
---@param custom_mt any
function IndexStateElement.new(target, custom_mt) end

---@param xmlFile any
---@param key any
function IndexStateElement:loadFromXML(xmlFile, key) end

---@param profile any
---@param applyProfile any
function IndexStateElement:loadProfile(profile, applyProfile) end

---@param src any
function IndexStateElement:copyAttributes(src) end

function IndexStateElement:onGuiSetupFinished() end

function IndexStateElement:locateStateElementTemplate() end

function IndexStateElement:locateIndexableElement() end

---@param index integer
---@param count integer
function IndexStateElement:onIndexChange(index, count) end

---@param count integer
---@param initialIndex integer?
function IndexStateElement:setPageCount(count, initialIndex) end

---@meta
-- FS25 1.25.1.0 : gui/elements/SmoothListElement.lua (generated stub, FS25 Lua Atlas)

---@class SmoothListElement : GuiElement
SmoothListElement = {}

---@param target table?
---@param custom_mt table?
---@return table
function SmoothListElement.new(target, custom_mt) end

---@param xmlFile integer
---@param key string
function SmoothListElement:loadFromXML(xmlFile, key) end

---@param profile table
---@param applyProfile any
function SmoothListElement:loadProfile(profile, applyProfile) end

---@param parent table
---@param includeId boolean?
---@param suppressOnCreate boolean?
---@param blockFocusHandlingReload any
---@return table
function SmoothListElement:clone(parent, includeId, suppressOnCreate, blockFocusHandlingReload) end

---@param src table
function SmoothListElement:copyAttributes(src) end

function SmoothListElement:onGuiSetupFinished() end

function SmoothListElement:buildCellDatabase() end

---@param lambda function
function SmoothListElement:iterateOverDatabase(lambda) end

function SmoothListElement:delete() end

function SmoothListElement:onOpen() end

function SmoothListElement:onClose() end

---@param dataSource table
function SmoothListElement:setDataSource(dataSource) end

---@param delegate table
function SmoothListElement:setDelegate(delegate) end

---@param name string
---@return table
function SmoothListElement:dequeueReusableCell(name) end

---@param cell table
function SmoothListElement:queueReusableCell(cell) end

---@param target table
---@param originalTarget table?
---@param callOnCreate boolean?
function SmoothListElement:setTarget(target, originalTarget, callOnCreate) end

---@param forceCellTypeUpdate boolean
function SmoothListElement:reloadData(forceCellTypeUpdate) end

---@param section integer?
function SmoothListElement:reloadSection(section) end

function SmoothListElement:buildSectionInfo() end

---@param section integer
---@param index integer
---@return number
function SmoothListElement:getLengthOfItemFast(section, index) end

---@param section integer
---@param index integer
---@return number
function SmoothListElement:getWidthOfItemFast(section, index) end

---@param updateSlider boolean
---@param repopulate any
function SmoothListElement:updateView(updateSlider, repopulate) end

function SmoothListElement:scrollToStartGamepad() end

function SmoothListElement:scrollToEndGamepad() end

function SmoothListElement:scrollToStart() end

function SmoothListElement:scrollToEnd() end

function SmoothListElement:scrollToPrevPage() end

function SmoothListElement:scrollToNextPage() end

---@param offset any
function SmoothListElement:smoothScrollTo(offset) end

function SmoothListElement:applyElementSelection() end

function SmoothListElement:clearElementSelection() end

---@return Number
function SmoothListElement:getItemCount() end

function SmoothListElement:getSelectedIndexInSection() end

function SmoothListElement:getSelectedPath() end

---@param section any
---@param index any
function SmoothListElement:getElementAtSectionIndex(section, index) end

function SmoothListElement:activateInput() end

function SmoothListElement:onInputDown() end

function SmoothListElement:onInputUp() end

---@param section any
---@param index any
---@param element any
function SmoothListElement:notifyDoubleClick(section, index, element) end

---@param section any
---@param index any
---@param element any
---@param wasAlreadySelected any
function SmoothListElement:notifyClick(section, index, element, wasAlreadySelected) end

---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param button any
---@param eventUsed any
function SmoothListElement:mouseEvent(posX, posY, isDown, isUp, button, eventUsed) end

---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param touchId any
---@param eventUsed any
---@return any
function SmoothListElement:touchEvent(posX, posY, isDown, isUp, touchId, eventUsed) end

function SmoothListElement:canReceiveFocus() end

function SmoothListElement:onFocusActivate() end

function SmoothListElement:onFocusEnter() end

function SmoothListElement:onFocusLeave() end

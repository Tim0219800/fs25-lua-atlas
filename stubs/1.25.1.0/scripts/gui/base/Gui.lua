---@meta
-- FS25 1.25.1.0 : gui/base/Gui.lua (generated stub, FS25 Lua Atlas)

---@class Gui
Gui = {}

---@return Gui
function Gui.new() end

---@param xmlFile any
---@param rootKey any
function Gui:loadPresets(xmlFile, rootKey) end

---@param xmlFile any
---@param rootKey any
---@param presets any
function Gui:loadTraits(xmlFile, rootKey, presets) end

---@param xmlFile any
---@param rootKey any
---@param presets any
---@param categoryName any
function Gui:loadProfileSet(xmlFile, rootKey, presets, categoryName) end

---@param xmlFilename xmlFilename
function Gui:loadProfiles(xmlFilename) end

---@param xmlFilename xmlFilename
---@param name name
---@param controller controller
---@param isFrame isFrame?
---@return Root
function Gui:loadGui(xmlFilename, name, controller, isFrame) end

---@param xmlFile xmlFile
---@param xmlNodePath xmlNodePath
---@param parentGuiElement parentGuiElement
---@param target target
function Gui:loadGuiRec(xmlFile, xmlNodePath, parentGuiElement, target) end

---@param frameRefElement self
---@return Cloned
function Gui:resolveFrameReference(frameRefElement) end

---@param profileName any
function Gui:getProfile(profileName) end

function Gui:getIsGuiVisible() end

function Gui:getIsDialogVisible() end

function Gui:getIsOverlayGuiVisible() end

---@param guiName any
---@return Root
function Gui:showGui(guiName) end

---@param guiName any
---@param closeAllOthers any
---@return Root
function Gui:showDialog(guiName, closeAllOthers) end

---@param guiName any
function Gui:closeDialogByName(guiName) end

---@param gui any
function Gui:closeDialog(gui) end

function Gui:closeAllDialogs() end

function Gui:registerMenuInput() end

---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param button any
function Gui:mouseEvent(posX, posY, isDown, isUp, button) end

---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param touchId any
function Gui:touchEvent(posX, posY, isDown, isUp, touchId) end

---@param unicode any
---@param sym any
---@param modifier any
---@param isDown any
function Gui:keyEvent(unicode, sym, modifier, isDown) end

---@param dt any
function Gui:update(dt) end

function Gui:draw() end

---@param action action
---@param value value
---@return True
function Gui:notifyControls(action, value) end

---@param actionName any
---@param inputValue any
function Gui:onMenuInput(actionName, inputValue) end

---@param action any
function Gui:onReleaseMovement(action) end

---@param action any
function Gui:onReleaseInput(action) end

---@param element any
function Gui:hasElementInputFocus(element) end

---@param screenClass table
---@return table
function Gui:getScreenInstanceByClass(screenClass) end

---@param sourceScreen table?
---@param screenClass table?
---@param returnScreenClass table?
---@return table
function Gui:changeScreen(sourceScreen, screenClass, returnScreenClass) end

function Gui:makeChangeScreenClosure() end

---@param isActive any
---@param contextName any
function Gui:toggleCustomInputContext(isActive, contextName) end

function Gui:makeToggleCustomInputContextClosure() end

function Gui:makePlaySampleClosure() end

---@param guiElement table
---@return table
function Gui:assignPlaySampleCallback(guiElement) end

---@param contextName string?
function Gui:enterMenuContext(contextName) end

function Gui:leaveMenuContext() end

---@param frameController any
---@param frameRootElement any
function Gui:addFrame(frameController, frameRootElement) end

---@param screenClass any
---@param screenInstance any
---@param screenRootElement any
function Gui:addScreen(screenClass, screenInstance, screenRootElement) end

---@param currentMission any
function Gui:setCurrentMission(currentMission) end

---@param mapXmlFile integer
---@param missionInfo any
---@param baseDirectory any
function Gui:loadMapData(mapXmlFile, missionInfo, baseDirectory) end

function Gui:unloadMapData() end

---@param client any
function Gui:setClient(client) end

---@param server any
function Gui:setServer(server) end

---@param baseDir string
function Gui.initGuiLibrary(baseDir) end

---@param name string
---@param class table
function Gui.registerGuiElement(name, class) end

---@param name string
---@param procFunction table
function Gui.registerGuiElementProcFunction(name, procFunction) end

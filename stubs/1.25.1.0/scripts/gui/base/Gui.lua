---@meta
-- FS25 1.25.1.0 : gui/base/Gui.lua (generated stub, FS25 Lua Atlas)

--- Central UI controller (the g_gui instance). It loads GUI profiles, traits and presets, builds screens, dialogs and reusable frames from XML, tracks the current screen and the stack of open dialogs, and routes mouse, touch, key, update, draw and menu-input events to them. It uses FocusManager for focus, GuiSoundPlayer for sounds, g_inputBinding for input contexts, g_messageCenter for open/close messages and g_depthOfFieldManager for dialog blur. It also holds the class mapping that turns XML element names into GuiElement classes (tables and constants defined outside the visible bodies, UNVERIFIED). Client-side UI only.
---@class Gui
Gui = {}

--- Creates the GUI controller: empty registries for screens, dialogs, profiles, traits and presets, a GuiSoundPlayer registered with FocusManager, the callback closures, and an ads-system occlusion region for the UI (initially inactive).
---@return Gui
function Gui.new() end

--- Reads Preset name/value pairs below a root key, resolving $preset_ references to earlier presets, and stores them in self.presets. Duplicate names log a dev error unless a reload is in progress. Returns the presets read from this file.
---@param xmlFile any
---@param rootKey any
function Gui:loadPresets(xmlFile, rootKey) end

--- Loads every Trait element below a root key as a trait GuiProfile and registers it by name; duplicates log a dev error unless reloading.
---@param xmlFile any
---@param rootKey any
---@param presets any
function Gui:loadTraits(xmlFile, rootKey, presets) end

--- Loads every Profile element below a root key into self.profiles, tagging each with a category, and also loads its Variant children as separate profiles named variantName_profileName that default to the profile as parent. Duplicate names log a dev error.
---@param xmlFile any
---@param rootKey any
---@param presets any
---@param categoryName any
function Gui:loadProfileSet(xmlFile, rootKey, presets, categoryName) end

--- Opens a profiles XML file and loads presets, traits, top-level profiles and each Category block. Returns true on success, or logs an error and returns false if the file cannot be opened.
---@param xmlFilename xmlFilename
function Gui:loadProfiles(xmlFilename) end

--- Builds a screen or frame from a view XML: loads its embedded profiles, creates the root GuiElement under the controller, builds children recursively, exposes controls as fields and raises create callbacks. Registers it as a frame or screen; on failure logs an error, deletes the controller and returns nil. Adjusts size for safe-frame screens.
---@param xmlFilename xmlFilename
---@param name name
---@param controller controller
---@param isFrame isFrame?
---@return Root
function Gui:loadGui(xmlFilename, name, controller, isFrame) end

--- Recursively instantiates child elements from XML using the element class mapping (uppercase type name), skips profile nodes, warns on unknown types, applies per-type processing functions, then raises the onCreate callback after the children are built.
---@param xmlFile xmlFile
---@param xmlNodePath xmlNodePath
---@param parentGuiElement parentGuiElement
---@param target target
function Gui:loadGuiRec(xmlFile, xmlNodePath, parentGuiElement, target) end

--- Replaces a frame reference element with a clone of the registered frame of that name, resized to the parent, re-targeted, added to the focus system, and deletes the reference element. Returns the original reference if no such frame exists.
---@param frameRefElement self
---@return Cloned
function Gui:resolveFrameReference(frameRefElement) end

--- Returns a profile by name, preferring platform-specific variants (Platform.guiPrefixes, then console_ or mobile_ prefixes). An unknown non-empty name logs a warning and falls back to the base reference profile (Gui.GUI_PROFILE_BASE).
---@param profileName any
function Gui:getProfile(profileName) end

--- Returns true when a screen is current or any dialog is open.
function Gui:getIsGuiVisible() end

--- Returns true when at least one dialog is open.
function Gui:getIsDialogVisible() end

--- Always returns false in this version; a hook for overlay-style views that keep the game display visible.
function Gui:getIsOverlayGuiVisible() end

--- Opens the screen registered under a name by calling changeScreen with that name's screen class. A nil name is treated as an empty name. Note: it looks up self.guis with the current element rather than a name, which yields nil, so changeScreen falls back to the current GUI as source.
---@param guiName any
---@return Root
function Gui:showGui(guiName) end

--- Opens a dialog by name: optionally closes others, enters the input context (dialog-specific unless the target sets needInput to false), sets focus, pushes it on the stack, calls onOpen, publishes GUI_DIALOG_OPENED and registers a blur area if the target provides one. Returns the root element, or nil for an unknown name.
---@param guiName any
---@param closeAllOthers any
---@return Root
function Gui:showDialog(guiName, closeAllOthers) end

--- Closes the dialog registered under the given name; does nothing if the name is unknown.
---@param guiName any
function Gui:closeDialogByName(guiName) end

--- Closes an open dialog: calls onClose, removes it from the stack, pops its blur area, hands listener role and focus back to the previous dialog or screen, reverts the input context and closes the GUI entirely if nothing is visible any more.
---@param gui any
function Gui:closeDialog(gui) end

--- Closes every open dialog. Note: it removes entries from the list while iterating it with ipairs, so some dialogs can be skipped when several are open.
function Gui:closeAllDialogs() end

--- Registers input action events for the menu navigation actions and axes (hidden from the help text), with release handlers for the page and axis actions, and marks the GUI as listening to input.
function Gui:registerMenuInput() end

--- Forwards a mouse event to the current listener element, and if it is not consumed, to the listener target's mouseEvent when present.
---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param button any
function Gui:mouseEvent(posX, posY, isDown, isUp, button) end

--- Forwards a touch event to the current listener element, and if it is not consumed, to the listener target's touchEvent when present.
---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param touchId any
function Gui:touchEvent(posX, posY, isDown, isUp, touchId) end

--- Forwards a raw key event to the current listener element, and if it is not consumed, to the target's keyEvent when present. Used by elements that need raw keys such as text input.
---@param unicode any
---@param sym any
---@param modifier any
---@param isDown any
function Gui:keyEvent(unicode, sym, modifier, isDown) end

--- Calls update on every open dialog target, then preUpdate and update on the current screen target (checking the screen did not change mid-update), and resets the per-frame input target and handled flag.
---@param dt any
function Gui:update(dt) end

--- Draws the current screen target, then each dialog target on top. When g_uiDebugEnabled is set, it also renders debug text about the focused element and its neighbours and outlines the focused element.
function Gui:draw() end

--- Dispatches a menu action to one receiver per frame unless FocusManager has it locked: the frame input target element, its target, the focused element if active, then FocusManager itself. Records whether the event was consumed. Returns nothing despite the doc comment.
---@param action action
---@param value value
---@return True
function Gui:notifyControls(action, value) end

--- Input event callback for menu actions: forwards to notifyControls only when the GUI is listening and no input was handled yet this frame.
---@param actionName any
---@param inputValue any
function Gui:onMenuInput(actionName, inputValue) end

--- Callback for the release of a movement axis: handles the release like onReleaseInput and then clears the FocusManager direction locks for that axis.
---@param action any
function Gui:onReleaseMovement(action) end

--- Callback for a released menu action: if not locked, calls inputReleaseEvent on the frame input target, its target and the active focused element.
---@param action any
function Gui:onReleaseInput(action) end

--- Returns true if the current listener's target is the given element.
---@param element any
function Gui:hasElementInputFocus(element) end

--- Returns the registered controller instance for a screen class, or nil.
---@param screenClass table
---@return table
function Gui:getScreenInstanceByClass(screenClass) end

--- Switches to the screen of the given class (nil closes the GUI): closes all dialogs and the previous screen, sets the new current screen, enters the menu input context when opening, sets focus, calls onOpen and publishes GUI_BEFORE/AFTER_OPEN or CLOSE messages. Returns the screen root element, or nil with a dev warning if the class is not registered.
---@param sourceScreen table?
---@param screenClass table?
---@param returnScreenClass table?
---@return table
function Gui:changeScreen(sourceScreen, screenClass, returnScreenClass) end

--- Returns a function (source, screenClass, returnScreenClass) that calls changeScreen on this instance, so controllers can switch screens without holding g_gui.
function Gui:makeChangeScreenClosure() end

--- Enters the named custom menu input context when active is true, otherwise leaves the current menu context.
---@param isActive any
---@param contextName any
function Gui:toggleCustomInputContext(isActive, contextName) end

--- Returns a function (isActive, contextName) that calls toggleCustomInputContext on this instance.
function Gui:makeToggleCustomInputContextClosure() end

--- Returns a function (sampleName) that plays a GUI sample through this instance's GuiSoundPlayer.
function Gui:makePlaySampleClosure() end

--- If the element includes PlaySampleMixin, gives it the play-sample closure. Returns the same element either way; suitable as an element processing function.
---@param guiElement table
---@return table
function Gui:assignPlaySampleCallback(guiElement) end

--- Sets the input binding context (default Gui.INPUT_CONTEXT_MENU) as a new level, registers menu input events and marks the GUI as listening.
---@param contextName string?
function Gui:enterMenuContext(contextName) end

--- Reverts the input context once if the GUI is listening, then keeps listening only while some screen or dialog is still visible.
function Gui:leaveMenuContext() end

--- Registers a loaded frame root element under its controller's name and gives the controller the change-screen, input-context and play-sample callbacks.
---@param frameController any
---@param frameRootElement any
function Gui:addFrame(frameController, frameRootElement) end

--- Registers a screen's root element and controller by class and gives the controller the change-screen, input-context and play-sample callbacks.
---@param screenClass any
---@param screenInstance any
---@param screenRootElement any
function Gui:addScreen(screenClass, screenInstance, screenRootElement) end

--- Passes the current mission to every screen controller that implements setCurrentMission.
---@param currentMission any
function Gui:setCurrentMission(currentMission) end

--- Lets the shop config, license plate and color picker screens (not on mobile) and the wardrobe screen (when the platform has one) load map data. Indexes those controllers directly, so each must be registered or this errors.
---@param mapXmlFile integer
---@param missionInfo any
---@param baseDirectory any
function Gui:loadMapData(mapXmlFile, missionInfo, baseDirectory) end

--- Calls unloadMapData on the in-game menu, shop config, license plate and color picker controllers, and on the wardrobe when available. The controllers must be registered or this errors.
function Gui:unloadMapData() end

--- Passes the network client object to every screen controller that implements setClient.
---@param client any
function Gui:setClient(client) end

--- Passes the server object to every screen controller that implements setServer. Note: the original doc comment wrongly says client.
---@param server any
function Gui:setServer(server) end

--- Loads the base GUI Lua files with source(): profile, utils, overlay, data source, mixins, tweens and all GuiElement classes, in a fixed order. The argument is the scripts base directory.
---@param baseDir string
function Gui.initGuiLibrary(baseDir) end

--- Registers a class in Gui.CONFIGURATION_CLASS_MAPPING under the uppercased XML element name, so XML views can instantiate it. Useful for mods adding custom elements.
---@param name string
---@param class table
function Gui.registerGuiElement(name, class) end

--- Registers a processing function in Gui.ELEMENT_PROCESSING_FUNCTIONS under the uppercased element name; loadGuiRec calls it on each newly loaded element of that type and uses its return value as the element.
---@param name string
---@param procFunction table
function Gui.registerGuiElementProcFunction(name, procFunction) end

# gui/base/Gui.lua

*[Version française](../../../fr/scripts/gui/base/Gui.md)*

Source: `dataS/scripts/gui/base/Gui.lua` — FS25 1.25.1.0

✍ Central UI controller (the g_gui instance). It loads GUI profiles, traits and presets, builds screens, dialogs and reusable frames from XML, tracks the current screen and the stack of open dialogs, and routes mouse, touch, key, update, draw and menu-input events to them. It uses FocusManager for focus, GuiSoundPlayer for sounds, g_inputBinding for input contexts, g_messageCenter for open/close messages and g_depthOfFieldManager for dialog blur. It also holds the class mapping that turns XML element names into GuiElement classes (tables and constants defined outside the visible bodies, UNVERIFIED). Client-side UI only.

- **Gui** (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `Gui.new() → Gui` | 61 | ✍ Creates the GUI controller: empty registries for screens, dialogs, profiles, traits and presets, a GuiSoundPlayer registered with FocusManager, the callback closures, and an ads-system occlusion region for the UI (initially inactive). |
| `Gui:loadPresets(xmlFile: any, rootKey: any)` | 121 | ✍ Reads Preset name/value pairs below a root key, resolving $preset_ references to earlier presets, and stores them in self.presets. Duplicate names log a dev error unless a reload is in progress. Returns the presets read from this file. |
| `Gui:loadTraits(xmlFile: any, rootKey: any, presets: any)` | 159 | ✍ Loads every Trait element below a root key as a trait GuiProfile and registers it by name; duplicates log a dev error unless reloading. |
| `Gui:loadProfileSet(xmlFile: any, rootKey: any, presets: any, categoryName: any)` | 182 | ✍ Loads every Profile element below a root key into self.profiles, tagging each with a category, and also loads its Variant children as separate profiles named variantName_profileName that default to the profile as parent. Duplicate names log a dev error. |
| `Gui:loadProfiles(xmlFilename: xmlFilename)` | 241 | ✍ Opens a profiles XML file and loads presets, traits, top-level profiles and each Category block. Returns true on success, or logs an error and returns false if the file cannot be opened. |
| `Gui:loadGui(xmlFilename: xmlFilename, name: name, controller: controller, isFrame: isFrame?) → Root` | 280 | ✍ Builds a screen or frame from a view XML: loads its embedded profiles, creates the root GuiElement under the controller, builds children recursively, exposes controls as fields and raises create callbacks. Registers it as a frame or screen; on failure logs an error, deletes the controller and returns nil. Adjusts size for safe-frame screens. |
| `Gui:loadGuiRec(xmlFile: xmlFile, xmlNodePath: xmlNodePath, parentGuiElement: parentGuiElement, target: target)` | 347 | ✍ Recursively instantiates child elements from XML using the element class mapping (uppercase type name), skips profile nodes, warns on unknown types, applies per-type processing functions, then raises the onCreate callback after the children are built. |
| `Gui:resolveFrameReference(frameRefElement: self) → Cloned` | 396 | ✍ Replaces a frame reference element with a clone of the registered frame of that name, resized to the parent, re-targeted, added to the focus system, and deletes the reference element. Returns the original reference if no such frame exists. |
| `Gui:getProfile(profileName: any)` | 445 | ✍ Returns a profile by name, preferring platform-specific variants (Platform.guiPrefixes, then console_ or mobile_ prefixes). An unknown non-empty name logs a warning and falls back to the base reference profile (Gui.GUI_PROFILE_BASE). |
| `Gui:getIsGuiVisible()` | 489 | ✍ Returns true when a screen is current or any dialog is open. |
| `Gui:getIsDialogVisible()` | 499 | ✍ Returns true when at least one dialog is open. |
| `Gui:getIsOverlayGuiVisible()` | 505 | ✍ Always returns false in this version; a hook for overlay-style views that keep the game display visible. |
| `Gui:showGui(guiName: any) → Root` | 512 | ✍ Opens the screen registered under a name by calling changeScreen with that name's screen class. A nil name is treated as an empty name. Note: it looks up self.guis with the current element rather than a name, which yields nil, so changeScreen falls back to the current GUI as source. |
| `Gui:showDialog(guiName: any, closeAllOthers: any) → Root` | 524 | ✍ Opens a dialog by name: optionally closes others, enters the input context (dialog-specific unless the target sets needInput to false), sets focus, pushes it on the stack, calls onOpen, publishes GUI_DIALOG_OPENED and registers a blur area if the target provides one. Returns the root element, or nil for an unknown name. |
| `Gui:closeDialogByName(guiName: any)` | 579 | ✍ Closes the dialog registered under the given name; does nothing if the name is unknown. |
| `Gui:closeDialog(gui: any)` | 589 | ✍ Closes an open dialog: calls onClose, removes it from the stack, pops its blur area, hands listener role and focus back to the previous dialog or screen, reverts the input context and closes the GUI entirely if nothing is visible any more. |
| `Gui:closeAllDialogs()` | 638 | ✍ Closes every open dialog. Note: it removes entries from the list while iterating it with ipairs, so some dialogs can be skipped when several are open. |
| `Gui:registerMenuInput()` | 646 | ✍ Registers input action events for the menu navigation actions and axes (hidden from the help text), with release handlers for the page and axis actions, and marks the GUI as listening to input. |
| `Gui:mouseEvent(posX: any, posY: any, isDown: any, isUp: any, button: any)` | 690 | ✍ Forwards a mouse event to the current listener element, and if it is not consumed, to the listener target's mouseEvent when present. |
| `Gui:touchEvent(posX: any, posY: any, isDown: any, isUp: any, touchId: any)` | 707 | ✍ Forwards a touch event to the current listener element, and if it is not consumed, to the listener target's touchEvent when present. |
| `Gui:keyEvent(unicode: any, sym: any, modifier: any, isDown: any)` | 724 | ✍ Forwards a raw key event to the current listener element, and if it is not consumed, to the target's keyEvent when present. Used by elements that need raw keys such as text input. |
| `Gui:update(dt: any)` | 740 | ✍ Calls update on every open dialog target, then preUpdate and update on the current screen target (checking the screen did not change mid-update), and resets the per-frame input target and handled flag. |
| `Gui:draw()` | 772 | ✍ Draws the current screen target, then each dialog target on top. When g_uiDebugEnabled is set, it also renders debug text about the focused element and its neighbours and outlines the focused element. |
| `Gui:notifyControls(action: action, value: value) → True` | 825 | ✍ Dispatches a menu action to one receiver per frame unless FocusManager has it locked: the frame input target element, its target, the focused element if active, then FocusManager itself. Records whether the event was consumed. Returns nothing despite the doc comment. |
| `Gui:onMenuInput(actionName: any, inputValue: any)` | 865 | ✍ Input event callback for menu actions: forwards to notifyControls only when the GUI is listening and no input was handled yet this frame. |
| `Gui:onReleaseMovement(action: any)` | 873 | ✍ Callback for the release of a movement axis: handles the release like onReleaseInput and then clears the FocusManager direction locks for that axis. |
| `Gui:onReleaseInput(action: any)` | 881 | ✍ Callback for a released menu action: if not locked, calls inputReleaseEvent on the frame input target, its target and the active focused element. |
| `Gui:hasElementInputFocus(element: any)` | 907 | ✍ Returns true if the current listener's target is the given element. |
| `Gui:getScreenInstanceByClass(screenClass: table) → table` | 919 | ✍ Returns the registered controller instance for a screen class, or nil. |
| `Gui:changeScreen(sourceScreen: table?, screenClass: table?, returnScreenClass: table?) → table` | 929 | ✍ Switches to the screen of the given class (nil closes the GUI): closes all dialogs and the previous screen, sets the new current screen, enters the menu input context when opening, sets focus, calls onOpen and publishes GUI_BEFORE/AFTER_OPEN or CLOSE messages. Returns the screen root element, or nil with a dev warning if the class is not registered. |
| `Gui:makeChangeScreenClosure()` | 984 | ✍ Returns a function (source, screenClass, returnScreenClass) that calls changeScreen on this instance, so controllers can switch screens without holding g_gui. |
| `Gui:toggleCustomInputContext(isActive: any, contextName: any)` | 992 | ✍ Enters the named custom menu input context when active is true, otherwise leaves the current menu context. |
| `Gui:makeToggleCustomInputContextClosure()` | 1002 | ✍ Returns a function (isActive, contextName) that calls toggleCustomInputContext on this instance. |
| `Gui:makePlaySampleClosure()` | 1010 | ✍ Returns a function (sampleName) that plays a GUI sample through this instance's GuiSoundPlayer. |
| `Gui:assignPlaySampleCallback(guiElement: table) → table` | 1020 | ✍ If the element includes PlaySampleMixin, gives it the play-sample closure. Returns the same element either way; suitable as an element processing function. |
| `Gui:enterMenuContext(contextName: string?)` | 1032 | ✍ Sets the input binding context (default Gui.INPUT_CONTEXT_MENU) as a new level, registers menu input events and marks the GUI as listening. |
| `Gui:leaveMenuContext()` | 1042 | ✍ Reverts the input context once if the GUI is listening, then keeps listening only while some screen or dialog is still visible. |
| `Gui:addFrame(frameController: any, frameRootElement: any)` | 1051 | ✍ Registers a loaded frame root element under its controller's name and gives the controller the change-screen, input-context and play-sample callbacks. |
| `Gui:addScreen(screenClass: any, screenInstance: any, screenRootElement: any)` | 1062 | ✍ Registers a screen's root element and controller by class and gives the controller the change-screen, input-context and play-sample callbacks. |
| `Gui:setCurrentMission(currentMission: any)` | 1074 | ✍ Passes the current mission to every screen controller that implements setCurrentMission. |
| `Gui:loadMapData(mapXmlFile: integer, missionInfo: any, baseDirectory: any)` | 1085 | ✍ Lets the shop config, license plate and color picker screens (not on mobile) and the wardrobe screen (when the platform has one) load map data. Indexes those controllers directly, so each must be registered or this errors. |
| `Gui:unloadMapData()` | 1101 | ✍ Calls unloadMapData on the in-game menu, shop config, license plate and color picker controllers, and on the wardrobe when available. The controllers must be registered or this errors. |
| `Gui:setClient(client: any)` | 1116 | ✍ Passes the network client object to every screen controller that implements setClient. |
| `Gui:setServer(server: any)` | 1126 | ✍ Passes the server object to every screen controller that implements setServer. Note: the original doc comment wrongly says client. |
| `Gui.initGuiLibrary(baseDir: string)` | 1152 | ✍ Loads the base GUI Lua files with source(): profile, utils, overlay, data source, mixins, tweens and all GuiElement classes, in a fixed order. The argument is the scripts base directory. |
| `Gui.registerGuiElement(name: string, class: table)` | 1215 | ✍ Registers a class in Gui.CONFIGURATION_CLASS_MAPPING under the uppercased XML element name, so XML views can instantiate it. Useful for mods adding custom elements. |
| `Gui.registerGuiElementProcFunction(name: string, procFunction: table)` | 1224 | ✍ Registers a processing function in Gui.ELEMENT_PROCESSING_FUNCTIONS under the uppercased element name; loadGuiRec calls it on each newly loaded element of that type and uses its return value as the element. |

## Messages

- publishes `MessageType.GUI_DIALOG_OPENED` (l.562)
- publishes `MessageType.GUI_BEFORE_OPEN` (l.954)
- publishes `MessageType.GUI_AFTER_OPEN` (l.965)
- publishes `MessageType.GUI_BEFORE_CLOSE` (l.970)
- publishes `MessageType.GUI_AFTER_CLOSE` (l.973)

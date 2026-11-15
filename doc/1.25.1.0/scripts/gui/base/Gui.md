# gui/base/Gui.lua

Source : `dataS/scripts/gui/base/Gui.lua` — FS25 1.25.1.0

- **Gui** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Gui.new() → Gui` | 61 |  |
| `Gui:loadPresets(xmlFile: any, rootKey: any)` | 121 |  |
| `Gui:loadTraits(xmlFile: any, rootKey: any, presets: any)` | 159 |  |
| `Gui:loadProfileSet(xmlFile: any, rootKey: any, presets: any, categoryName: any)` | 182 |  |
| `Gui:loadProfiles(xmlFilename: xmlFilename)` | 241 |  |
| `Gui:loadGui(xmlFilename: xmlFilename, name: name, controller: controller, isFrame: isFrame?) → Root` | 280 |  |
| `Gui:loadGuiRec(xmlFile: xmlFile, xmlNodePath: xmlNodePath, parentGuiElement: parentGuiElement, target: target)` | 347 |  |
| `Gui:resolveFrameReference(frameRefElement: self) → Cloned` | 396 |  |
| `Gui:getProfile(profileName: any)` | 445 |  |
| `Gui:getIsGuiVisible()` | 489 |  |
| `Gui:getIsDialogVisible()` | 499 |  |
| `Gui:getIsOverlayGuiVisible()` | 505 |  |
| `Gui:showGui(guiName: any) → Root` | 512 |  |
| `Gui:showDialog(guiName: any, closeAllOthers: any) → Root` | 524 |  |
| `Gui:closeDialogByName(guiName: any)` | 579 |  |
| `Gui:closeDialog(gui: any)` | 589 |  |
| `Gui:closeAllDialogs()` | 638 |  |
| `Gui:registerMenuInput()` | 646 |  |
| `Gui:mouseEvent(posX: any, posY: any, isDown: any, isUp: any, button: any)` | 690 |  |
| `Gui:touchEvent(posX: any, posY: any, isDown: any, isUp: any, touchId: any)` | 707 |  |
| `Gui:keyEvent(unicode: any, sym: any, modifier: any, isDown: any)` | 724 |  |
| `Gui:update(dt: any)` | 740 |  |
| `Gui:draw()` | 772 |  |
| `Gui:notifyControls(action: action, value: value) → True` | 825 |  |
| `Gui:onMenuInput(actionName: any, inputValue: any)` | 865 |  |
| `Gui:onReleaseMovement(action: any)` | 873 |  |
| `Gui:onReleaseInput(action: any)` | 881 |  |
| `Gui:hasElementInputFocus(element: any)` | 907 |  |
| `Gui:getScreenInstanceByClass(screenClass: table) → table` | 919 |  |
| `Gui:changeScreen(sourceScreen: table?, screenClass: table?, returnScreenClass: table?) → table` | 929 |  |
| `Gui:makeChangeScreenClosure()` | 984 |  |
| `Gui:toggleCustomInputContext(isActive: any, contextName: any)` | 992 |  |
| `Gui:makeToggleCustomInputContextClosure()` | 1002 |  |
| `Gui:makePlaySampleClosure()` | 1010 |  |
| `Gui:assignPlaySampleCallback(guiElement: table) → table` | 1020 |  |
| `Gui:enterMenuContext(contextName: string?)` | 1032 |  |
| `Gui:leaveMenuContext()` | 1042 |  |
| `Gui:addFrame(frameController: any, frameRootElement: any)` | 1051 |  |
| `Gui:addScreen(screenClass: any, screenInstance: any, screenRootElement: any)` | 1062 |  |
| `Gui:setCurrentMission(currentMission: any)` | 1074 |  |
| `Gui:loadMapData(mapXmlFile: integer, missionInfo: any, baseDirectory: any)` | 1085 |  |
| `Gui:unloadMapData()` | 1101 |  |
| `Gui:setClient(client: any)` | 1116 |  |
| `Gui:setServer(server: any)` | 1126 |  |
| `Gui.initGuiLibrary(baseDir: string)` | 1152 |  |
| `Gui.registerGuiElement(name: string, class: table)` | 1215 |  |
| `Gui.registerGuiElementProcFunction(name: string, procFunction: table)` | 1224 |  |

## Messages

- publie `MessageType.GUI_DIALOG_OPENED` (l.562)
- publie `MessageType.GUI_BEFORE_OPEN` (l.954)
- publie `MessageType.GUI_AFTER_OPEN` (l.965)
- publie `MessageType.GUI_BEFORE_CLOSE` (l.970)
- publie `MessageType.GUI_AFTER_CLOSE` (l.973)

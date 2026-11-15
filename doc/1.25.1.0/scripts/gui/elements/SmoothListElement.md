# gui/elements/SmoothListElement.lua

Source : `dataS/scripts/gui/elements/SmoothListElement.lua` — FS25 1.25.1.0

- **SmoothListElement** hérite de `GuiElement` (l.33)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SmoothListElement.new(target: table?, custom_mt: table?) → table` | 50 |  |
| `SmoothListElement:loadFromXML(xmlFile: integer, key: string)` | 134 |  |
| `SmoothListElement:loadProfile(profile: table, applyProfile: any)` | 205 |  |
| `SmoothListElement:clone(parent: table, includeId: boolean?, suppressOnCreate: boolean?, blockFocusHandlingReload: any) → table` | 254 |  |
| `SmoothListElement:copyAttributes(src: table)` | 274 |  |
| `SmoothListElement:onGuiSetupFinished()` | 327 |  |
| `SmoothListElement:buildCellDatabase()` | 355 |  |
| `SmoothListElement:iterateOverDatabase(lambda: function)` | 407 |  |
| `SmoothListElement:delete()` | 425 |  |
| `SmoothListElement:onOpen()` | 446 |  |
| `SmoothListElement:onClose()` | 460 |  |
| `SmoothListElement:setDataSource(dataSource: table)` | 473 |  |
| `SmoothListElement:setDelegate(delegate: table)` | 484 |  |
| `SmoothListElement:dequeueReusableCell(name: string) → table` | 500 |  |
| `SmoothListElement:queueReusableCell(cell: table)` | 526 |  |
| `SmoothListElement:setTarget(target: table, originalTarget: table?, callOnCreate: boolean?)` | 549 |  |
| `SmoothListElement:reloadData(forceCellTypeUpdate: boolean)` | 573 |  |
| `SmoothListElement:reloadSection(section: integer?)` | 600 |  |
| `SmoothListElement:buildSectionInfo()` | 607 |  |
| `SmoothListElement:getLengthOfItemFast(section: integer, index: integer) → number` | 791 |  |
| `SmoothListElement:getWidthOfItemFast(section: integer, index: integer) → number` | 803 |  |
| `SmoothListElement:updateView(updateSlider: boolean, repopulate: any)` | 814 |  |
| `SmoothListElement:scrollToStartGamepad()` | 1048 |  |
| `SmoothListElement:scrollToEndGamepad()` | 1063 |  |
| `SmoothListElement:scrollToStart()` | 1078 |  |
| `SmoothListElement:scrollToEnd()` | 1088 |  |
| `SmoothListElement:scrollToPrevPage()` | 1102 |  |
| `SmoothListElement:scrollToNextPage()` | 1147 |  |
| `SmoothListElement:smoothScrollTo(offset: any)` | 1185 |  |
| `SmoothListElement:applyElementSelection()` | 1279 |  |
| `SmoothListElement:clearElementSelection()` | 1289 |  |
| `SmoothListElement:getItemCount() → Number` | 1455 |  |
| `SmoothListElement:getSelectedIndexInSection()` | 1461 |  |
| `SmoothListElement:getSelectedPath()` | 1473 |  |
| `SmoothListElement:getElementAtSectionIndex(section: any, index: any)` | 1479 |  |
| `SmoothListElement:activateInput()` | 1534 |  |
| `SmoothListElement:onInputDown()` | 1576 |  |
| `SmoothListElement:onInputUp()` | 1585 |  |
| `SmoothListElement:notifyDoubleClick(section: any, index: any, element: any)` | 1598 |  |
| `SmoothListElement:notifyClick(section: any, index: any, element: any, wasAlreadySelected: any)` | 1604 |  |
| `SmoothListElement:mouseEvent(posX: any, posY: any, isDown: any, isUp: any, button: any, eventUsed: any)` | 1610 |  |
| `SmoothListElement:touchEvent(posX: any, posY: any, isDown: any, isUp: any, touchId: any, eventUsed: any) → any` | 1681 |  |
| `SmoothListElement:canReceiveFocus()` | 1906 |  |
| `SmoothListElement:onFocusActivate()` | 1912 |  |
| `SmoothListElement:onFocusEnter()` | 1934 |  |
| `SmoothListElement:onFocusLeave()` | 1944 |  |

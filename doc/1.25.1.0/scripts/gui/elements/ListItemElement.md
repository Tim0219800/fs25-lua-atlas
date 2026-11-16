# gui/elements/ListItemElement.lua

*[Version française](../../../fr/scripts/gui/elements/ListItemElement.md)*

Source: `dataS/scripts/gui/elements/ListItemElement.lua` — FS25 1.25.1.0

✍ ListItemElement is a BitmapElement used as a row or cell by SmoothListElement, with a background image layer. It supports selection rules, optional focusing of children and alternating row colors, and raises onFocus, onLeave and onClick callbacks from mouse and touch input. XML or profile keys: allowSelected, autoSelectChildren, alternateChildren, hideSelection, alternateBackgroundColor.

- **ListItemElement** inherits from `BitmapElement` (l.21)

## Functions

| Function | Line | Description |
|---|---|---|
| `ListItemElement.new(target: any, custom_mt: any)` | 27 | ✍ Constructor. Sets selection allowed, handleFocus off, children auto-selection off, no alternate background and an empty attributes table. |
| `ListItemElement:loadFromXML(xmlFile: any, key: any)` | 46 | ✍ Reads allowSelected, autoSelectChildren, alternateChildren and hideSelection, and registers the onFocus, onLeave and onClick callbacks from the XML node. |
| `ListItemElement:loadProfile(profile: any, applyProfile: any)` | 61 | ✍ Reads the four boolean options from the profile. On first load only, stores the normal overlay color as backgroundColor and reads alternateBackgroundColor. |
| `ListItemElement:copyAttributes(src: any)` | 79 | ✍ Copies selection options, background colors, the section-header flag and the three callbacks from a source element. |
| `ListItemElement:onClose()` | 99 | ✍ Calls the parent onClose, then resets the element. |
| `ListItemElement:setSelected(selected: any)` | 115 | ✍ Applies selection only if the item allows it and does not hide the selection. |
| `ListItemElement:mouseEvent(posX: any, posY: any, isDown: any, isUp: any, button: any, eventUsed: any)` | 121 | ✍ Handles mouse input when visible: highlights and raises onFocus on first hover, raises onClick on left button down, raises onLeave and clears highlight on exit. Returns whether the event was used. |
| `ListItemElement:touchEvent(posX: any, posY: any, isDown: any, isUp: any, touchId: any, eventUsed: any)` | 171 | ✍ Touch equivalent of mouseEvent: highlight and onFocus on entry, onClick on touch down, onLeave and unhighlight on exit. Returns whether the event was used. |
| `ListItemElement:getFocusTarget(incomingDirection: incomingDirection, moveDirection: moveDirection) → GuiElement` | 230 | ✍ Delegates to the parent focus target only when autoSelectChildren is true; otherwise the item itself is the focus target. |

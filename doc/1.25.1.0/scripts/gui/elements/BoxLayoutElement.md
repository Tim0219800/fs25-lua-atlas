# gui/elements/BoxLayoutElement.lua

*[Version française](../../../fr/scripts/gui/elements/BoxLayoutElement.md)*

Source: `dataS/scripts/gui/elements/BoxLayoutElement.lua` — FS25 1.25.1.0

✍ Layout container that arranges its children in rows or columns (flows), derived from BitmapElement and able to draw a background image. Children whose `ignoreLayout` is set are skipped. XML/profile keys include alignmentX/Y, fillDirectionX/Y, flowDirection, focusDirection, numFlows, elementSpacing, lateralFlowSize, fitFlowToElements, autoValidateLayout, useFullVisibility, wrapAround and rememberLastFocus. It also links its children for gamepad focus navigation. `invalidateLayout` (which triggers the layout) is defined outside this file. Client-side GUI.

- **BoxLayoutElement** inherits from `BitmapElement` (l.29)

## Functions

| Function | Line | Description |
|---|---|---|
| `BoxLayoutElement.new(target: any, custom_mt: any)` | 84 | ✍ Constructor with defaults: horizontal flow, left/top alignment, left-to-right and top-to-bottom filling, one flow, flows fitted to elements, no spacing, no auto validation, full visibility checks, empty cell tables. |
| `BoxLayoutElement:loadFromXML(xmlFile: any, key: any)` | 119 | ✍ Reads alignment, fill directions, flow and focus direction, flow count, spacing, lateral flow size and the boolean options listed in the module description from the XML node. fitFlowToElements defaults to true when lateralFlowSize is 0. |
| `BoxLayoutElement:loadProfile(profile: any, applyProfile: any)` | 182 | ✍ Same settings as the XML loader but read from a GUI profile. |
| `BoxLayoutElement:copyAttributes(src: any)` | 246 | ✍ Copies alignment, fill directions, flow/focus direction, flow count, sizes, spacing, tolerances and boolean options from a source layout. |
| `BoxLayoutElement:onGuiSetupFinished()` | 270 | ✍ Computes the layout tolerance in screen units from the pixel size constant, then invalidates the layout so it gets built. |
| `BoxLayoutElement:addElement(element: any)` | 280 | ✍ Adds a child, resets its anchor and pivot to (0,0) so they do not interfere with layouting, and invalidates the layout when auto-validation is on. |
| `BoxLayoutElement:removeElement(element: any)` | 294 | ✍ Removes a child and invalidates the layout when auto-validation is on. |
| `BoxLayoutElement:getIsElementIncluded(element: any, ignoreVisibility: any)` | 304 | ✍ Decides whether a child takes part in the layout, based on `ignoreLayout`, the ignoreVisibility argument and visibility mode (full or own visible flag). Note: operator precedence of the `and`/`or` chain means `ignoreLayout` only guards the first branch. |
| `BoxLayoutElement:updateLayoutCells(ignoreVisibility: boolean)` | 312 | ✍ Rebuilds the cell table from the included children: places them in order, starts a new flow when the size would overflow (while the flow count allows), and records flow sizes, lateral sizes and totals. Sizes include margins and spacing. |
| `BoxLayoutElement:applyCellPositions(offsetX: integer, offsetY: integer)` | 376 | ✍ Positions every cell element according to alignment, fill directions, flow sizes, margins and spacing, with optional x/y offsets (used by scrolling layouts). Also resets each cell's anchor and pivot. |
| `BoxLayoutElement:focusLinkCells()` | 439 | ✍ Finds the first and last focusable element among the cells, stores the first as default focus target, clears the incoming focus targets and links each focusable cell to its neighbors through `focusLinkChildElement` (defined elsewhere). |
| `BoxLayoutElement:canReceiveFocus()` | 541 | ✍ Returns true only if the layout handles focus and at least one child can receive focus. |
| `BoxLayoutElement:onFocusLeave()` | 595 | ✍ Runs the parent handler; when `rememberLastFocus` is set and the currently focused element is a descendant, stores it as `lastFocusElement`. |
| `BoxLayoutElement:updateAbsolutePosition()` | 608 | ✍ Updates the absolute position through the parent, then reapplies the cell positions so children follow. |

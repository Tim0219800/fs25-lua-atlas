# gui/ConstructionScreen.lua

*[Version française](../../fr/scripts/gui/ConstructionScreen.md)*

Source: `dataS/scripts/gui/ConstructionScreen.lua` — FS25 1.25.1.0

✍ Client-side construction (build mode) screen, derived from ScreenElement. It owns a top-down camera, a cursor, construction sounds, the active brush, and caches of menu cells for the item list and attribute details. It gets brush classes from g_constructionBrushTypeManager and handles input contexts and action events. Much of the file is outside the described entries.

- **ConstructionScreen** inherits from `ScreenElement` (l.16)

## Functions

| Function | Line | Description |
|---|---|---|
| `ConstructionScreen.new(target: table, custom_mt: table) → ConstructionScreen` | 36 | ✍ Creates the screen with a GuiTopDownCamera, GuiTopDownCursor and ConstructionSound, no brush, and empty tables for items, events, marquee boxes, cloned elements and cell caches. Mouse mode is on by default. |
| `ConstructionScreen:onOpen()` | 123 | ✍ Activates the construction input context, camera and cursor, shifts the safe frame by the menu width, and creates the select and destruct brushes on first use. It then selects the selector brush, rebuilds data, shows the input help and subscribes to messages. In first person on foot, it shows the player model. |
| `ConstructionScreen:onClose(element: table)` | 191 | ✍ Reverses onOpen: hides the player model again if shown, unsubscribes from messages, restores input help and safe frame, and clears the open time. It removes the brush, deactivates cursor and camera, removes menu action events and reverts the input context. |
| `ConstructionScreen:registerBrushActionEvents()` | 556 | ✍ Registers input action events for the current brush (primary, secondary, tertiary, and others) according to the brush flags such as dragging support. Stores event ids in brushEvents and sets high text priority on the main buttons. Does nothing without a brush. |
| `ConstructionScreen:removeBrushActionEvents()` | 705 | ✍ Removes every action event listed in brushEvents and clears the stored references to the primary, secondary, tertiary, fourth, axis, snapping and show-configs events. |
| `ConstructionScreen:buildCellDatabase()` | 2048 | ✍ Builds the template table for the attribute layout: clones each element of attributesLayout by name and creates an empty cache for it. Prepares the reuse done by dequeueDetailsCell and queueDetailsCell. |
| `ConstructionScreen:dequeueDetailsCell(name: string) → table` | 2064 | ✍ Returns a details cell of the given name, taken from the cache or cloned from its template, and adds it to the attributes layout. Returns nil if no template exists for that name. |
| `ConstructionScreen:queueDetailsCell(cell: table)` | 2087 | ✍ Returns a cell to the cache of its name, removes it from the attributes layout and unlinks it. Note: no reset of the cell happens here, despite what one would expect from a cache release. |

## Messages

- subscribes `MessageType.INPUT_MODE_CHANGED` (l.158)
- subscribes `MessageType.SLOT_USAGE_CHANGED` (l.173)
- subscribes `MessageType.APP_WINDOW_FOCUS_CHANGED` (l.177)

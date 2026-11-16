# gui/elements/TabbedMenuFrameElement.lua

*[Version française](../../../fr/scripts/gui/elements/TabbedMenuFrameElement.md)*

Source: `dataS/scripts/gui/elements/TabbedMenuFrameElement.lua` — FS25 1.25.1.0

✍ Base class (derived from FrameElement) for the frames shown inside the tabbed in-game menu. It stores custom menu-button info with a dirty flag so the container menu can refresh its buttons, the page number, a title, and a close-request hook for frames that must finish work first. The container is not in this file, so how it consumes these values is UNVERIFIED.

- **TabbedMenuFrameElement** inherits from `FrameElement` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `TabbedMenuFrameElement.new(target: any, customMt: any)` | 18 | ✍ Constructor. Initialises empty menu-button info, the dirty flags, current page 1 (one page) and a no-op close callback. |
| `TabbedMenuFrameElement:initialize(...: any)` | 39 | ✍ Empty hook for late initialisation of a frame; subclasses override it. Accepts any arguments and does nothing here. |
| `TabbedMenuFrameElement:getHasCustomMenuButtons()` | 44 | ✍ Returns whether this frame supplies its own menu buttons. |
| `TabbedMenuFrameElement:getMenuButtonInfo() → table` | 51 | ✍ Returns the stored array of custom button descriptions (input action, optional text, optional callback). |
| `TabbedMenuFrameElement:setMenuButtonInfo(menuButtonInfo: table?)` | 58 | ✍ Stores the custom button info and flags custom buttons as present unless nil is passed, which resets it. It does not mark the info dirty. |
| `TabbedMenuFrameElement:setMenuButtonInfoDirty()` | 65 | ✍ Raises the dirty flag so the container menu rebuilds its buttons from this frame's info. |
| `TabbedMenuFrameElement:isMenuButtonInfoDirty()` | 71 | ✍ Returns whether the button info has changed since the flag was last cleared. |
| `TabbedMenuFrameElement:clearMenuButtonInfoDirty()` | 77 | ✍ Clears the button-info dirty flag. |
| `TabbedMenuFrameElement:getMainElementSize()` | 83 | ✍ Returns the default main-content size {1, 1} (full screen in normalised units). Subclasses override it. |
| `TabbedMenuFrameElement:getMainElementPosition()` | 89 | ✍ Returns the default main-content position {0, 0}. Subclasses override it. |
| `TabbedMenuFrameElement:requestClose(callback: any)` | 98 | ✍ Stores the given callback (or a no-op) and returns true, meaning closing is allowed at once. Subclasses override it to delay closing, e.g. to save changes, and call the callback later. |
| `TabbedMenuFrameElement:onFrameOpen()` | 105 | ✍ Called by the container when the frame opens. Runs the superclass onOpen, then calls updatePagingButtons, which is not defined in this file (UNVERIFIED, presumably from FrameElement). |
| `TabbedMenuFrameElement:onFrameClose()` | 113 | ✍ Called by the container when the frame closes. Only forwards to the superclass onClose. |
| `TabbedMenuFrameElement:setTitle(title: any)` | 121 | ✍ Stores the frame title and, if a pagingTitle element exists on the frame, updates its text too. |

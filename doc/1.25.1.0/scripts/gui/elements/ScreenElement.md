# gui/elements/ScreenElement.lua

*[Version française](../../../fr/scripts/gui/elements/ScreenElement.md)*

Source: `dataS/scripts/gui/elements/ScreenElement.lua` — FS25 1.25.1.0

✍ Base class of full-screen GUI views, extending FrameElement. It tracks open state, shows the mouse cursor while open and restores it on close, and centralizes shared input handling: page prev/next for a page selector, list scrolling actions forwarded to the focused element, and dispatch to button actions. A few helpers it references (such as callButtonsWithAction, onPagePrevious, onPageNext) are not in this dump (UNVERIFIED).

- **ScreenElement** inherits from `FrameElement` (l.17)

## Functions

| Function | Line | Description |
|---|---|---|
| `ScreenElement.new(target: any, custom_mt: any)` | 21 | ✍ Constructor. Builds a FrameElement and sets defaults: back allowed, cursor handling on, no return screen class, closed, not initialized, click sound not muted. |
| `ScreenElement:onOpen()` | 37 | ✍ Called when the screen opens: runs initializeScreen once, remembers the current mouse cursor visibility, forces the cursor visible through g_inputBinding and sets the open flag. |
| `ScreenElement:initializeScreen()` | 50 | ✍ One-time setup marking the screen as initialized; if a pageSelector exists, disables the click sounds of its buttons since paging sounds are handled elsewhere. |
| `ScreenElement:onClose()` | 61 | ✍ Called when the screen closes: restores the previous mouse cursor state if handleCursorVisibility is set and clears the open flag. |
| `ScreenElement:invalidateScreen()` | 144 | ✍ Empty hook for subclasses to refresh their content; does nothing here. |
| `ScreenElement:inputEvent(action: any, value: any, eventUsed: any)` | 169 | ✍ Handles input after the parent: page prev/next actions call onPagePrevious/onPageNext when a pageSelector exists (always consumed), list start/end/page actions call the matching scroll method on the focused element if present, and remaining actions are tried on child buttons. Does nothing while inputDisableTime is positive. |
| `ScreenElement:setReturnScreenClass(returnScreenClass: any)` | 252 | ✍ Stores which screen class gets opened when the user goes back from this screen. |
| `ScreenElement:getIsOpen()` | 258 | ✍ Returns whether the screen is currently open. |
| `ScreenElement:canReceiveFocus()` | 264 | ✍ Returns true only when the screen is visible and every child element can itself receive focus. |
| `ScreenElement:setNextScreenClickSoundMuted(value: any)` | 281 | ✍ Sets the flag that mutes the next click sound, used to override sounds for activate and cancel actions. Called without argument it sets true. |

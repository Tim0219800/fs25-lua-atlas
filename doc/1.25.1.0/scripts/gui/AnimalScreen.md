# gui/AnimalScreen.lua

*[Version française](../../fr/scripts/gui/AnimalScreen.md)*

Source: `dataS/scripts/gui/AnimalScreen.lua` — FS25 1.25.1.0

✍ Client-side full-screen GUI for the animal dealer, derived from ScreenElement. It lets the player switch between buying and selling, and walks through three selection steps (source, target husbandry, amount). It uses a controller object, the message center for money changes, and the input binding for its action events. Most of the file is outside the described entries.

- **AnimalScreen** inherits from `ScreenElement` (l.18)

## Functions

| Function | Line | Description |
|---|---|---|
| `AnimalScreen.new(custom_mt: table) → table` | 35 | ✍ Creates the screen instance, starting in buy mode with the source selected, closed, zero balance, no animals and no selection state. Also prepares the table mapping source selector states to animal types. |
| `AnimalScreen:delete()` | 133 | ✍ Deletes all cloned dot elements in the source dot box, deletes the dot template, then calls the parent delete. |
| `AnimalScreen:onOpen()` | 146 | ✍ Sets the game state to the animal shop, opens in buy mode, and falls back to sell mode if the buy list is empty. If nothing can be sold either, it closes the screen and shows an info dialog. Otherwise it subscribes to MONEY_CHANGED and registers action events. |
| `AnimalScreen:onClose(element: table)` | 195 | ✍ Resets the controller, removes action events and the custom input context, resets the mission game state, and displays the pending money changes for animal purchases and sales. Unsubscribes from messages and marks the screen as closed. |
| `AnimalScreen:setSelectionState(state: any, forceUpdate: any)` | 225 | ✍ Moves the screen to the source, target or amount step. It skips steps that are unusable (no husbandry, a single non-scrollable husbandry, hidden amount box), updates the highlighted boxes and rebuilds the gamepad focus links. Returns false if the target step is impossible. |
| `AnimalScreen:onClickBack()` | 721 | ✍ Back button handler. Closes the screen on mobile or when already on the source step; otherwise goes back one step in buy mode, or two steps in sell mode. |
| `AnimalScreen:onClickSelect()` | 737 | ✍ Select button handler. Advances one step in buy mode or two in sell mode, unless the amount step is already reached. Always returns true. |
| `AnimalScreen:removeActionEvents()` | 886 | ✍ Removes every input action event registered by this screen as target through g_inputBinding. |

## Messages

- subscribes `MessageType.MONEY_CHANGED` (l.165)

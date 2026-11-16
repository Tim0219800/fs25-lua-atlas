# player/graphical/PlayerStyleConfig.lua

*[Version française](../../../fr/scripts/player/graphical/PlayerStyleConfig.md)*

Source: `dataS/scripts/player/graphical/PlayerStyleConfig.lua` — FS25 1.25.1.0

✍ Represents one slot of a PlayerStyle (face, beard, top and so on) with its item list, selected item and colour. It also defines the getter filters that decide which items of a slot are currently usable. Most of the class body (constructor, XML loading, streams) is absent from the SDK dump; only the filters and lookup helpers are documented.

- **PlayerStyleConfig** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlayerStyleConfig:ENABLED_GETTER_FILTER(index: integer) → boolean` | 34 | ✍ Filter: returns true unless the owning style has marked this config as disabled for the current selection. |
| `PlayerStyleConfig:NOT_HIDDEN_GETTER_FILTER(index: integer, gear: PlayerStyleItem) → boolean` | 43 | ✍ Filter: accepts an item only if its hidden flag is not set. |
| `PlayerStyleConfig:NOT_FOR_HAT_GETTER_FILTER(index: integer, hair: PlayerStyleItem) → boolean` | 52 | ✍ Filter: accepts a hair style only if it is not the variant meant to be worn under a hat. |
| `PlayerStyleConfig:SELECTED_GETTER_FILTER(index: integer) → boolean` | 60 | ✍ Filter: accepts only the item whose index equals the currently selected item index. |
| `PlayerStyleConfig:NO_ONEPIECE_GETTER_FILTER(index: integer) → boolean` | 68 | ✍ Filter: returns true only when no one-piece outfit is selected (its selected index is 0), used by top and bottom. |
| `PlayerStyleConfig:BEARD_FACE_GETTER_FILTER(index: integer, beard: PlayerStyleItem) → boolean` | 77 | ✍ Filter: accepts a beard that has no face restriction, or whose face name matches the currently selected face item. |
| `PlayerStyleConfig:getItemNameIndex(itemName: string) → integer` | 247 | ✍ Looks up an item by its name and returns its position in this config, or nil if the name is nil, blank or unknown. |
| `PlayerStyleConfig:getItemIndex(item: PlayerStyleItem) → integer` | 270 | ✍ Gives the position of an item within this config, or nil when no item is passed or it is not found. The empty item at index 0 is handled as a special case. |
| `PlayerStyleConfig:getSelectedItem() → PlayerStyleItem` | 291 | ✍ Returns the currently selected item, or nil if the selected index has no item. |

# gui/elements/IngameMapPreviewElement.lua

*[Version française](../../../fr/scripts/gui/elements/IngameMapPreviewElement.md)*

Source: `dataS/scripts/gui/elements/IngameMapPreviewElement.lua` — FS25 1.25.1.0

✍ IngameMapPreviewElement is a small GuiElement subclass that only restores the shared in-game map when it closes. It expects a field ingameMap (set elsewhere, UNVERIFIED) and undoes the custom layout, hotspot clipping and clip area applied for a map preview.

- **IngameMapPreviewElement** inherits from `GuiElement` (l.10)

## Functions

| Function | Line | Description |
|---|---|---|
| `IngameMapPreviewElement:onClose()` | 62 | ✍ Calls the parent onClose, then resets the map: custom layout to nil, clipHotspots to false and the map clip area cleared. |

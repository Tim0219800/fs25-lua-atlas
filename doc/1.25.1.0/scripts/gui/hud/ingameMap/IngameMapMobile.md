# gui/hud/ingameMap/IngameMapMobile.lua

*[Version française](../../../../fr/scripts/gui/hud/ingameMap/IngameMapMobile.md)*

Source: `dataS/scripts/gui/hud/ingameMap/IngameMapMobile.lua` — FS25 1.25.1.0

✍ Mobile subclass of IngameMap (the HUD/menu map display). It only overrides the scaling behaviour so the element is repositioned to its base position after a scale change.

- **IngameMapMobile** inherits from `IngameMap` (l.16)

## Functions

| Function | Line | Description |
|---|---|---|
| `IngameMapMobile:setScale(uiScale: any)` | 311 | ✍ Applies the uiScale through the IngameMap parent implementation, then moves the element to the background position computed for that scale. |

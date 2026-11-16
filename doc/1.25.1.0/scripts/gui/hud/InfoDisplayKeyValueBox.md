# gui/hud/InfoDisplayKeyValueBox.lua

*[Version française](../../../fr/scripts/gui/hud/InfoDisplayKeyValueBox.md)*

Source: `dataS/scripts/gui/hud/InfoDisplayKeyValueBox.lua` — FS25 1.25.1.0

✍ Info box (extends InfoDisplayBox) meant to show a title and key/value lines on a three-part background. Only the constructor is in this file: it creates the fieldInfo top/middle/bottom background overlays, colored from HUD.COLOR.BACKGROUND, and a warning icon colored from HUD.COLOR.ACTIVE. Line and title methods are not defined here (UNVERIFIED where they live).

- **InfoDisplayKeyValueBox** inherits from `InfoDisplayBox` (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `InfoDisplayKeyValueBox.new(infoDisplay: any, uiScale: any, customMt: any)` | 19 | ✍ Creates the box with an empty line list, the placeholder title 'Unknown Title', three background overlays and a warning icon overlay created through g_overlayManager. |

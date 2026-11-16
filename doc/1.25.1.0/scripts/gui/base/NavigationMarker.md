# gui/base/NavigationMarker.lua

*[Version française](../../../fr/scripts/gui/base/NavigationMarker.md)*

Source: `dataS/scripts/gui/base/NavigationMarker.lua` — FS25 1.25.1.0

✍ HUD marker pointing to a world position: it projects the position to the screen, clamps it to the screen border, draws a pulsing marker overlay with an arrow when off-screen, and prints the distance. Only the render method is in this file; the constructor and fields such as `worldPosX` come from elsewhere (UNVERIFIED).

- **NavigationMarker** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `NavigationMarker:render()` | 62 | ✍ Client-side drawing: returns if hidden, without a local player or closer than `minDistance`. Projects the target via the active camera, clamps to borders, pulses alpha with `g_time`, draws marker, arrow if clamped, and the distance text. |

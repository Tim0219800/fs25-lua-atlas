# gui/hud/HUDSliderElement.lua

*[Version française](../../../fr/scripts/gui/hud/HUDSliderElement.md)*

Source: `dataS/scripts/gui/hud/HUDSliderElement.lua` — FS25 1.25.1.0

✍ HUD slider for touch devices (mobile UI). It registers three touch areas (down, always, up) on a background overlay through g_touchHandler and moves the wrapped overlay along one axis between minimum and maximum translations, with optional center and lock positions. Extends HUDElement. Only the constructor is in this file; callbacks such as onSliderDown, setCallback, setAxisPosition or resetSlider are referenced by other code but not defined here (UNVERIFIED where they come from).

- **HUDSliderElement** inherits from `HUDElement` (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `HUDSliderElement.new(overlay: number, backgroundOverlay: number, touchAreaOffsetX: number, touchAreaOffsetY: number, touchAreaPressedGain: table?, transAxis: any, minTrans: any, centerTrans: any, maxTrans: any, lockTrans: any)` | 23 | ✍ Builds the slider around an overlay and a background overlay, storing axis, min/center/max/lock translations and default speed 0.0002, then registers three touch areas on the background and sets their pressed-size gain. Note: its doc comment describes FrameElement parameters, not these. |

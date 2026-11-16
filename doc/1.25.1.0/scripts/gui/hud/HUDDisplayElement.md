# gui/hud/HUDDisplayElement.lua

*[Version française](../../../fr/scripts/gui/hud/HUDDisplayElement.md)*

Source: `dataS/scripts/gui/hud/HUDDisplayElement.lua` — FS25 1.25.1.0

✍ Base class for the larger HUD display blocks, derived from HUDElement. It adds remembered original position and optional slide animations (tween sequence) to show or hide the element by translating it, by default half a screen downwards. Subclasses can override getHidingTranslation.

- **HUDDisplayElement** inherits from `HUDElement` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `HUDDisplayElement.new(overlay: table, parentHudElement: table?, customMt: table?) → table` | 23 | ✍ Constructor taking the overlay, an optional parent HUD element and an optional metatable; initialises the stored original position to 0,0 and no animation state. |
| `HUDDisplayElement:setVisible(isVisible: boolean, animate: boolean)` | 36 | ✍ Sets visibility. With animate true and no animation running it plays the show/hide slide; otherwise it stops any animation and applies the change immediately, moving the element to its original position or to its hidden offset. |
| `HUDDisplayElement:setScale(uiScale: any)` | 61 | ✍ Sets a uniform scale by passing the same value for both axes to the parent. |
| `HUDDisplayElement:storeOriginalPosition()` | 67 | ✍ Remembers the current position as the visible (original) position used by the animations. |
| `HUDDisplayElement:getHidingTranslation() → number, number` | 76 | ✍ Returns the screen-space translation applied when hidden: 0 horizontally and -0.5 vertically by default. Override in subclasses. |
| `HUDDisplayElement:animationSetPositionX(x: any)` | 82 | ✍ Tween setter that changes only the X position. |
| `HUDDisplayElement:animationSetPositionY(y: any)` | 88 | ✍ Tween setter that changes only the Y position. |
| `HUDDisplayElement:animateHide()` | 94 | ✍ Starts a tween sequence moving the element by the hiding translation over HUDDisplayElement.MOVE_ANIMATION_DURATION; when it ends the element is really hidden. |
| `HUDDisplayElement:animateShow()` | 107 | ✍ Makes the element visible and starts a tween sequence moving it back to its original position over MOVE_ANIMATION_DURATION. |
| `HUDDisplayElement:onAnimateVisibilityFinished(isVisible: any)` | 121 | ✍ Animation end callback: after a hide animation it applies the hidden state; nothing to do after a show. |

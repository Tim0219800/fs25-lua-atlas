# debug/elements/DebugElement.lua

*[Version française](../../../fr/scripts/debug/elements/DebugElement.md)*

Source: `dataS/scripts/debug/elements/DebugElement.lua` — FS25 1.25.1.0

✍ DebugElement is the base class of all Debug* elements: it stores position, colour, optional text, visibility, clip distance and whether to hide when a GUI is open. Setters return self so they can be chained, and `addToManager` registers the element with `g_debugManager`, which calls `getShouldBeDrawn` and `draw` each frame.

- **DebugElement** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `DebugElement.new(customMt: table?) → table` | 18 | ✍ Creates an element at the origin with a white colour, no text, visible, no clip distance and hidden while a GUI is open. Subclasses pass their own metatable. |
| `DebugElement:getShouldBeDrawn() → boolean` | 55 | ✍ Tells the manager whether to call `draw`: false when invisible, when a GUI other than ConstructionScreen is shown and hiding is on, or when the active camera is farther than the clip distance. Note: the invisible case returns nil, not false. |
| `DebugElement:draw()` | 76 | ✍ Empty base implementation; subclasses override it to render. |
| `DebugElement:addToManager(groupId: string?, lifetime: number?, maxCount: integer?) → DebugElement` | 86 | ✍ Registers the element with `g_debugManager`, optionally in a named group, with a lifetime in ms and a per-group maximum count (oldest removed first). Returns self. |
| `DebugElement:setColorRGBA(r: number, g: number, b: number, a: number?) → DebugElement` | 99 | ✍ Replaces the colour with a new Color built from r, g, b and an optional alpha, each from 0 to 1. Returns self. |
| `DebugElement:setIsVisible(isVisible: boolean) → DebugElement` | 178 | ✍ Shows or hides the element. Returns self. |
| `DebugElement:setVisbileWhenGUIOpen(isVisible: boolean) → DebugElement` | 191 | ✍ Chooses whether the element stays visible while a GUI is open (stored inverted as `hideWhenGuiIsOpen`). The method name contains a typo, Visbile. Returns self. |
| `DebugElement:setClipDistance(clipDistance: number?) → DebugElement` | 204 | ✍ Sets the maximum camera distance at which the element is drawn; nil disables clipping. Returns self. |

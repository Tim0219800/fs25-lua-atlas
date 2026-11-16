# debug/elements/DebugFunction.lua

*[Version française](../../../fr/scripts/debug/elements/DebugFunction.md)*

Source: `dataS/scripts/debug/elements/DebugFunction.lua` — FS25 1.25.1.0

✍ DebugFunction is a lightweight debug element that runs a user-supplied draw function each frame, so custom debug rendering can be registered with the DebugManager. It does not inherit from DebugElement.

- **DebugFunction** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `DebugFunction:getShouldBeDrawn() → boolean` | 58 | ✍ Always returns true, so the manager always calls `draw`. |
| `DebugFunction:draw()` | 64 | ✍ Calls the stored `drawFunc` with the element as argument if one is set; otherwise does nothing. |

# objects/NightIllumination.lua

*[Version française](../../fr/scripts/objects/NightIllumination.md)*

Source: `dataS/scripts/objects/NightIllumination.lua` — FS25 1.25.1.0

✍ Legacy i3D onCreate user-attribute handler. It no longer does any lighting work: it only logs a deprecation warning pointing to the Visibility Condition tab of GIANTS Editor.


## Functions

| Function | Line | Description |
|---|---|---|
| `NightIllumination:onCreate(id: integer)` | 19 | ✍ Logs a deprecation warning with the node's full path; has no other effect. |

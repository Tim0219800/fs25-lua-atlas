# vehicles/ai/settings/AIUserSetting.lua

*[Version française](../../../../fr/scripts/vehicles/ai/settings/AIUserSetting.md)*

Source: `dataS/scripts/vehicles/ai/settings/AIUserSetting.lua` — FS25 1.25.1.0

✍ Base class for user-adjustable AI settings. It only holds a few default fields (unit text, default postfix, vineyard flag) that concrete settings classes are expected to extend.

- **AIUserSetting** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIUserSetting.new(customMt: any)` | 16 | ✍ Constructor. Creates the object with unitText and defaultPostFix as nil and isVineyardSetting as false. |

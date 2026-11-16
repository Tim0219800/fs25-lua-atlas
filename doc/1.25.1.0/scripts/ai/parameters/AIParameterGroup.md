# ai/parameters/AIParameterGroup.lua

*[Version française](../../../fr/scripts/ai/parameters/AIParameterGroup.md)*

Source: `dataS/scripts/ai/parameters/AIParameterGroup.lua` — FS25 1.25.1.0

✍ Plain container that groups several AI parameters under one localized title for the job setup screen. It is not an `AIParameter` itself.

- **AIParameterGroup** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIParameterGroup.new(title: any, customMt: any)` | 16 | ✍ Creates a group with the given title and an empty parameter list. |
| `AIParameterGroup:getTitle()` | 27 | ✍ Returns the group title. |
| `AIParameterGroup:addParameter(parameter: any)` | 33 | ✍ Appends a parameter to the group. |
| `AIParameterGroup:getParameters()` | 39 | ✍ Returns the list of parameters of the group. |

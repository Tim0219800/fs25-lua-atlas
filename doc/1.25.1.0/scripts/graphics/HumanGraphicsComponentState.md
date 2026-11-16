# graphics/HumanGraphicsComponentState.lua

*[Version française](../../fr/scripts/graphics/HumanGraphicsComponentState.md)*

Source: `dataS/scripts/graphics/HumanGraphicsComponentState.lua` — FS25 1.25.1.0

✍ Tiny data class meant to hold the state of a human graphics component. In this dump it only has a constructor that calls setDefault, which is not defined in this file (UNVERIFIED where it comes from).

- **HumanGraphicsComponentState** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `HumanGraphicsComponentState.new(customMt: any) → table` | 16 | ✍ Creates an instance and calls self:setDefault(). setDefault is not defined here, so the constructor would fail unless it is supplied elsewhere (UNVERIFIED). |

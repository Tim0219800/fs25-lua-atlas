# field/FieldState.lua

*[Version française](../../fr/scripts/field/FieldState.md)*

Source: `dataS/scripts/field/FieldState.lua` — FS25 1.25.1.0

✍ Plain data holder for the state of a field or sampled spot: fruit, growth, weeds, stones, ground type, spray, lime, roller, plow, stubble and water levels, farmland and owner. It has no logic of its own; other classes fill it.

- **FieldState** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `FieldState.new(customMt: any) → table` | 33 | ✍ Constructor. Sets all levels to 0, validity to false, fruit type unknown, ground type NONE, farmland id 0 and owner AccessHandler.NOBODY. |

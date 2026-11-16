# objects/football/FootballFieldActivatable.lua

*[Version française](../../../fr/scripts/objects/football/FootballFieldActivatable.md)*

Source: `dataS/scripts/objects/football/FootballFieldActivatable.lua` — FS25 1.25.1.0

✍ Activatable used to reset the football. This file only defines the distance function; the rest of the class (constructor, run) is not in the dump and is UNVERIFIED.

- **FootballFieldResetActivatable** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `FootballFieldResetActivatable:getDistance(x: any, y: any, z: any)` | 32 | ✍ Returns the distance from the given point to the field's reset trigger node, or `math.huge` if the field has no such node. |

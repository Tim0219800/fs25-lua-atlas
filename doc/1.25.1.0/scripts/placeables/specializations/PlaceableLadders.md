# placeables/specializations/PlaceableLadders.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableLadders.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableLadders.lua` — FS25 1.25.1.0

✍ Placeable specialization for placeables with climbable ladders. In this SDK dump only the collectPickObjects override is present; the ladder trigger loading code is not included, so spec.ladderTriggers is filled elsewhere (UNVERIFIED).

- **PlaceableLadders** (l.9)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableLadders.registerOverwrittenFunctions(placeableType: any)` | 22 | ✍ Overrides collectPickObjects on the placeable type. |
| `PlaceableLadders:collectPickObjects(superFunc: any, node: any)` | 60 | ✍ Calls the parent for the node unless the node is one of the ladder trigger nodes, which are therefore not registered as pickable objects. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerOverwrittenFunction | `collectPickObjects` | 23 |

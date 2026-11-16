# field/Field.lua

*[Version française](../../fr/scripts/field/Field.md)*

Source: `dataS/scripts/field/Field.lua` — FS25 1.25.1.0

✍ Wraps one map field defined in the map i3d: its polygon, area, label position, farmland link and mission flags. Created and loaded by FieldManager. It holds a FieldState instance that is filled with the sampled ground data.

- **Field** (l.19)

## Functions

| Function | Line | Description |
|---|---|---|
| `Field.new(customMt: any) → table` | 29 | ✍ Constructor. Initialises empty polygon data, area of 1 ha, no farmland, no current mission, planned fruit type unknown, missions allowed, and a new FieldState. |
| `Field:load(id: integer) → boolean` | 55 | ✍ Reads the field from an i3d node through user attributes (name, polygonIndex, angle, missionAllowed, missionOnlyGrass, indicator nodes). Computes area in ha and label position; returns false if polygonIndex is missing or unresolved, true otherwise. |
| `Field:delete()` | 108 | ✍ Unsubscribes this object from all message center subscriptions. Does not delete the polygon nodes. |

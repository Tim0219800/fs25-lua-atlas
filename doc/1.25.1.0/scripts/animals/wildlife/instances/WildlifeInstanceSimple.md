# animals/wildlife/instances/WildlifeInstanceSimple.lua

*[Version française](../../../../fr/scripts/animals/wildlife/instances/WildlifeInstanceSimple.md)*

Source: `dataS/scripts/animals/wildlife/instances/WildlifeInstanceSimple.lua` — FS25 1.25.1.0

✍ Simple wildlife instance class, a child of `WildlifeInstance`. The file only defines the despawn test based on its flee state machine.

- **WildlifeInstanceSimple** inherits from `WildlifeInstance` (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `WildlifeInstanceSimple:getCanDespawnNow() → boolean` | 94 | ✍ Returns true if the instance is not fleeing to despawn, has a `despawnTime`, and has lived at least that long since spawning. |

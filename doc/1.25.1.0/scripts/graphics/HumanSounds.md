# graphics/HumanSounds.lua

*[Version française](../../fr/scripts/graphics/HumanSounds.md)*

Source: `dataS/scripts/graphics/HumanSounds.lua` — FS25 1.25.1.0

✍ Sound holder for the human player model. In this dump only the constructor remains: it stores a base directory and builds a raycast collision mask (static objects, water, terrain, terrain delta, road, building, vehicle). Other members are not present (UNVERIFIED).

- **HumanSounds** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `HumanSounds.new(baseDirectory: any, customMt: any) → table` | 44 | ✍ Creates the object with isLoaded false, the given baseDirectory and a raycastMask combining several CollisionFlag values; vehicles are included so a player on a boat is detected. |

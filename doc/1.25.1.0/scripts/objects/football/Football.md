# objects/football/Football.lua

*[Version française](../../../fr/scripts/objects/football/Football.md)*

Source: `dataS/scripts/objects/football/Football.lua` — FS25 1.25.1.0

✍ Football (soccer ball) physics object, extending PhysicsObject. This file only contains the constructor and the destructor; the ball behaviour is inherited or implemented in the field class.

- **Football** inherits from `PhysicsObject` (l.15)

## Functions

| Function | Line | Description |
|---|---|---|
| `Football.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 35 | ✍ Constructor: builds the PhysicsObject, sets a forced clip distance of 200 and registers the class name `Football`. |
| `Football:delete()` | 71 | ✍ Deletes the sound samples, unregisters the class name, removes children from the node object, and calls the grandparent `delete` deliberately so the ball entity itself is not deleted. |

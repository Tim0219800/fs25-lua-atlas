# animals/DogPetActivatable.lua

*[Version française](../../fr/scripts/animals/DogPetActivatable.md)*

Source: `dataS/scripts/animals/DogPetActivatable.lua` — FS25 1.25.1.0

✍ Small activatable object that lets the player pet a dog. It shows the localized action_petAnimal text, is always activatable, and measures distance through the dog, then calls Dog:pet when run.

- **DogPetActivatable** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `DogPetActivatable.new(dog: any)` | 15 | ✍ Creates the activatable for a dog with the localized pet action text. |
| `DogPetActivatable:getIsActivatable()` | 27 | ✍ Always returns true; availability is decided elsewhere, for example by the dog registering or removing the activatable. |
| `DogPetActivatable:getDistance(posX: any, posY: any, posZ: any)` | 33 | ✍ Returns the distance from the given world position to the dog, delegated to Dog:getDistanceTo. |
| `DogPetActivatable:run()` | 40 | ✍ Calls pet on the dog. |

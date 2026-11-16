# vehicles/specializations/activatables/LivestockTrailerActivatable.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/activatables/LivestockTrailerActivatable.md)*

Source: `dataS/scripts/vehicles/specializations/activatables/LivestockTrailerActivatable.lua` — FS25 1.25.1.0

✍ Activatable attached to a livestock trailer so the player can open the animal management screen for it. It holds a reference to the trailer and only becomes selectable when animals or rideables are present and nobody is blocking input. Client-side UI helper; it does not itself transfer animals.

- **LivestockTrailerActivatable** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `LivestockTrailerActivatable.new(livestockTrailer: any)` | 15 | ✍ Creates the activatable for the given livestock trailer and stores the localized prompt text `action_openLivestockTrailerMenu`. |
| `LivestockTrailerActivatable:getIsActivatable()` | 26 | ✍ Returns false while the trailer has a loading trigger. Otherwise true when there are rideables in the trigger or animals aboard, and the trailer or one of those rideables is active for input. |
| `LivestockTrailerActivatable:run()` | 49 | ✍ Points `g_animalScreen` at this trailer (no husbandry, not a dealer view) and opens the `AnimalScreen` GUI. |

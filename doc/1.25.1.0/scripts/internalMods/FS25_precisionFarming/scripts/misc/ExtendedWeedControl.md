# internalMods/FS25_precisionFarming/scripts/misc/ExtendedWeedControl.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/misc/ExtendedWeedControl.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/misc/ExtendedWeedControl.lua` — FS25 1.25.1.0

✍ Precision Farming extension of weed handling. It loads a weed noise bitmap (shared/weedNoise.grle) used to keep patchy weed areas, clears weeds on sowing, and overrides herbicide spraying so spot spraying skips preventive stages. It overrides FSDensityMapUtil, Sprayer, FieldUpdateTask and FieldState, and relies on the weedSystem, whose source is not in this dump.

- **ExtendedWeedControl** (l.15)

## Functions

| Function | Line | Description |
|---|---|---|
| `ExtendedWeedControl:loadFromXML(_: any, _: any, baseDirectory: any, configFileName: any, mapFilename: any)` | 36 | ✍ Creates and loads the weed noise bit vector map and builds a filter on it. If loading fails it logs an error and returns false. Note: on success it returns nothing (nil), not true. |
| `ExtendedWeedControl:unloadMapData()` | 53 | ✍ Drops the filters, deletes the noise bit vector map and, on the server, removes the pfWeedSetNoiseParameters console command (its registration is not in this file). |
| `ExtendedWeedControl:setWeedNoiseParameters(minOctave1: any, numOctave1: any, persistence1: any, minOctave2: any, numOctave2: any, persistence2: any)` | 69 | ✍ Developer tool: regenerates the noise map from two Perlin noise filters with the given octave and persistence parameters, and saves weedNoise.grle in the user profile folder. Missing parameters keep previous values. |
| `ExtendedWeedControl:clearWeedArea(modifier: any, weedFilter: any)` | 107 | ✍ Sets to 0 the pixels of the modifier's area that match both the noise filter and the given weed filter. |
| `ExtendedWeedControl:getWeedModifier()` | 113 | ✍ Lazily creates, then returns, the weed density modifier, along with dense and sparse weed filters. Returns nil if the map has no weed. |
| `ExtendedWeedControl:overwriteGameFunctions(pfModule: any)` | 138 | ✍ Overrides FSDensityMapUtil.setSowingWeedArea (clears dense and sparse weeds), Sprayer.processSprayerArea (remembers spot spraying), FSDensityMapUtil.updateHerbicideArea (rewrites it, no preventive stages when spot spraying), FieldUpdateTask.prepare and FieldState.update (weed state sampled in a 20 m square). |

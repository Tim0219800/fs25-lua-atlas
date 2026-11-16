# objects/BuyingStation.lua

*[Version française](../../fr/scripts/objects/BuyingStation.md)*

Source: `dataS/scripts/objects/BuyingStation.lua` — FS25 1.25.1.0

✍ Loading station that lets players buy goods (fill types) from a placeable. It extends LoadingStation and declares the XML schema of the per-fill-type entries plus two helpers used by the store specs to list which fill types a buying station offers.

- **BuyingStation** inherits from `LoadingStation` (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `BuyingStation.registerXMLPaths(schema: any, basePath: any)` | 185 | ✍ Registers fillType(?) entries with name, statsName (default other) and priceScale (default 1) at the base path, then the LoadingStation paths. |
| `BuyingStation.loadSpecValueFillTypes(xmlFile: any, customEnvironment: any, baseDir: any)` | 195 | ✍ Reads placeable.buyingStation#fillTypes and each loadTrigger#fillTypes (space separated names), upper-cases them into a set, and lets PlaceableHeapSpawner add its own. Returns the set of names, or nil if nothing is found. |
| `BuyingStation.getSpecValueFillTypes(storeItem: any, realItem: any)` | 224 | ✍ Converts the buyingStationFillTypes set stored in the store item specs into fill type entries through g_fillTypeManager. Returns nil when the spec is absent. |

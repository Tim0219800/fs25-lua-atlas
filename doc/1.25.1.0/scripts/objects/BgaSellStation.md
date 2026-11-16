# objects/BgaSellStation.lua

*[Version française](../../fr/scripts/objects/BgaSellStation.md)*

Source: `dataS/scripts/objects/BgaSellStation.lua` — FS25 1.25.1.0

✍ Unloading station used by biogas plants for selling goods. It extends UnloadingStation and only adds the XML registration of the appearsOnStats flag.

- **BgaSellStation** inherits from `UnloadingStation` (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `BgaSellStation.registerXMLPaths(schema: any, basePath: any)` | 55 | ✍ Registers the boolean XML attribute appearsOnStats (default false) at the base path, then the UnloadingStation paths. The attribute is only declared here; its use is not in this file (UNVERIFIED). |

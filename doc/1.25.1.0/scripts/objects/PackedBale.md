# objects/PackedBale.lua

Source : `dataS/scripts/objects/PackedBale.lua` — FS25 1.25.1.0

- **PackedBale** hérite de `Bale` (l.17)
- **PackedBaleActivatable** (l.140)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PackedBale.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 27 |  |
| `PackedBale:delete()` | 41 |  |
| `PackedBale:loadBaleAttributesFromXML(xmlFile: table)` | 50 |  |
| `PackedBale:unpack(noEventSend: boolean)` | 78 |  |
| `PackedBale:getCanInteract()` | 108 |  |
| `PackedBale:getInteractionPosition()` | 123 |  |
| `PackedBaleActivatable.new(packedBale: any)` | 144 |  |
| `PackedBaleActivatable:getIsActivatable()` | 155 |  |
| `PackedBaleActivatable:run()` | 165 |  |

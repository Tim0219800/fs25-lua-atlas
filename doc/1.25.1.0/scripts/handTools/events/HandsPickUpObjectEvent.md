# handTools/events/HandsPickUpObjectEvent.lua

Source : `dataS/scripts/handTools/events/HandsPickUpObjectEvent.lua` — FS25 1.25.1.0

- **HandsPickUpObjectEvent** hérite de `Event` (l.4)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HandsPickUpObjectEvent.emptyNew() → table` | 11 |  |
| `HandsPickUpObjectEvent.new(hands: HandTool, target: table) → table` | 21 |  |
| `HandsPickUpObjectEvent:readStream(streamId: integer, connection: table)` | 34 |  |
| `HandsPickUpObjectEvent:writeStream(streamId: integer, connection: table)` | 70 |  |
| `HandsPickUpObjectEvent:run(connection: table)` | 99 |  |
| `HandsPickUpObjectEvent.sendEvent(hands: HandTool, target: table, noEventSend: boolean?)` | 123 |  |
| `HandsPickUpObjectEvent.getTargetGhostObject(target: table?) → table?` | 146 |  |

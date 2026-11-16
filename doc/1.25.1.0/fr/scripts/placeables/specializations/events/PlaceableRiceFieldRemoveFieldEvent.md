# placeables/specializations/events/PlaceableRiceFieldRemoveFieldEvent.lua

*[English version](../../../../../scripts/placeables/specializations/events/PlaceableRiceFieldRemoveFieldEvent.md)*

Source: `dataS/scripts/placeables/specializations/events/PlaceableRiceFieldRemoveFieldEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui supprime un champ d'un PlaceableRiceField par son index. Un client l'envoie au serveur, qui l'applique puis le rediffuse à tous les clients.

- **PlaceableRiceFieldRemoveFieldEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableRiceFieldRemoveFieldEvent.emptyNew() → table` | 14 | ✍ Crée un événement vide lié au canal réseau principal (`NetworkNode.CHANNEL_MAIN`). |
| `PlaceableRiceFieldRemoveFieldEvent.new(placeableRiceField: any, fieldIndex: any)` | 20 | ✍ Construit l'événement à partir du placeable de rizière et de l'index du champ à supprimer. |
| `PlaceableRiceFieldRemoveFieldEvent:readStream(streamId: integer, connection: Connection)` | 33 | ✍ Lit l'objet rizière et un index de champ UInt8, puis exécute l'événement. |
| `PlaceableRiceFieldRemoveFieldEvent:writeStream(streamId: integer, connection: Connection)` | 45 | ✍ Écrit l'objet rizière et l'index de champ UInt8. |
| `PlaceableRiceFieldRemoveFieldEvent:run(connection: Connection)` | 54 | ✍ Si la rizière est synchronisée, supprime le champ via `removeFieldByIndex` ; reçu par le serveur (la connexion n'est pas celle du serveur), il rediffuse ensuite le même événement à tous les clients. |

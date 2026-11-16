# placeables/specializations/events/PlaceableRiceFieldSetTargetHeightEvent.lua

*[English version](../../../../../scripts/placeables/specializations/events/PlaceableRiceFieldSetTargetHeightEvent.md)*

Source: `dataS/scripts/placeables/specializations/events/PlaceableRiceFieldSetTargetHeightEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui modifie la hauteur d'eau cible d'une rizière d'un PlaceableRiceField. Un client l'envoie au serveur, qui l'applique et le rediffuse à tous les clients.

- **PlaceableRiceFieldSetTargetHeightEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableRiceFieldSetTargetHeightEvent.emptyNew() → table` | 14 | ✍ Crée un événement vide avec la métatable de la classe ; contrairement aux événements voisins, aucun canal n'est passé (canal par défaut). |
| `PlaceableRiceFieldSetTargetHeightEvent.new(placeableRiceField: any, fieldIndex: any, targetHeight: any)` | 20 | ✍ Construit l'événement à partir du placeable de rizière, d'un index de champ et d'une hauteur d'eau cible. |
| `PlaceableRiceFieldSetTargetHeightEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Lit l'objet rizière, un index de champ UInt8 et une hauteur cible Float32, puis exécute l'événement. |
| `PlaceableRiceFieldSetTargetHeightEvent:writeStream(streamId: integer, connection: Connection)` | 47 | ✍ Écrit l'objet rizière, l'index de champ UInt8 et la hauteur cible Float32. |
| `PlaceableRiceFieldSetTargetHeightEvent:run(connection: Connection)` | 57 | ✍ Si la rizière est synchronisée, appelle `setWaterHeightTarget` avec l'index du champ, la hauteur cible et un indicateur à true ; sur le serveur, il rediffuse ensuite l'événement à tous les clients. |

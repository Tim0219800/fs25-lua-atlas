# placeables/specializations/events/PlaceableObjectStorageUnloadEvent.lua

*[English version](../../../../../scripts/placeables/specializations/events/PlaceableObjectStorageUnloadEvent.md)*

Source: `dataS/scripts/placeables/specializations/events/PlaceableObjectStorageUnloadEvent.lua` — FS25 1.25.1.0

✍ Événement réseau (sous-classe d'Event) qui demande au serveur de décharger un certain nombre d'objets stockés d'un même type d'un placeable de stockage d'objets. Il transporte le placeable, l'indice d'information d'objet et la quantité.

- **PlaceableObjectStorageUnloadEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableObjectStorageUnloadEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide pour la lecture de flux. |
| `PlaceableObjectStorageUnloadEvent.new(placeable: table, objectInfoIndex: integer, objectAmount: boolean)` | 23 | ✍ Crée l'événement avec le placeable de stockage, l'indice d'information d'objet et la quantité à décharger. |
| `PlaceableObjectStorageUnloadEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Lit le placeable, l'indice d'information d'objet (`NUM_BITS_OBJECT_INFO` bits) et la quantité (`NUM_BITS_AMOUNT` bits), puis appelle `run`. |
| `PlaceableObjectStorageUnloadEvent:writeStream(streamId: integer, connection: Connection)` | 46 | ✍ Écrit le placeable, l'indice d'information d'objet et la quantité avec les mêmes largeurs de bits qu'à la lecture. |
| `PlaceableObjectStorageUnloadEvent:run(connection: Connection)` | 55 | ✍ Si le placeable est synchronisé et possède `removeAbstractObjectsFromStorage`, l'appelle avec l'indice, la quantité et la connexion. |

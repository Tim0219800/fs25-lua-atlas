# placeables/specializations/events/PlaceableFenceRemoveSegmentEvent.lua

*[English version](../../../../../scripts/placeables/specializations/events/PlaceableFenceRemoveSegmentEvent.md)*

Source: `dataS/scripts/placeables/specializations/events/PlaceableFenceRemoveSegmentEvent.lua` — FS25 1.25.1.0

✍ Événement réseau (sous-classe d'Event) pour supprimer un panneau de clôture identifié par un indice de segment et de poteau. Un client l'envoie au serveur, qui l'applique et le diffuse à tous les clients.

- **PlaceableFenceRemoveSegmentEvent** hérite de `Event` (l.6)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableFenceRemoveSegmentEvent.emptyNew() → table` | 13 | ✍ Crée une instance d'événement vide pour la lecture de flux. |
| `PlaceableFenceRemoveSegmentEvent.new(fence: table, segmentIndex: integer, poleIndex: boolean)` | 22 | ✍ Crée l'événement avec la clôture, l'indice du segment et l'indice du poteau. |
| `PlaceableFenceRemoveSegmentEvent:readStream(streamId: integer, connection: Connection)` | 36 | ✍ Lit la clôture, l'indice du segment et l'indice du poteau (entiers 32 bits), puis appelle `run`. |
| `PlaceableFenceRemoveSegmentEvent:writeStream(streamId: integer, connection: Connection)` | 48 | ✍ Écrit la clôture, l'indice du segment et l'indice du poteau sous forme d'entiers 32 bits. |
| `PlaceableFenceRemoveSegmentEvent:run(connection: Connection)` | 57 | ✍ Si la clôture est synchronisée, supprime le panneau via `doDeletePanel` et publie le message de suppression de segment ; sur le serveur, elle diffuse ensuite l'événement à tous les clients. |

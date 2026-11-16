# placeables/specializations/events/PlaceableFenceSegmentBatchEvent.lua

*[English version](../../../../../scripts/placeables/specializations/events/PlaceableFenceSegmentBatchEvent.md)*

Source: `dataS/scripts/placeables/specializations/events/PlaceableFenceSegmentBatchEvent.lua` — FS25 1.25.1.0

✍ Événement réseau (sous-classe d'Event, canal principal) qui envoie de nombreux segments de clôture en un seul message lors d'une construction en masse, au lieu d'un événement d'ajout par segment. Le serveur a déjà validé et facturé les segments, donc il ne porte pas de prix et n'est traité que par les clients.

- **PlaceableFenceSegmentBatchEvent** hérite de `Event` (l.17)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableFenceSegmentBatchEvent.emptyNew() → PlaceableFenceSegmentBatchEvent` | 28 | ✍ Crée un événement vide sur `NetworkNode.CHANNEL_MAIN` pour la lecture de flux. |
| `PlaceableFenceSegmentBatchEvent.new(fencePlaceable: Placeable, segments: table) → PlaceableFenceSegmentBatchEvent` | 39 | ✍ Crée l'événement avec le placeable de clôture et la liste des segments. |
| `PlaceableFenceSegmentBatchEvent:readStream(streamId: integer, connection: Connection)` | 52 | ✍ Lit le placeable, journalise une erreur et revient tôt s'il est inconnu (ce qui désalignerait le flux), puis lit un nombre (UInt8, donc 255 au plus) et chaque segment (coordonnées et drapeaux de rendu) et le crée, puis appelle `run`. |
| `PlaceableFenceSegmentBatchEvent:writeStream(streamId: integer, connection: Connection)` | 87 | ✍ Écrit le placeable, le nombre de segments en UInt8 et les coordonnées et drapeaux de rendu de chaque segment. |
| `PlaceableFenceSegmentBatchEvent:run(connection: Connection)` | 104 | ✍ Ignorée sauf si reçue du serveur et si le placeable est synchronisé ; met alors chaque segment en file avec `addSegment` (construction asynchrone étalée sur plusieurs images) et publie pour lui le message d'ajout de segment. |

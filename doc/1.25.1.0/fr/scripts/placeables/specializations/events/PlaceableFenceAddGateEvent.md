# placeables/specializations/events/PlaceableFenceAddGateEvent.lua

*[English version](../../../../../scripts/placeables/specializations/events/PlaceableFenceAddGateEvent.md)*

Source: `dataS/scripts/placeables/specializations/events/PlaceableFenceAddGateEvent.lua` — FS25 1.25.1.0

✍ Événement réseau (sous-classe d'Event) utilisé quand un client rejoint la partie : il transporte un placeable de clôture, un indice de segment et l'objet animé de portail de ce segment pour l'enregistrer comme objet réseau. Sa fonction `run` est vide.

- **PlaceableFenceAddGateEvent** hérite de `Event` (l.6)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableFenceAddGateEvent.emptyNew() → table` | 13 | ✍ Crée une instance d'événement vide pour la lecture de flux. |
| `PlaceableFenceAddGateEvent.new(fence: table, segmentIndex: integer, animatedObject: boolean)` | 22 | ✍ Crée l'événement avec la clôture, l'indice du segment et l'objet animé du portail. |
| `PlaceableFenceAddGateEvent:readStream(streamId: integer, connection: Connection)` | 36 | ✍ Côté client à la connexion : lit la clôture et l'indice du segment, récupère l'objet animé du segment, lit son identifiant et son état, termine son enregistrement, puis appelle `run`. |
| `PlaceableFenceAddGateEvent:writeStream(streamId: integer, connection: Connection)` | 53 | ✍ Côté serveur à la connexion : écrit la clôture, l'indice du segment, l'identifiant et l'état de l'objet animé, et l'enregistre dans le flux de la connexion. |
| `PlaceableFenceAddGateEvent:run(connection: Connection)` | 65 | ✍ Ne fait rien ; tout le travail est fait pendant la lecture du flux. |

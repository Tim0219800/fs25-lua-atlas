# placeables/specializations/events/PlaceableFenceAddSegmentEvent.lua

*[English version](../../../../../scripts/placeables/specializations/events/PlaceableFenceAddSegmentEvent.md)*

Source: `dataS/scripts/placeables/specializations/events/PlaceableFenceAddSegmentEvent.lua` — FS25 1.25.1.0

✍ Événement réseau (sous-classe d'Event) pour ajouter un segment de clôture depuis l'outil de construction. Un client l'envoie au serveur, qui crée le segment, débite le prix d'achat de la ferme propriétaire de la clôture et le diffuse aux autres clients. Les écouteurs locaux sont prévenus via une publication du centre de messages.

- **PlaceableFenceAddSegmentEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableFenceAddSegmentEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide pour la lecture de flux. |
| `PlaceableFenceAddSegmentEvent.new(fence: table, x1: integer, z1: boolean, x2: any, z2: any, renderFirst: any, renderLast: any, gateIndex: any, price: any)` | 23 | ✍ Crée l'événement avec la clôture, les extrémités du segment (x1, z1, x2, z2), les drapeaux de rendu premier et dernier, un indice de portail optionnel et le prix. |
| `PlaceableFenceAddSegmentEvent:readStream(streamId: integer, connection: Connection)` | 43 | ✍ Lit la clôture, quatre coordonnées, les deux drapeaux de rendu, l'indice de portail (0 signifie aucun) et le prix, puis appelle `run`. |
| `PlaceableFenceAddSegmentEvent:writeStream(streamId: integer, connection: Connection)` | 65 | ✍ Écrit les mêmes champs dans le même ordre (indice de portail écrit 0 si nil). |
| `PlaceableFenceAddSegmentEvent:run(connection: Connection)` | 81 | ✍ Si la clôture est synchronisée, crée et ajoute le segment (construit de façon synchrone sur les clients s'il a un portail) et publie le message d'ajout de segment. Côté serveur, elle déduit aussi le prix de la ferme propriétaire comme achat de propriété et diffuse l'événement. |

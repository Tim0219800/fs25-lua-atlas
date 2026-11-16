# placeables/specializations/events/PlaceableLightsStateEvent.lua

*[English version](../../../../../scripts/placeables/specializations/events/PlaceableLightsStateEvent.md)*

Source: `dataS/scripts/placeables/specializations/events/PlaceableLightsStateEvent.lua` — FS25 1.25.1.0

✍ Événement réseau (sous-classe d'Event) qui allume ou éteint un groupe de lumières d'un placeable. Un client l'envoie au serveur, qui le rediffuse aux autres clients et l'applique localement.

- **PlaceableLightsStateEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableLightsStateEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide pour la lecture de flux. |
| `PlaceableLightsStateEvent.new(placeable: table, groupIndex: integer, isActive: boolean)` | 23 | ✍ Crée l'événement avec le placeable, l'indice du groupe de lumières et l'état actif visé. |
| `PlaceableLightsStateEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Lit le placeable, l'indice du groupe (`PlaceableLights.MAX_NUM_BITS` bits) et le drapeau actif, puis appelle `run`. |
| `PlaceableLightsStateEvent:writeStream(streamId: integer, connection: Connection)` | 46 | ✍ Écrit le placeable, l'indice du groupe (`PlaceableLights.MAX_NUM_BITS` bits) et le drapeau actif. |
| `PlaceableLightsStateEvent:run(connection: Connection)` | 55 | ✍ Sur le serveur, rediffuse aux autres connexions (pas à l'émetteur) ; puis, si le placeable est synchronisé et possède `setGroupIsActive`, applique l'état localement sans renvoi. |
| `PlaceableLightsStateEvent.sendEvent(placeable: table, groupIndex: integer, isActive: boolean, noEventSend: any)` | 70 | ✍ Sauf si `noEventSend` vaut true, diffuse l'événement depuis le serveur, ou l'envoie au serveur depuis un client. |

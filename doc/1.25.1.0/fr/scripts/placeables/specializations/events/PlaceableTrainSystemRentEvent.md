# placeables/specializations/events/PlaceableTrainSystemRentEvent.lua

*[English version](../../../../../scripts/placeables/specializations/events/PlaceableTrainSystemRentEvent.md)*

Source: `dataS/scripts/placeables/specializations/events/PlaceableTrainSystemRentEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui synchronise la location ou le retour de la voie ferrée d'un PlaceableTrainSystem, avec la ferme locataire et une position sur la spline. Utiliser `sendEvent` pour l'acheminer correctement depuis le client ou le serveur. À noter : les commentaires du source (démarrage IA, andain) viennent d'autres événements et ne correspondent pas.

- **PlaceableTrainSystemRentEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableTrainSystemRentEvent.emptyNew() → table` | 14 | ✍ Crée un événement vide avec la métatable de la classe, sur le canal par défaut. |
| `PlaceableTrainSystemRentEvent.new(object: table, isRented: integer, farmId: boolean, splinePosition: integer)` | 25 | ✍ Construit l'événement à partir de l'objet système ferroviaire, d'un indicateur de location, de l'id de ferme locataire et de la position sur la spline. L'id de ferme et la position ne comptent que si loué. |
| `PlaceableTrainSystemRentEvent:readStream(streamId: integer, connection: Connection)` | 38 | ✍ Lit l'objet et l'indicateur de location ; si loué, lit aussi l'id de ferme et la position spline Float32. Puis exécute l'événement. |
| `PlaceableTrainSystemRentEvent:writeStream(streamId: integer, connection: Connection)` | 54 | ✍ Écrit l'objet et l'indicateur de location ; si loué, écrit aussi l'id de ferme et la position spline. |
| `PlaceableTrainSystemRentEvent:run(connection: Connection)` | 65 | ✍ Si l'objet est synchronisé, appelle `rentRailroad` ou `returnRailroad` (avec un indicateur sans envoi). Reçu par le serveur, il rediffuse un nouvel événement aux autres clients, sans la connexion expéditrice. |
| `PlaceableTrainSystemRentEvent.sendEvent(object: table, isRented: boolean, farmId: boolean, splinePosition: any, noEventSend: boolean)` | 90 | ✍ Fonction statique : sauf si `noEventSend` est true, le serveur diffuse l'événement, tandis qu'un client l'envoie à la connexion serveur. |

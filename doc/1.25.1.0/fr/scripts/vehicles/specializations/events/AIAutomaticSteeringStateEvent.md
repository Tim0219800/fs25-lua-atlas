# vehicles/specializations/events/AIAutomaticSteeringStateEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/AIAutomaticSteeringStateEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/AIAutomaticSteeringStateEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui active ou désactive le guidage automatique d'un véhicule, éventuellement avec l'indice et le côté du segment de départ. Les clients l'envoient au serveur, qui l'applique et le rediffuse. Utiliser `sendEvent` pour l'émettre.

- **AIAutomaticSteeringStateEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIAutomaticSteeringStateEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide avec la métatable de la classe ; utilisée par la couche réseau avant que `readStream` ne la remplisse. |
| `AIAutomaticSteeringStateEvent.new(vehicle: table, state: integer, segmentIndex: any, segmentIsLeft: any)` | 23 | ✍ Crée l'événement avec véhicule, état activé/désactivé, et indice et côté de segment optionnels. |
| `AIAutomaticSteeringStateEvent:readStream(streamId: integer, connection: Connection)` | 37 | ✍ Lit le véhicule, l'indicateur d'état et un segment optionnel (indice UInt16 plus indicateur gauche), puis appelle `run`. |
| `AIAutomaticSteeringStateEvent:writeStream(streamId: integer, connection: Connection)` | 53 | ✍ Écrit véhicule, état et, si l'indice de segment est défini et supérieur à 0, l'indice et l'indicateur gauche. |
| `AIAutomaticSteeringStateEvent:run(connection: Connection)` | 66 | ✍ Applique `setAIAutomaticSteeringEnabled` sur un véhicule synchronisé (qui peut renvoyer le segment effectif) et, si reçu sur le serveur, rediffuse un nouvel événement aux clients. |
| `AIAutomaticSteeringStateEvent.sendEvent(vehicle: table, state: integer, segmentIndex: boolean, segmentIsLeft: any, noEventSend: boolean)` | 81 | ✍ Envoie l'événement sauf si `noEventSend` vaut true : le serveur le diffuse, un client l'envoie au serveur. |

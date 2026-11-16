# vehicles/specializations/events/RidgeMarkerSetStateEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/RidgeMarkerSetStateEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/RidgeMarkerSetStateEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `RidgeMarkerSetStateEvent` (hérite de `Event`) qui réplique l'état du traceur de lignes. Elle transporte le véhicule et un état (`RidgeMarker.SEND_NUM_BITS` bits ; le constructeur vérifie qu'il est inférieur à `RidgeMarker.MAX_NUM_RIDGEMARKERS`). Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **RidgeMarkerSetStateEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `RidgeMarkerSetStateEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de `RidgeMarkerSetStateEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `RidgeMarkerSetStateEvent.new(vehicle: table, state: integer)` | 23 | ✍ Crée l'événement avec ses données : le véhicule et un état (`RidgeMarker.SEND_NUM_BITS` bits ; le constructeur vérifie qu'il est inférieur à `RidgeMarker.MAX_NUM_RIDGEMARKERS`). |
| `RidgeMarkerSetStateEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule et un état (`RidgeMarker.SEND_NUM_BITS` bits ; le constructeur vérifie qu'il est inférieur à `RidgeMarker.MAX_NUM_RIDGEMARKERS`)), puis appelle `run`. |
| `RidgeMarkerSetStateEvent:writeStream(streamId: integer, connection: Connection)` | 45 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule et un état (`RidgeMarker.SEND_NUM_BITS` bits ; le constructeur vérifie qu'il est inférieur à `RidgeMarker.MAX_NUM_RIDGEMARKERS`)). |
| `RidgeMarkerSetStateEvent:run(connection: Connection)` | 53 | ✍ Exécute l'événement côté réception : appelle `setRidgeMarkerState(state, true)` sur le véhicule. Sur le serveur, il retransmet aussi l'événement aux autres clients, sauf l'émetteur. |
| `RidgeMarkerSetStateEvent.sendEvent(vehicle: table, state: integer, noEventSend: boolean)` | 68 | ✍ Fonction utilitaire d'envoi : le serveur diffuse l'événement aux clients, un client l'envoie au serveur. Ignorée si `noEventSend` est activé. |

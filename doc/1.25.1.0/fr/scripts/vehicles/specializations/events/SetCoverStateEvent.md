# vehicles/specializations/events/SetCoverStateEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/SetCoverStateEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/SetCoverStateEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `SetCoverStateEvent` (hérite de `Event`) qui réplique l'état de la bâche d'un véhicule. Elle transporte le véhicule et un état (`Cover.SEND_NUM_BITS` bits). Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **SetCoverStateEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SetCoverStateEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de `SetCoverStateEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `SetCoverStateEvent.new(vehicle: table, state: integer)` | 22 | ✍ Crée l'événement avec ses données : le véhicule et un état (`Cover.SEND_NUM_BITS` bits). |
| `SetCoverStateEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule et un état (`Cover.SEND_NUM_BITS` bits)), puis appelle `run`. |
| `SetCoverStateEvent:writeStream(streamId: integer, connection: Connection)` | 45 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule et un état (`Cover.SEND_NUM_BITS` bits)). |
| `SetCoverStateEvent:run(connection: Connection)` | 53 | ✍ Exécute l'événement côté réception : appelle `setCoverState(state, true)` sur le véhicule. Sur le serveur, il retransmet aussi l'événement aux autres clients, sauf l'émetteur. |
| `SetCoverStateEvent.sendEvent(vehicle: table, state: integer, noEventSend: boolean)` | 70 | ✍ Fonction utilitaire d'envoi : le serveur diffuse l'événement aux clients, un client l'envoie au serveur. Ignorée si `noEventSend` est activé. |

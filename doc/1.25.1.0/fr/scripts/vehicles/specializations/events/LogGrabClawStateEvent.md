# vehicles/specializations/events/LogGrabClawStateEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/LogGrabClawStateEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/LogGrabClawStateEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `LogGrabClawStateEvent` (hérite de `Event`) qui réplique l'état d'une griffe d'une pince à grumes. Elle transporte le véhicule, un état booléen et un index de pince (`LogGrab.GRAB_INDEX_NUM_BITS` bits). Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **LogGrabClawStateEvent** hérite de `Event` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `LogGrabClawStateEvent.emptyNew() → table` | 19 | ✍ Crée une instance vide de `LogGrabClawStateEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `LogGrabClawStateEvent.new(object: table, state: table, grabIndex: any) → table` | 29 | ✍ Crée l'événement avec ses données : le véhicule, un état booléen et un index de pince (`LogGrab.GRAB_INDEX_NUM_BITS` bits). |
| `LogGrabClawStateEvent:readStream(streamId: integer, connection: Connection)` | 42 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule, un état booléen et un index de pince (`LogGrab.GRAB_INDEX_NUM_BITS` bits)), puis appelle `run`. |
| `LogGrabClawStateEvent:writeStream(streamId: integer, connection: Connection)` | 54 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule, un état booléen et un index de pince (`LogGrab.GRAB_INDEX_NUM_BITS` bits)). |
| `LogGrabClawStateEvent:run(connection: Connection)` | 63 | ✍ Exécute l'événement côté réception : appelle `setLogGrabClawState(grabIndex, state, true)` sur le véhicule. Sur le serveur, il retransmet aussi l'événement aux autres clients, sauf l'émetteur. |
| `LogGrabClawStateEvent.sendEvent(vehicle: table, state: integer, grabIndex: boolean, noEventSend: boolean)` | 78 | ✍ Fonction utilitaire d'envoi : le serveur diffuse l'événement aux clients, un client l'envoie au serveur. Ignorée si `noEventSend` est activé. |

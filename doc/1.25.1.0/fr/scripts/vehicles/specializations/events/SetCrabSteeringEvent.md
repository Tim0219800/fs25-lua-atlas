# vehicles/specializations/events/SetCrabSteeringEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/SetCrabSteeringEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/SetCrabSteeringEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `SetCrabSteeringEvent` (hérite de `Event`) qui réplique le mode de direction en crabe. Elle transporte le véhicule et un état (`CrabSteering.STEERING_SEND_NUM_BITS` bits). Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **SetCrabSteeringEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SetCrabSteeringEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de `SetCrabSteeringEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `SetCrabSteeringEvent.new(vehicle: table, state: integer)` | 23 | ✍ Crée l'événement avec ses données : le véhicule et un état (`CrabSteering.STEERING_SEND_NUM_BITS` bits). |
| `SetCrabSteeringEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule et un état (`CrabSteering.STEERING_SEND_NUM_BITS` bits)), puis appelle `run`. |
| `SetCrabSteeringEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule et un état (`CrabSteering.STEERING_SEND_NUM_BITS` bits)). |
| `SetCrabSteeringEvent:run(connection: Connection)` | 52 | ✍ Exécute l'événement côté réception : appelle `setCrabSteering(state, true)` sur le véhicule. Sur le serveur, il retransmet aussi l'événement aux autres clients, sauf l'émetteur. |
| `SetCrabSteeringEvent.sendEvent(vehicle: table, state: integer, noEventSend: boolean)` | 67 | ✍ Fonction utilitaire d'envoi : le serveur diffuse l'événement aux clients, un client l'envoie au serveur. Ignorée si `noEventSend` est activé. |

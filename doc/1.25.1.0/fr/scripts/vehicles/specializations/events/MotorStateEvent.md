# vehicles/specializations/events/MotorStateEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/MotorStateEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/MotorStateEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `MotorStateEvent` (hérite de `Event`) qui réplique l'état du moteur d'un véhicule. Elle transporte le véhicule et un état moteur sérialisé via `MotorState`. Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **MotorStateEvent** hérite de `Event` (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `MotorStateEvent.emptyNew() → table` | 18 | ✍ Crée une instance vide de `MotorStateEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `MotorStateEvent.new(vehicle: table, motorState: integer)` | 27 | ✍ Crée l'événement avec ses données : le véhicule et un état moteur sérialisé via `MotorState`. |
| `MotorStateEvent:readStream(streamId: integer, connection: Connection)` | 39 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule et un état moteur sérialisé via `MotorState`), puis appelle `run`. |
| `MotorStateEvent:writeStream(streamId: integer, connection: Connection)` | 50 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule et un état moteur sérialisé via `MotorState`). |
| `MotorStateEvent:run(connection: Connection)` | 58 | ✍ Exécute l'événement côté réception : appelle `setMotorState(state, true)` sur le véhicule. Sur le serveur, il retransmet aussi l'événement aux autres clients, sauf l'émetteur. |
| `MotorStateEvent.sendEvent(vehicle: table, motorState: integer, noEventSend: boolean)` | 74 | ✍ Fonction utilitaire d'envoi : le serveur diffuse l'événement aux clients, un client l'envoie au serveur. Ignorée si `noEventSend` est activé. |

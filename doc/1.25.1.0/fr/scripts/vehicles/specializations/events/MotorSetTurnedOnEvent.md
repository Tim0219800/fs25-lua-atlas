# vehicles/specializations/events/MotorSetTurnedOnEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/MotorSetTurnedOnEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/MotorSetTurnedOnEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `MotorSetTurnedOnEvent` (hérite de `Event`) qui réplique le démarrage ou l'arrêt du moteur. Elle transporte le véhicule et un booléen d'état allumé. Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **MotorSetTurnedOnEvent** hérite de `Event` (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `MotorSetTurnedOnEvent.emptyNew() → table` | 18 | ✍ Crée une instance vide de `MotorSetTurnedOnEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `MotorSetTurnedOnEvent.new(vehicle: table, turnedOn: boolean)` | 27 | ✍ Crée l'événement avec ses données : le véhicule et un booléen d'état allumé. |
| `MotorSetTurnedOnEvent:readStream(streamId: integer, connection: Connection)` | 38 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule et un booléen d'état allumé), puis appelle `run`. |
| `MotorSetTurnedOnEvent:writeStream(streamId: integer, connection: Connection)` | 48 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule et un booléen d'état allumé). |
| `MotorSetTurnedOnEvent:run(connection: Connection)` | 56 | ✍ Exécute l'événement côté réception : appelle `startMotor(true)` ou `stopMotor(true)` sur le véhicule. Sur le serveur, il retransmet aussi l'événement aux autres clients, sauf l'émetteur. |
| `MotorSetTurnedOnEvent.sendEvent(vehicle: table, turnedOn: boolean, noEventSend: boolean)` | 75 | ✍ Fonction utilitaire d'envoi : le serveur diffuse l'événement aux clients, un client l'envoie au serveur. Ignorée si `noEventSend` est activé. |

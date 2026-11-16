# vehicles/specializations/events/SetCruiseControlSpeedEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/SetCruiseControlSpeedEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/SetCruiseControlSpeedEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `SetCruiseControlSpeedEvent` (hérite de `Event`) qui réplique les vitesses cibles du régulateur (avant et arrière). Elle transporte le véhicule et deux vitesses uint8 (avant, arrière). Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **SetCruiseControlSpeedEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SetCruiseControlSpeedEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de `SetCruiseControlSpeedEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `SetCruiseControlSpeedEvent.new(vehicle: table, speed: number, speedReverse: number)` | 24 | ✍ Crée l'événement avec ses données : le véhicule et deux vitesses uint8 (avant, arrière). |
| `SetCruiseControlSpeedEvent:readStream(streamId: integer, connection: Connection)` | 36 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule et deux vitesses uint8 (avant, arrière)), puis appelle `run`. |
| `SetCruiseControlSpeedEvent:writeStream(streamId: integer, connection: Connection)` | 47 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule et deux vitesses uint8 (avant, arrière)). |
| `SetCruiseControlSpeedEvent:run(connection: Connection)` | 56 | ✍ Exécute l'événement côté réception : appelle `setCruiseControlMaxSpeed(speed, speedReverse)` sur le véhicule. Sur le serveur, il retransmet aussi l'événement aux autres clients, sauf l'émetteur. |

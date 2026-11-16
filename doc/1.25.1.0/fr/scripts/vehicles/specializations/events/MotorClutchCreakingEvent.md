# vehicles/specializations/events/MotorClutchCreakingEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/MotorClutchCreakingEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/MotorClutchCreakingEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `MotorClutchCreakingEvent` (hérite de `Event`) qui indique aux clients que l'embrayage grince. Elle transporte le véhicule, un indicateur isEvent, un indicateur de transmission par groupes et des index optionnels de rapport (6 bits) et de groupe (5 bits). Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **MotorClutchCreakingEvent** hérite de `Event` (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `MotorClutchCreakingEvent.emptyNew() → table` | 18 | ✍ Crée une instance vide de `MotorClutchCreakingEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `MotorClutchCreakingEvent.new(vehicle: table, isEvent: boolean, groupTransmission: any, gearIndex: any, groupIndex: any)` | 27 | ✍ Crée l'événement avec ses données : le véhicule, un indicateur isEvent, un indicateur de transmission par groupes et des index optionnels de rapport (6 bits) et de groupe (5 bits). |
| `MotorClutchCreakingEvent:readStream(streamId: integer, connection: Connection)` | 42 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule, un indicateur isEvent, un indicateur de transmission par groupes et des index optionnels de rapport (6 bits) et de groupe (5 bits)), puis appelle `run`. |
| `MotorClutchCreakingEvent:writeStream(streamId: integer, connection: Connection)` | 61 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule, un indicateur isEvent, un indicateur de transmission par groupes et des index optionnels de rapport (6 bits) et de groupe (5 bits)). |
| `MotorClutchCreakingEvent:run(connection: Connection)` | 78 | ✍ Exécute l'événement côté réception : lève l'événement véhicule `onClutchCreaking` avec ces valeurs (pas de retransmission dans `run`). |

# vehicles/specializations/events/AnimatedVehicleStopEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/AnimatedVehicleStopEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/AnimatedVehicleStopEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `AnimatedVehicleStopEvent` (hérite de `Event`) qui réplique l'arrêt d'une animation nommée sur un véhicule. Elle transporte le véhicule et le nom de l'animation. Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **AnimatedVehicleStopEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AnimatedVehicleStopEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de `AnimatedVehicleStopEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `AnimatedVehicleStopEvent.new(object: table, name: string)` | 23 | ✍ Crée l'événement avec ses données : le véhicule et le nom de l'animation. |
| `AnimatedVehicleStopEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule et le nom de l'animation), puis appelle `run`. |
| `AnimatedVehicleStopEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule et le nom de l'animation). |
| `AnimatedVehicleStopEvent:run(connection: Connection)` | 52 | ✍ Exécute l'événement côté réception : appelle `stopAnimation(name, true)` sur le véhicule. Sur le serveur, il retransmet aussi l'événement aux autres clients, sauf l'émetteur. |

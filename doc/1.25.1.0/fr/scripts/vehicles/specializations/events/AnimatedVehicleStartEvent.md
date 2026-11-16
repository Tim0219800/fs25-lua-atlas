# vehicles/specializations/events/AnimatedVehicleStartEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/AnimatedVehicleStartEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/AnimatedVehicleStartEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `AnimatedVehicleStartEvent` (hérite de `Event`) qui réplique le démarrage d'une animation nommée sur un véhicule. Elle transporte le véhicule, le nom de l'animation, la vitesse de lecture et le temps d'animation de départ (flottants). Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **AnimatedVehicleStartEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AnimatedVehicleStartEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de `AnimatedVehicleStartEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `AnimatedVehicleStartEvent.new(object: table, name: string, speed: number, animTime: number)` | 25 | ✍ Crée l'événement avec ses données : le véhicule, le nom de l'animation, la vitesse de lecture et le temps d'animation de départ (flottants). |
| `AnimatedVehicleStartEvent:readStream(streamId: integer, connection: Connection)` | 38 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule, le nom de l'animation, la vitesse de lecture et le temps d'animation de départ (flottants)), puis appelle `run`. |
| `AnimatedVehicleStartEvent:writeStream(streamId: integer, connection: Connection)` | 51 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule, le nom de l'animation, la vitesse de lecture et le temps d'animation de départ (flottants)). |
| `AnimatedVehicleStartEvent:run(connection: any)` | 60 | ✍ Exécute l'événement côté réception : appelle `playAnimation(name, speed, animTime, true)` sur le véhicule. Sur le serveur, il retransmet aussi l'événement aux autres clients, sauf l'émetteur. |

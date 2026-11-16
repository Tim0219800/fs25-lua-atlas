# vehicles/specializations/events/SetCruiseControlStateEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/SetCruiseControlStateEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/SetCruiseControlStateEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `SetCruiseControlStateEvent` (hérite de `Event`) qui réplique l'état du régulateur de vitesse. Elle transporte le véhicule et un état (2 bits). Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **SetCruiseControlStateEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SetCruiseControlStateEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de `SetCruiseControlStateEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `SetCruiseControlStateEvent.new(vehicle: table, state: integer)` | 23 | ✍ Crée l'événement avec ses données : le véhicule et un état (2 bits). |
| `SetCruiseControlStateEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule et un état (2 bits)), puis appelle `run`. |
| `SetCruiseControlStateEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule et un état (2 bits)). |
| `SetCruiseControlStateEvent:run(connection: Connection)` | 52 | ✍ Exécute l'événement côté réception : appelle `setCruiseControlState(state, true)` sur le véhicule (pas de retransmission dans `run`). |

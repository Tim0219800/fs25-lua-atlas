# vehicles/specializations/events/LocomotiveStateEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/LocomotiveStateEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/LocomotiveStateEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `LocomotiveStateEvent` (hérite de `Event`) qui réplique l'état d'une locomotive. Elle transporte le véhicule et un état (`Locomotive.NUM_BITS_STATE` bits). Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **LocomotiveStateEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `LocomotiveStateEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de `LocomotiveStateEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `LocomotiveStateEvent.new(object: table, state: boolean)` | 23 | ✍ Crée l'événement avec ses données : le véhicule et un état (`Locomotive.NUM_BITS_STATE` bits). |
| `LocomotiveStateEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule et un état (`Locomotive.NUM_BITS_STATE` bits)), puis appelle `run`. |
| `LocomotiveStateEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule et un état (`Locomotive.NUM_BITS_STATE` bits)). |
| `LocomotiveStateEvent:run(connection: Connection)` | 52 | ✍ Exécute l'événement côté réception : appelle `setLocomotiveState(state, true)` sur le véhicule (pas de retransmission dans `run`). |

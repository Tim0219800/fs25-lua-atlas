# vehicles/specializations/events/BaleLoaderStateEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/BaleLoaderStateEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/BaleLoaderStateEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `BaleLoaderStateEvent` (hérite de `Event`) qui réplique un changement d'état d'un chargeur de balles. Elle transporte le véhicule, un identifiant d'état int8 et, seulement pour `BaleLoader.CHANGE_GRAB_BALE`, l'id réseau de la balle la plus proche. Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **BaleLoaderStateEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BaleLoaderStateEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de `BaleLoaderStateEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `BaleLoaderStateEvent.new(object: table, stateId: integer, nearestBaleServerId: integer?) → BaleLoaderStateEvent` | 25 | ✍ Crée l'événement avec ses données : le véhicule, un identifiant d'état int8 et, seulement pour `BaleLoader.CHANGE_GRAB_BALE`, l'id réseau de la balle la plus proche. |
| `BaleLoaderStateEvent:readStream(streamId: integer, connection: Connection)` | 38 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule, un identifiant d'état int8 et, seulement pour `BaleLoader.CHANGE_GRAB_BALE`, l'id réseau de la balle la plus proche), puis appelle `run`. |
| `BaleLoaderStateEvent:writeStream(streamId: integer, connection: Connection)` | 52 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule, un identifiant d'état int8 et, seulement pour `BaleLoader.CHANGE_GRAB_BALE`, l'id réseau de la balle la plus proche). |
| `BaleLoaderStateEvent:run(connection: Connection)` | 63 | ✍ Exécute l'événement côté réception : appelle `doStateChange(stateId, nearestBaleServerId)` sur le véhicule (pas de retransmission dans `run`). |

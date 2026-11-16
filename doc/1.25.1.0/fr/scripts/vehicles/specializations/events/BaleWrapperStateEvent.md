# vehicles/specializations/events/BaleWrapperStateEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/BaleWrapperStateEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/BaleWrapperStateEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `BaleWrapperStateEvent` (hérite de `Event`) qui réplique un changement d'état d'une enrubanneuse. Elle transporte le véhicule, un identifiant d'état int8 et, seulement pour `BaleWrapper.CHANGE_GRAB_BALE`, l'id réseau de la balle la plus proche. Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **BaleWrapperStateEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BaleWrapperStateEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de `BaleWrapperStateEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `BaleWrapperStateEvent.new(object: table, stateId: integer, nearestBaleServerId: integer?) → BaleWrapperStateEvent` | 25 | ✍ Crée l'événement avec ses données : le véhicule, un identifiant d'état int8 et, seulement pour `BaleWrapper.CHANGE_GRAB_BALE`, l'id réseau de la balle la plus proche. |
| `BaleWrapperStateEvent:readStream(streamId: integer, connection: Connection)` | 38 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule, un identifiant d'état int8 et, seulement pour `BaleWrapper.CHANGE_GRAB_BALE`, l'id réseau de la balle la plus proche), puis appelle `run`. |
| `BaleWrapperStateEvent:writeStream(streamId: integer, connection: Connection)` | 51 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule, un identifiant d'état int8 et, seulement pour `BaleWrapper.CHANGE_GRAB_BALE`, l'id réseau de la balle la plus proche). |
| `BaleWrapperStateEvent:run(connection: Connection)` | 62 | ✍ Exécute l'événement côté réception : appelle `doStateChange(stateId, nearestBaleServerId)` sur le véhicule (pas de retransmission dans `run`). |

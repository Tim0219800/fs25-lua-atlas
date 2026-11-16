# vehicles/specializations/events/CraneShovelEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/CraneShovelEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/CraneShovelEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `CraneShovelEvent` (hérite de `Event`) qui réplique l'état de la pelle d'une grue. Elle transporte le véhicule et un état booléen. Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **CraneShovelEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `CraneShovelEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de `CraneShovelEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `CraneShovelEvent.new(object: table, state: any)` | 22 | ✍ Crée l'événement avec ses données : le véhicule et un état booléen. |
| `CraneShovelEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule et un état booléen), puis appelle `run`. |
| `CraneShovelEvent:writeStream(streamId: integer, connection: Connection)` | 46 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule et un état booléen). |
| `CraneShovelEvent:run(connection: Connection)` | 54 | ✍ Exécute l'événement côté réception : appelle `setCraneShovelState(state, nil, true)` sur le véhicule (pas de retransmission dans `run`). |
| `CraneShovelEvent.sendEvent(object: table, state: boolean, noEventSend: boolean)` | 65 | ✍ Fonction utilitaire d'envoi : le serveur diffuse l'événement aux clients, un client l'envoie au serveur. Ignorée si `noEventSend` est activé. |

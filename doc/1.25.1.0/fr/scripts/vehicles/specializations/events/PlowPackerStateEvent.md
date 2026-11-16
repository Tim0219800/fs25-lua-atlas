# vehicles/specializations/events/PlowPackerStateEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/PlowPackerStateEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/PlowPackerStateEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `PlowPackerStateEvent` (hérite de `Event`) qui réplique l'état du rouleau packer d'une charrue. Elle transporte le véhicule, un état booléen et un indicateur de mise à jour des animations. Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **PlowPackerStateEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlowPackerStateEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de `PlowPackerStateEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `PlowPackerStateEvent.new(object: table, state: boolean, updateAnimations: boolean)` | 23 | ✍ Crée l'événement avec ses données : le véhicule, un état booléen et un indicateur de mise à jour des animations. |
| `PlowPackerStateEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule, un état booléen et un indicateur de mise à jour des animations), puis appelle `run`. |
| `PlowPackerStateEvent:writeStream(streamId: integer, connection: Connection)` | 46 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule, un état booléen et un indicateur de mise à jour des animations). |
| `PlowPackerStateEvent:run(connection: Connection)` | 55 | ✍ Exécute l'événement côté réception : appelle `setPackerState(state, updateAnimations, true)` sur le véhicule. Sur le serveur, il retransmet aussi l'événement aux autres clients, sauf l'émetteur. |
| `PlowPackerStateEvent.sendEvent(object: table, state: boolean, updateAnimations: boolean, noEventSend: boolean)` | 71 | ✍ Fonction utilitaire d'envoi : le serveur diffuse l'événement aux clients, un client l'envoie au serveur. Ignorée si `noEventSend` est activé. |

# vehicles/specializations/events/BalerBaleTypeEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/BalerBaleTypeEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/BalerBaleTypeEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `BalerBaleTypeEvent` (hérite de `Event`) qui réplique le type de balle sélectionné d'une presse. Elle transporte le véhicule, un index de type de balle (`BalerBaleTypeEvent.BALE_TYPE_SEND_NUM_BITS` bits) et un indicateur force (faux si nil). Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **BalerBaleTypeEvent** hérite de `Event` (l.10)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BalerBaleTypeEvent.emptyNew() → table` | 17 | ✍ Crée une instance vide de `BalerBaleTypeEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `BalerBaleTypeEvent.new(object: table, baleTypeIndex: integer, force: boolean)` | 26 | ✍ Crée l'événement avec ses données : le véhicule, un index de type de balle (`BalerBaleTypeEvent.BALE_TYPE_SEND_NUM_BITS` bits) et un indicateur force (faux si nil). |
| `BalerBaleTypeEvent:readStream(streamId: integer, connection: Connection)` | 38 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule, un index de type de balle (`BalerBaleTypeEvent.BALE_TYPE_SEND_NUM_BITS` bits) et un indicateur force (faux si nil)), puis appelle `run`. |
| `BalerBaleTypeEvent:writeStream(streamId: integer, connection: Connection)` | 49 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule, un index de type de balle (`BalerBaleTypeEvent.BALE_TYPE_SEND_NUM_BITS` bits) et un indicateur force (faux si nil)). |
| `BalerBaleTypeEvent:run(connection: Connection)` | 58 | ✍ Exécute l'événement côté réception : appelle `setBaleTypeIndex(index, force, true)` sur le véhicule. Sur le serveur, il retransmet aussi l'événement aux autres clients, sauf l'émetteur. |
| `BalerBaleTypeEvent.sendEvent(object: table, baleTypeIndex: integer, force: boolean, noEventSend: boolean)` | 74 | ✍ Fonction utilitaire d'envoi : le serveur diffuse l'événement aux clients, un client l'envoie au serveur. Ignorée si `noEventSend` est activé. |

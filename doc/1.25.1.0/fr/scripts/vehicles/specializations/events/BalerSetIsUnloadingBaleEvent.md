# vehicles/specializations/events/BalerSetIsUnloadingBaleEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/BalerSetIsUnloadingBaleEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/BalerSetIsUnloadingBaleEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `BalerSetIsUnloadingBaleEvent` (hérite de `Event`) qui réplique l'état d'éjection de balle d'une presse. Elle transporte le véhicule et un booléen. Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **BalerSetIsUnloadingBaleEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BalerSetIsUnloadingBaleEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de `BalerSetIsUnloadingBaleEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `BalerSetIsUnloadingBaleEvent.new(object: table, isUnloadingBale: boolean)` | 23 | ✍ Crée l'événement avec ses données : le véhicule et un booléen. |
| `BalerSetIsUnloadingBaleEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule et un booléen), puis appelle `run`. |
| `BalerSetIsUnloadingBaleEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule et un booléen). |
| `BalerSetIsUnloadingBaleEvent:run(connection: Connection)` | 52 | ✍ Exécute l'événement côté réception : appelle `setIsUnloadingBale(value, true)` sur le véhicule. Sur le serveur, il retransmet aussi l'événement aux autres clients, sauf l'émetteur. |
| `BalerSetIsUnloadingBaleEvent.sendEvent(object: table, isUnloadingBale: boolean, noEventSend: boolean)` | 67 | ✍ Fonction utilitaire d'envoi : le serveur diffuse l'événement aux clients, un client l'envoie au serveur. Ignorée si `noEventSend` est activé. |

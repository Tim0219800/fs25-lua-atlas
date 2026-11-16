# vehicles/specializations/events/BaleCounterResetEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/BaleCounterResetEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/BaleCounterResetEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `BaleCounterResetEvent` (hérite de `Event`) qui réplique la remise à zéro du compteur de balles d'un véhicule. Elle transporte uniquement le véhicule. Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **BaleCounterResetEvent** hérite de `Event` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BaleCounterResetEvent.emptyNew() → table` | 19 | ✍ Crée une instance vide de `BaleCounterResetEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `BaleCounterResetEvent.new(object: table) → table` | 29 | ✍ Crée l'événement avec ses données : uniquement le véhicule. |
| `BaleCounterResetEvent:readStream(streamId: integer, connection: Connection)` | 40 | ✍ Lit les données de l'événement depuis le flux réseau (uniquement le véhicule), puis appelle `run`. |
| `BaleCounterResetEvent:writeStream(streamId: integer, connection: Connection)` | 50 | ✍ Écrit les données de l'événement dans le flux réseau (uniquement le véhicule). |
| `BaleCounterResetEvent:run(connection: Connection)` | 57 | ✍ Exécute l'événement côté réception : appelle `doBaleCounterReset(true)` sur le véhicule. Sur le serveur, il retransmet aussi l'événement aux autres clients, sauf l'émetteur. |
| `BaleCounterResetEvent.sendEvent(vehicle: table, noEventSend: boolean)` | 72 | ✍ Fonction utilitaire d'envoi : le serveur diffuse l'événement aux clients, un client l'envoie au serveur. Ignorée si `noEventSend` est activé. |

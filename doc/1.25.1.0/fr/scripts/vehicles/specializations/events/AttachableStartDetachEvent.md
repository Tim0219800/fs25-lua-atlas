# vehicles/specializations/events/AttachableStartDetachEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/AttachableStartDetachEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/AttachableStartDetachEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `AttachableStartDetachEvent` (hérite de `Event`) qui réplique le début du processus de détachement d'un outil attelé. Elle transporte uniquement le véhicule (l'outil attelé). Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **AttachableStartDetachEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AttachableStartDetachEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de `AttachableStartDetachEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `AttachableStartDetachEvent.new(vehicle: table, state: integer, segmentIndex: any, segmentIsLeft: any)` | 23 | ✍ Crée l'événement avec ses données : uniquement le véhicule (l'outil attelé). |
| `AttachableStartDetachEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Lit les données de l'événement depuis le flux réseau (uniquement le véhicule (l'outil attelé)), puis appelle `run`. |
| `AttachableStartDetachEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Écrit les données de l'événement dans le flux réseau (uniquement le véhicule (l'outil attelé)). |
| `AttachableStartDetachEvent:run(connection: Connection)` | 51 | ✍ Exécute l'événement côté réception : appelle `startDetachProcess(true)` sur le véhicule. Sur le serveur, il retransmet aussi l'événement aux autres clients, sauf l'émetteur. |
| `AttachableStartDetachEvent.sendEvent(vehicle: table, noEventSend: boolean)` | 66 | ✍ Fonction utilitaire d'envoi : le serveur diffuse l'événement aux clients, un client l'envoie au serveur. Ignorée si `noEventSend` est activé. |

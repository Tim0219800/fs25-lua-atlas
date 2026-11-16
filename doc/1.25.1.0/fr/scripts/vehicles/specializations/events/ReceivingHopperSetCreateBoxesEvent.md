# vehicles/specializations/events/ReceivingHopperSetCreateBoxesEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/ReceivingHopperSetCreateBoxesEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/ReceivingHopperSetCreateBoxesEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `ReceivingHopperSetCreateBoxesEvent` (hérite de `Event`) qui réplique le fait qu'une trémie de réception crée des caisses ou non. Elle transporte le véhicule et un booléen. Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **ReceivingHopperSetCreateBoxesEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ReceivingHopperSetCreateBoxesEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de `ReceivingHopperSetCreateBoxesEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `ReceivingHopperSetCreateBoxesEvent.new(object: table, state: boolean)` | 23 | ✍ Crée l'événement avec ses données : le véhicule et un booléen. |
| `ReceivingHopperSetCreateBoxesEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule et un booléen), puis appelle `run`. |
| `ReceivingHopperSetCreateBoxesEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule et un booléen). |
| `ReceivingHopperSetCreateBoxesEvent:run(connection: Connection)` | 52 | ✍ Exécute l'événement côté réception : appelle `setCreateBoxes(state, true)` sur le véhicule. Sur le serveur, il retransmet aussi l'événement aux autres clients, sauf l'émetteur. |
| `ReceivingHopperSetCreateBoxesEvent.sendEvent(vehicle: table, state: boolean, noEventSend: boolean)` | 67 | ✍ Fonction utilitaire d'envoi : le serveur diffuse l'événement aux clients, un client l'envoie au serveur. Ignorée si `noEventSend` est activé. |

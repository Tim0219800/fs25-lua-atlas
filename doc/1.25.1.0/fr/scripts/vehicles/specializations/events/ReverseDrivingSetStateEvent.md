# vehicles/specializations/events/ReverseDrivingSetStateEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/ReverseDrivingSetStateEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/ReverseDrivingSetStateEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `ReverseDrivingSetStateEvent` (hérite de `Event`) qui réplique l'état de conduite inversée d'un véhicule. Elle transporte le véhicule et un booléen. Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **ReverseDrivingSetStateEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ReverseDrivingSetStateEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de `ReverseDrivingSetStateEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `ReverseDrivingSetStateEvent.new(vehicle: table, isReverseDriving: boolean)` | 23 | ✍ Crée l'événement avec ses données : le véhicule et un booléen. |
| `ReverseDrivingSetStateEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule et un booléen), puis appelle `run`. |
| `ReverseDrivingSetStateEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule et un booléen). |
| `ReverseDrivingSetStateEvent:run(connection: Connection)` | 52 | ✍ Exécute l'événement côté réception : appelle `setIsReverseDriving(value, true)` sur le véhicule. Sur le serveur, il retransmet aussi l'événement aux autres clients, sauf l'émetteur. |
| `ReverseDrivingSetStateEvent.sendEvent(vehicle: table, isReverseDriving: boolean, noEventSend: boolean)` | 67 | ✍ Fonction utilitaire d'envoi : le serveur diffuse l'événement aux clients, un client l'envoie au serveur. Ignorée si `noEventSend` est activé. |

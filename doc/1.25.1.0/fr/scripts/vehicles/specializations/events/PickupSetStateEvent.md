# vehicles/specializations/events/PickupSetStateEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/PickupSetStateEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/PickupSetStateEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `PickupSetStateEvent` (hérite de `Event`) qui réplique l'état abaissé ou relevé d'un pick-up. Elle transporte le véhicule et un booléen isPickupLowered. Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **PickupSetStateEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PickupSetStateEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de `PickupSetStateEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `PickupSetStateEvent.new(object: table, isPickupLowered: boolean)` | 23 | ✍ Crée l'événement avec ses données : le véhicule et un booléen isPickupLowered. |
| `PickupSetStateEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule et un booléen isPickupLowered), puis appelle `run`. |
| `PickupSetStateEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule et un booléen isPickupLowered). |
| `PickupSetStateEvent:run(connection: Connection)` | 52 | ✍ Exécute l'événement côté réception : appelle `setPickupState(isPickupLowered, true)` sur le véhicule. Sur le serveur, il retransmet aussi l'événement aux autres clients, sauf l'émetteur. |
| `PickupSetStateEvent.sendEvent(vehicle: table, isPickupLowered: boolean, noEventSend: boolean)` | 67 | ✍ Fonction utilitaire d'envoi : le serveur diffuse l'événement aux clients, un client l'envoie au serveur. Ignorée si `noEventSend` est activé. |

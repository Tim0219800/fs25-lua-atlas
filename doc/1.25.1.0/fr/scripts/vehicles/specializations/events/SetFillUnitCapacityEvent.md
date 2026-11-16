# vehicles/specializations/events/SetFillUnitCapacityEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/SetFillUnitCapacityEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/SetFillUnitCapacityEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `SetFillUnitCapacityEvent` (hérite de `Event`) qui réplique une nouvelle capacité pour une unité de remplissage. Elle transporte le véhicule, un index d'unité de remplissage (8 bits) et une capacité (float32). Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **SetFillUnitCapacityEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SetFillUnitCapacityEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de `SetFillUnitCapacityEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `SetFillUnitCapacityEvent.new(vehicle: table, fillUnitIndex: boolean, capacity: boolean)` | 23 | ✍ Crée l'événement avec ses données : le véhicule, un index d'unité de remplissage (8 bits) et une capacité (float32). |
| `SetFillUnitCapacityEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule, un index d'unité de remplissage (8 bits) et une capacité (float32)), puis appelle `run`. |
| `SetFillUnitCapacityEvent:writeStream(streamId: integer, connection: Connection)` | 46 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule, un index d'unité de remplissage (8 bits) et une capacité (float32)). |
| `SetFillUnitCapacityEvent:run(connection: Connection)` | 55 | ✍ Exécute l'événement côté réception : appelle `setFillUnitCapacity(fillUnitIndex, capacity, true)` sur le véhicule. Sur le serveur, il retransmet aussi l'événement aux autres clients, sauf l'émetteur. |
| `SetFillUnitCapacityEvent.sendEvent(vehicle: table, fillUnitIndex: boolean, capacity: boolean, noEventSend: boolean)` | 70 | ✍ Fonction utilitaire d'envoi : le serveur diffuse l'événement aux clients, un client l'envoie au serveur. Ignorée si `noEventSend` est activé. |

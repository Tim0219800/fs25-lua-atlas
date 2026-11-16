# vehicles/specializations/events/PlantLimitToFieldEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/PlantLimitToFieldEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/PlantLimitToFieldEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `PlantLimitToFieldEvent` (hérite de `Event`) qui réplique l'option de limitation du semis au champ d'un semoir. Elle transporte le véhicule et un booléen. Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **PlantLimitToFieldEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlantLimitToFieldEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de `PlantLimitToFieldEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `PlantLimitToFieldEvent.new(object: table, plantLimitToField: boolean)` | 23 | ✍ Crée l'événement avec ses données : le véhicule et un booléen. |
| `PlantLimitToFieldEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule et un booléen), puis appelle `run`. |
| `PlantLimitToFieldEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule et un booléen). |
| `PlantLimitToFieldEvent:run(connection: Connection)` | 52 | ✍ Exécute l'événement côté réception : appelle `setPlantLimitToField(value, true)` sur le véhicule. Sur le serveur, il retransmet aussi l'événement aux autres clients, sauf l'émetteur. |
| `PlantLimitToFieldEvent.sendEvent(vehicle: table, plantLimitToField: boolean, noEventSend: boolean)` | 67 | ✍ Fonction utilitaire d'envoi : le serveur diffuse l'événement aux clients, un client l'envoie au serveur. Ignorée si `noEventSend` est activé. |

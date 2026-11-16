# vehicles/specializations/events/AIVehicleIsBlockedEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/AIVehicleIsBlockedEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/AIVehicleIsBlockedEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `AIVehicleIsBlockedEvent` (hérite de `Event`) qui indique aux clients qu'un véhicule piloté par l'IA est bloqué ou de nouveau libre. Elle transporte l'objet véhicule et un booléen de blocage. Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **AIVehicleIsBlockedEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIVehicleIsBlockedEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de `AIVehicleIsBlockedEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `AIVehicleIsBlockedEvent.new(object: table, isBlocked: boolean)` | 23 | ✍ Crée l'événement avec ses données : l'objet véhicule et un booléen de blocage. |
| `AIVehicleIsBlockedEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Lit les données de l'événement depuis le flux réseau (l'objet véhicule et un booléen de blocage), puis appelle `run`. |
| `AIVehicleIsBlockedEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Écrit les données de l'événement dans le flux réseau (l'objet véhicule et un booléen de blocage). |
| `AIVehicleIsBlockedEvent:run(connection: Connection)` | 52 | ✍ Exécute l'événement côté réception : appelle `aiBlock()` ou `aiContinue()` sur le véhicule une fois synchronisé (pas de retransmission dans `run`). |

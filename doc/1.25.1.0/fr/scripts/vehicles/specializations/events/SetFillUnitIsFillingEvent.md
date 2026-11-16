# vehicles/specializations/events/SetFillUnitIsFillingEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/SetFillUnitIsFillingEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/SetFillUnitIsFillingEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `SetFillUnitIsFillingEvent` (hérite de `Event`) qui réplique si une unité de remplissage est en cours de remplissage. Elle transporte le véhicule et un booléen isFilling. Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **SetFillUnitIsFillingEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SetFillUnitIsFillingEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de `SetFillUnitIsFillingEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `SetFillUnitIsFillingEvent.new(vehicle: table, isFilling: boolean)` | 23 | ✍ Crée l'événement avec ses données : le véhicule et un booléen isFilling. |
| `SetFillUnitIsFillingEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule et un booléen isFilling), puis appelle `run`. |
| `SetFillUnitIsFillingEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule et un booléen isFilling). |
| `SetFillUnitIsFillingEvent:run(connection: Connection)` | 52 | ✍ Exécute l'événement côté réception : appelle `setFillUnitIsFilling(isFilling, true)` sur le véhicule. Sur le serveur, il retransmet aussi l'événement aux autres clients, sauf l'émetteur. |

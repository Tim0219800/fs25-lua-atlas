# vehicles/specializations/events/MowerToggleWindrowDropEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/MowerToggleWindrowDropEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/MowerToggleWindrowDropEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `MowerToggleWindrowDropEvent` (hérite de `Event`) qui réplique l'utilisation des zones de dépose d'andain de la faucheuse. Elle transporte le véhicule et un booléen. Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **MowerToggleWindrowDropEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `MowerToggleWindrowDropEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de `MowerToggleWindrowDropEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `MowerToggleWindrowDropEvent.new(object: table, useMowerWindrowDropAreas: boolean)` | 23 | ✍ Crée l'événement avec ses données : le véhicule et un booléen. |
| `MowerToggleWindrowDropEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule et un booléen), puis appelle `run`. |
| `MowerToggleWindrowDropEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule et un booléen). |
| `MowerToggleWindrowDropEvent:run(connection: Connection)` | 52 | ✍ Exécute l'événement côté réception : appelle `setUseMowerWindrowDropAreas(value, true)` sur le véhicule. Sur le serveur, il retransmet aussi l'événement aux autres clients, sauf l'émetteur. |
| `MowerToggleWindrowDropEvent.sendEvent(vehicle: table, useMowerWindrowDropAreas: boolean, noEventSend: boolean)` | 67 | ✍ Fonction utilitaire d'envoi : le serveur diffuse l'événement aux clients, un client l'envoie au serveur. Ignorée si `noEventSend` est activé. |

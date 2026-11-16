# vehicles/specializations/events/CombineStrawEnableEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/CombineStrawEnableEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/CombineStrawEnableEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `CombineStrawEnableEvent` (hérite de `Event`) qui réplique l'activation de la sortie de paille (andain) d'une moissonneuse. Elle transporte le véhicule et un booléen d'andain actif. Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **CombineStrawEnableEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `CombineStrawEnableEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de `CombineStrawEnableEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `CombineStrawEnableEvent.new(vehicle: table, isSwathActive: boolean)` | 23 | ✍ Crée l'événement avec ses données : le véhicule et un booléen d'andain actif. |
| `CombineStrawEnableEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule et un booléen d'andain actif), puis appelle `run`. |
| `CombineStrawEnableEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule et un booléen d'andain actif). |
| `CombineStrawEnableEvent:run(connection: Connection)` | 52 | ✍ Exécute l'événement côté réception : appelle `setIsSwathActive(value, true)` sur le véhicule. Sur le serveur, il retransmet aussi l'événement aux autres clients, sauf l'émetteur. |
| `CombineStrawEnableEvent.sendEvent(vehicle: table, isSwathActive: boolean, noEventSend: boolean)` | 67 | ✍ Fonction utilitaire d'envoi : le serveur diffuse l'événement aux clients, un client l'envoie au serveur. Ignorée si `noEventSend` est activé. |

# vehicles/specializations/events/BaleWrapperAutomaticDropEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/BaleWrapperAutomaticDropEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/BaleWrapperAutomaticDropEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `BaleWrapperAutomaticDropEvent` (hérite de `Event`) qui réplique le réglage de dépose automatique d'une enrubanneuse. Elle transporte le véhicule et un booléen. Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **BaleWrapperAutomaticDropEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BaleWrapperAutomaticDropEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de `BaleWrapperAutomaticDropEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `BaleWrapperAutomaticDropEvent.new(object: table, automaticDrop: boolean)` | 22 | ✍ Crée l'événement avec ses données : le véhicule et un booléen. |
| `BaleWrapperAutomaticDropEvent:readStream(streamId: integer, connection: Connection)` | 33 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule et un booléen), puis appelle `run`. |
| `BaleWrapperAutomaticDropEvent:writeStream(streamId: integer, connection: Connection)` | 43 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule et un booléen). |
| `BaleWrapperAutomaticDropEvent:run(connection: Connection)` | 51 | ✍ Exécute l'événement côté réception : appelle `setBaleWrapperAutomaticDrop(value, true)` sur le véhicule. Sur le serveur, il retransmet aussi l'événement aux autres clients, sauf l'émetteur. |
| `BaleWrapperAutomaticDropEvent.sendEvent(object: table, automaticDrop: boolean, noEventSend: boolean)` | 66 | ✍ Fonction utilitaire d'envoi : le serveur diffuse l'événement aux clients, un client l'envoie au serveur. Ignorée si `noEventSend` est activé. |

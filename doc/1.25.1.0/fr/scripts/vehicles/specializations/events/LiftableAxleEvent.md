# vehicles/specializations/events/LiftableAxleEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/LiftableAxleEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/LiftableAxleEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `LiftableAxleEvent` (hérite de `Event`) qui réplique l'état relevé d'un essieu relevable. Elle transporte le véhicule, un état booléen et une hauteur fixe optionnelle (float32). Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **LiftableAxleEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `LiftableAxleEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de `LiftableAxleEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `LiftableAxleEvent.new(object: table, state: any, fixedHeight: any)` | 22 | ✍ Crée l'événement avec ses données : le véhicule, un état booléen et une hauteur fixe optionnelle (float32). |
| `LiftableAxleEvent:readStream(streamId: integer, connection: Connection)` | 36 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule, un état booléen et une hauteur fixe optionnelle (float32)), puis appelle `run`. |
| `LiftableAxleEvent:writeStream(streamId: integer, connection: Connection)` | 53 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule, un état booléen et une hauteur fixe optionnelle (float32)). |
| `LiftableAxleEvent:run(connection: Connection)` | 65 | ✍ Exécute l'événement côté réception : appelle `setLiftableAxleState(state, fixedHeight, nil, true)` sur le véhicule. Sur le serveur, il retransmet aussi l'événement aux autres clients, sauf l'émetteur. |
| `LiftableAxleEvent.sendEvent(object: table, state: boolean, fixedHeight: boolean, noEventSend: boolean)` | 76 | ✍ Fonction utilitaire d'envoi : le serveur diffuse l'événement aux clients, un client l'envoie au serveur. Ignorée si `noEventSend` est activé. |

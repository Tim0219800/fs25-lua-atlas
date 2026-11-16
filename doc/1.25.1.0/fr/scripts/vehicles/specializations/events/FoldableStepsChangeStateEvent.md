# vehicles/specializations/events/FoldableStepsChangeStateEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/FoldableStepsChangeStateEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/FoldableStepsChangeStateEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `FoldableStepsChangeStateEvent` (hérite de `Event`) qui réplique l'état cible d'un outil repliable par étapes. Elle transporte le véhicule et un état cible (`FoldableSteps.STATE_NUM_BITS` bits). Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **FoldableStepsChangeStateEvent** hérite de `Event` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FoldableStepsChangeStateEvent.emptyNew() → table` | 19 | ✍ Crée une instance vide de `FoldableStepsChangeStateEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `FoldableStepsChangeStateEvent.new(object: table, targetState: table) → table` | 29 | ✍ Crée l'événement avec ses données : le véhicule et un état cible (`FoldableSteps.STATE_NUM_BITS` bits). |
| `FoldableStepsChangeStateEvent:readStream(streamId: integer, connection: Connection)` | 41 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule et un état cible (`FoldableSteps.STATE_NUM_BITS` bits)), puis appelle `run`. |
| `FoldableStepsChangeStateEvent:writeStream(streamId: integer, connection: Connection)` | 52 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule et un état cible (`FoldableSteps.STATE_NUM_BITS` bits)). |
| `FoldableStepsChangeStateEvent:run(connection: Connection)` | 60 | ✍ Exécute l'événement côté réception : appelle `setFoldableStepsFoldState(targetState, true)` sur le véhicule. Sur le serveur, il retransmet aussi l'événement aux autres clients, sauf l'émetteur. |
| `FoldableStepsChangeStateEvent.sendEvent(vehicle: table, targetState: integer, noEventSend: boolean)` | 75 | ✍ Fonction utilitaire d'envoi : le serveur diffuse l'événement aux clients, un client l'envoie au serveur. Ignorée si `noEventSend` est activé. |

# vehicles/specializations/events/AIFieldWorkerStateEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/AIFieldWorkerStateEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/AIFieldWorkerStateEvent.lua` — FS25 1.25.1.0

✍ Événement serveur vers client qui reproduit sur les clients l'état du field worker (travail de champ IA) d'un véhicule en appelant `startFieldWorker` ou `stopFieldWorker`. L'écrire depuis un client déclenche une assertion.

- **AIFieldWorkerStateEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIFieldWorkerStateEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide avec la métatable de la classe ; utilisée par la couche réseau avant que `readStream` ne la remplisse. |
| `AIFieldWorkerStateEvent.new(vehicle: table, isActive: boolean)` | 23 | ✍ Crée l'événement pour un véhicule avec l'indicateur d'activité du field worker. |
| `AIFieldWorkerStateEvent:readStream(streamId: integer, connection: Connection)` | 36 | ✍ Lit le véhicule et l'indicateur d'activité, puis appelle `run`. |
| `AIFieldWorkerStateEvent:writeStream(streamId: integer, connection: Connection)` | 47 | ✍ Écrit véhicule et indicateur. Vérifie par assertion qu'il n'est écrit que côté serveur (événement serveur vers client). |
| `AIFieldWorkerStateEvent:run(connection: Connection)` | 56 | ✍ Sur un véhicule synchronisé, appelle `startFieldWorker` ou `stopFieldWorker` selon l'indicateur. |

# ai/events/AITaskStartEvent.lua

*[English version](../../../../scripts/ai/events/AITaskStartEvent.md)*

Source: `dataS/scripts/ai/events/AITaskStartEvent.lua` — FS25 1.25.1.0

✍ Événement qui synchronise le démarrage d'une tâche d'un job IA : il transporte l'id du job, l'index de la tâche (uint8), et appelle `job:startTask(task)` chez le récepteur.

- **AITaskStartEvent** hérite de `Event` (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AITaskStartEvent.emptyNew()` | 17 | ✍ Crée un événement vide pour la reconstruction depuis un flux. |
| `AITaskStartEvent.new(job: any, task: any)` | 24 | ✍ Crée l'événement pour un job et une tâche. |
| `AITaskStartEvent:readStream(streamId: any, connection: any)` | 35 | ✍ Lit l'id du job et l'index de tâche, retrouve le job via `aiSystem:getJobById` et la tâche via `job:getTaskByIndex`, puis exécute l'événement. |
| `AITaskStartEvent:writeStream(streamId: any, connection: any)` | 49 | ✍ Écrit l'id du job (int32) et l'index de la tâche (uint8). |
| `AITaskStartEvent:run(connection: any)` | 56 | ✍ Journalise un avertissement de développement et sort si le job est inconnu ; sinon appelle `job:startTask(task)`. |

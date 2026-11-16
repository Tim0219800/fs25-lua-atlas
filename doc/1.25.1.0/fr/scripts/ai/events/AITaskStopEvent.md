# ai/events/AITaskStopEvent.lua

*[English version](../../../../scripts/ai/events/AITaskStopEvent.md)*

Source: `dataS/scripts/ai/events/AITaskStopEvent.lua` — FS25 1.25.1.0

✍ Événement qui synchronise le arrêt d'une tâche d'un job IA : il transporte l'id du job, l'index de la tâche (uint8) et un drapeau indiquant si tout le job a été arrêté, et appelle `job:stopTask(task, wasJobStopped)` chez le récepteur.

- **AITaskStopEvent** hérite de `Event` (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AITaskStopEvent.emptyNew()` | 17 | ✍ Crée un événement vide pour la reconstruction depuis un flux. |
| `AITaskStopEvent.new(job: any, task: any, wasJobStopped: any)` | 24 | ✍ Crée l'événement pour un job et une tâche, plus le drapeau d'arrêt. |
| `AITaskStopEvent:readStream(streamId: any, connection: any)` | 36 | ✍ Lit l'id du job et l'index de tâche, retrouve le job via `aiSystem:getJobById` et la tâche via `job:getTaskByIndex`, lit le drapeau d'arrêt, puis exécute l'événement. |
| `AITaskStopEvent:writeStream(streamId: any, connection: any)` | 53 | ✍ Écrit l'id du job (int32) et l'index de la tâche (uint8) et le drapeau d'arrêt. |
| `AITaskStopEvent:run(connection: any)` | 61 | ✍ Journalise un avertissement de développement et sort si le job est inconnu ; sinon appelle `job:stopTask(task, wasJobStopped)`. |

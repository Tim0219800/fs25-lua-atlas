# ai/tasks/AITask.lua

*[English version](../../../../scripts/ai/tasks/AITask.md)*

Source: `dataS/scripts/ai/tasks/AITask.lua` — FS25 1.25.1.0

✍ Classe de base de toutes les tâches de job IA. Une tâche sait si elle tourne sur le serveur, quel job la possède, et gère les indicateurs en cours, terminée et marquée comme terminée ; les sous-classes surchargent start, stop, update et validate. Les jobs enchaînent leurs tâches et lisent getIsFinished pour passer à la suivante.

- **AITask** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AITask.new(isServer: any, job: any, customMt: any)` | 16 | ✍ Crée une tâche liée au drapeau isServer et au job propriétaire, initialement ni en cours ni terminée. |
| `AITask:delete()` | 30 | ✍ Point d'entrée vide que les sous-classes peuvent surcharger pour libérer des ressources. |
| `AITask:update(dt: any)` | 35 | ✍ Point d'entrée vide appelé à chaque image ; dt est le pas de temps. Les sous-classes y placent leur logique. |
| `AITask:start()` | 40 | ✍ Marque la tâche comme en cours et non terminée. Si un skip avait été demandé plus tôt (markAsFinished), la tâche est aussitôt marquée terminée et la demande est effacée. |
| `AITask:skip()` | 54 | ✍ Termine la tâche immédiatement si elle est en cours ; sinon mémorise la demande pour qu'elle se termine dès son démarrage. |
| `AITask:stop(wasJobStopped: any)` | 65 | ✍ Marque la tâche comme n'étant plus en cours et efface toute demande de skip en attente. L'argument wasJobStopped n'est pas utilisé ici. |
| `AITask:reset()` | 73 | ✍ Efface l'indicateur de fin pour que la tâche puisse être rejouée. Les sous-classes l'étendent pour vider leurs propres références. |
| `AITask:validate(ignoreUnsetParameters: any)` | 79 | ✍ Contrôle de base qui réussit toujours, retournant true et aucune erreur. Les sous-classes peuvent retourner false avec un message ; ignoreUnsetParameters n'est pas utilisé ici. |
| `AITask:getIsFinished()` | 85 | ✍ Retourne si la tâche est terminée. |

# ai/tasks/AITaskConveyor.lua

*[English version](../../../../scripts/ai/tasks/AITaskConveyor.md)*

Source: `dataS/scripts/ai/tasks/AITaskConveyor.lua` — FS25 1.25.1.0

✍ Tâche IA qui active le field worker d'un véhicule pendant son exécution et le coupe à l'arrêt. Elle sert au travail de type convoyeur et suit le même schéma start/stop que AITaskFieldWork. Elle étend AITask et suppose que le véhicule fournit startFieldWorker et stopFieldWorker.

- **AITaskConveyor** hérite de `AITask` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AITaskConveyor.new(isServer: any, job: any, customMt: any)` | 16 | ✍ Crée la tâche sans véhicule assigné. |
| `AITaskConveyor:reset()` | 26 | ✍ Efface la référence au véhicule, puis exécute le reset du parent. |
| `AITaskConveyor:setVehicle(vehicle: any)` | 33 | ✍ Définit le véhicule sur lequel le field worker est démarré et arrêté. |
| `AITaskConveyor:start()` | 39 | ✍ Appelle startFieldWorker sur le véhicule, ou journalise une erreur développeur si aucun véhicule n'est défini, puis exécute le start du parent. |
| `AITaskConveyor:stop(wasJobStopped: any)` | 51 | ✍ Exécute le stop du parent, puis appelle stopFieldWorker sur le véhicule, ou journalise une erreur développeur si aucun véhicule n'est défini. |

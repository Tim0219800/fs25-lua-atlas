# ai/tasks/AITaskFieldWork.lua

*[English version](../../../../scripts/ai/tasks/AITaskFieldWork.md)*

Source: `dataS/scripts/ai/tasks/AITaskFieldWork.lua` — FS25 1.25.1.0

✍ Tâche IA qui fait tourner le field worker du véhicule pendant la durée de la tâche. Elle appelle startFieldWorker au démarrage et stopFieldWorker à l'arrêt, et suppose que le véhicule fournit les deux. Le travail réel (direction, outils) est implémenté dans le véhicule, pas ici.

- **AITaskFieldWork** hérite de `AITask` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AITaskFieldWork.new(isServer: any, job: any, customMt: any)` | 16 | ✍ Crée la tâche sans véhicule assigné. |
| `AITaskFieldWork:reset()` | 26 | ✍ Efface la référence au véhicule, puis exécute le reset du parent. |
| `AITaskFieldWork:update(dt: any)` | 33 | ✍ Surcharge vide appelée à chaque image ; rien n'est fait ici. |
| `AITaskFieldWork:setVehicle(vehicle: any)` | 38 | ✍ Définit le véhicule dont le field worker est démarré et arrêté. |
| `AITaskFieldWork:start()` | 44 | ✍ Appelle startFieldWorker sur le véhicule, ou journalise une erreur développeur si aucun véhicule n'est défini, puis exécute le start du parent. |
| `AITaskFieldWork:stop(wasJobStopped: any)` | 56 | ✍ Exécute le stop du parent, puis appelle stopFieldWorker sur le véhicule, ou journalise une erreur développeur si aucun véhicule n'est défini. |

# ai/tasks/AITaskLoading.lua

*[English version](../../../../scripts/ai/tasks/AITaskLoading.md)*

Source: `dataS/scripts/ai/tasks/AITaskLoading.lua` — FS25 1.25.1.0

✍ Tâche IA qui conduit un véhicule jusqu'à un déclencheur de chargement et lance le chargement d'un type de remplissage choisi dans une unité de remplissage d'un véhicule à charger. Le positionnement n'a lieu que sur le serveur et utilise la position et la direction IA du déclencheur décalées d'un offset. Le chargement est délégué au véhicule (aiPrepareLoading, aiStartLoadingFromTrigger, aiFinishLoading), qui appelle ensuite finishedLoading.

- **AITaskLoading** hérite de `AITask` (l.15)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AITaskLoading.new(isServer: any, job: any, customMt: any)` | 19 | ✍ Crée la tâche sans véhicule, déclencheur, type de remplissage ni unité de remplissage, avec un offset nul et une vitesse maximale de 5. Unité de vitesse NON VÉRIFIÉE. |
| `AITaskLoading:reset()` | 35 | ✍ Efface le véhicule, le déclencheur, le véhicule à charger et le type de remplissage, puis exécute le reset du parent. L'offset et l'index de l'unité de remplissage ne sont pas effacés. |
| `AITaskLoading:setVehicle(vehicle: any)` | 45 | ✍ Définit le véhicule conduit jusqu'au déclencheur de chargement. |
| `AITaskLoading:setLoadTrigger(loadTrigger: any)` | 51 | ✍ Définit le déclencheur de chargement vers lequel rouler. Il doit fournir getAITargetPositionAndDirection. |
| `AITaskLoading:setFillType(fillType: any)` | 57 | ✍ Définit le type de remplissage à charger. |
| `AITaskLoading:setFillUnit(vehicle: any, fillUnitIndex: any, offsetZ: any)` | 63 | ✍ Définit le véhicule à charger, l'index de son unité de remplissage et l'offset Z appliqué à la position cible du déclencheur. |
| `AITaskLoading:start()` | 71 | ✍ Sur le serveur, calcule la cible du déclencheur reculée de l'offset, lit la hauteur du terrain et définit une cible IA sur le véhicule. Exécute toujours le start du parent. |
| `AITaskLoading:finishedLoading()` | 98 | ✍ Appelé quand le chargement est terminé : prévient le véhicule via aiFinishLoading, puis marque la tâche terminée. |
| `AITaskLoading:onTargetReached()` | 109 | ✍ À l'arrivée, efface la cible IA, passe à l'état de chargement, prépare le véhicule à charger et lance le chargement du type de remplissage depuis le déclencheur. |
| `AITaskLoading:onError(errorMessage: any)` | 121 | ✍ Callback vide pour les erreurs IA ; le message n'est pas traité. |

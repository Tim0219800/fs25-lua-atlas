# ai/tasks/AITaskDriveTo.lua

*[English version](../../../../scripts/ai/tasks/AITaskDriveTo.md)*

Source: `dataS/scripts/ai/tasks/AITaskDriveTo.lua` — FS25 1.25.1.0

✍ Tâche IA qui conduit un véhicule vers une position au sol avec un cap cible, éventuellement en passant par une position décalée placée derrière la cible selon ce cap. Sur le serveur, elle attend d'abord que le véhicule soit prêt (avec un délai) puis définit les cibles IA. Elle se termine à l'arrivée à la position finale.

- **AITaskDriveTo** hérite de `AITask` (l.18)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AITaskDriveTo.new(isServer: any, job: any, customMt: any)` | 22 | ✍ Crée la tâche sans cible ni véhicule, avec l'état initial de conduite vers l'offset, une vitesse maximale de 10, un offset nul et un délai de préparation nul. Unité de vitesse NON VÉRIFIÉE. |
| `AITaskDriveTo:reset()` | 41 | ✍ Efface le véhicule, la position et la direction cibles, restaure l'état, la vitesse et l'offset initiaux, puis exécute le reset du parent. |
| `AITaskDriveTo:setVehicle(vehicle: any)` | 53 | ✍ Définit le véhicule à conduire. |
| `AITaskDriveTo:setTargetOffset(offset: any)` | 59 | ✍ Définit la distance, derrière la cible et le long de la direction cible, d'un point intermédiaire. Zéro signifie aller directement à la cible. |
| `AITaskDriveTo:setTargetPosition(x: any, z: any)` | 65 | ✍ Mémorise les coordonnées x et z de la cible. À noter : la branche censée mettre à jour une cible en cours est vide et lit self.isActive, donc un changement après le démarrage n'a aucun effet. |
| `AITaskDriveTo:setTargetDirection(dirX: any, dirZ: any)` | 77 | ✍ Mémorise la direction cible (dirX, dirZ). La branche de mise à jour en cours d'exécution est vide, donc un changement après le démarrage n'a aucun effet. |
| `AITaskDriveTo:update(dt: any)` | 88 | ✍ Serveur seulement, à l'état de préparation : demande au véhicule s'il est prêt et lance la conduite le cas échéant. S'il n'est pas prêt et ne se prépare pas, le temps s'accumule et le job IA est arrêté avec une erreur de préparation après PREPARE_TIMEOUT. |
| `AITaskDriveTo:start()` | 108 | ✍ Sur le serveur, passe à l'état de préparation, demande au véhicule de se préparer à la conduite IA et marque la tâche active. Exécute toujours le start du parent. |
| `AITaskDriveTo:stop(wasJobStopped: any)` | 123 | ✍ Exécute le stop du parent puis, sur le serveur, efface la cible IA du véhicule et marque la tâche inactive. |
| `AITaskDriveTo:startDriving()` | 135 | ✍ Lit la hauteur du terrain et définit la première cible IA : la position cible, ou le point décalé si un offset est défini (état de conduite vers l'offset, sinon vers la position finale). |
| `AITaskDriveTo:onTargetReached()` | 155 | ✍ Callback à l'arrivée. Depuis le point décalé, il définit la cible finale avec la vitesse maximale et change d'état ; depuis la position finale, il marque la tâche terminée. |
| `AITaskDriveTo:onError(errorMessage: any)` | 167 | ✍ Callback vide pour les erreurs IA ; le message n'est pas traité. |

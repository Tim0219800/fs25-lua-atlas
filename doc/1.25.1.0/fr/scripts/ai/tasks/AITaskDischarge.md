# ai/tasks/AITaskDischarge.lua

*[English version](../../../../scripts/ai/tasks/AITaskDischarge.md)*

Source: `dataS/scripts/ai/tasks/AITaskDischarge.lua` — FS25 1.25.1.0

✍ Tâche IA qui conduit un véhicule jusqu'à un déclencheur de déchargement puis fait décharger un véhicule de déchargement à cet endroit. Le positionnement n'a lieu que sur le serveur : la cible vient de la position et de la direction IA du déclencheur, décalées d'un offset. Si le déchargement ne peut pas démarrer, le job est arrêté avec le message d'erreur de station pleine.

- **AITaskDischarge** hérite de `AITask` (l.15)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AITaskDischarge.new(isServer: any, job: any, customMt: any)` | 19 | ✍ Crée la tâche sans véhicule ni déclencheur, avec un offset nul, une vitesse maximale de 5 et l'état de conduite. L'unité de vitesse est NON VÉRIFIÉE (elle dépend de l'appel de cible IA). |
| `AITaskDischarge:reset()` | 35 | ✍ Efface le véhicule, le déclencheur, le véhicule de déchargement et le noeud, remet l'offset et l'état de conduite, puis exécute le reset du parent. |
| `AITaskDischarge:setVehicle(vehicle: any)` | 47 | ✍ Définit le véhicule conduit jusqu'au déclencheur de déchargement. |
| `AITaskDischarge:setUnloadTrigger(unloadTrigger: any)` | 53 | ✍ Définit le déclencheur de déchargement vers lequel le véhicule roule. Il doit fournir getAITargetPositionAndDirection. |
| `AITaskDischarge:setDischargeNode(vehicle: any, dischargeNode: any, offsetZ: any)` | 59 | ✍ Mémorise le noeud de déchargement et son véhicule. Si un véhicule est fourni, mémorise aussi l'offset Z et sélectionne l'index du noeud comme noeud de déchargement courant du véhicule. |
| `AITaskDischarge:start()` | 71 | ✍ Sur le serveur, calcule la cible du déclencheur reculée de l'offset, lit la hauteur du terrain et définit une cible IA sur le véhicule, puis passe à l'état de conduite. Exécute toujours le start du parent. |
| `AITaskDischarge:onTargetReached()` | 87 | ✍ Callback à l'arrivée du véhicule : efface la cible IA puis, si le véhicule de déchargement autorise un déchargement IA, le lance. Sinon le job est arrêté avec une erreur de station pleine. |
| `AITaskDischarge:onError(errorMessage: any)` | 100 | ✍ Callback vide pour les erreurs IA ; le message n'est pas traité. |
| `AITaskDischarge:finishedDischarge()` | 105 | ✍ Appelé par le véhicule de déchargement quand il a terminé ; marque la tâche comme terminée. |

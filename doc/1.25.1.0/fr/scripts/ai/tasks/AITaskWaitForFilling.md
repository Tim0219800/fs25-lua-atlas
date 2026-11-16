# ai/tasks/AITaskWaitForFilling.lua

*[English version](../../../../scripts/ai/tasks/AITaskWaitForFilling.md)*

Source: `dataS/scripts/ai/tasks/AITaskWaitForFilling.lua` — FS25 1.25.1.0

✍ Tâche IA qui attend sur le serveur que plusieurs unités de remplissage soient pleines, puis ajoute un court délai (3 secondes) avant de se terminer. Si une unité contient un type non autorisé, le job est arrêté avec une erreur de type de remplissage invalide. Elle prépare et libère le chargement de chaque unité via aiPrepareLoading et aiFinishLoading.

- **AITaskWaitForFilling** hérite de `AITask` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AITaskWaitForFilling.new(isServer: any, job: any, customMt: any)` | 16 | ✍ Crée la tâche avec des types de remplissage autorisés et une liste d'unités vides, une durée d'attente de 3000 ms et l'état non chargé complètement. |
| `AITaskWaitForFilling:reset()` | 31 | ✍ Efface le véhicule, les types autorisés, les unités de remplissage et l'état d'attente, puis exécute le reset du parent. |
| `AITaskWaitForFilling:addAllowedFillType(fillType: any)` | 42 | ✍ Ajoute un type de remplissage à l'ensemble des types considérés valides dans les unités surveillées. |
| `AITaskWaitForFilling:update(dt: any)` | 48 | ✍ Serveur seulement. Une unité est valide si elle est vide ou contient un type autorisé ; si aucune ne l'est, le job s'arrête avec une erreur. Quand toutes les unités n'ont plus de capacité libre, il attend waitDuration (basé sur g_time) puis se termine. |
| `AITaskWaitForFilling:start()` | 88 | ✍ Exécute le start du parent ; sur le serveur, remet à zéro l'indicateur de remplissage complet et appelle aiPrepareLoading sur chaque unité enregistrée. |
| `AITaskWaitForFilling:stop(wasJobStopped: any)` | 101 | ✍ Exécute le stop du parent ; sur le serveur, appelle aiFinishLoading sur chaque unité enregistrée. |
| `AITaskWaitForFilling:setVehicle(vehicle: any)` | 113 | ✍ Mémorise la référence au véhicule. Elle n'est pas utilisée par la logique de mise à jour, qui s'appuie sur les unités enregistrées. |
| `AITaskWaitForFilling:addFillUnits(vehicle: any, fillUnitIndex: any)` | 119 | ✍ Enregistre un véhicule et un index d'unité de remplissage à surveiller. Malgré le pluriel du nom, une seule unité est ajoutée par appel. |

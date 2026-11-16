# animals/husbandry/placeables/PlaceableHusbandryAnimalWorker.lua

*[English version](../../../../../scripts/animals/husbandry/placeables/PlaceableHusbandryAnimalWorker.md)*

Source: `dataS/scripts/animals/husbandry/placeables/PlaceableHusbandryAnimalWorker.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable qui permet à un élevage d'utiliser des tâches d'ouvrier à embaucher (par exemple un service récurrent d'exercice ou de récolte). Elle exige PlaceableHusbandryAnimals. Chaque tâche de g_currentMission.animalWorkerTaskSystem a un indicateur d'activation, un jour de dernière exécution et des prix pouvant être remplacés dans le XML du placeable. Le serveur exécute les tâches échues chaque heure et facture les salaires ; seuls les indicateurs d'activation sont synchronisés vers les clients. AnimalWorkerTaskSystem n'est pas dans le dump (NON VÉRIFIÉ).

- **PlaceableHusbandryAnimalWorker** (l.19)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableHusbandryAnimalWorker.registerXMLPaths(schema: XMLSchema, basePath: string)` | 31 | ✍ Enregistre les surcharges XML optionnelles `.husbandry.animalWorker.task(?)` avec `#name`, `#basePrice` et `#pricePerAnimal`. |
| `PlaceableHusbandryAnimalWorker.registerSavegameXMLPaths(schema: XMLSchema, basePath: string)` | 43 | ✍ Enregistre les chemins de sauvegarde `.task(?)` avec `#name`, `#enabled` et `#lastRunDay`. |
| `PlaceableHusbandryAnimalWorker.registerFunctions(placeableType: table)` | 54 | ✍ Enregistre les fonctions de tâche sur le type de placeable : chargement des prix, état, tâches disponibles, activation, coût, test d'échéance, application d'état depuis un événement et exécution de tâche. |
| `PlaceableHusbandryAnimalWorker.registerOverwrittenFunctions(placeableType: table)` | 68 | ✍ Surcharge getConditionInfos pour que le menu des animaux affiche l'état des ouvriers. |
| `PlaceableHusbandryAnimalWorker.registerEventListeners(placeableType: table)` | 75 | ✍ Abonne à onLoad, onReadStream, onWriteStream, onHourChanged et onDayChanged. |
| `PlaceableHusbandryAnimalWorker.prerequisitesPresent(specializations: table) → boolean` | 87 | ✍ Retourne true seulement si le type de placeable possède aussi PlaceableHusbandryAnimals. |
| `PlaceableHusbandryAnimalWorker:onLoad(savegame: table?)` | 95 | ✍ Construit une entrée d'état (désactivée, jour de dernière exécution -1, prix par défaut) pour chaque tâche du système de tâches, indexée par nom, puis charge les surcharges de prix XML. Ne fait rien si le système de tâches est absent. |
| `PlaceableHusbandryAnimalWorker:loadAnimalWorkerPriceOverrides()` | 121 | ✍ Lit chaque entrée `placeable.husbandry.animalWorker.task` et remplace le prix de base et le prix par animal de l'état de la tâche correspondante ; un nom de tâche inconnu produit un avertissement XML. |
| `PlaceableHusbandryAnimalWorker:onReadStream(streamId: integer, connection: table)` | 142 | ✍ Connexion d'un client : lit un bit d'activation par tâche enregistrée, dans l'ordre des tâches, et l'applique à l'état correspondant. |
| `PlaceableHusbandryAnimalWorker:onWriteStream(streamId: integer, connection: table)` | 159 | ✍ Connexion côté serveur : écrit un bit d'activation par tâche enregistrée dans l'ordre des tâches, false pour les tâches que cet élevage ne propose pas. |
| `PlaceableHusbandryAnimalWorker:loadFromXMLFile(xmlFile: XMLFile, key: string) → boolean` | 174 | ✍ Restaure l'indicateur d'activation et le jour de dernière exécution de chaque tâche, par nom, depuis la sauvegarde ; les tâches inconnues sont ignorées. Retourne toujours true. |
| `PlaceableHusbandryAnimalWorker:saveToXMLFile(xmlFile: XMLFile, key: string)` | 198 | ✍ Écrit le nom, l'indicateur d'activation et le jour de dernière exécution de chaque tâche proposée sous des clés `.task` indexées, dans l'ordre du système de tâches. |
| `PlaceableHusbandryAnimalWorker:onHourChanged(hour: integer)` | 220 | ✍ Serveur seulement. Pour chaque tâche disponible et activée qui n'a pas tourné aujourd'hui et est échue à cette heure, exécute performAnimalWorkerTask. |
| `PlaceableHusbandryAnimalWorker:onDayChanged(currentDay: integer)` | 246 | ✍ Côté client, pour la ferme du joueur local seulement : la veille d'une tâche planifiée (la période correspond à notifyPeriod et c'est le dernier jour de la période), affiche le rappel de la tâche en notification en jeu. |
| `PlaceableHusbandryAnimalWorker:getConditionInfos(superFunc: function) → table` | 277 | ✍ Surcharge qui ajoute une entrée d'état aux infos d'état, montrant les tâches activées sur les tâches disponibles en texte et en ratio. Rien n'est ajouté s'il n'y a aucune tâche disponible. |
| `PlaceableHusbandryAnimalWorker:performAnimalWorkerTask(task: table) → integer, integer` | 311 | ✍ Serveur seulement. Exécute la tâche via AnimalWorkerTaskSystem.performTask. Si des animaux ont été traités, il enregistre le jour et facture le prix de base plus le prix par animal en argent IA à la ferme (rien pour la ferme spectateur). Retourne le nombre d'animaux traités et le coût ; une exécution sans effet ne coûte rien. |
| `PlaceableHusbandryAnimalWorker:applyAnimalWorkerStateFromEvent(task: table, enabled: boolean) → boolean` | 349 | ✍ Définit l'indicateur d'activation d'une tâche, appelé par l'événement de changement d'état. Retourne la valeur appliquée, ou false si l'élevage ne propose pas la tâche. |
| `PlaceableHusbandryAnimalWorker:getAnimalWorkerTaskState(task: table?) → table?` | 388 | ✍ Retourne la table d'état de cet élevage pour la tâche, ou nil si la tâche est nil ou non proposée. |
| `PlaceableHusbandryAnimalWorker:getAnimalWorkerAvailableTasks() → table` | 399 | ✍ Retourne les tâches qui ont un état sur cet élevage et sont actuellement disponibles selon AnimalWorkerTaskSystem, dans l'ordre des tâches. |
| `PlaceableHusbandryAnimalWorker:getAnimalWorkerTaskIsEnabled(task: table?) → boolean` | 421 | ✍ Retourne true si l'état de la tâche existe et est activé. |
| `PlaceableHusbandryAnimalWorker:getAnimalWorkerTaskCost(task: table?, numAnimals: integer) → integer` | 432 | ✍ Retourne le prix de base plus le prix par animal multiplié par numAnimals, ou 0 si l'élevage ne propose pas la tâche. |
| `PlaceableHusbandryAnimalWorker:getAnimalWorkerTaskIsDue(task: table, hour: integer) → boolean` | 446 | ✍ Détermine si une tâche est échue à l'heure donnée. Les tâches non quotidiennes exigent la période et le jour de période planifiés ; l'heure doit être égale ou postérieure à celle du planning (défaut issu de AnimalWorkerTaskSystem), donc une heure manquée s'exécute plus tard le même jour. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadAnimalWorkerPriceOverrides` | 55 |
| registerFunction | `getAnimalWorkerTaskState` | 56 |
| registerFunction | `getAnimalWorkerAvailableTasks` | 57 |
| registerFunction | `getAnimalWorkerTaskIsEnabled` | 58 |
| registerFunction | `getAnimalWorkerTaskCost` | 59 |
| registerFunction | `getAnimalWorkerTaskIsDue` | 60 |
| registerFunction | `applyAnimalWorkerStateFromEvent` | 61 |
| registerFunction | `performAnimalWorkerTask` | 62 |
| registerOverwrittenFunction | `getConditionInfos` | 69 |
| registerEventListener | `onLoad` | 76 |
| registerEventListener | `onReadStream` | 77 |
| registerEventListener | `onWriteStream` | 78 |
| registerEventListener | `onHourChanged` | 79 |
| registerEventListener | `onDayChanged` | 80 |

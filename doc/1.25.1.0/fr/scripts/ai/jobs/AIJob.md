# ai/jobs/AIJob.lua

*[English version](../../../../scripts/ai/jobs/AIJob.md)*

Source: `dataS/scripts/ai/jobs/AIJob.lua` — FS25 1.25.1.0

✍ Classe de base de tous les jobs d'assistant IA. Un job possède une liste ordonnée de tâches et des paramètres nommés/groupés ; le serveur pilote démarrage, mise à jour et arrêt des tâches et diffuse `AITaskStartEvent`/`AITaskStopEvent`, tandis que les clients sont seulement notifiés. Il gère aussi le coût par milliseconde, les notifications et la (dé)sérialisation XML/flux de ses paramètres. Les jobs concrets comme `AIJobFieldWork` ou `AIJobGoTo` en héritent.

- **AIJob** (l.18)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIJob.new(isServer: any, customMt: any)` | 22 | ✍ Crée un job avec des listes de tâches et de paramètres vides, `currentTaskIndex` à 0, sans id de job ni coût en attente. `isServer` détermine si l'instance pilote les tâches. |
| `AIJob:delete()` | 41 | ✍ Supprime chaque paramètre nommé et chaque tâche du job. |
| `AIJob:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 52 | ✍ Écrit chaque paramètre nommé sauvegardable comme une entrée `parameter(i)` avec son nom, en déléguant le contenu au paramètre. Renvoie true. |
| `AIJob:loadFromXMLFile(xmlFile: any, key: any)` | 69 | ✍ Parcourt les entrées `parameter` sous la clé et laisse le paramètre nommé correspondant se charger s'il le permet. Les noms inconnus sont ignorés. |
| `AIJob:readStream(streamId: any, connection: any)` | 83 | ✍ Lit le drapeau de démarrage direct, l'id de job optionnel, chaque paramètre nommé dans l'ordre, appelle `setValues` puis lit l'index de tâche courant (uint8). |
| `AIJob:writeStream(streamId: any, connection: any)` | 101 | ✍ Écrit les données attendues par `readStream` : drapeau de démarrage direct, id de job optionnel, tous les paramètres nommés et l'index de tâche courant. |
| `AIJob:update(dt: any)` | 117 | ✍ Serveur uniquement. Sans tâche active, vérifie `canStartWork` et démarre la première tâche ou arrête le job avec un message. Sinon met à jour la tâche courante et, une fois finie, vérifie `canContinueWork`, passe à la suivante, boucle si `getIsLooping`, ou s'arrête avec `AIMessageSuccessFinishedJob`. |
| `AIJob:updateCost(dt: any)` | 168 | ✍ Cumule le coût courant (`getPricePerMs` fois dt fois le multiplicateur de coût de l'économie) et arrête le job avec `AIMessageErrorOutOfMoney` si le solde de la ferme devenait négatif. Au-delà de 25 de coût en attente, il est débité en argent de type `MoneyType.AI`. |
| `AIJob:canContinueWork()` | 191 | ✍ Point d'extension appelé à la fin d'une tâche ; renvoie true et un message nil par défaut. Les sous-classes renvoient false plus un `AIMessage` pour interrompre le job. |
| `AIJob:canStartWork()` | 197 | ✍ Point d'extension appelé avant le démarrage de la première tâche ; renvoie true et nil par défaut. Les sous-classes peuvent refuser avec un message. |
| `AIJob:getPricePerMs()` | 203 | ✍ Renvoie le coût de base par milliseconde, 0.0004 par défaut ; les sous-classes le redéfinissent (par exemple travail des champs et convoyeur). |
| `AIJob:getNextTaskIndex()` | 209 | ✍ Renvoie l'index de la tâche suivante, l'index courant plus un. Les sous-classes le redéfinissent pour brancher. |
| `AIJob:validate(farmId: any)` | 215 | ✍ Point d'extension qui vérifie les paramètres du job avant le démarrage ; renvoie true et nil par défaut, les sous-classes renvoient false plus un texte d'erreur. |
| `AIJob:getIsLooping()` | 221 | ✍ Renvoie false par défaut : le job se termine après sa dernière tâche. Les jobs en boucle le redéfinissent. |
| `AIJob:setValues()` | 227 | ✍ Point d'extension vide qui recopie les valeurs des paramètres dans les tâches ; les sous-classes l'implémentent et `readStream` l'appelle. |
| `AIJob:startTask(task: any)` | 232 | ✍ Rend la tâche courante, appelle `task:start()` et, sur le serveur, diffuse un `AITaskStartEvent`. |
| `AIJob:stopTask(task: any, wasJobStopped: any)` | 243 | ✍ Appelle `task:stop(wasJobStopped)` et, sur le serveur, diffuse un `AITaskStopEvent`. |
| `AIJob:start(farmId: any)` | 253 | ✍ Choisit un assistant aléatoire dans `g_helperManager`, mémorise son index et l'id de ferme, marque le job comme actif et, sur le serveur, remet l'index de tâche à 0. |
| `AIJob:getCanSkipTask()` | 266 | ✍ Renvoie false par défaut ; les jobs avec des tâches ignorables le redéfinissent. |
| `AIJob:skipCurrentTask()` | 272 | ✍ Point d'extension vide pour ignorer la tâche courante ; redéfini là où `getCanSkipTask` peut être vrai. |
| `AIJob:stop(aiMessage: any)` | 277 | ✍ Marque le job comme inactif ; sur le serveur arrête la tâche courante avec `wasJobStopped` à true, débite le coût en attente, affiche la notification du message donné et réinitialise toutes les tâches. |
| `AIJob:addTask(task: any)` | 298 | ✍ Ajoute une tâche à la fin et lui attribue son `taskIndex`. Vérifie par assertion que la tâche n'a pas déjà été ajoutée. |
| `AIJob:resetTasks()` | 306 | ✍ Appelle `reset()` sur chaque tâche du job. |
| `AIJob:getTaskByIndex(taskIndex: any)` | 314 | ✍ Renvoie la tâche à l'index donné, ou nil. |
| `AIJob:getTitle()` | 320 | ✍ Renvoie le titre de l'assistant affecté au job. |
| `AIJob:getDescription()` | 327 | ✍ Renvoie le titre du type de job d'`aiJobTypeManager` pour le `jobTypeIndex` du job. Les sous-classes y ajoutent la description de la tâche courante. |
| `AIJob:getHelperName()` | 334 | ✍ Renvoie le titre de l'assistant, nom inséré dans les messages IA. |
| `AIJob:showNotification(aiMessage: any)` | 341 | ✍ Affiche une notification en jeu pour le message, seulement sur le client dont le joueur local appartient à la ferme qui a lancé le job. Le type (critique, OK, info) suit `aiMessage:getType()`. Ne fait rien si l'assistant n'existe plus. |
| `AIJob:getStartTaskIndex()` | 369 | ✍ Renvoie l'index de la première tâche à exécuter, 1 par défaut ; les sous-classes peuvent sauter des étapes. |
| `AIJob:addNamedParameter(name: any, parameter: any)` | 375 | ✍ Enregistre un paramètre sous un nom pour qu'il puisse être sauvegardé, transmis et retrouvé par son nom. |
| `AIJob:setParameterValid(isValid: any)` | 381 | ✍ Fixe le drapeau de validité de chaque paramètre nommé à la valeur donnée. |
| `AIJob:getNamedParameters()` | 389 | ✍ Renvoie la liste des entrées `{name, parameter}`. |
| `AIJob:getNamedParameter(name: any)` | 395 | ✍ Trouve un paramètre par son nom, sans tenir compte de la casse. Renvoie nil pour un nom nil ou inconnu. |
| `AIJob:getGroupedParameters()` | 412 | ✍ Renvoie les groupes de paramètres utilisés pour présenter le job dans l'interface. |
| `AIJob:applyCurrentState(vehicle: any, mission: any, farmId: any, isDirectStart: any)` | 418 | ✍ Point d'extension qui initialise les paramètres à partir de l'état du véhicule et de la mission ; la version de base ne mémorise que le drapeau de démarrage direct. |
| `AIJob:getIsAvailableForVehicle(vehicle: any)` | 424 | ✍ Renvoie true par défaut : le job peut être proposé pour tout véhicule ; les sous-classes le restreignent. |
| `AIJob:setId(id: any)` | 430 | ✍ Mémorise l'id du job utilisé pour l'identifier dans les événements réseau. |
| `AIJob:onParameterValueChanged(parameter: any)` | 436 | ✍ Point d'extension vide appelé quand une valeur de paramètre change dans l'interface ; les sous-classes y réagissent. |
| `AIJob:getIsStartable(connection: any)` | 441 | ✍ Renvoie true et `AIJob.START_SUCCESS` par défaut ; les sous-classes renvoient false plus un état d'erreur de démarrage. `AIJob.START_SUCCESS` n'est pas défini dans ce fichier (NON VÉRIFIÉ). |

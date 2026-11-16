# field/FieldManager.lua

*[English version](../../../scripts/field/FieldManager.md)*

Source: `dataS/scripts/field/FieldManager.lua` — FS25 1.25.1.0

✍ Gestionnaire des champs de la carte, sous-classe de AbstractManager. Au chargement, il relie chaque Field à sa parcelle, vérifie que le champ ne touche pas d'autres parcelles et, sur une nouvelle sauvegarde serveur, met en file des FieldUpdateTask pour pré-planter ou préparer les champs des PNJ. Il sauvegarde et charge aussi les données des champs et les tâches en attente, et enregistre des commandes de triche gsField*. Beaucoup de méthodes appelées (getFieldById, addFieldUpdateTask, onFinishFieldUpdateTask, logique de mise à jour) ne sont pas dans ce fichier : NON VÉRIFIÉ.

- **FieldManager** hérite de `AbstractManager` (l.37)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FieldManager.new(customMt: table) → FieldManager` | 63 | ✍ Constructeur. Crée le gestionnaire via AbstractManager.new avec la métatable fournie ou par défaut. |
| `FieldManager:initDataStructures()` | 71 | ✍ Réinitialise la liste des champs, la correspondance parcelle-champ, les files de tâches de mise à jour, les tables de mises à jour en attente, les minuteries et le champ de debug. |
| `FieldManager:loadMapData(xmlFile: XMLFile, missionInfo: any, baseDirectory: any) → boolean` | 93 | ✍ Gros chargeur exécuté par sous-tâches de g_asyncTaskManager : s'enregistre comme updateable, construit la liste des cultures disponibles, relie les champs aux parcelles avec des erreurs de log en cas de chevauchement, crée des FieldUpdateTask aléatoires pour les champs sans propriétaire autorisant les missions dans une nouvelle sauvegarde serveur (ou des tâches du XML des champs de la carte), enregistre les commandes de triche, s'abonne aux messages de croissance et de génération de missions et crée un overlay de debug. Sur les clients, il met seulement tous les champs en sol cultivé. Les tâches en attente sont ensuite exécutées jusqu'au bout. |
| `FieldManager:unloadMapData()` | 352 | ✍ Retire l'updateable, supprime tous les champs, efface les références, se désabonne des messages, retire les commandes console gsField* et appelle le parent. |
| `FieldManager:delete()` | 379 | ✍ Fonction vide ; le nettoyage est fait dans unloadMapData. |
| `FieldManager:loadFromXMLFile(xmlFilename: string)` | 385 | ✍ Lit le fichier des champs de la sauvegarde : données par champ via Field:loadFromXMLFile, liste des mises à jour en attente et tâches de mise à jour sauvegardées, instanciées par nom de classe et mises en file. Journalise et retourne si le fichier manque. |
| `FieldManager:saveToXMLFile(xmlFilename: string)` | 432 | ✍ Écrit les champs (id plus données de Field:saveToXMLFile), les mises à jour en attente et les tâches de mise à jour en file (ignorées si needsSaving vaut false) dans le fichier XML de la sauvegarde. |

## Messages

- s'abonne à `MessageType.FINISHED_GROWTH_PERIOD` (l.321)
- s'abonne à `MessageType.MISSION_GENERATION_START` (l.322)
- s'abonne à `MessageType.MISSION_GENERATION_END` (l.323)

# ai/AIJobTypeManager.lua

*[English version](../../../scripts/ai/AIJobTypeManager.md)*

Source: `dataS/scripts/ai/AIJobTypeManager.lua` — FS25 1.25.1.0

✍ Registre des types de jobs IA. Au chargement de la map il enregistre GOTO, FIELDWORK, CONVEYOR, DELIVER et LOAD_AND_DELIVER avec un titre localisé et une classe de job, publie la table nom vers index comme global AIJobType et crée des instances de job à partir d'un index de type. Les classes de job elles-mêmes ne sont pas dans ce fichier.

- **AIJobTypeManager** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIJobTypeManager.new(isServer: any, customMt: any) → table` | 18 | ✍ Constructeur. Mémorise si cette instance tourne sur le serveur ; les tables de types de jobs sont remplies plus tard dans loadMapData. |
| `AIJobTypeManager:loadMapData(xmlFile: any, missionInfo: any, baseDirectory: any) → boolean` | 29 | ✍ Réinitialise les tables de types de jobs, relie le global AIJobType à la table nom vers index et enregistre les cinq types de jobs intégrés. Les arguments XML et mission ne sont pas utilisés. Retourne toujours nil malgré son commentaire (aucun return explicite dans le code). |
| `AIJobTypeManager:delete()` | 44 | ✍ Vide toutes les tables de types de jobs et réinitialise le global AIJobType sur la table nom vers index désormais vide. |
| `AIJobTypeManager:registerJobType(name: any, title: any, classObject: any)` | 53 | ✍ Enregistre un type de job sous un nom valide mis en majuscules avec un titre localisé et une classe, et retourne son enregistrement (name, title, classObject, index). Retourne nil avec un avertissement si le nom est invalide ou déjà utilisé. |
| `AIJobTypeManager:getJobTypeIndex(job: any)` | 81 | ✍ Retourne l'index de type d'une instance de job, retrouvé à partir de sa classe, ou nil si la classe est inconnue ou non enregistrée. |
| `AIJobTypeManager:createJob(typeIndex: any)` | 92 | ✍ Crée un job du type donné en appelant le new de la classe enregistrée avec l'indicateur serveur, et lui attribue l'index de type. Retourne nil pour un index nil ou inconnu. |
| `AIJobTypeManager:getJobTypeByIndex(index: any)` | 110 | ✍ Retourne l'enregistrement de type de job pour un index, ou nil. |
| `AIJobTypeManager:getJobTypeIndexByName(name: any)` | 116 | ✍ Retourne l'index de type de job pour un nom (insensible à la casse), ou nil si le nom est nil ou inconnu. |

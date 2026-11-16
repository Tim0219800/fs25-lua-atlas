# missions/field/StonePickMission.lua

*[English version](../../../../scripts/missions/field/StonePickMission.md)*

Source: `dataS/scripts/missions/field/StonePickMission.lua` — FS25 1.25.1.0

✍ Contrat de ramassage de cailloux, sous-classe de AbstractFieldMission utilisant WorkAreaType.STONEPICKER. L'avancement est mesuré dans la density map du système de cailloux. Il n'est proposé que sur des champs labourés, non semés, contenant réellement des cailloux, hors hiver, si les cailloux sont activés dans la sauvegarde.

- **StonePickMission** hérite de `AbstractFieldMission` (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `StonePickMission.new(isServer: any, isClient: any, customMt: any)` | 24 | ✍ Constructeur. Crée la mission avec les textes de titre et description du ramassage, le type de zone de travail ramasse-cailloux, stoneValue à 3 et spawnedPixels à 0. |
| `StonePickMission:getFieldPreparingTask()` | 51 | ✍ Sur le serveur, fixe le niveau de cailloux de l'état du champ à stoneValue, puis renvoie la tâche de préparation du parent. |
| `StonePickMission:getFieldFinishTask()` | 62 | ✍ Sur le serveur, remet le niveau de cailloux à 0 et le type de sol à CULTIVATED dans l'état du champ, puis renvoie la tâche de fin du parent. |
| `StonePickMission:createModifier()` | 74 | ✍ Crée les modificateurs de density map (avec et sans masque) sur la density map des cailloux, avec des filtres comparant à la valeur maximale de cailloux, supérieure à 0 et égale à 0. |
| `StonePickMission:getPartitionCompletion(partitionIndex: any)` | 95 | ✍ Définit la région de la partition et renvoie pixels cumulés, surface et surface totale d'après la carte de cailloux. Le total exclut la zone non masquée (sans cailloux). Renvoie 0, 0, 0 sans modificateur. |
| `StonePickMission:initializeModifier()` | 113 | ✍ Appelle la version du parent, puis applique le polygone de density map du champ au modificateur non masqué. |
| `StonePickMission:setPartitionRegion(partitionIndex: any)` | 124 | ✍ Appelle le parent puis, s'il y a plus d'une partition, restreint le modificateur non masqué à la plage minZ/maxZ de la partition. |
| `StonePickMission:getRewardPerHa()` | 139 | ✍ Renvoie la récompense par hectare enregistrée pour ce type de mission dans MissionManager. |
| `StonePickMission:getMissionTypeName()` | 146 | ✍ Renvoie StonePickMission.NAME (la valeur est définie ailleurs, pas dans ce fichier). |
| `StonePickMission:validate(event: any)` | 152 | ✍ Exécute la validation du parent puis, si la mission n'est pas terminée, revérifie que le champ reste éligible. Renvoie false si l'un des tests échoue. |
| `StonePickMission.loadMapData(xmlFile: any, key: any, baseDirectory: any)` | 168 | ✍ Lit #rewardPerHa dans le XML de la carte (2200 par défaut) vers les données du type de mission. Renvoie true. |
| `StonePickMission.tryGenerateMission()` | 177 | ✍ Générateur côté serveur : si canRun, prend un champ pour une mission, exige qu'il soit libre et éligible, crée et initialise une mission et fixe sa date de fin par défaut. Renvoie la mission ou nil. |
| `StonePickMission.getFieldHasStones(field: table) → boolean` | 210 | ✍ Renvoie true si la density map des cailloux a au moins un pixel supérieur à 0 dans le polygone du champ. False si la carte n'a pas de cailloux. |
| `StonePickMission.isAvailableForField(field: any, mission: any)` | 235 | ✍ Pour une nouvelle mission, exige un état de champ valide, aucune culture, un sol labouré et des cailloux présents. Dans tous les cas, refuse en hiver. |
| `StonePickMission.canRun()` | 268 | ✍ Renvoie true seulement si la limite d'instances n'est pas atteinte, si la carte a des cailloux et si les cailloux sont activés dans les réglages de la sauvegarde. |

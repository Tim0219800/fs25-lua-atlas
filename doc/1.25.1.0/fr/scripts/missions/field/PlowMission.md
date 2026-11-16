# missions/field/PlowMission.lua

*[English version](../../../../scripts/missions/field/PlowMission.md)*

Source: `dataS/scripts/missions/field/PlowMission.lua` — FS25 1.25.1.0

✍ Contrat de labour, sous-classe de AbstractFieldMission utilisant WorkAreaType.PLOW. L'achèvement est la part des pixels du champ dont le type de sol est PLOWED. Proposé sur les champs avec une culture récoltée ou flétrie dont le niveau de labour n'est pas encore au maximum.

- **PlowMission** hérite de `AbstractFieldMission` (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlowMission.new(isServer: any, isClient: any, customMt: any)` | 24 | ✍ Constructeur. Crée la mission avec les textes de titre et description du labour et le type de zone de travail charrue. |
| `PlowMission:createModifier()` | 39 | ✍ Crée un modificateur de density map sur la carte du type de sol et un filtre sur la valeur PLOWED ; sert à mesurer l'avancement. |
| `PlowMission:getFieldFinishTask()` | 51 | ✍ Met l'état du champ à culture inconnue et sol PLOWED, puis renvoie la tâche de fin du parent. Contrairement à StonePickMission, ne teste pas isServer. |
| `PlowMission:getRewardPerHa()` | 61 | ✍ Renvoie la récompense par hectare enregistrée pour le type de mission labour dans MissionManager. |
| `PlowMission:getMissionTypeName()` | 68 | ✍ Renvoie PlowMission.NAME (valeur définie ailleurs, pas dans ce fichier). |
| `PlowMission:validate(event: any)` | 74 | ✍ Exécute la validation du parent puis, si non terminée, revérifie que le champ est toujours éligible. Renvoie false si l'un échoue. |
| `PlowMission.loadMapData(xmlFile: any, key: any, baseDirectory: any)` | 90 | ✍ Lit #rewardPerHa dans le XML de la carte (2800 par défaut) vers les données du type de mission labour. Renvoie true. |
| `PlowMission.tryGenerateMission()` | 99 | ✍ Générateur côté serveur : si canRun, choisit un champ libre et éligible, crée et initialise une PlowMission et fixe sa date de fin par défaut. Renvoie la mission ou nil. |
| `PlowMission.isAvailableForField(field: any, mission: any)` | 129 | ✍ Pour une nouvelle mission, exige un état valide, un champ non réservé à l'herbe, un niveau de labour inférieur au max, une culture connue non réservée aux missions de récolte, pas une culture dérobée jeune, et un stade coupé ou flétri. Toujours true pour une mission existante. |
| `PlowMission.canRun()` | 170 | ✍ Renvoie true tant que le nombre de missions de labour en cours est inférieur au maximum du type. |

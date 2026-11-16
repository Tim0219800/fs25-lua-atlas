# vehicles/specializations/WorkArea.lua

*[English version](../../../../scripts/vehicles/specializations/WorkArea.md)*

Source: `dataS/scripts/vehicles/specializations/WorkArea.lua` — FS25 1.25.1.0

✍ Spécialisation centrale qui donne aux outils des zones de travail (nœuds de départ, de largeur et de hauteur formant un parallélogramme) et exécute leur fonction de traitement à chaque tick de mise à jour. Elle exige GroundReference et gère une configuration `workArea`. À chaque tick elle déclenche `onStartWorkAreaProcessing` et `onEndWorkAreaProcessing`, vérifie l'activité (contact au sol, sens, état abaissé) et l'accès aux parcelles, appelle les fonctions de pré/traitement/post nommées dans le XML et ajoute hectares travaillés et temps aux statistiques de la ferme. Elle enregistre les types de zone default et auxiliary. `getMissionByWorkArea` est enregistrée comme fonction du véhicule mais son corps n'est pas dans le dump (NON VÉRIFIÉ).

- **WorkArea** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WorkArea.initSpecialization()` | 18 | ✍ Enregistre les types de zone `default` et `auxiliary`, ajoute le type de configuration `workArea` et déclare les chemins XML de zone (de base et par configuration) ainsi que `#workAreaIndex` pour les pièces rotatives à vitesse. |
| `WorkArea.registerWorkAreaXMLPaths(schema: any, basePath: any)` | 37 | ✍ Enregistre les attributs XML d'une zone de travail sous un chemin de base : type, contact au sol, désactivation en marche arrière, obligation de parcelle possédée, noms de fonctions, les trois nœuds de zone, indice du nœud de référence au sol et option abaissé seulement. |
| `WorkArea.prerequisitesPresent(specializations: any)` | 56 | ✍ Renvoie true seulement si le type de véhicule possède la spécialisation GroundReference. |
| `WorkArea.registerEvents(vehicleType: any)` | 62 | ✍ Enregistre les événements de véhicule `onStartWorkAreaProcessing` et `onEndWorkAreaProcessing`. |
| `WorkArea.registerFunctions(vehicleType: any)` | 69 | ✍ Enregistre l'API des zones de travail sur le type de véhicule : chargement, accès par indice, activité, largeur, état de traitement, zones par type, accès aux parcelles, dernière surface travaillée, mission et largeur IA. |
| `WorkArea.registerOverwrittenFunctions(vehicleType: any)` | 89 | ✍ Surcharge `loadSpeedRotatingPartFromXML`, `getIsSpeedRotatingPartActive`, `checkMovingPartDirtyUpdateNode` et `getImplementAllowAutomaticSteering`. |
| `WorkArea.registerEventListeners(vehicleType: any)` | 98 | ✍ S'abonne à onLoad et onUpdateTick. |
| `WorkArea:onLoad(savegame: table)` | 106 | ✍ Choisit la section XML de la configuration `workArea` retenue (repli sur `vehicle.workAreas`), charge chaque zone valide, calcule les largeurs et indexe les zones par type. Initialise l'état d'avertissement de parcelle et les textes. |
| `WorkArea:getIsAccessibleAtWorldPosition(farmId: boolean, x: integer, z: boolean, workAreaType: any)` | 161 | ✍ Renvoie trois valeurs : si la ferme peut travailler en x, z, l'identifiant du propriétaire de la parcelle, et si la terre est achetable. Les véhicules de mission s'en remettent à `g_missionManager` ; une terre sans propriétaire ou non achetable est refusée. |
| `WorkArea:updateLastWorkedArea(area: any)` | 185 | ✍ Conserve la plus grande surface travaillée signalée pendant le tick courant, convertie ensuite en hectares pour les statistiques. |
| `WorkArea:getLastTouchedFarmlandFarmId()` | 192 | ✍ Renvoie l'identifiant de la ferme de la dernière parcelle où une zone de travail était accessible, ou 0 sinon. |
| `WorkArea:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 207 | ✍ À chaque tick : déclenche l'événement de début, puis pour chaque zone non auxiliaire vérifie l'activité et l'accès à la parcelle (départ, largeur, hauteur et quatrième coin), exécute les fonctions de pré, principale et post, et mémorise hectares travaillés et date de traitement. Affiche un avertissement clignotant si aucune zone n'est sur une terre accessible et achetable, déclenche l'événement de fin, puis ajoute hectares et minutes aux statistiques de la ferme. |
| `WorkArea:loadWorkAreaFromXML(workArea: table, xmlFile: XMLFile, key: string) → boolean` | 345 | ✍ Remplit une table de zone de travail depuis le XML et renvoie true en cas de succès. Valide les trois nœuds (positions distinctes), le type, la référence au sol (si le contact est requis), le `functionName` obligatoire qui doit exister sur le véhicule, et les fonctions pré/post optionnelles. À noter : le test `workArea.type == nil` ne peut jamais se déclencher à cause du repli `or WorkAreaType.DEFAULT` juste au-dessus. |
| `WorkArea:getWorkAreaByIndex(workAreaIndex: any)` | 452 | ✍ Renvoie la table de zone de travail à l'indice donné (à partir de 1), ou nil. |
| `WorkArea:getIsWorkAreaActive(workArea: table) → boolean` | 461 | ✍ Vrai si la zone remplit ses conditions : nœud de référence au sol actif (si requis), pas de marche arrière (si `disableBackwards`) et outil abaissé (si `onlyActiveWhenLowered`). |
| `WorkArea:updateWorkAreaWidth(workAreaIndex: integer)` | 488 | ✍ Recalcule la `workWidth` de la zone (mètres) comme l'étalement latéral des nœuds de départ, de largeur et de hauteur mesuré depuis le premier composant. Sans effet si l'indice est invalide. |
| `WorkArea:getWorkAreaWidth(workAreaIndex: integer)` | 507 | ✍ Renvoie la dernière largeur calculée de la zone de travail à l'indice donné (sans vérification de nil sur l'indice). |
| `WorkArea:getIsWorkAreaProcessing(workArea: table)` | 515 | ✍ Vrai si la zone a produit un résultat dans les 200 dernières ms de temps de mission. |
| `WorkArea:getTypedNetworkAreas(areaType: integer, needsFieldProperty: boolean) → table, boolean, number` | 526 | ✍ Pour les zones actives d'un type, renvoie une liste de coordonnées {x, z, x1, z1, x2, z2} à envoyer sur le réseau, un indicateur signalant si une zone a été refusée faute d'accès, et la surface cumulée. Si `needsFieldProperty` est défini, vérifie l'accès du local à la terre. |
| `WorkArea:getTypedWorkAreas(areaType: integer) → table` | 560 | ✍ Renvoie la table des zones de travail d'un type donné, ou une table vide. |
| `WorkArea:getIsTypedWorkAreaActive(areaType: integer) → boolean, table` | 575 | ✍ Indique si au moins une zone du type est active, et renvoie aussi la liste des zones de ce type. |
| `WorkArea:getAIWorkAreaWidth()` | 616 | ✍ Renvoie la plus grande `workWidth` parmi les zones dont le type est marqué zone IA par le gestionnaire de types (0 s'il n'y en a pas). |
| `WorkArea:getIsFarmlandNotOwnedWarningShown()` | 629 | ✍ Indique si l'avertissement de parcelle non possédée a été déclenché au dernier tick. |
| `WorkArea:loadSpeedRotatingPartFromXML(superFunc: table, speedRotatingPart: table, xmlFile: XMLFile, key: string) → boolean` | 639 | ✍ Étend le chargeur parent : après son succès, lit aussi `#workAreaIndex` dans la pièce rotative. Renvoie false si le parent échoue. |
| `WorkArea:getIsSpeedRotatingPartActive(superFunc: table, speedRotatingPart: table) → boolean` | 653 | ✍ Si la pièce est liée à une zone, elle n'est active que pendant le traitement de cette zone ; un indice invalide journalise un avertissement et renvoie true. Sinon s'en remet au parent. À noter : l'avertissement affiche l'indice après l'avoir mis à nil. |
| `WorkArea:checkMovingPartDirtyUpdateNode(superFunc: any, node: any, movingPart: any)` | 673 | ✍ Appelle la vérification parente, puis journalise une erreur XML si un nœud de zone ou de référence au sol se trouve sous une pièce mobile à distance de mise à jour limitée. |
| `WorkArea:getImplementAllowAutomaticSteering(superFunc: any)` | 693 | ✍ Renvoie true si une zone de travail a un type marqué pour l'aide à la conduite ; sinon s'en remet au parent. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onStartWorkAreaProcessing` | 63 |
| registerEvent | `onEndWorkAreaProcessing` | 64 |
| registerFunction | `loadWorkAreaFromXML` | 70 |
| registerFunction | `getWorkAreaByIndex` | 71 |
| registerFunction | `getIsWorkAreaActive` | 72 |
| registerFunction | `updateWorkAreaWidth` | 73 |
| registerFunction | `getWorkAreaWidth` | 74 |
| registerFunction | `getIsWorkAreaProcessing` | 75 |
| registerFunction | `getTypedNetworkAreas` | 76 |
| registerFunction | `getTypedWorkAreas` | 77 |
| registerFunction | `getIsTypedWorkAreaActive` | 78 |
| registerFunction | `getIsFarmlandNotOwnedWarningShown` | 79 |
| registerFunction | `getLastTouchedFarmlandFarmId` | 80 |
| registerFunction | `getIsAccessibleAtWorldPosition` | 81 |
| registerFunction | `updateLastWorkedArea` | 82 |
| registerFunction | `getMissionByWorkArea` | 83 |
| registerFunction | `getAIWorkAreaWidth` | 84 |
| registerOverwrittenFunction | `loadSpeedRotatingPartFromXML` | 90 |
| registerOverwrittenFunction | `getIsSpeedRotatingPartActive` | 91 |
| registerOverwrittenFunction | `checkMovingPartDirtyUpdateNode` | 92 |
| registerOverwrittenFunction | `getImplementAllowAutomaticSteering` | 93 |
| registerEventListener | `onLoad` | 99 |
| registerEventListener | `onUpdateTick` | 100 |

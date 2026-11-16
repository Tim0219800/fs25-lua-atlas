# vehicles/specializations/AttacherJointsCompControl.lua

*[English version](../../../../scripts/vehicles/specializations/AttacherJointsCompControl.md)*

Source: `dataS/scripts/vehicles/specializations/AttacherJointsCompControl.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule qui raidit ou assouplit les ressorts de translation d'une articulation de composant choisie selon la masse de l'outil accroché à un attache. Elle exige la spécialisation AttacherJoints. Elle ajoute un bloc `dependentComponentJoint` à chaque attache dans le XML du véhicule et lisse les changements avec un ValueInterpolator. Tout s'exécute uniquement côté serveur.


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AttacherJointsCompControl.prerequisitesPresent(specializations: table) → boolean` | 19 | ✍ Renvoie true seulement si le type de véhicule contient la spécialisation AttacherJoints. |
| `AttacherJointsCompControl.initSpecialization()` | 25 | ✍ Enregistre dans le schéma XML les entrées du bloc `dependentComponentJoint` d'une attache : index de l'articulation, facteurs de ressort et d'amortissement, masse de référence et durées d'interpolation à l'attelage/dételage. |
| `AttacherJointsCompControl.registerFunctions(vehicleType: any)` | 43 | ✍ Enregistre les trois fonctions de véhicule de cette spécialisation : setDependentComponentJointBaseFactors, addDependentComponentJointData et updateDependentComponentJointValues. |
| `AttacherJointsCompControl.registerOverwrittenFunctions(vehicleType: any)` | 51 | ✍ Surcharge `addToPhysics` et `loadAttacherJointFromXML` sur le type de véhicule afin d'initialiser les facteurs des articulations et de les lire dans le XML. |
| `AttacherJointsCompControl.registerEventListeners(vehicleType: any)` | 58 | ✍ Abonne le véhicule aux événements `onPreLoad` et `onStateChange`. |
| `AttacherJointsCompControl:onPreLoad(savegame: table)` | 66 | ✍ Crée la table vide des données d'articulations dépendantes. Sur une instance non serveur, elle retire l'écouteur `onStateChange`, la logique étant réservée au serveur. |
| `AttacherJointsCompControl:onStateChange(state: any, data: any)` | 78 | ✍ Lors d'un changement d'état ATTACH ou DETACH du véhicule, recalcule les facteurs de ressort et d'amortissement des articulations dépendantes. |
| `AttacherJointsCompControl:setDependentComponentJointBaseFactors(componentJointIndex: any, transSpringFactor: any, transDampingFactor: any, overwrite: any)` | 86 | ✍ Serveur uniquement. Définit les facteurs de base de ressort et d'amortissement d'une articulation, en les remplaçant ou en multipliant les valeurs actuelles, pour que d'autres scripts puissent la modifier indépendamment des outils attelés. |
| `AttacherJointsCompControl:addDependentComponentJointData(componentJointIndex: any)` | 103 | ✍ Récupère ou crée l'enregistrement de données pour l'index d'une articulation de composant, avec des callbacks qui appliquent les facteurs aux trois limites de translation. Renvoie nil et journalise un avertissement XML si l'index est inconnu. |
| `AttacherJointsCompControl:updateDependentComponentJointValues(forceUpdate: any, skipInterpolation: any)` | 155 | ✍ Recalcule les facteurs cibles d'après la masse de chaque outil attelé (plafonnée à la masse de référence) et lance un ValueInterpolator, ou les applique immédiatement si `skipInterpolation` est défini. À noter : le test de dételage compare la cible d'amortissement à elle-même, donc cette moitié est toujours vraie. |
| `AttacherJointsCompControl:addToPhysics(superFunc: any) → boolean` | 204 | ✍ Appelle la fonction parente puis, sur le serveur, applique immédiatement les facteurs sans interpolation. Renvoie false si la fonction parente a échoué. |
| `AttacherJointsCompControl:loadAttacherJointFromXML(superFunc: table, attacherJoint: table, xmlFile: string, baseName: string, index: integer)` | 222 | ✍ Après le chargement parent, uniquement sur le serveur, lit le bloc `dependentComponentJoint` de l'attache et stocke ses facteurs, sa masse de référence et ses durées d'interpolation. Renvoie false si le parent a échoué. |
| `AttacherJointsCompControl:updateDebugValues(values: any)` | 250 | ✍ Ajoute des lignes d'affichage de debug : masse de l'outil comparée à la masse de référence, facteurs de ressort et d'amortissement par attache, et facteurs de base et actuels par articulation. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `setDependentComponentJointBaseFactors` | 44 |
| registerFunction | `addDependentComponentJointData` | 45 |
| registerFunction | `updateDependentComponentJointValues` | 46 |
| registerOverwrittenFunction | `addToPhysics` | 52 |
| registerOverwrittenFunction | `loadAttacherJointFromXML` | 53 |
| registerEventListener | `onPreLoad` | 59 |
| registerEventListener | `onStateChange` | 60 |

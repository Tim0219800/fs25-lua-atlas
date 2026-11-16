# vehicles/specializations/GroundReference.lua

*[English version](../../../../scripts/vehicles/specializations/GroundReference.md)*

Source: `dataS/scripts/vehicles/specializations/GroundReference.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule pour les outils travaillant le sol : elle déclare des nœuds de référence et suit si chacun est au niveau ou sous la surface du terrain (ou de la matière en carte de hauteur), éventuellement seulement quand l'outil est abaissé. Le résultat pilote le multiplicateur de puissance (charge) et permet aux parties tournantes liées à la vitesse (roues, dents) de ne tourner qu'au contact du sol. L'état est calculé côté serveur et envoyé aux clients dans le flux de mise à jour.

- **GroundReference** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `GroundReference.prerequisitesPresent(specializations: any)` | 16 | ✍ Renvoie toujours true : aucun prérequis envers d'autres spécialisations. |
| `GroundReference.initSpecialization()` | 22 | ✍ Enregistre le schéma XML d'un nœud de référence au sol (nœud, seuil, actif seulement abaissé, valeur de charge, facteur de force, profondeur maximale d'activation) et l'attribut groundReferenceNodeIndex des parties tournantes. La constante du chemin de base est définie hors de ce fichier (NON VÉRIFIÉ). |
| `GroundReference.registerEvents(vehicleType: any)` | 43 | ✍ Vide : la spécialisation n'enregistre aucun événement personnalisé. |
| `GroundReference.registerFunctions(vehicleType: any)` | 48 | ✍ Enregistre sur le type de véhicule les fonctions de chargement, de mise à jour et d'interrogation des nœuds (dont la vitesse d'avance). |
| `GroundReference.registerOverwrittenFunctions(vehicleType: any)` | 59 | ✍ Surcharge getPowerMultiplier, loadSpeedRotatingPartFromXML et getIsSpeedRotatingPartActive pour que le contact au sol influence la charge et les parties tournantes. |
| `GroundReference.registerEventListeners(vehicleType: any)` | 67 | ✍ Abonne la spécialisation à onLoad, onReadUpdateStream, onWriteUpdateStream et onUpdateTick. |
| `GroundReference:onLoad(savegame: any)` | 76 | ✍ Charge toutes les entrées groundReferenceNode, puis normalise les valeurs de charge et les facteurs de force pour que chaque ensemble totalise 1. Sans nœud, retire l'écouteur onUpdateTick. |
| `GroundReference:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 124 | ✍ Côté client : lit un booléen par nœud de référence dans le flux et le stocke comme état actif du nœud. |
| `GroundReference:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 135 | ✍ Côté serveur : écrit l'état actif de chaque nœud de référence dans le flux de mise à jour envoyé aux clients. |
| `GroundReference:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 146 | ✍ À chaque tick, rafraîchit l'état actif de chaque nœud de référence au sol. |
| `GroundReference:loadGroundReferenceNode(xmlFile: any, baseName: any, entry: any)` | 155 | ✍ Charge un nœud de référence depuis le XML (nœud, seuil, option abaissé seulement, valeur de charge, facteur de force, profondeur max). Renvoie true en cas de succès, false si le nœud manque. Signale l'usage de facteurs de force si l'un est fourni. |
| `GroundReference:updateGroundReferenceNode(groundReferenceNode: any)` | 179 | ✍ Serveur uniquement. Un nœud est actif si l'outil est abaissé (si requis) et si le nœud se situe sous la hauteur du terrain, ou de la matière en carte de hauteur, en tenant compte du seuil, sans dépasser la profondeur maximale d'activation. |
| `GroundReference:getGroundReferenceNodeFromIndex(refNodeIndex: any)` | 213 | ✍ Renvoie la table du nœud de référence à l'indice donné (base 1), ou nil. |
| `GroundReference:getIsGroundReferenceNodeActive(groundReferenceNode: any)` | 220 | ✍ Indique si le nœud de référence donné est actuellement actif (au contact du sol). |
| `GroundReference:getIsGroundReferenceNodeThreshold(groundReferenceNode: any)` | 226 | ✍ Renvoie le seuil de hauteur du nœud de référence donné, en mètres. |
| `GroundReference:getGroundReferenceNodeForwardSpeed(groundReferenceNodeIndex: any)` | 232 | ✍ Renvoie la dernière vitesse du véhicule si le nœud indexé est actif et que le véhicule avance, sinon 0. Utilisé par les parties tournantes liées à un nœud de référence. |
| `GroundReference:getPowerMultiplier(superFunc: any)` | 246 | ✍ Met à l'échelle le multiplicateur de puissance parent selon le contact au sol : somme des facteurs de force des nœuds actifs s'il y en a de configurés, sinon valeur de charge du dernier nœud actif. À noter : sans nœud actif le facteur vaut 0. |
| `GroundReference:loadSpeedRotatingPartFromXML(superFunc: any, speedRotatingPart: any, xmlFile: any, key: any)` | 274 | ✍ Étend le chargeur parent pour lire groundReferenceNodeIndex d'une partie tournante, avec un avertissement si l'indice vaut 0 puisque les indices commencent à 1. |
| `GroundReference:getIsSpeedRotatingPartActive(superFunc: any, speedRotatingPart: any)` | 292 | ✍ Renvoie false pour une partie tournante dont le nœud de référence lié est inactif. Avertit et supprime le lien si l'indice est inconnu, puis s'en remet au test parent. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadGroundReferenceNode` | 49 |
| registerFunction | `updateGroundReferenceNode` | 50 |
| registerFunction | `getGroundReferenceNodeFromIndex` | 51 |
| registerFunction | `getIsGroundReferenceNodeActive` | 52 |
| registerFunction | `getIsGroundReferenceNodeThreshold` | 53 |
| registerFunction | `getGroundReferenceNodeForwardSpeed` | 54 |
| registerOverwrittenFunction | `getPowerMultiplier` | 60 |
| registerOverwrittenFunction | `loadSpeedRotatingPartFromXML` | 61 |
| registerOverwrittenFunction | `getIsSpeedRotatingPartActive` | 62 |
| registerEventListener | `onLoad` | 68 |
| registerEventListener | `onReadUpdateStream` | 69 |
| registerEventListener | `onWriteUpdateStream` | 70 |
| registerEventListener | `onUpdateTick` | 71 |

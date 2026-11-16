# vehicles/specializations/AdditionalToolConnections.lua

*[English version](../../../../scripts/vehicles/specializations/AdditionalToolConnections.md)*

Source: `dataS/scripts/vehicles/specializations/AdditionalToolConnections.lua` — FS25 1.25.1.0

✍ Spécialisation pour les outils dont une pièce mobile doit suivre un point de connexion supplémentaire sur l'articulation d'attache du tracteur (par exemple un second bras). L'outil déclare des entrées vehicle.additionalToolConnections.connection avec un id et un movingPartNode ; l'articulation d'attache déclare des entrées additionalToolConnection avec le même id et un nœud cible. Elle exige AttacherJoints ou Attachable. À l'attelage, le nœud de référence de la pièce mobile est changé et les changements d'objet sont activés ; au dételage, ils sont annulés.


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AdditionalToolConnections.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Renvoie vrai si le type de véhicule possède AttacherJoints ou Attachable. |
| `AdditionalToolConnections.initSpecialization()` | 24 | ✍ Déclare les clés XML des connexions côté outil (id, movingPartNode, changements d'objet) et, par enregistrement différé, les clés id/node additionalToolConnection sur chaque articulation d'attache. |
| `AdditionalToolConnections.registerFunctions(vehicleType: any)` | 42 | ✍ Vide : n'enregistre aucune nouvelle fonction de véhicule. |
| `AdditionalToolConnections.registerOverwrittenFunctions(vehicleType: any)` | 47 | ✍ Surcharge loadAttacherJointFromXML pour que les articulations d'attache lisent aussi leurs connexions supplémentaires. |
| `AdditionalToolConnections.registerEventListeners(vehicleType: any)` | 53 | ✍ Abonne la spécialisation à onPostLoad, onPostAttach et onPreDetach. |
| `AdditionalToolConnections:onPostLoad(savegame: any)` | 61 | ✍ Lit chaque connexion, retrouve sa pièce mobile et mémorise id, nœud et changements d'objet (désactivés au départ). Journalise un avertissement XML si l'id, le nœud ou la pièce mobile manque. |
| `AdditionalToolConnections:loadAttacherJointFromXML(superFunc: table, attacherJoint: table, xmlFile: string, baseName: string, index: integer, ...: any)` | 95 | ✍ Surcharge : appelle le chargeur parent et, s'il réussit, remplit attacherJoint.additionalToolConnections avec des paires id vers nœud. Renvoie faux si le parent échoue. |
| `AdditionalToolConnections:onPostAttach(attacherVehicle: table, inputJointDescIndex: integer, jointDescIndex: integer, loadFromSavegame: boolean)` | 120 | ✍ Pour chaque connexion de l'outil dont l'id existe sur l'articulation utilisée, fait pointer le nœud de référence de la pièce mobile vers le nœud de l'articulation et active les changements d'objet. |
| `AdditionalToolConnections:onPreDetach(attacherVehicle: table, implement: table)` | 141 | ✍ Avant le dételage, efface le nœud de référence de la pièce mobile de chaque connexion et désactive les changements d'objet. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerOverwrittenFunction | `loadAttacherJointFromXML` | 48 |
| registerEventListener | `onPostLoad` | 54 |
| registerEventListener | `onPostAttach` | 55 |
| registerEventListener | `onPreDetach` | 56 |

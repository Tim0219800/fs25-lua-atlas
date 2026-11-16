# vehicles/specializations/Suspensions.lua

*[English version](../../../../scripts/vehicles/specializations/Suspensions.md)*

Source: `dataS/scripts/vehicles/specializations/Suspensions.lua` — FS25 1.25.1.0

✍ Spécialisation des suspensions hors roues (cabine, siège ou personnage conducteur), sans prérequis. Chaque nœud de suspension est une simulation ressort/amortisseur côté client, par axe, pilotée par l'accélération d'un point de référence du composant parent et appliquée comme rotation ou translation à un node. Les nœuds sont lus dans vehicle.suspensions.suspension du XML du véhicule et mis à jour seulement dans une distance configurable.

- **Suspensions** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Suspensions.prerequisitesPresent(specializations: any)` | 19 | ✍ Renvoie toujours true : aucune spécialisation prérequise. |
| `Suspensions.initSpecialization()` | 25 | ✍ Enregistre le schéma XML d'un nœud de suspension (node, torse du personnage, poids, limites de rotation/translation, écart de vitesse, paramètres de ressort X/Y/Z, inversion, serveur seul) et vehicle.suspensions#maxUpdateDistance. |
| `Suspensions.registerFunctions(vehicleType: any)` | 53 | ✍ Enregistre loadSuspensionNodeFromXML, getSuspensionNodeFromIndex, getIsSuspensionNodeActive et setSuspensionNodeCharacter. |
| `Suspensions.registerEventListeners(vehicleType: any)` | 62 | ✍ S'abonne à onLoad, onUpdate, onEnterVehicle et onVehicleCharacterChanged. |
| `Suspensions:onLoad(savegame: any)` | 71 | ✍ Client uniquement : charge chaque nœud de suspension (en ignorant ceux marqués serveur seul sur un client pur), lit la distance max de mise à jour et marque les suspensions disponibles. Désactivé avec un avertissement si la plateforme interdit les suspensions. Retire les écouteurs update/enter/character si aucune n'est disponible. |
| `Suspensions:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 114 | ✍ Pour les véhicules dans la distance max de mise à jour, calcule l'accélération du point de référence de chaque nœud puis intègre un ressort/amortisseur par axe avec un pas d'Euler implicite (dt physique sur le serveur, dt de frame sinon), borne aux limites et applique rotation ou translation. |
| `Suspensions:loadSuspensionNodeFromXML(xmlFile: any, key: any, suspensionNode: any)` | 240 | ✍ Remplit une table de nœud de suspension depuis le XML : node et composant parent, poids, limites, paramètres de ressort (multipliés par 1000), indicateurs. Renvoie false si le nœud est inutilisable ou sans limites de rotation ou de translation. |
| `Suspensions:getSuspensionNodeFromIndex(suspensionIndex: any)` | 314 | ✍ Renvoie la table du nœud de suspension à l'index donné, ou nil si aucune suspension n'est disponible. |
| `Suspensions:getIsSuspensionNodeActive(suspensionNode: any)` | 325 | ✍ Renvoie true si le nœud de suspension possède à la fois un node et un composant parent. |
| `Suspensions:setSuspensionNodeCharacter(suspensionNode: any, character: any)` | 331 | ✍ Pour les nœuds utilisant le torse du personnage, pointe le node vers le nœud de suspension troisième personne du modèle de personnage et recalcule son composant parent et son décalage de référence. |
| `Suspensions:onEnterVehicle(isControlling: any)` | 347 | ✍ Quand quelqu'un entre dans le véhicule, associe le personnage du véhicule (s'il existe) à chaque nœud de suspension. |
| `Suspensions:onVehicleCharacterChanged(character: any)` | 361 | ✍ Pour les nœuds de torse du personnage, associe le nouveau personnage ou vide le node quand le personnage est retiré. |
| `Suspensions.subCollisionErrorFunction(collisionNode: any, xmlFile: any, nodeName: any)` | 376 | ✍ Callback de vérification en debug : journalise une erreur XML quand une forme de collision est enfant d'un nœud de suspension, ce qui peut empêcher le véhicule de s'endormir. Référencé seulement dans un bloc debug. |
| `Suspensions:getSuspensionModfier()` | 384 | ✍ Renvoie la translation verticale courante de la suspension du siège (nœud 2 s'il est non rotatif et sans torse, sinon nœud 1), ou 0 si rotatif ou absent. À noter : le nom est orthographié « Modfier » dans la source. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadSuspensionNodeFromXML` | 54 |
| registerFunction | `getSuspensionNodeFromIndex` | 55 |
| registerFunction | `getIsSuspensionNodeActive` | 56 |
| registerFunction | `setSuspensionNodeCharacter` | 57 |
| registerEventListener | `onLoad` | 63 |
| registerEventListener | `onUpdate` | 64 |
| registerEventListener | `onEnterVehicle` | 65 |
| registerEventListener | `onVehicleCharacterChanged` | 66 |

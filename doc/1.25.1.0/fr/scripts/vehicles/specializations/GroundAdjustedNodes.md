# vehicles/specializations/GroundAdjustedNodes.lua

*[English version](../../../../scripts/vehicles/specializations/GroundAdjustedNodes.md)*

Source: `dataS/scripts/vehicles/specializations/GroundAdjustedNodes.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule qui déplace verticalement des nœuds pour qu'ils suivent le sol, par exemple les tuyaux d'un épandeur de lisier. Des raycasts partant de nœuds configurés mesurent la distance au terrain (ou à l'eau), et les nœuds ajustés sont translatés vers ce résultat à vitesse limitée. Elle tourne aussi bien côté client que serveur, ne se met à jour que si le véhicule est proche du joueur et ajoute une légère oscillation au-dessus d'un champ. Configurable via le XML du véhicule et une configuration de la boutique.

- **GroundAdjustedNodes** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `GroundAdjustedNodes.prerequisitesPresent(specializations: any)` | 20 | ✍ Renvoie toujours true : la spécialisation n'a aucun prérequis envers d'autres spécialisations. |
| `GroundAdjustedNodes.initSpecialization()` | 26 | ✍ Enregistre le type de configuration boutique « groundAdjustedNode » et les chemins du schéma XML sous vehicle.groundAdjustedNodes (distances de mise à jour, ajustement à l'eau, masque de collision, option d'activité seulement attelé). Ajoute aussi les attributs de début/fin d'échelle d'ajustement aux parties d'animation. |
| `GroundAdjustedNodes.registerNodeXMLPaths(schema: any, basePath: any)` | 51 | ✍ Enregistre les attributs XML d'une entrée groundAdjustedNode : temps d'activation, décalage Y et nœuds de raycast. Enregistre aussi les attributs des nœuds ajustés, directement sur l'entrée (ancien style) et sur ses enfants adjustNode. |
| `GroundAdjustedNodes.registerAdjustNodeXMLPaths(schema: any, basePath: any)` | 68 | ✍ Enregistre les attributs XML d'un nœud ajusté : nœud, limites minY et maxY, vitesses de déplacement, retour à l'état inactif, seuil de mise à jour, position inactive et option de hauteur inactive moyenne. |
| `GroundAdjustedNodes.registerFunctions(vehicleType: any)` | 83 | ✍ Enregistre sur le type de véhicule les fonctions de la spécialisation (chargeurs XML, initialisation, test d'activité, mises à jour des raycasts et des nœuds). |
| `GroundAdjustedNodes.registerEventListeners(vehicleType: any)` | 95 | ✍ Abonne la spécialisation à onLoad, onLoadFinished, onUpdate et onRegisterAnimationValueTypes. |
| `GroundAdjustedNodes:onLoad(savegame: any)` | 104 | ✍ Lit les réglages globaux et charge chaque groundAdjustedNode, ceux de base comme ceux de la configuration choisie. Si aucun n'est valide, retire les écouteurs de mise à jour, de fin de chargement et d'animation pour économiser du temps. |
| `GroundAdjustedNodes:onLoadFinished(savegame: any)` | 143 | ✍ Calcule l'état actif initial de chaque nœud et, s'il est actif, applique la hauteur ajustée courante aux nœuds qui s'écartent sensiblement de leur position i3d. Marque les outils mobiles comme modifiés si disponible. |
| `GroundAdjustedNodes:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 165 | ✍ À chaque frame, si le véhicule est plus proche que maxUpdateDistance, lance les raycasts puis met à jour chaque nœud ajusté au sol. Rien ne se passe si le véhicule est plus éloigné. |
| `GroundAdjustedNodes:loadGroundAdjustedNodeFromXML(xmlFile: any, key: any, groundAdjustedNode: any)` | 178 | ✍ Charge un groundAdjustedNode : temps d'activation, nœuds ajustés (y compris l'ancienne forme à nœud unique) et nœuds de raycast, avec au plus deux nœuds de raycast. Renvoie true seulement s'il existe au moins un nœud de raycast et un nœud ajusté, sinon journalise un avertissement. |
| `GroundAdjustedNodes:loadGroundAdjustedRaycastNodeFromXML(xmlFile: any, key: any, groundAdjustedNode: any, raycastNode: any)` | 232 | ✍ Charge un nœud de raycast (nœud, distance, décalage Y) et construit son callback de raycast, qui ignore les triggers et mémorise la distance touchée. Réutilise une entrée existante si le même nœud a des réglages identiques et refuse les doublons contradictoires. Renvoie nil en cas d'erreur. |
| `GroundAdjustedNodes:loadGroundAdjustedAdjustNodeFromXML(xmlFile: any, key: any, groundAdjustedNode: any, adjustNode: any, required: any)` | 280 | ✍ Charge un nœud ajusté : mémorise sa translation actuelle, ses limites en Y, ses vitesses de déplacement (converties par milliseconde) et sa hauteur inactive. Renvoie false si le nœud manque, avec un avertissement seulement s'il est obligatoire. |
| `GroundAdjustedNodes:initGroundAdjustedAdjustNode(groundAdjustedNode: any, adjustNode: any)` | 317 | ✍ Quand deux nœuds de raycast sont utilisés, calcule la position relative du nœud ajusté entre eux (alpha) afin d'interpoler les deux hauteurs mesurées. Sans effet avec un seul nœud de raycast. |
| `GroundAdjustedNodes:updateGroundAdjustedRaycasts(dt: any)` | 332 | ✍ Pour chaque nœud de raycast actif, teste si l'endroit est sur un champ via la carte de densité de détail du terrain. Hors champ (ou avec ajustement à l'eau) il lance un raycast vers le bas, sinon il utilise la hauteur du terrain. Mémorise la distance au sol obtenue. |
| `GroundAdjustedNodes:updateGroundAdjustedNode(groundAdjustedNode: any, dt: any)` | 390 | ✍ Met à jour l'état actif et la hauteur cible de chaque nœud ajusté : d'après la distance mesurée au sol, plus une oscillation de bruit sur les champs, bornée par minY et maxY et mélangée à la position inactive selon l'échelle active. Déplace ensuite le nœud vers la cible à la vitesse configurée. |
| `GroundAdjustedNodes:getIsGroundAdjustedNodeActive(groundAdjustedNode: any, ignoreAttachState: any)` | 490 | ✍ Indique si l'ajustement au sol est permis : toujours si l'option onlyActiveWhileAttached est désactivée, ou si le véhicule est attelé à un autre véhicule, ou si le test d'attelage est ignoré. |
| `GroundAdjustedNodes:onRegisterAnimationValueTypes()` | 497 | ✍ Enregistre le type de valeur d'animation « groundAdjustScale », qui permet à une animation de piloter l'échelle active du groundAdjustedNode possédant un nœud donné. Avertit et renvoie 0 si aucun groundAdjustedNode correspondant n'est trouvé. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadGroundAdjustedNodeFromXML` | 84 |
| registerFunction | `loadGroundAdjustedAdjustNodeFromXML` | 85 |
| registerFunction | `initGroundAdjustedAdjustNode` | 86 |
| registerFunction | `loadGroundAdjustedRaycastNodeFromXML` | 87 |
| registerFunction | `getIsGroundAdjustedNodeActive` | 88 |
| registerFunction | `updateGroundAdjustedRaycasts` | 89 |
| registerFunction | `updateGroundAdjustedNode` | 90 |
| registerEventListener | `onLoad` | 96 |
| registerEventListener | `onLoadFinished` | 97 |
| registerEventListener | `onUpdate` | 98 |
| registerEventListener | `onRegisterAnimationValueTypes` | 99 |

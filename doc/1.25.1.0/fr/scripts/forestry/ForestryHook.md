# forestry/ForestryHook.lua

*[English version](../../../scripts/forestry/ForestryHook.md)*

Source: `dataS/scripts/forestry/ForestryHook.lua` — FS25 1.25.1.0

✍ Classe simple (pas une spécialisation) représentant un crochet d'arbre, la pièce que la corde forestière tire et fixe autour d'un arbre. Elle charge un XML de crochet et un i3d partagé, lie le nœud du crochet sous un véhicule ou un autre nœud, oriente des articulations configurées vers une cible, et peut se monter sur un arbre en créant une forme de sangle de tension. Utilisée avec les classes de corde forestière ; les méthodes getBeltSpacing et updateDynamicSpacingNodes sont appelées ici mais ne sont pas définies dans ce fichier (origine NON VÉRIFIÉE).

- **ForestryHook** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ForestryHook.new(vehicle: any, linkNode: any, customMt: any)` | 17 | ✍ Constructeur. Mémorise le véhicule propriétaire (peut être nil) et le nœud de liaison, puis initialise position, rotation, visibilité, état de cible et tables vides de sous-cibles et de nœuds de rotation. |
| `ForestryHook.registerXMLPaths(schema: any, baseKey: any)` | 40 | ✍ Déclare la clé XML #filename (chemin du XML du crochet, par défaut treeHook01.xml dans les données forestières partagées) sous la clé de base fournie. |
| `ForestryHook:isValid()` | 46 | ✍ Retourne true une fois qu'un nom de fichier i3d a été résolu depuis le XML du crochet, c'est-à-dire que la définition du crochet a été trouvée. |
| `ForestryHook:loadFromXML(xmlFile: any, key: any, baseDirectory: any)` | 52 | ✍ Lit le nom du XML du crochet, charge ce XML et le chemin de l'i3d, puis lance un chargement i3d partagé asynchrone via le véhicule s'il existe, sinon via g_i3DManager. onI3DLoaded termine l'initialisation. |
| `ForestryHook:loadFromConfigXML(xmlFile: any)` | 74 | ✍ Analyse le XML du crochet : nœuds de rotation avec limites d'axes et indicateurs d'alignement, nœuds cibles de corde (le premier devient la cible principale), paramètres de sangle d'arbre (décalage, écart vertical max, espacement, type via g_tensionBeltManager) et espacement dynamique optionnel avec nœuds d'ajustement. |
| `ForestryHook:clone()` | 140 | ✍ Crée un nouveau crochet avec les mêmes véhicule, nœud de liaison et fichiers, en rechargeant l'i3d partagé déjà en cache de façon synchrone. Retourne le clone, ou rien si le crochet n'a pas de fichier i3d. |
| `ForestryHook:delete()` | 156 | ✍ Retire le crochet des éléments mis à jour de la mission, supprime le nœud du crochet (s'il existe encore) et libère l'i3d partagé, supprime la forme de sangle et réactive le balancement au vent d'un arbre encore statique sur lequel il était monté. |
| `ForestryHook:update(dt: any)` | 184 | ✍ Met à jour la position de la cible et, si elle est valide, oriente chaque nœud de rotation vers la cible (ou la moyenne de ses sous-cibles), par angles Y/X bornés ou par direction complète. Se désinscrit des mises à jour si le nœud du crochet n'existe plus. |
| `ForestryHook:setTargetNode(nodeId: any, isActiveDirty: any)` | 246 | ✍ Définit le nœud que le crochet doit viser et fait une mise à jour immédiate. Si isActiveDirty est true et le nœud valide, le crochet est inscrit aux mises à jour continues, sinon il en est retiré. |
| `ForestryHook:setTargetPosition(x: any, y: any, z: any)` | 265 | ✍ Définit une position monde fixe comme cible, la marque valide et l'applique par une mise à jour immédiate. |
| `ForestryHook:setSubTargetNode(nodeId: any, index: any)` | 273 | ✍ Mémorise un nœud de sous-cible à l'index donné ; les nœuds de rotation ayant des targetIndices visent la moyenne des sous-cibles qu'ils référencent. |
| `ForestryHook:resetSubTargetNodes()` | 279 | ✍ Efface tous les nœuds de sous-cible mémorisés. |
| `ForestryHook:link(node: any, x: any, y: any, z: any, rx: any, ry: any, rz: any)` | 287 | ✍ Change le nœud de liaison et, au besoin, la position et la rotation locales (les valeurs nil conservent les précédentes). Si le nœud du crochet est chargé, il est relié de nouveau, affiché ou masqué selon la visibilité, et repositionné. |
| `ForestryHook:setPositionAndDirection(x: any, y: any, z: any, dx: any, dz: any)` | 302 | ✍ Convertit une position monde et une direction horizontale (dx, dz) dans l'espace local du nœud de liaison, les mémorise et les applique au nœud du crochet s'il est chargé. |
| `ForestryHook:mountToTree(splitShapeId: any, x: any, y: any, z: any, maxRadius: any, tx: any, ty: any, tz: any)` | 345 | ✍ Fixe le crochet autour d'un arbre près du point donné. Calcule la position décalée sur l'arbre (retourne nil s'il n'y en a pas), construit une sangle de tension liée à l'arbre, y relie le crochet et remplace l'éventuelle sangle précédente. Retourne le centre x, y, z. Sur un arbre statique non coupé, désactive aussi le balancement au vent. |
| `ForestryHook:setVisibility(visibility: any)` | 387 | ✍ Mémorise l'indicateur de visibilité et l'applique au nœud du crochet s'il est chargé. |
| `ForestryHook:getRopeTargetPosition()` | 396 | ✍ Retourne la position monde du nœud cible principal de la corde, ou 0, 0, 0 s'il n'y en a pas ou s'il n'existe plus. |
| `ForestryHook:getRopeTarget()` | 406 | ✍ Retourne le nœud auquel une corde doit s'attacher : la cible principale de corde, sinon le nœud du crochet, sinon le nœud de liaison. |
| `ForestryHook:getRopeTargets()` | 412 | ✍ Retourne la liste de tous les nœuds cibles de corde lus dans le XML du crochet (des entrées peuvent être nil si un nœud n'a pas été trouvé). |
| `ForestryHook:onI3DLoaded(i3dNode: any, failedReason: any)` | 418 | ✍ Rappel du chargement de l'i3d partagé. En cas de succès, prend le premier enfant comme nœud du crochet, le lie et le positionne, analyse le XML de configuration, le libère, lance une mise à jour et supprime la racine i3d temporaire. Ne fait rien si le chargement a échoué. |

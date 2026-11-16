# vehicles/specializations/FillVolume.lua

*[English version](../../../../scripts/vehicles/specializations/FillVolume.md)*

Source: `dataS/scripts/vehicles/specializations/FillVolume.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule qui affiche le contenu d'une FillUnit sous forme de tas 3D visible et déformable (forme de plan de remplissage) dans les remorques, trémies et réservoirs similaires. Elle requiert FillUnit, lit la configuration fillVolume du XML (volumes, nœuds d'info de chargement et de déchargement, nœuds de hauteur, nœuds déformateurs), crée des formes de plan de remplissage du moteur et y ajoute de la matière à chaque changement de niveau d'unité. Elle gère aussi la mise à l'échelle et le déplacement de nœuds selon la hauteur, les déformateurs déplacés par des outils mobiles, et synchronise la dernière position de remplissage vers les clients. Les formes et mises à jour visuelles concernent surtout le client, mais la position de remplissage est envoyée par le serveur.

- **FillVolume** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FillVolume.prerequisitesPresent(specializations: any)` | 31 | ✍ Retourne true seulement si le type de véhicule possède aussi la spécialisation FillUnit. |
| `FillVolume.initSpecialization()` | 37 | ✍ Enregistre la configuration de véhicule fillVolume et le schéma XML des volumes (nœud, index et facteur d'unité, limites de tas, nœuds déformateurs), des nœuds d'info de chargement et déchargement, des nœuds de hauteur, et des extras fillVolume sur les outils et pièces mobiles. |
| `FillVolume.registerInfoNodeXMLPaths(schema: any, basePath: any)` | 94 | ✍ Enregistre les attributs XML d'une liste de nœuds d'info (nœud, largeur, longueur, index de hauteur, priorité, hauteur ou pourcentage min et max, début et fin de translation), partagés par chargement et déchargement. |
| `FillVolume.registerFunctions(vehicleType: any)` | 111 | ✍ Enregistre sur le type de véhicule les fonctions de volume : chargeurs, accès aux infos de chargement et déchargement, recherche d'index de volume, forçage du type et vitesse de défilement UV. |
| `FillVolume.registerOverwrittenFunctions(vehicleType: any)` | 125 | ✍ Surcharge setMovingToolDirty, loadExtraDependentParts et updateExtraDependentParts pour que les outils et pièces mobiles puissent marquer les nœuds déformateurs comme modifiés. |
| `FillVolume.registerEventListeners(vehicleType: any)` | 133 | ✍ S'abonne aux événements de chargement, suppression, flux de mise à jour en lecture et écriture, update, et onFillUnitFillLevelChanged. |
| `FillVolume:onLoad(savegame: any)` | 144 | ✍ Charge les volumes configurés, normalise les facteurs d'unité, crée une forme de plan par volume (avec matériau et tableaux de textures, en mesurant le décalage de hauteur de base), trouve les polylignes des déformateurs, puis charge les infos de chargement, déchargement et hauteur. Retire l'écouteur update côté serveur ou si rien n'est configuré. |
| `FillVolume:onDelete()` | 252 | ✍ Supprime les formes de plan de remplissage créées pour chaque volume du moteur et efface les références. |
| `FillVolume:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 266 | ✍ Côté client : si l'indicateur est actif, lit la dernière position de remplissage compressée (deux valeurs) envoyée par le serveur. |
| `FillVolume:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 279 | ✍ Côté serveur : si le drapeau dirty est actif, écrit aux clients la dernière position de remplissage envoyée (deux valeurs compressées). |
| `FillVolume:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 292 | ✍ Client uniquement. Applique les translations de déformateurs en attente aux polylignes de la forme, fait défiler le décalage UV via getFillVolumeUVScrollSpeed, et recalcule les valeurs des nœuds de hauteur en échantillonnant le tas aux nœuds de référence puis en mettant à l'échelle, déplaçant ou orientant les nœuds liés. |
| `FillVolume:loadFillVolume(xmlFile: any, key: any, entry: any)` | 433 | ✍ Lit un volume : nœud (doit être une forme), fillUnitIndex valide obligatoire, facteur, options de plans latéraux et de tas, types par défaut et forcé, limites de pente et d'erreur, nœuds déformateurs. Retourne false si les données sont invalides. À noter : l'angle physique maximal est fixé à 35 degrés au chargement. |
| `FillVolume:loadFillVolumeInfo(xmlFile: any, key: any, entry: any)` | 532 | ✍ Lit une liste de nœuds d'info de position de remplissage (nœud, largeur, longueur, conditions de hauteur et de pourcentage, plage de translation) et les trie par priorité décroissante. Retourne toujours true. |
| `FillVolume:loadFillVolumeHeightNode(xmlFile: any, key: any, entry: any)` | 578 | ✍ Lit un nœud de hauteur : index de volume obligatoire (échec s'il n'existe pas), nœuds de référence échantillonnés pour la hauteur, et nœuds affectés avec axes d'échelle et de translation, maxima, décalage et option d'orientation. |
| `FillVolume:getFillVolumeLoadInfo(loadInfoIndex: any)` | 644 | ✍ Retourne l'entrée d'info de chargement (liste de nœuds de position de remplissage) à l'index donné, ou nil. |
| `FillVolume:getFillVolumeUnloadInfo(unloadInfoIndex: any)` | 651 | ✍ Retourne l'entrée d'info de déchargement à l'index donné, ou nil. |
| `FillVolume:getFillVolumeIndicesByFillUnitIndex(fillUnitIndex: any)` | 658 | ✍ Retourne un tableau des index de tous les volumes rattachés à l'index d'unité donné (éventuellement vide). |
| `FillVolume:setFillVolumeForcedFillTypeByFillUnitIndex(fillUnitIndex: any, forcedFillType: any)` | 672 | ✍ Force le type de remplissage affiché sur chaque volume lié à l'unité donnée. |
| `FillVolume:setFillVolumeForcedFillType(fillVolumeIndex: any, forcedFillType: any)` | 683 | ✍ Définit un type d'affichage forcé sur un volume ; il est utilisé au prochain changement de niveau et effacé quand l'unité devient vide. |
| `FillVolume:getFillVolumeUVScrollSpeed()` | 692 | ✍ Point d'extension retournant 0, 0, 0 (pas de défilement de texture) ; d'autres spécialisations peuvent le surcharger pour animer la surface du tas. |
| `FillVolume:setMovingToolDirty(superFunc: function, node: integer, forceUpdate: boolean, dt: number)` | 702 | ✍ Surcharge le parent : après son appel, marque comme modifié le déformateur lié à ce nœud d'outil mobile pour déformer le tas à la prochaine mise à jour. |
| `FillVolume:loadExtraDependentParts(superFunc: any, xmlFile: any, baseName: any, entry: any)` | 716 | ✍ Surcharge le parent : après son succès, lit fillVolumeIndex et deformerNodeIndices d'une pièce ou d'un outil mobile. Retourne false si le parent échoue. |
| `FillVolume:updateExtraDependentParts(superFunc: any, part: any, dt: any)` | 738 | ✍ Surcharge le parent : résout une fois le volume référencé (avertissement et abandon du lien s'il n'existe pas), puis marque les déformateurs listés comme modifiés. |
| `FillVolume:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, _: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 767 | ✍ Gestionnaire central : synchronise chaque volume lié avec le niveau de l'unité, règle angle de surface et texture selon le type, affiche ou masque la forme, et ajoute ou retire de la matière à la position de chargement (meilleur nœud d'info, ou position par défaut côté client). Peut envoyer la position et marque nœuds de hauteur et déformateurs comme modifiés. |
| `FillVolume:updateDebugValues(values: any)` | 962 | ✍ Ajoute des lignes de débogage (index d'unité et de volume, dernier type, identifiant de forme, visibilité, index de texture, dernières positions de remplissage) à la liste fournie pour l'affichage de débogage du véhicule. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadFillVolume` | 112 |
| registerFunction | `loadFillVolumeInfo` | 113 |
| registerFunction | `loadFillVolumeHeightNode` | 114 |
| registerFunction | `getFillVolumeLoadInfo` | 115 |
| registerFunction | `getFillVolumeUnloadInfo` | 116 |
| registerFunction | `getFillVolumeIndicesByFillUnitIndex` | 117 |
| registerFunction | `setFillVolumeForcedFillTypeByFillUnitIndex` | 118 |
| registerFunction | `setFillVolumeForcedFillType` | 119 |
| registerFunction | `getFillVolumeUVScrollSpeed` | 120 |
| registerOverwrittenFunction | `setMovingToolDirty` | 126 |
| registerOverwrittenFunction | `loadExtraDependentParts` | 127 |
| registerOverwrittenFunction | `updateExtraDependentParts` | 128 |
| registerEventListener | `onLoad` | 134 |
| registerEventListener | `onDelete` | 135 |
| registerEventListener | `onReadUpdateStream` | 136 |
| registerEventListener | `onWriteUpdateStream` | 137 |
| registerEventListener | `onUpdate` | 138 |
| registerEventListener | `onFillUnitFillLevelChanged` | 139 |

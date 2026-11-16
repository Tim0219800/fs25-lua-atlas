# vehicles/specializations/TreeSaplingPallet.lua

*[English version](../../../../scripts/vehicles/specializations/TreeSaplingPallet.md)*

Source: `dataS/scripts/vehicles/specializations/TreeSaplingPallet.lua` — FS25 1.25.1.0

✍ Spécialisation des palettes de plants. Elle mémorise le type d'arbre et la variation portés par la palette, charge le modèle I3D de plant correspondant et le clone sur les nœuds de plants, puis affiche ou masque ces nœuds selon le niveau de remplissage. TreePlanter lit et écrit ce type via `getTreeSaplingPalletType` et `setTreeSaplingPalletType`. Elle n'a aucun prérequis et ajoute une configuration véhicule `treeSaplingType`.

- **TreeSaplingPallet** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TreeSaplingPallet.prerequisitesPresent(specializations: any)` | 15 | ✍ Renvoie toujours true : aucune autre spécialisation n'est requise. |
| `TreeSaplingPallet.initSpecialization()` | 21 | ✍ Enregistre le type de configuration `treeSaplingType` et les clés XML `vehicle.treeSaplingPallet` (index du fill unit, type d'arbre, variation, fichier I3D personnalisé, nœuds de plants, nœuds par configuration), ainsi que les clés de sauvegarde du type et de la variation. |
| `TreeSaplingPallet.registerFunctions(vehicleType: any)` | 46 | ✍ Enregistre le callback de chargement du plant, l'accesseur et le mutateur du type d'arbre, et les deux fonctions de mise à jour visuelle. |
| `TreeSaplingPallet.registerOverwrittenFunctions(vehicleType: any)` | 56 | ✍ Enregistre une surcharge de `showInfo`. |
| `TreeSaplingPallet.registerEventListeners(vehicleType: any)` | 62 | ✍ S'abonne à onLoad, onDelete et onFillUnitFillLevelChanged. |
| `TreeSaplingPallet:onLoad(savegame: any)` | 70 | ✍ Détermine le type d'arbre, la variation, le fill unit et le fichier I3D depuis le XML, l'élément de configuration choisi et la sauvegarde, trouve le fichier du plant via le gestionnaire de plantation, collecte les nœuds de plants (rotation et échelle aléatoires en option) et lance le chargement visuel. À noter : le type par défaut dans le code est "spruce" alors que le schéma indique "spruce1". |
| `TreeSaplingPallet:onDelete()` | 148 | ✍ Libère la requête I3D partagée du plant et supprime les formes de plants clonées. |
| `TreeSaplingPallet:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 168 | ✍ Sauvegarde le nom du type d'arbre et celui de la variation courants. |
| `TreeSaplingPallet:getTreeSaplingPalletType() → string` | 182 | ✍ Renvoie le nom du type d'arbre et celui de la variation courants (deux valeurs). |
| `TreeSaplingPallet:setTreeSaplingPalletType(treeTypeName: any, variationName: any) → string` | 190 | ✍ Mémorise un nouveau type d'arbre et une nouvelle variation et recharge les visuels si l'un des deux change. Contrairement à `onLoad`, elle ne cherche pas de nouveau fichier I3D : le fichier utilisé reste celui résolu au chargement. |
| `TreeSaplingPallet:updateTreeSaplingVisuals() → string` | 201 | ✍ Libère la requête I3D partagée précédente et lance le chargement du fichier de plant, comme sous-fichier pendant le chargement du véhicule ou de façon asynchrone ensuite. |
| `TreeSaplingPallet:onTreeSaplingLoaded(i3dNode: any, failedReason: any, args: any) → integer, table` | 222 | ✍ Callback de chargement : clone la forme de plant chargée sur chaque nœud de plants (en remplaçant les clones précédents), supprime la racine I3D chargée et rafraîchit la visibilité des nœuds. |
| `TreeSaplingPallet:updateTreeSaplingPalletNodes()` | 244 | ✍ Affiche autant de nœuds de plants que le niveau arrondi et règle le paramètre de shader `hideByIndex` à capacité moins niveau. |
| `TreeSaplingPallet:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillTypeIndex: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 259 | ✍ Rafraîchit la visibilité des nœuds de plants à chaque changement de niveau d'un fill unit. |
| `TreeSaplingPallet:showInfo(superFunc: any, box: any)` | 265 | ✍ Surcharge : ajoute une ligne de type d'arbre à la boîte d'info si une description du type a été trouvée, puis appelle le parent. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `onTreeSaplingLoaded` | 47 |
| registerFunction | `getTreeSaplingPalletType` | 48 |
| registerFunction | `setTreeSaplingPalletType` | 49 |
| registerFunction | `updateTreeSaplingVisuals` | 50 |
| registerFunction | `updateTreeSaplingPalletNodes` | 51 |
| registerOverwrittenFunction | `showInfo` | 57 |
| registerEventListener | `onLoad` | 63 |
| registerEventListener | `onDelete` | 64 |
| registerEventListener | `onFillUnitFillLevelChanged` | 65 |

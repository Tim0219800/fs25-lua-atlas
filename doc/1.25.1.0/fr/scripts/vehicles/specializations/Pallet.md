# vehicles/specializations/Pallet.lua

*[English version](../../../../scripts/vehicles/specializations/Pallet.md)*

Source: `dataS/scripts/vehicles/specializations/Pallet.lua` — FS25 1.25.1.0

✍ Spécialisation des palettes et big bags dont le contenu visible suit une unité de remplissage. Aucun prérequis. Elle marque le véhicule comme palette sans saisie du joueur, affiche ou masque des objets de contenu selon le pourcentage de remplissage, fournit les nœuds de maillage pour les sangles, peut mélanger des textures selon l'âge et compte dans la limite d'emplacements de palettes. Elle sert aussi de cargaison chargeable automatiquement.

- **Pallet** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Pallet.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Retourne toujours true : aucune autre spécialisation n'est requise. |
| `Pallet.initSpecialization()` | 23 | ✍ Enregistre les chemins XML sous vehicle.pallet (unité de remplissage, nœud de forme, nœuds de lien, fichier i3d, textures, objets de contenu, sangles, son de déchargement) et l'âge de palette sauvegardé. |
| `Pallet.registerFunctions(vehicleType: any)` | 54 | ✍ Enregistre cinq fonctions de véhicule. À noter : onPalletI3DFileLoaded et updatePalletStraps sont enregistrées depuis Pallet mais aucune fonction de ce nom n'est définie dans ce fichier, donc ces entrées sont nil. |
| `Pallet.registerOverwrittenFunctions(vehicleType: any)` | 64 | ✍ Surcharge getMeshNodes, loadComponentFromXML, la taille et le chargement automatique, les indicateurs d'aperçu et de réinitialisation, la visibilité du hotspot de carte et le vidage à la réinitialisation. |
| `Pallet.registerEventListeners(vehicleType: any)` | 77 | ✍ S'abonne aux événements de pré-chargement, chargement, post-chargement, suppression et changement de niveau de remplissage. |
| `Pallet:onPreLoad(savegame: any)` | 87 | ✍ Met isPallet à true et désactive la saisie du joueur sur le véhicule. |
| `Pallet:onLoad(savegame: table)` | 95 | ✍ Lit le XML : valide le nœud de forme, charge éventuellement un i3d de palette partagé dans les nœuds de lien, collecte textures, âge de palette (aléatoire hors config boutique), objets de contenu (masqués au départ), sangles et son de déchargement. S'enregistre dans la limite d'emplacements de palettes et fixe les limites de joint de fourche. |
| `Pallet:onPostLoad(savegame: any)` | 227 | ✍ Si des textures sont définies, applique une texture diffuse au nœud de la palette, ou mélange deux textures selon l'âge via une carte personnalisée et un paramètre blendScale. |
| `Pallet:onDelete()` | 255 | ✍ Supprime les échantillons sonores côté client, libère la requête i3d partagée et retire la palette de la limite d'emplacements. |
| `Pallet:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 271 | ✍ Sauvegarde l'âge de la palette. |
| `Pallet:loadComponentFromXML(superFunc: any, component: any, xmlFile: any, key: any, rootPosition: any, i: any)` | 278 | ✍ Si la plateforme n'a pas de palettes dynamiques, transforme un composant dynamique en corps rigide cinématique, puis appelle le parent. |
| `Pallet:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillType: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 290 | ✍ Affiche les objets de contenu proportionnellement au pourcentage de remplissage (au moins un si non vide), joue le son de déchargement quand un objet disparaît et marque les nœuds de sangle comme à recalculer. |
| `Pallet:getMeshNodes(superFunc: any)` | 326 | ✍ Reconstruit la liste en cache des maillages de sangle si elle est périmée et la retourne si elle n'est pas vide ; sinon délègue au parent. |
| `Pallet:collectPalletTensionBeltNodes(nodes: any)` | 343 | ✍ Ajoute à la table fournie les nœuds de sangle de base, les objets de contenu visibles utilisables comme maillage de sangle, et les nœuds supplémentaires de la spec d'objet à sangle s'il y en a. |
| `Pallet:setPalletTensionBeltNodesDirty()` | 371 | ✍ Marque la liste en cache des maillages de sangle comme périmée. |
| `Pallet:getInfoBoxTitle()` | 463 | ✍ Retourne le titre localisé de palette pour la boîte d'information. |
| `Pallet:getAutoLoadSize(superFunc: any)` | 469 | ✍ Retourne longueur, hauteur et largeur du véhicule en x, y, z, en échangeant longueur et largeur car les palettes sont chargées tournées de 90 degrés. |
| `Pallet:autoLoad(superFunc: any, autoLoader: any, node: any, posX: any, posZ: any, sizeX: any, sizeZ: any)` | 481 | ✍ Monte la palette de façon cinématique sur le nœud du chargeur automatique, au centre de la cellule et tournée de 90 degrés autour de Y, et retourne toujours true. |
| `Pallet:getShowInVehiclesOverview(superFunc: any)` | 496 | ✍ Toujours false : les palettes ne figurent pas dans l'aperçu des véhicules. |
| `Pallet:getCanBeReset(superFunc: any)` | 502 | ✍ Toujours false : les palettes ne peuvent pas être réinitialisées. |
| `Pallet:getIsMapHotspotVisible(superFunc: any)` | 508 | ✍ Toujours false : les palettes n'ont pas de hotspot de carte visible. |
| `Pallet:getFillUnitEmptyOnReset(superFunc: any)` | 514 | ✍ Toujours false : l'unité de remplissage n'est pas vidée à la réinitialisation. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `onPalletI3DFileLoaded` | 55 |
| registerFunction | `getInfoBoxTitle` | 56 |
| registerFunction | `collectPalletTensionBeltNodes` | 57 |
| registerFunction | `setPalletTensionBeltNodesDirty` | 58 |
| registerFunction | `updatePalletStraps` | 59 |
| registerOverwrittenFunction | `getMeshNodes` | 65 |
| registerOverwrittenFunction | `loadComponentFromXML` | 66 |
| registerOverwrittenFunction | `getAutoLoadSize` | 67 |
| registerOverwrittenFunction | `autoLoad` | 68 |
| registerOverwrittenFunction | `getShowInVehiclesOverview` | 69 |
| registerOverwrittenFunction | `getCanBeReset` | 70 |
| registerOverwrittenFunction | `getIsMapHotspotVisible` | 71 |
| registerOverwrittenFunction | `getFillUnitEmptyOnReset` | 72 |
| registerEventListener | `onPreLoad` | 78 |
| registerEventListener | `onLoad` | 79 |
| registerEventListener | `onPostLoad` | 80 |
| registerEventListener | `onDelete` | 81 |
| registerEventListener | `onFillUnitFillLevelChanged` | 82 |

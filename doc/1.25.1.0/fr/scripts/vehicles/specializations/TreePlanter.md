# vehicles/specializations/TreePlanter.lua

*[English version](../../../../scripts/vehicles/specializations/TreePlanter.md)*

Source: `dataS/scripts/vehicles/specializations/TreePlanter.lua` — FS25 1.25.1.0

✍ Spécialisation des machines de plantation d'arbres. Elle monte une palette de plants (détectée par un trigger de palettes) et l'utilise comme contenu du fill unit, puis plante des arbres du type choisi, soit automatiquement en roulant (espacement `minDistance`), soit par une action d'entrée manuelle. Pour les types de remplissage qui ne sont pas des plants, elle retombe sur une routine de semis/travail du sol sur les density maps. Elle exige TurnOnVehicle, FillUnit et GroundReference ; le serveur plante, les clients gèrent son, animations et avertissements. Le fichier définit aussi la classe auxiliaire TreePlanterActivatable.

- **TreePlanter** (l.16)
- **TreePlanterActivatable** (l.1396)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TreePlanter.prerequisitesPresent(specializations: table) → boolean` | 38 | ✍ Renvoie true seulement si le type de véhicule possède les spécialisations TurnOnVehicle, FillUnit et GroundReference. |
| `TreePlanter.initSpecialization()` | 46 | ✍ Enregistre le schéma XML `vehicle.treePlanter` (action d'entrée, nœud, distance minimale, trigger de palettes, référence au sol, nœuds de saisie/montage, fill unit, nœuds de plants, animations de plantation et de magasin, sons, nœuds d'animation) et les clés de sauvegarde (dernière position d'arbre, palette montée, type d'arbre). |
| `TreePlanter.registerFunctions(vehicleType: any)` | 84 | ✍ Enregistre les fonctions véhicule de la spécialisation (retrait de l'objet monté, limite au champ, création d'arbre, chargement de palette et callback du trigger, choix du type d'arbre, visuels des plants, mise à jour du remplissage). |
| `TreePlanter.registerOverwrittenFunctions(vehicleType: any)` | 99 | ✍ Enregistre des surcharges des multiplicateurs de salissure/usure, des pièces rotatives, de la zone de travail, de la limite de vitesse, de la sélection, du test de champ, des accesseurs de fill unit (redirigés vers la palette montée), des requêtes d'objet monté et de palette à décharger, et de la direction automatique. |
| `TreePlanter.registerEventListeners(vehicleType: any)` | 125 | ✍ Abonne la spécialisation au chargement/suppression, aux flux et flux de mise à jour, à update, update tick, draw, aux événements d'action, à la mise en marche/arrêt et aux événements du fill unit (remplissage, niveau, décharge de palette). |
| `TreePlanter:onLoad(savegame: table)` | 146 | ✍ Charge le XML `treePlanter` (nœuds, trigger de palettes, référence au sol, nœuds de plants, animations, portée de montage, fill unit), crée l'activatable, enregistre les exigences de sol de l'IA et restaure depuis la sauvegarde la dernière position d'arbre, le drapeau de palette montée et le type d'arbre. |
| `TreePlanter:onDelete()` | 252 | ✍ Libère les sons et nœuds d'animation, retire l'activatable et le trigger de palettes, démonte la palette et libère le fichier I3D partagé des plants. |
| `TreePlanter:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 281 | ✍ Sauvegarde la dernière position d'arbre, la présence d'une palette montée, ainsi que les noms du type d'arbre et de la variation courants. |
| `TreePlanter:removeMountedObject(object: integer, isDeleting: boolean)` | 307 | ✍ Démonte et oublie la palette de plants si c'est l'objet indiqué. |
| `TreePlanter:onReadStream(streamId: integer, connection: Connection)` | 320 | ✍ Côté client à la connexion : lit l'identifiant de la palette montée, le type d'arbre et la variation courants, et la dernière position d'arbre. |
| `TreePlanter:onWriteStream(streamId: integer, connection: Connection)` | 347 | ✍ Côté serveur à la connexion : écrit l'identifiant de la palette montée, le type et la variation d'arbre, et la dernière position d'arbre compressée. |
| `TreePlanter:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 374 | ✍ Client uniquement : lit le contact au sol et les indicateurs d'avertissement (terrain non possédé, zone interdite) quand le bit dirty est activé. |
| `TreePlanter:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 390 | ✍ Serveur uniquement : écrit le contact au sol et les deux indicateurs d'avertissement quand le drapeau dirty de la spécialisation est activé. |
| `TreePlanter:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 406 | ✍ Monte une palette une fois synchronisée (depuis un identifiant reçu ou un drapeau sauvegardé), adopte son type d'arbre côté serveur, gère l'activatable de rechargement côté client selon la palette valide la plus proche, et garde la palette montée active ou l'oublie si elle est supprimée. |
| `TreePlanter:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 469 | ✍ Boucle de travail principale. Serveur : met à jour le contact au sol, arrête l'IA sans palette, plante des arbres selon la distance pour le type plants, sinon travaille et sème la zone avec consommation de semences, statistiques et coût. Vérifie l'accès à la ferme, les zones interdites et la période de plantation. Client : son de travail et état des actions de limite au champ et de plantation manuelle. |
| `TreePlanter:onDraw(isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 673 | ✍ Affiche des textes d'aide (remplir d'abord l'outil, type d'arbre) et des avertissements clignotants : pas d'accès au terrain, zone interdite, trop d'arbres, ou type de culture non plantable à la période courante. |
| `TreePlanter:onTurnedOn()` | 708 | ✍ Client uniquement : démarre les nœuds d'animation. |
| `TreePlanter:onTurnedOff()` | 718 | ✍ Client uniquement : arrête les nœuds d'animation et les sons de travail. |
| `TreePlanter:onFillUnitIsFillingStateChanged(isFilling: any)` | 729 | ✍ Serveur uniquement : au début d'un remplissage depuis une source exposant un type de palette de plants, adopte ce type d'arbre et cette variation. |
| `TreePlanter:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillTypeIndex: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 747 | ✍ Rafraîchit les visuels de plants et l'animation du magasin quand le fill unit de la planteuse change. |
| `TreePlanter:onFillUnitUnloadPallet(pallet: any)` | 755 | ✍ Recopie le type d'arbre courant sur la palette déchargée si elle le supporte, et oublie la palette montée si c'est celle-ci. |
| `TreePlanter:addFillUnitFillLevel(superFunc: any, farmId: any, fillUnitIndex: any, fillLevelDelta: any, fillTypeIndex: any, toolType: any, fillPositionData: any)` | 769 | ✍ Surcharge : avec une palette montée, la variation est appliquée au fill unit de la palette. À noter : le test de type interroge la palette avec le `fillUnitIndex` de la planteuse et non son propre index, ce qui ressemble à un bug. |
| `TreePlanter:getFillUnitFillLevel(superFunc: any, fillUnitIndex: any)` | 788 | ✍ Surcharge : avec une palette montée, renvoie la somme des niveaux de ses fill units au lieu du niveau propre de la planteuse. |
| `TreePlanter:getFillUnitFillLevelPercentage(superFunc: any, fillUnitIndex: any)` | 808 | ✍ Surcharge : avec une palette montée, renvoie le niveau divisé par la capacité cumulée. |
| `TreePlanter:getFillUnitFillType(superFunc: any, fillUnitIndex: any)` | 826 | ✍ Surcharge : avec une palette montée, renvoie le type de remplissage de son premier fill unit non vide. |
| `TreePlanter:getFillUnitCapacity(superFunc: any, fillUnitIndex: any)` | 845 | ✍ Surcharge : avec une palette montée, renvoie la capacité cumulée des fill units de la palette. |
| `TreePlanter:getFillUnitAllowsFillType(superFunc: any, fillUnitIndex: any, fillType: any)` | 865 | ✍ Surcharge : refuse tout type de remplissage pour le fill unit de la planteuse tant qu'une palette est montée. |
| `TreePlanter:getFillUnitFreeCapacity(superFunc: any, fillUnitIndex: any, fillTypeIndex: any, farmId: any)` | 879 | ✍ Surcharge : renvoie une capacité libre de 0 tant qu'une palette est montée. |
| `TreePlanter:getFillLevelInformation(superFunc: any, display: any)` | 893 | ✍ Surcharge : si une palette est montée, ajoute son type, son niveau et sa capacité à l'affichage HUD avant d'appeler le parent. |
| `TreePlanter:getHasObjectMounted(superFunc: table, object: table) → boolean` | 912 | ✍ Surcharge : renvoie aussi true si l'objet est la palette montée ou est monté sur elle. |
| `TreePlanter:getFillUnitUnloadPalletFilename(superFunc: any, fillUnitIndex: any)` | 935 | ✍ Surcharge : sans palette montée et avec un type d'arbre connu, renvoie le fichier d'objet de boutique de la palette de plants correspondante ; sinon ne renvoie rien. |
| `TreePlanter:getFillUnitHasMountedPalletsToUnload(superFunc: any)` | 946 | ✍ Surcharge : renvoie true quand une palette de plants est montée. |
| `TreePlanter:getFillUnitMountedPalletsToUnload(superFunc: any)` | 952 | ✍ Surcharge : renvoie une table contenant la palette montée (entrée nil s'il n'y en a pas). |
| `TreePlanter:getImplementAllowAutomaticSteering(superFunc: any)` | 958 | ✍ Surcharge qui renvoie toujours true : la direction automatique est autorisée. |
| `TreePlanter:getCanPlantOutsideSeason()` | 964 | ✍ Renvoie false par défaut : planter hors période de plantation n'est pas permis (point d'extension que d'autres codes peuvent surcharger). |
| `TreePlanter:setTreePlanterTreeTypeIndex(treeTypeIndex: any, treeVariationIndex: any, noEventSend: any)` | 970 | ✍ Définit le type d'arbre et la variation courants, met à jour le texte d'info, recharge l'I3D de plant affiché sur les nœuds et envoie TreePlanterTreeTypeEvent sauf si `noEventSend`. |
| `TreePlanter:onTreePlanterSaplingLoaded(i3dNode: any, failedReason: any, args: any) → integer, table` | 1011 | ✍ Callback asynchrone : clone le plant chargé sur chaque nœud de plants, rafraîchit les visuels de remplissage et supprime la racine I3D chargée. |
| `TreePlanter:updateTreePlanterFillLevel(onLoad: any)` | 1029 | ✍ Affiche autant de nœuds de plants que le niveau arrondi, règle le paramètre de shader `hideByIndex`, déplace l'animation du magasin vers la rangée correspondante et active/désactive l'action de déchargement. `onLoad` saute l'animation instantanément. |
| `TreePlanter:setPlantLimitToField(plantLimitToField: boolean, noEventSend: boolean)` | 1064 | ✍ Définit si le semis est limité aux champs et envoie PlantLimitToFieldEvent quand la valeur change. |
| `TreePlanter:createTree(noEventSend: any)` | 1076 | ✍ Plante un arbre à la position du nœud. Abandonne avec un avertissement si la limite d'arbres est atteinte. Serveur : plante avec rotation aléatoire via le gestionnaire de plantation, consomme un plant (ou facture l'aide), met à jour les statistiques. Client : joue l'animation de plantation. Envoie TreePlanterCreateTreeEvent. |
| `TreePlanter:loadPallet(palletObjectId: table, noEventSend: any)` | 1147 | ✍ Envoie TreePlanterLoadPalletEvent et mémorise l'identifiant de la palette pour que `onUpdate` la monte. |
| `TreePlanter:getDirtMultiplier(superFunc: any) → number` | 1158 | ✍ Surcharge : ajoute un terme de salissure de travail proportionnel à la vitesse sur la limite de vitesse tant que la planteuse touche le sol. |
| `TreePlanter:getWearMultiplier(superFunc: any) → number` | 1172 | ✍ Surcharge : ajoute un terme d'usure de travail proportionnel à la vitesse sur la limite de vitesse tant que la planteuse touche le sol. |
| `TreePlanter:getIsSpeedRotatingPartActive(superFunc: table, speedRotatingPart: table) → boolean` | 1187 | ✍ Surcharge : les pièces rotatives sont inactives sans contact au sol, sinon le parent décide. |
| `TreePlanter:getIsWorkAreaActive(superFunc: any, workArea: any)` | 1199 | ✍ Surcharge : la zone de travail liée au nœud de référence au sol de la planteuse est inactive tant que la machine n'est pas allumée. |
| `TreePlanter:doCheckSpeedLimit(superFunc: any) → boolean` | 1215 | ✍ Surcharge : vérifie aussi la limite de vitesse quand la machine est allumée et la chaîne d'outils abaissée. |
| `TreePlanter:getCanBeSelected(superFunc: any)` | 1221 | ✍ Surcharge qui renvoie toujours true : la planteuse peut être sélectionnée. |
| `TreePlanter:onDeleteTreePlanterObject(object: any)` | 1227 | ✍ Écouteur de suppression : oublie une palette montée ou présente dans le trigger quand elle est supprimée. |
| `TreePlanter:getIsOnField(superFunc: any)` | 1238 | ✍ Surcharge : compte aussi comme sur un champ quand la planteuse touche le sol, car elle n'a pas besoin d'un champ pour travailler. |
| `TreePlanter:palletTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 1253 | ✍ Callback du trigger tenant une liste comptée des véhicules palettes accessibles dans le trigger ; enregistre un écouteur de suppression à la première entrée. |
| `TreePlanter:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 1284 | ✍ Client uniquement : enregistre la bascule de limite au champ (IMPLEMENT_EXTRA3, sauf si forcée) et, si configurée, l'action de plantation manuelle. |
| `TreePlanter.actionEventToggleTreePlanterFieldLimitation(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1306 | ✍ Callback d'entrée : bascule le réglage de limite au champ. |
| `TreePlanter.actionEventPlant(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1312 | ✍ Callback d'entrée de plantation manuelle : vérifie le contact au sol, la limite d'arbres, l'accès au terrain et les zones interdites, affiche un avertissement clignotant en cas d'échec, sinon appelle `createTree`. |
| `TreePlanter.getDefaultSpeedLimit() → number` | 1337 | ✍ Renvoie la limite de vitesse par défaut de la spécialisation, 5 (km/h supposé, NON VÉRIFIÉ). |
| `TreePlanter.getSaplingPalletInRange(self: integer, refNode: integer, palletsInTrigger: any) → table` | 1345 | ✍ Renvoie la palette la plus proche de la liste du trigger, dans la portée de montage d'un nœud de référence, ayant un fill unit non vide d'un type pris en charge par la planteuse ; nil sinon. |
| `TreePlanterActivatable.new(treePlanterVehicle: table) → table` | 1402 | ✍ Crée l'activatable d'une planteuse et construit son texte d'invite de recharge à partir de la description de type du véhicule. |
| `TreePlanterActivatable:getIsActivatable() → boolean` | 1414 | ✍ Vrai quand le véhicule courant du joueur local est le véhicule racine de cette planteuse, qu'aucune palette n'est montée et qu'une palette est proche. |
| `TreePlanterActivatable:run()` | 1428 | ✍ Callback d'activation : demande à la planteuse de charger la palette de plants la plus proche via `loadPallet`. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `removeMountedObject` | 85 |
| registerFunction | `setPlantLimitToField` | 86 |
| registerFunction | `createTree` | 87 |
| registerFunction | `loadPallet` | 88 |
| registerFunction | `palletTriggerCallback` | 89 |
| registerFunction | `onDeleteTreePlanterObject` | 90 |
| registerFunction | `getCanPlantOutsideSeason` | 91 |
| registerFunction | `setTreePlanterTreeTypeIndex` | 92 |
| registerFunction | `onTreePlanterSaplingLoaded` | 93 |
| registerFunction | `updateTreePlanterFillLevel` | 94 |
| registerOverwrittenFunction | `getDirtMultiplier` | 100 |
| registerOverwrittenFunction | `getWearMultiplier` | 101 |
| registerOverwrittenFunction | `getIsSpeedRotatingPartActive` | 102 |
| registerOverwrittenFunction | `getIsWorkAreaActive` | 103 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 104 |
| registerOverwrittenFunction | `getCanBeSelected` | 105 |
| registerOverwrittenFunction | `getIsOnField` | 106 |
| registerOverwrittenFunction | `addFillUnitFillLevel` | 108 |
| registerOverwrittenFunction | `getFillUnitFillLevel` | 109 |
| registerOverwrittenFunction | `getFillUnitFillLevelPercentage` | 110 |
| registerOverwrittenFunction | `getFillUnitFillType` | 111 |
| registerOverwrittenFunction | `getFillUnitCapacity` | 112 |
| registerOverwrittenFunction | `getFillUnitAllowsFillType` | 113 |
| registerOverwrittenFunction | `getFillUnitFreeCapacity` | 114 |
| registerOverwrittenFunction | `getFillLevelInformation` | 115 |
| registerOverwrittenFunction | `getHasObjectMounted` | 116 |
| registerOverwrittenFunction | `getFillUnitHasMountedPalletsToUnload` | 117 |
| registerOverwrittenFunction | `getFillUnitUnloadPalletFilename` | 118 |
| registerOverwrittenFunction | `getFillUnitMountedPalletsToUnload` | 119 |
| registerOverwrittenFunction | `getImplementAllowAutomaticSteering` | 120 |
| registerEventListener | `onLoad` | 126 |
| registerEventListener | `onDelete` | 127 |
| registerEventListener | `onReadStream` | 128 |
| registerEventListener | `onWriteStream` | 129 |
| registerEventListener | `onReadUpdateStream` | 130 |
| registerEventListener | `onWriteUpdateStream` | 131 |
| registerEventListener | `onUpdate` | 132 |
| registerEventListener | `onUpdateTick` | 133 |
| registerEventListener | `onDraw` | 134 |
| registerEventListener | `onRegisterActionEvents` | 135 |
| registerEventListener | `onTurnedOn` | 136 |
| registerEventListener | `onTurnedOff` | 137 |
| registerEventListener | `onFillUnitIsFillingStateChanged` | 138 |
| registerEventListener | `onFillUnitFillLevelChanged` | 139 |
| registerEventListener | `onFillUnitUnloadPallet` | 140 |

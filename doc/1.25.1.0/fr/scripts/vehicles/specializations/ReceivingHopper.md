# vehicles/specializations/ReceivingHopper.lua

*[English version](../../../../scripts/vehicles/specializations/ReceivingHopper.md)*

Source: `dataS/scripts/vehicles/specializations/ReceivingHopper.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule pour les trémies de réception qui reçoivent des produits déversés (pommes de terre par exemple) et peuvent faire apparaître des caisses (véhicules de type palette) à remplir. Exige FillUnit et Dischargeable. L'apparition des caisses se fait uniquement côté serveur, le joueur peut l'activer par une action, elle est synchronisée par ReceivingHopperSetCreateBoxesEvent et sauvegardée sous createBoxes. XML sous vehicle.receivingHopper : index d'unité de remplissage, nœud de point d'apparition et un fichier de caisse par type de remplissage.

- **ReceivingHopper** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ReceivingHopper.prerequisitesPresent(specializations: table) → boolean` | 21 | ✍ Retourne true seulement si le type de véhicule possède les spécialisations FillUnit et Dischargeable. |
| `ReceivingHopper.initSpecialization()` | 27 | ✍ Enregistre les entrées du schéma XML (index d'unité de remplissage, nœud d'apparition, type de remplissage et fichier de caisse) et la clé de sauvegarde createBoxes. |
| `ReceivingHopper.registerFunctions(vehicleType: any)` | 44 | ✍ Enregistre setCreateBoxes, getCanSpawnNextBox, collisionTestCallback, createBox et onCreateBoxFinished sur le type de véhicule. |
| `ReceivingHopper.registerOverwrittenFunctions(vehicleType: any)` | 54 | ✍ Surcharge handleDischargeRaycast et getCanBeSelected sur le type de véhicule. |
| `ReceivingHopper.registerEventListeners(vehicleType: any)` | 61 | ✍ S'abonne à onLoad, onUpdateTick, onRegisterActionEvents et onFillUnitFillLevelChanged. |
| `ReceivingHopper:onLoad(savegame: table)` | 71 | ✍ Signale les clés XML obsolètes, lit l'index d'unité de remplissage, le point d'apparition et la table type de remplissage vers fichier de caisse, et restaure createBoxes depuis la sauvegarde. Retire l'écouteur onUpdateTick hors serveur. |
| `ReceivingHopper:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 127 | ✍ Écrit l'indicateur createBoxes dans le XML de sauvegarde du véhicule. |
| `ReceivingHopper:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 138 | ✍ Tick serveur. Quand la création de caisses est activée et que l'état de déchargement est éteint, crée une nouvelle caisse si getCanSpawnNextBox l'autorise. |
| `ReceivingHopper:setCreateBoxes(state: boolean, noEventSend: boolean)` | 153 | ✍ Change l'indicateur de création de caisses. Si la valeur diffère, envoie ReceivingHopperSetCreateBoxesEvent (sauf noEventSend), met à jour le texte d'action et oublie la dernière caisse. |
| `ReceivingHopper:getCanSpawnNextBox()` | 167 | ✍ Retourne true si aucune caisse n'est en cours de création, que le type de remplissage courant a un fichier de caisse, que la caisse précédente est pleine et qu'un test de recouvrement au point d'apparition ne trouve aucun objet ni joueur. |
| `ReceivingHopper:collisionTestCallback(transformId: any)` | 199 | ✍ Callback de recouvrement : marque le point d'apparition comme occupé si le nœud touché appartient à un objet ou joueur enregistré autre que ce véhicule. |
| `ReceivingHopper:createBox()` | 210 | ✍ Serveur uniquement. Charge le véhicule caisse du type de remplissage courant au point d'apparition via VehicleLoadingData, appartenant à la ferme de la trémie, et appelle onCreateBoxFinished à la fin. |
| `ReceivingHopper:onCreateBoxFinished(vehicles: any, vehicleLoadState: any, arguments: any)` | 237 | ✍ Callback de chargement : efface l'indicateur de création et, en cas de succès, mémorise le premier véhicule chargé comme dernière caisse. |
| `ReceivingHopper:handleDischargeRaycast(superFunc: any, dischargeNode: any, hitObject: any, hitShape: any, hitDistance: any, hitFillUnitIndex: any, hitTerrain: any)` | 248 | ✍ Gestionnaire de raycast de déchargement surchargé. Met l'état de déchargement à OBJECT tant que l'objet touché accepte le type et a de la place, et le remet à OFF sinon. La fonction parente n'est pas appelée. |
| `ReceivingHopper:getCanBeSelected(superFunc: any)` | 269 | ✍ Surchargée pour toujours retourner true : la trémie peut toujours être sélectionnée par le joueur. |
| `ReceivingHopper:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 275 | ✍ Côté client, reconstruit les actions et, si actif pour l'entrée, enregistre IMPLEMENT_EXTRA pour activer ou désactiver la création de caisses, puis met à jour son texte. |
| `ReceivingHopper:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillType: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 289 | ✍ Garde le véhicule actif (raiseActive) tant que l'unité de remplissage modifiée contient du produit. |
| `ReceivingHopper.actionEventToggleBoxCreation(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 297 | ✍ Callback d'entrée qui inverse l'indicateur de création de caisses via setCreateBoxes. |
| `ReceivingHopper.updateActionEvents(self: any)` | 304 | ✍ Règle le texte d'action sur le libellé d'activation ou de désactivation de l'apparition de palettes selon l'état courant de createBoxes. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `setCreateBoxes` | 45 |
| registerFunction | `getCanSpawnNextBox` | 46 |
| registerFunction | `collisionTestCallback` | 47 |
| registerFunction | `createBox` | 48 |
| registerFunction | `onCreateBoxFinished` | 49 |
| registerOverwrittenFunction | `handleDischargeRaycast` | 55 |
| registerOverwrittenFunction | `getCanBeSelected` | 56 |
| registerEventListener | `onLoad` | 62 |
| registerEventListener | `onUpdateTick` | 63 |
| registerEventListener | `onRegisterActionEvents` | 64 |
| registerEventListener | `onFillUnitFillLevelChanged` | 65 |

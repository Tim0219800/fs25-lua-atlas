# vehicles/specializations/PlowPacker.lua

*[English version](../../../../scripts/vehicles/specializations/PlowPacker.md)*

Source: `dataS/scripts/vehicles/specializations/PlowPacker.lua` — FS25 1.25.1.0

✍ Spécialisation pour les charrues équipées d'un rouleau packer pouvant être désactivé. Elle requiert les spécialisations Plow, Cultivator et AnimatedVehicle, lit vehicle.plow.packer dans le XML et sauvegarde l'état du packer. Packer actif, la charrue travaille comme un outil de type cultivateur (via FSDensityMapUtil) et les exigences de sol de l'IA changent. Le packer est forcé actif avant un demi-tour ou un pliage ; les changements d'état sont synchronisés par PlowPackerStateEvent. Les constantes CULTIVATED_GROUND_TYPES et CLIENT_DM_UPDATE_RADIUS sont utilisées mais non définies dans le dump (NON VÉRIFIÉ).

- **PlowPacker** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlowPacker.initSpecialization()` | 24 | ✍ Enregistre les clés XML sous vehicle.plow.packer (inputAction, animations deactivateLeft/Right, animationSpeed, foldingConfig, partialDeactivated, lowerAnimation) et les clés de sauvegarde packerState et lastPackerState. |
| `PlowPacker.prerequisitesPresent(specializations: any)` | 49 | ✍ Retourne true uniquement si le type de véhicule possède les spécialisations Plow, Cultivator et AnimatedVehicle. |
| `PlowPacker.registerFunctions(vehicleType: any)` | 57 | ✍ Ajoute setPackerState et getIsPackerAllowed au type de véhicule. |
| `PlowPacker.registerOverwrittenFunctions(vehicleType: any)` | 64 | ✍ Surcharge setRotationMax, setPlowAIRequirements, setFoldState, processCultivatorArea et getUseCultivatorAIRequirements. |
| `PlowPacker.registerEventListeners(vehicleType: any)` | 74 | ✍ Abonne aux événements onLoad, onPostLoad, onReadStream, onWriteStream, onUpdate, onUpdateTick, onRegisterActionEvents et onSetLowered. |
| `PlowPacker:onLoad(savegame: any)` | 87 | ✍ Lit les réglages XML du packer. Le packer n'est disponible que si la configuration de pliage correspond et que les deux animations de désactivation existent. Démarre avec le packer actif et charge les textes de bascule. |
| `PlowPacker:onPostLoad(savegame: any)` | 118 | ✍ Recalcule les exigences IA, puis restaure packerState et lastPackerState depuis la sauvegarde sauf en cas de réinitialisation des véhicules. Applique immédiatement l'état d'animation restauré. |
| `PlowPacker:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 137 | ✍ Écrit packerState, et lastPackerState s'il est défini, dans la sauvegarde, uniquement si le packer est disponible. |
| `PlowPacker:onReadStream(streamId: integer, connection: Connection)` | 152 | ✍ Côté client à la connexion : lit le booléen d'état du packer et l'applique avec l'animation, si le packer est actuellement autorisé. |
| `PlowPacker:onWriteStream(streamId: integer, connection: Connection)` | 168 | ✍ Côté serveur à la connexion : écrit le booléen d'état courant du packer dans le flux quand le packer est disponible. |
| `PlowPacker:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 180 | ✍ Serveur uniquement. Remet le packer sur désactivé après un demi-tour s'il l'était avant, exécute un pliage différé une fois les animations du packer terminées, et rejoue l'animation d'abaissement si elle est désynchronisée. |
| `PlowPacker:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 224 | ✍ Client uniquement. Rafraîchit à chaque tick le texte de l'événement d'action du packer quand il est disponible. |
| `PlowPacker:setRotationMax(superFunc: any, rotationMax: any, noEventSend: any, turnAnimationTime: any)` | 234 | ✍ Serveur : si la cible de rotation de la charrue change, mémorise l'état du packer dans lastPackerState et force le packer actif avant d'appeler la fonction parente. |
| `PlowPacker:setPlowAIRequirements(superFunc: any, excludedGroundTypes: any)` | 252 | ✍ Quand le packer est actif ou partiellement désactivé, appelle le parent avec PlowPacker.CULTIVATED_GROUND_TYPES (non défini dans le dump, NON VÉRIFIÉ) comme types de sol exclus ; sinon transmet la liste reçue. |
| `PlowPacker:setFoldState(superFunc: any, direction: any, moveToMiddle: any, noEventSend: any)` | 265 | ✍ Lors d'un pliage dans une direction autre que celle du retournement avec le packer désactivé, le serveur réactive le packer et diffère le pliage réel jusqu'à la fin de ses animations. L'événement de direction de pliage est quand même envoyé. Sinon appelle le parent. |
| `PlowPacker:processCultivatorArea(superFunc: any, workArea: any, dt: any)` | 302 | ✍ Remplace le traitement de zone du cultivateur : efface les traces de pneus, puis appelle FSDensityMapUtil.updatePlowPackerArea et cumule les surfaces modifiée, statistique et totale. Les clients éloignés du véhicule sautent la mise à jour. Retourne la surface réelle et la surface. |
| `PlowPacker:getUseCultivatorAIRequirements(superFunc: any) → boolean` | 331 | ✍ Retourne toujours false : l'IA n'applique jamais les exigences de cultivateur à cette charrue. |
| `PlowPacker:setPackerState(newState: any, updateAnimations: any, noEventSend: any)` | 337 | ✍ Définit ou bascule (nil) l'état du packer. Joue si besoin l'animation de désactivation gauche ou droite selon la rotation de la charrue, planifie une resynchronisation de l'abaissement, met à jour les exigences IA et envoie PlowPackerStateEvent. |
| `PlowPacker:getIsPackerAllowed()` | 382 | ✍ Retourne false pendant l'animation de retournement, si l'animation de pliage n'est pas à sa position de travail, si un pliage est en attente ou si aucun packer n'est disponible ; true sinon. |
| `PlowPacker:onSetLowered(lowered: any)` | 405 | ✍ Si le packer est autorisé et actif, joue l'animation d'abaissement du packer en avant ou en arrière pour suivre l'état abaissé. |
| `PlowPacker:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 419 | ✍ Client uniquement. Vide et enregistre l'événement d'action de bascule du packer (alimenté, entrée par défaut IMPLEMENT_EXTRA4) quand le véhicule est actif pour les entrées et qu'un packer existe. |
| `PlowPacker.updateActionEventText(self: any)` | 436 | ✍ Définit le texte d'action (activer ou désactiver) selon l'état du packer et n'active l'action que tant que getIsPackerAllowed retourne true. |
| `PlowPacker.actionEventPackerDeactivate(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any, isMouse: any)` | 453 | ✍ Callback d'entrée qui bascule le packer en appelant setPackerState sans argument. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `setPackerState` | 58 |
| registerFunction | `getIsPackerAllowed` | 59 |
| registerOverwrittenFunction | `setRotationMax` | 65 |
| registerOverwrittenFunction | `setPlowAIRequirements` | 66 |
| registerOverwrittenFunction | `setFoldState` | 67 |
| registerOverwrittenFunction | `processCultivatorArea` | 68 |
| registerOverwrittenFunction | `getUseCultivatorAIRequirements` | 69 |
| registerEventListener | `onLoad` | 75 |
| registerEventListener | `onPostLoad` | 76 |
| registerEventListener | `onReadStream` | 77 |
| registerEventListener | `onWriteStream` | 78 |
| registerEventListener | `onUpdate` | 79 |
| registerEventListener | `onUpdateTick` | 80 |
| registerEventListener | `onRegisterActionEvents` | 81 |
| registerEventListener | `onSetLowered` | 82 |

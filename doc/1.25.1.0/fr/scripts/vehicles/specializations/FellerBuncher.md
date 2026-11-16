# vehicles/specializations/FellerBuncher.lua

*[English version](../../../../scripts/vehicles/specializations/FellerBuncher.md)*

Source: `dataS/scripts/vehicles/specializations/FellerBuncher.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule pour les têtes d'abatteuse qui coupent des arbres sur pied, les saisissent avec un bras principal et des emplacements d'arbres supplémentaires, puis les relâchent. Exige FillUnit (le niveau de remplissage compte les arbres chargés). Le serveur gère la détection, la coupe (splitShape), le montage par joints physiques et le relâchement ; les clients reçoivent l'état des effets et des pinces par flux, et les actions passent par FellerBuncherCutEvent et FellerBuncherReleaseEvent (définis ailleurs, NON VÉRIFIÉ). Elle réutilise WoodHarvester pour le contrôle d'accès à l'arbre et se configure sous vehicle.fellerBuncher dans le XML.


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FellerBuncher.prerequisitesPresent(specializations: table) → boolean` | 21 | ✍ Renvoie true seulement si la spécialisation FillUnit est présente. |
| `FellerBuncher.initSpecialization()` | 27 | ✍ Ajoute la caractéristique boutique « fellerBuncherMaxTreeSize » et enregistre les clés XML : unité de remplissage, rayon max, actions d'entrée, nœud et collision de coupe, nœud de montage, direction de déplacement de l'arbre, pince principale, animation de coupe, démontage, emplacements d'arbres, sons, nœuds d'animation et effets. |
| `FellerBuncher.registerFunctions(vehicleType: any)` | 83 | ✍ Enregistre les fonctions de niveau véhicule pour l'état de la pince, les contrôles de coupe, la coupe, le montage, le relâchement, le comptage des arbres et les gestionnaires de messages de coupe/montage d'arbre. |
| `FellerBuncher.registerOverwrittenFunctions(vehicleType: any)` | 102 | ✍ Surcharge getCanToggleTurnedOn, registerLoweringActionEvent, getSupportsAutoTreeAlignment et getAutoAlignHasValidTree. |
| `FellerBuncher.registerEventListeners(vehicleType: any)` | 111 | ✍ S'abonne aux événements de chargement/suppression, de flux et de flux de mise à jour, de tick de mise à jour, d'allumage/extinction, de fin d'animation et d'enregistrement des événements d'action. |
| `FellerBuncher:onLoad(savegame: any)` | 127 | ✍ Lit tous les réglages XML dans le spec (rayon, actions d'entrée, nœuds de coupe et de montage, animations de pince et d'emplacements, minutage du démontage), construit les emplacements d'arbres, charge animations, effets et sons côté client, s'abonne aux messages TREE_SHAPE_CUT et TREE_SHAPE_MOUNTED et crée le drapeau de modification. |
| `FellerBuncher:onDelete()` | 226 | ✍ Relâche l'arbre du bras principal et tous les emplacements, puis supprime effets, sons et animations. |
| `FellerBuncher:onReadStream(streamId: integer, connection: Connection)` | 244 | ✍ Client à la connexion : lit l'état de l'effet, l'usage de la pince principale et celui de chaque emplacement d'arbre. |
| `FellerBuncher:onWriteStream(streamId: integer, connection: Connection)` | 257 | ✍ Serveur à la connexion : écrit l'état de l'effet, l'usage de la pince principale et celui de chaque emplacement d'arbre. |
| `FellerBuncher:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 268 | ✍ Client : quand le bit de modification est présent, lit l'état de l'effet et l'usage des pinces/emplacements, puis rafraîchit les événements d'action. |
| `FellerBuncher:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 285 | ✍ Serveur : quand le drapeau de modification est actif, écrit l'état de l'effet et l'usage des pinces/emplacements. |
| `FellerBuncher:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 300 | ✍ Serveur : cherche un arbre coupable dans le nœud de coupe, gère le minuteur de coupe automatique (sans action de coupe), pousse un arbre fraîchement coupé vers le nœud de montage, gère le démontage échelonné et relâche les arbres supprimés. Les clients ne font que détecter l'arbre pour l'interface. Pilote aussi l'effet et le son de coupe (copeaux) selon l'état de l'effet. |
| `FellerBuncher:onTurnedOn()` | 488 | ✍ Active les pinces via setFellerBuncherGrabState(true) si aucun arbre n'est chargé ; sur les clients, démarre les nœuds d'animation et le son de scie. |
| `FellerBuncher:onTurnedOff()` | 503 | ✍ Inverse l'état des pinces si aucun arbre n'est chargé ; sur les clients, arrête nœuds d'animation, effets et sons. |
| `FellerBuncher:onFinishAnimation(name: any)` | 519 | ✍ Pilote la séquence de montage : quand l'animation de la pince principale ou d'un emplacement se termine pendant un montage, tente de monter l'arbre dans le premier emplacement libre ou le bras principal via mountTreeInRange et met à jour états, amortissement des joints et animations ; en cas d'échec, rouvre la pince. |
| `FellerBuncher:setFellerBuncherGrabState(state: any)` | 580 | ✍ Joue les animations de la pince principale, de tous les emplacements et de coupe vers l'avant (true) ou en sens inverse (false). |
| `FellerBuncher:getIsFellerBuncherReadyForCut()` | 601 | ✍ Renvoie true seulement si aucun montage ou démontage n'est en cours, si la pince principale ne s'anime pas, si la machine est allumée et s'il reste un emplacement d'arbre libre. |
| `FellerBuncher:getFellerBuncherCanCutSplitShape(splitShapeId: any, cx: any, cy: any, cz: any, nx: any, ny: any, nz: any, yx: any, yy: any, yz: any, minY: any, maxY: any, minZ: any, maxZ: any)` | 629 | ✍ Vérifie si un arbre trouvé peut être coupé : accès via WoodHarvester, rayon par rapport à maxRadius, pas déjà tenu, et les deux côtés du plan de coupe plus longs que 0,15. Renvoie un booléen et, en cas de refus, un texte d'avertissement (trop épais, pas d'accès, pas de permission). |
| `FellerBuncher:cutTree(noEventSend: any)` | 664 | ✍ Coupe l'arbre trouvé dans le nœud de coupe : sur le serveur met à jour statistiques et succès de coupe, enregistre le type d'arbre et sépare la forme ; puis joue l'animation de coupe, le son de coupe (mode manuel côté client) et envoie FellerBuncherCutEvent. |
| `FellerBuncher:fellerBuncherSplitShapeCallback(shape: any, isBelow: any, isAbove: any, minY: any, maxY: any, minZ: any, maxZ: any)` | 704 | ✍ Rappel de découpe : enregistre la nouvelle forme comme forme découpée connue auprès du gestionnaire de plantation d'arbres et, pour la partie au-dessus de la coupe, lance le processus de montage. |
| `FellerBuncher:doMountProcess(shape: any, noEventSend: any)` | 717 | ✍ Démarre le montage d'une forme coupée : inverse l'animation de la pince principale, signale le montage en cours et décale légèrement la forme le long de la direction de déplacement (avec un petit relevé). Le paramètre noEventSend n'est pas utilisé ici. |
| `FellerBuncher:mountTreeInRange()` | 730 | ✍ Teste la forme en attente contre le nœud de montage et, si elle convient, crée un joint rigide à ressort entre le composant de montage et la forme, puis publie TREE_SHAPE_MOUNTED. Renvoie indice de joint, nœud de joint et forme, ou 0 et nil. |
| `FellerBuncher:releaseMountedTrees(noEventSend: any)` | 768 | ✍ Sur le serveur démarre le relâchement échelonné de tous les arbres (bras principal d'abord, puis emplacements) ; de chaque côté envoie FellerBuncherReleaseEvent sauf si noEventSend vaut true. |
| `FellerBuncher:releaseMainArmTree()` | 786 | ✍ Ouvre la pince principale, retire son joint et son nœud de joint, restaure l'amortissement des joints de composants sur le serveur et met à jour le nombre d'arbres. Renvoie si le bras principal tenait un arbre. |
| `FellerBuncher:releaseNextTreeSlot()` | 828 | ✍ Relâche le premier emplacement d'arbre utilisé (animation, joint, nœud) et met à jour le nombre d'arbres. Renvoie true si un emplacement a été relâché, false si aucun n'était utilisé. |
| `FellerBuncher:onFellerBuncherTreesChanged()` | 859 | ✍ Fixe le niveau de l'unité de remplissage au nombre d'arbres chargés (la vide puis ajoute le nombre), rafraîchit les événements d'action et signale une mise à jour réseau. |
| `FellerBuncher:getNumLoadedTrees()` | 873 | ✍ Renvoie le nombre d'arbres tenus : le bras principal (0 ou 1) plus les emplacements utilisés. |
| `FellerBuncher:onFellerBuncherTreeShapeCut(oldShape: any, shape: any)` | 891 | ✍ Gestionnaire de message (serveur) : si la forme coupée était tenue dans le bras principal ou un emplacement, relâche tous les arbres montés. |
| `FellerBuncher:onFellerBuncherTreeShapeMounted(shape: any, mountVehicle: any)` | 910 | ✍ Gestionnaire de message (serveur) : si une forme tenue est montée par un autre véhicule, relâche tous les arbres montés. |
| `FellerBuncher:getCanToggleTurnedOn(superFunc: any)` | 929 | ✍ Surcharge : refuse le basculement pendant un montage, un démontage ou une animation de la pince principale ; sinon délègue au parent. |
| `FellerBuncher:registerLoweringActionEvent(superFunc: any, actionEventsTable: any, inputAction: any, target: any, callback: any, triggerUp: any, triggerDown: any, triggerAlways: any, startActive: any, callbackState: any, customIconName: any, ignoreCollisions: any)` | 949 | ✍ Surcharge à corps vide : aucun événement d'action d'abaissement n'est enregistré pour cette machine. |
| `FellerBuncher:getSupportsAutoTreeAlignment(superFunc: any)` | 954 | ✍ Surcharge : renvoie toujours true, déclarant la prise en charge de l'alignement automatique sur l'arbre. |
| `FellerBuncher:getAutoAlignHasValidTree(superFunc: any, radius: any)` | 960 | ✍ Surcharge : renvoie si un arbre coupable a été trouvé et si le rayon donné est dans maxRadius. |
| `FellerBuncher:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 967 | ✍ Client : enregistre l'action motorisée de relâchement et, si une action de coupe est définie, l'action de coupe (priorité haute, avec textes) pour le véhicule actif, puis met à jour leur état. |
| `FellerBuncher.actionEventReleaseTrees(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 990 | ✍ Rappel d'entrée : relâche les arbres montés. |
| `FellerBuncher.actionEventCutTree(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 996 | ✍ Rappel d'entrée : coupe l'arbre détecté. |
| `FellerBuncher.updateActionEvents(self: any)` | 1002 | ✍ Client : n'active l'action de relâchement que si un arbre est tenu et l'action de coupe que si un arbre coupable a été trouvé. |
| `FellerBuncher.loadSpecValueMaxTreeSize(xmlFile: any, customEnvironment: any, baseDir: any)` | 1029 | ✍ Chargeur de caractéristique boutique : renvoie la valeur vehicle.fellerBuncher#maxRadius du XML. |
| `FellerBuncher.getSpecValueMaxTreeSize(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 1035 | ✍ Accesseur de caractéristique boutique : convertit le rayon en diamètre en centimètres et le renvoie en texte, ou en valeur(s) plus texte selon les drapeaux. Ne renvoie rien sans la caractéristique. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `setFellerBuncherGrabState` | 84 |
| registerFunction | `getIsFellerBuncherReadyForCut` | 85 |
| registerFunction | `getFellerBuncherCanCutSplitShape` | 86 |
| registerFunction | `cutTree` | 87 |
| registerFunction | `fellerBuncherSplitShapeCallback` | 88 |
| registerFunction | `doMountProcess` | 89 |
| registerFunction | `mountTreeInRange` | 90 |
| registerFunction | `releaseMountedTrees` | 91 |
| registerFunction | `releaseMainArmTree` | 92 |
| registerFunction | `releaseNextTreeSlot` | 93 |
| registerFunction | `onFellerBuncherTreesChanged` | 94 |
| registerFunction | `getNumLoadedTrees` | 95 |
| registerFunction | `onFellerBuncherTreeShapeCut` | 96 |
| registerFunction | `onFellerBuncherTreeShapeMounted` | 97 |
| registerOverwrittenFunction | `getCanToggleTurnedOn` | 103 |
| registerOverwrittenFunction | `registerLoweringActionEvent` | 104 |
| registerOverwrittenFunction | `getSupportsAutoTreeAlignment` | 105 |
| registerOverwrittenFunction | `getAutoAlignHasValidTree` | 106 |
| registerEventListener | `onLoad` | 112 |
| registerEventListener | `onDelete` | 113 |
| registerEventListener | `onReadStream` | 114 |
| registerEventListener | `onWriteStream` | 115 |
| registerEventListener | `onReadUpdateStream` | 116 |
| registerEventListener | `onWriteUpdateStream` | 117 |
| registerEventListener | `onUpdateTick` | 118 |
| registerEventListener | `onTurnedOn` | 119 |
| registerEventListener | `onTurnedOff` | 120 |
| registerEventListener | `onFinishAnimation` | 121 |
| registerEventListener | `onRegisterActionEvents` | 122 |

## Messages

- s'abonne à `MessageType.TREE_SHAPE_CUT` (l.218)
- s'abonne à `MessageType.TREE_SHAPE_MOUNTED` (l.219)
- publie `MessageType.TREE_SHAPE_MOUNTED` (l.757)

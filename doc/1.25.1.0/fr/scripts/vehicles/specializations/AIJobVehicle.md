# vehicles/specializations/AIJobVehicle.lua

*[English version](../../../../scripts/vehicles/specializations/AIJobVehicle.md)*

Source: `dataS/scripts/vehicles/specializations/AIJobVehicle.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule qui permet de faire conduire un véhicule par un job d'assistant IA. Elle exige les spécialisations AIVehicle et Drivable. Elle conserve le job courant et le dernier job, lit depuis le XML du véhicule les nœuds de direction et de marche arrière IA ainsi que les types de jobs gérés, et sauvegarde le dernier job et les autorisations de démarrage/arrêt. Beaucoup de fonctions enregistrées (démarrage/arrêt de job, recherche de l'assistant, points d'intérêt) n'ont pas leur corps dans ce dump du SDK : seules les parties présentes sont décrites.

- **AIJobVehicle** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIJobVehicle.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Renvoie vrai seulement si le type de véhicule possède aussi les spécialisations AIVehicle et Drivable. |
| `AIJobVehicle.initSpecialization()` | 25 | ✍ Déclare dans le schéma XML les clés vehicle.ai (nœud de direction, nœud de marche arrière, vitesse de direction, supportsAIJobs, supportedJobTypes) et les clés de sauvegarde pour les autorisations de démarrage/arrêt et le type du dernier job. |
| `AIJobVehicle.registerEvents(vehicleType: any)` | 44 | ✍ Enregistre les événements de véhicule onAIJobStarted, onAIJobFinished, onAIJobVehicleBlock et onAIJobVehicleContinue. |
| `AIJobVehicle.registerFunctions(vehicleType: any)` | 52 | ✍ Enregistre les fonctions publiques de la spécialisation (bascule, tests de démarrage/arrêt, accès au job et à l'assistant, nœuds IA, blocage/reprise, etc.). Plusieurs des corps enregistrés sont absents du dump. |
| `AIJobVehicle.registerOverwrittenFunctions(vehicleType: any)` | 83 | ✍ Surcharge un ensemble de fonctions de base du véhicule, dont getIsActive, getIsAIActive, getFullName, getActiveFarm, les fonctions de point d'intérêt de carte et les getters liés à la sortie du véhicule. Seuls certains corps de surcharge sont présents dans le dump. |
| `AIJobVehicle.registerEventListeners(vehicleType: any)` | 100 | ✍ Abonne la spécialisation à onLoad, onDelete, onUpdate, onSetBroken, onReadStream, onWriteStream et onAIModeChanged. |
| `AIJobVehicle:onLoad(savegame: table)` | 113 | ✍ Initialise l'état de la spec, lit depuis le XML la vitesse de direction (multipliée par 0,001), les nœuds, supportsAIJobs et supportedJobTypes, et met en cache les textes du HUD. Lors du chargement d'une sauvegarde, recrée le dernier job via aiJobTypeManager et restaure les indicateurs de démarrage/arrêt. |
| `AIJobVehicle:onReadStream(streamId: integer, connection: Connection)` | 171 | ✍ Côté client à la connexion : lit si un job est actif et, si oui, son id, sa ferme et l'index de l'assistant, puis appelle aiJobStarted avec le job retrouvé par id. Lit ensuite le type du dernier job et le reconstruit depuis le flux. |
| `AIJobVehicle:onWriteStream(streamId: integer, connection: Connection)` | 198 | ✍ Côté serveur à la connexion : écrit l'id du job actif, la ferme initiatrice et l'index de l'assistant si un job existe, puis le type du dernier job et ses données. Symétrique de onReadStream. |
| `AIJobVehicle:onAIModeChanged(aiMode: any)` | 217 | ✍ Quand le mode IA devient autre chose que AIModeSelection.MODE.WORKER, arrête le job en cours (s'il existe) avec un message d'arrêt par l'utilisateur. |
| `AIJobVehicle:getShowAIToggleActionEvent() → boolean` | 235 | ✍ Indique si l'action de bascule de l'IA doit être affichée : faux sans nœud de direction IA, si l'IA est désactivée, sans la permission hireAssistant, ou si la limite d'IA est atteinte alors que l'IA est inactive. |
| `AIJobVehicle:getIsInUse(superFunc: any, connection: any)` | 372 | ✍ Surcharge : renvoie vrai tant que l'IA est active, sinon délègue à l'implémentation parente. |
| `AIJobVehicle:getIsActive(superFunc: any)` | 382 | ✍ Surcharge : le véhicule est considéré actif dès que l'IA est active, sinon le résultat du parent est utilisé. |
| `AIJobVehicle:getIsAIActive(superFunc: any)` | 396 | ✍ Surcharge : vrai si le parent le dit ou si un job est actuellement assigné à ce véhicule. |
| `AIJobVehicle:toggleAIVehicle()` | 429 | ✍ Si l'IA tourne, arrête le job comme si l'utilisateur l'avait fait. Sinon envoie un AIJobStartRequestEvent au serveur pour un job démarrable, ou ouvre l'écran IA du menu en jeu (chemin dédié sur mobile), sauf si une visite guidée est en cours. |
| `AIJobVehicle:getCanToggleAIVehicle() → boolean` | 468 | ✍ Renvoie getCanStopAIVehicle quand l'IA est active, sinon getCanStartAIVehicle. Le corps du test d'arrêt n'est pas dans le dump (NON VÉRIFIÉ). |
| `AIJobVehicle:getCanStartAIVehicle() → boolean` | 488 | ✍ Vrai seulement si l'IA n'est pas désactivée, la ferme propriétaire n'est pas EVERYONE, les jobs sont gérés et le démarrage autorisé, un nœud de direction existe, la limite d'IA n'est pas atteinte, l'IA est inactive et le véhicule n'est pas en panne. |
| `AIJobVehicle:getIsAIJobSupported(aiJobName: any) → boolean` | 528 | ✍ Compare un nom de job à supportedJobTypes du XML, sans tenir compte de la casse. Renvoie vrai si aucune liste n'est définie. |
| `AIJobVehicle:getDeactivateLightsOnLeave(superFunc: any) → boolean` | 570 | ✍ Surcharge : les lumières ne sont éteintes à la sortie que si le parent l'autorise et que l'IA n'est pas active. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onAIJobStarted` | 45 |
| registerEvent | `onAIJobFinished` | 46 |
| registerEvent | `onAIJobVehicleBlock` | 47 |
| registerEvent | `onAIJobVehicleContinue` | 48 |
| registerFunction | `getShowAIToggleActionEvent` | 53 |
| registerFunction | `stopCurrentAIJob` | 54 |
| registerFunction | `skipCurrentTask` | 55 |
| registerFunction | `aiJobStarted` | 56 |
| registerFunction | `aiJobFinished` | 57 |
| registerFunction | `toggleAIVehicle` | 58 |
| registerFunction | `getCanToggleAIVehicle` | 59 |
| registerFunction | `getCanStartAIVehicle` | 60 |
| registerFunction | `getCanStopAIVehicle` | 61 |
| registerFunction | `getIsAIJobSupported` | 62 |
| registerFunction | `setAIMapHotspotBlinking` | 63 |
| registerFunction | `getCurrentHelper` | 64 |
| registerFunction | `aiBlock` | 65 |
| registerFunction | `aiContinue` | 66 |
| registerFunction | `getAIDirectionNode` | 67 |
| registerFunction | `getAISteeringNode` | 68 |
| registerFunction | `getAIReverserNode` | 69 |
| registerFunction | `getAISteeringSpeed` | 70 |
| registerFunction | `getAIJobFarmId` | 71 |
| registerFunction | `getStartableAIJob` | 72 |
| registerFunction | `getHasStartableAIJob` | 73 |
| registerFunction | `getStartAIJobText` | 74 |
| registerFunction | `getJob` | 75 |
| registerFunction | `getLastJob` | 76 |
| registerFunction | `setIsAIStartAllowed` | 77 |
| registerFunction | `setIsAIStopAllowed` | 78 |
| registerOverwrittenFunction | `getIsVehicleControlledByPlayer` | 84 |
| registerOverwrittenFunction | `getIsActive` | 85 |
| registerOverwrittenFunction | `getIsAIActive` | 86 |
| registerOverwrittenFunction | `getAllowTireTracks` | 87 |
| registerOverwrittenFunction | `getDeactivateOnLeave` | 88 |
| registerOverwrittenFunction | `getStopMotorOnLeave` | 89 |
| registerOverwrittenFunction | `getDisableVehicleCharacterOnLeave` | 90 |
| registerOverwrittenFunction | `getFullName` | 91 |
| registerOverwrittenFunction | `getActiveFarm` | 92 |
| registerOverwrittenFunction | `getIsMapHotspotVisible` | 93 |
| registerOverwrittenFunction | `getMapHotspot` | 94 |
| registerOverwrittenFunction | `getDeactivateLightsOnLeave` | 95 |
| registerEventListener | `onLoad` | 101 |
| registerEventListener | `onDelete` | 102 |
| registerEventListener | `onUpdate` | 103 |
| registerEventListener | `onSetBroken` | 104 |
| registerEventListener | `onReadStream` | 105 |
| registerEventListener | `onWriteStream` | 106 |
| registerEventListener | `onAIModeChanged` | 107 |

## Messages

- publie `MessageType.GUI_INGAME_OPEN_AI_SCREEN` (l.446)
- publie `MessageType.GUI_INGAME_OPEN_AI_SCREEN` (l.461)

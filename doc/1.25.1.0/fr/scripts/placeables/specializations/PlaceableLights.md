# placeables/specializations/PlaceableLights.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableLights.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableLights.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable qui pilote des groupes de lumières sur les bâtiments : modèles i3d de lumières partagées, formes auto-éclairées et nœuds de lumière réelle (profil bas/haut). Les groupes se commutent à la main via un trigger et un activatable, ou automatiquement par des conditions de visibilité liées à l'heure et à la météo. L'état est synchronisé par PlaceableLightsStateEvent ; dépend du système de masques d'environnement de la mission (classe absente du dump).

- **PlaceableLights** (l.11)
- **PlaceableLightsActivatable** (l.535)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableLights.prerequisitesPresent(specializations: table) → boolean` | 22 | ✍ Renvoie toujours true : cette spécialisation n'exige aucune autre spécialisation. |
| `PlaceableLights.registerFunctions(placeableType: any)` | 28 | ✍ Enregistre sur le type de placeable les fonctions lightSetupChanged, getUseHighProfile, setGroupIsActive, lightsTriggerCallback, sharedLightLoaded et updateLightState. |
| `PlaceableLights.registerEventListeners(placeableType: any)` | 39 | ✍ Abonne la spécialisation aux événements onLoad, onDelete, onWriteStream, onReadStream et onFinalizePlacement. |
| `PlaceableLights.registerXMLPaths(schema: any, basePath: any)` | 49 | ✍ Déclare le schéma XML sous lights : sharedLight, lightShape, realLights.low/high et group (trigger, action d'entrée, textes, heures d'activation/désactivation, drapeaux météo, son de bascule). |
| `PlaceableLights:onLoad(savegame: table)` | 86 | ✍ Lit depuis le XML les groupes de lumières, lumières partagées (chargées en asynchrone), formes lumineuses et lumières réelles, et applique les conditions de visibilité heure/météo aux groupes non manuels. S'abonne au changement du réglage lightsProfile ; nombre de groupes limité par PlaceableLights.MAX_NUM_GROUPS. À noter : le test d'heure incomplète (ligne 143) n'avertit que si activateTime est défini sans deactivateTime, pas l'inverse. |
| `PlaceableLights:onFinalizePlacement()` | 288 | ✍ Une fois le placement finalisé, applique la configuration de lumières courante en appelant lightSetupChanged. |
| `PlaceableLights:sharedLightLoaded(i3dNode: any, failedReason: any, args: any)` | 294 | ✍ Callback asynchrone d'un i3d de lumière partagée : configure ses formes lightControl (mode manuel ou condition de visibilité), l'échelle de couleur et les nœuds de rotation, le lie au nœud de liaison, puis libère l'i3d et le XML temporaires et termine la tâche de chargement. |
| `PlaceableLights:onDelete()` | 365 | ✍ Libère les XML et requêtes i3d des lumières partagées, se désabonne des messages, retire l'activatable, supprime les triggers des groupes et détruit les échantillons sonores de bascule. |
| `PlaceableLights:onReadStream(streamId: integer, connection: table)` | 402 | ✍ Côté client à la connexion : lit un booléen par groupe à commande manuelle et l'applique via setGroupIsActive sans renvoyer d'événement. |
| `PlaceableLights:onWriteStream(streamId: integer, connection: table)` | 415 | ✍ Côté serveur à la connexion : écrit l'état actif de chaque groupe à commande manuelle, dans l'ordre lu par onReadStream. |
| `PlaceableLights:getUseHighProfile()` | 426 | ✍ Renvoie true si le profil de lumières (valeur imposée par la plateforme si présente, sinon le réglage du jeu) est au moins GS_PROFILE_HIGH. |
| `PlaceableLights:setGroupIsActive(groupIndex: any, isActive: any, noEventSend: any)` | 435 | ✍ Définit ou inverse (isActive nil) l'état d'un groupe, met à jour les lumières, envoie PlaceableLightsStateEvent sauf si noEventSend est vrai, et joue le son de bascule côté client. |
| `PlaceableLights:updateLightState(groupIndex: any, isActive: any)` | 454 | ✍ Applique l'état d'un groupe : règle lightControl sur les lumières partagées et formes des groupes manuels, puis affiche les lumières réelles du profil actif et masque celles de l'autre profil. |
| `PlaceableLights:lightsTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any)` | 498 | ✍ Callback de trigger : quand le joueur local entre dans le trigger d'un groupe, enregistre l'activatable pour ce groupe ; à la sortie, le retire si le joueur n'est dans la zone d'aucun autre groupe. |
| `PlaceableLights:lightSetupChanged()` | 527 | ✍ Réapplique l'état de chaque groupe, par exemple après un changement du réglage de profil de lumières. |
| `PlaceableLightsActivatable.new(placeable: any)` | 539 | ✍ Crée l'objet activatable lié à un placeable, avec l'indice de groupe 1 et un texte vide. |
| `PlaceableLightsActivatable:setGroupIndex(groupIndex: any)` | 551 | ✍ Choisit le groupe de lumières contrôlé par l'activatable (1 par défaut) et met à jour son texte d'invite. |
| `PlaceableLightsActivatable:run()` | 558 | ✍ Appelé quand le joueur déclenche l'action : inverse l'état du groupe sélectionné sur le placeable et met à jour le texte. |
| `PlaceableLightsActivatable:updateActivateText()` | 566 | ✍ Construit l'invite à partir du texte d'activation ou de désactivation du groupe et de son nom, selon que le groupe est actif ou non. |
| `PlaceableLightsActivatable:getDistance(x: any, y: any, z: any)` | 579 | ✍ Renvoie la distance entre le point donné et le nœud de trigger du groupe, ou math.huge si le groupe n'a pas de trigger. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `lightSetupChanged` | 29 |
| registerFunction | `getUseHighProfile` | 30 |
| registerFunction | `setGroupIsActive` | 31 |
| registerFunction | `lightsTriggerCallback` | 32 |
| registerFunction | `sharedLightLoaded` | 33 |
| registerFunction | `updateLightState` | 34 |
| registerEventListener | `onLoad` | 40 |
| registerEventListener | `onDelete` | 41 |
| registerEventListener | `onWriteStream` | 42 |
| registerEventListener | `onReadStream` | 43 |
| registerEventListener | `onFinalizePlacement` | 44 |

## Messages

- s'abonne à `MessageType.SETTING_CHANGED` (l.98)

# vehicles/specializations/HookLiftTrailer.lua

*[English version](../../../../scripts/vehicles/specializations/HookLiftTrailer.md)*

Source: `dataS/scripts/vehicles/specializations/HookLiftTrailer.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule pour les remorques à bras de levage (hooklift) (requiert AnimatedVehicle et Foldable). Une animation de référence (par défaut unfoldHand) charge et décharge le conteneur, une animation distincte le fait basculer. Le script anime les limites des joints physiques à partir de keyframes, peut créer un joint supplémentaire quand le conteneur est entièrement levé, gère les règles de détachement et de basculement, pilote des rouleaux visuels, les visuels de verrou du crochet et les textes HUD du Foldable, et maintient la prise de force pendant les animations. Fonctionne avec HookLiftContainer côté conteneur.

- **HookLiftTrailer** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HookLiftTrailer.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Renvoie true seulement si le type de véhicule possède AnimatedVehicle et Foldable. |
| `HookLiftTrailer.initSpecialization()` | 23 | ✍ Enregistre le schéma XML sous vehicle.hookLiftTrailer : keyframes des limites de joint, joint supplémentaire, animation de déchargement, verrou du crochet, verrou du conteneur, rouleaux visuels et textes HUD. |
| `HookLiftTrailer.registerFunctions(vehicleType: any)` | 76 | ✍ Enregistre startTipping, stopTipping, getIsTippingAllowed, getCanDetachContainer, les fonctions de mise à jour du verrou et du joint et setHookLiftContainerPhysicsState. |
| `HookLiftTrailer.registerOverwrittenFunctions(vehicleType: any)` | 88 | ✍ Surcharge getIsFoldAllowed, isDetachAllowed, getDoConsumePtoPower, getPtoRpm, addToPhysics et removeFromPhysics. |
| `HookLiftTrailer.registerEventListeners(vehicleType: any)` | 99 | ✍ Abonne à onLoad, onPostLoad, onUpdateTick, onPostAttachImplement, onPreDetachImplement et onUpdateAnimation. |
| `HookLiftTrailer:onLoad(savegame: table)` | 111 | ✍ Charge le nom de l'animation de référence, les courbes de limites de joint (min et max de rotation et translation par temps de clé), les réglages du joint supplémentaire, l'animation de déchargement, le verrou du crochet (client seulement), le verrou du conteneur, les rouleaux visuels et les textes localisés. À noter : la valeur par défaut de direction des visualRoll est 1 dans le code alors que le schéma annonce -1. |
| `HookLiftTrailer:onPostLoad(savegame: table)` | 202 | ✍ Définit les textes de direction de la spécialisation Foldable sur les libellés de décharge et de charge du bras. |
| `HookLiftTrailer:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 214 | ✍ Tant qu'un conteneur est attelé, autorise son détachement une fois l'animation de référence au-delà de 0,95 et applique les limites de joint interpolées à ses joints physiques pendant l'animation, les verrouillant à 0,99. Côté client, bascule aussi le visuel du verrou du crochet quand le joint du conteneur est proche du nœud de référence. |
| `HookLiftTrailer:onPostAttachImplement(attachable: table, inputJointDescIndex: any, jointDescIndex: any, loadFromSavegame: any)` | 279 | ✍ Si l'outil attelé utilise un type de joint hooklift, l'enregistre comme conteneur attelé avec son indice de joint et passe les textes du Foldable sur les libellés du conteneur. Rafraîchit ensuite l'état du verrou. |
| `HookLiftTrailer:onPreDetachImplement(implement: integer)` | 305 | ✍ Quand le conteneur porté est détaché, le déverrouille, rétablit les textes du bras, supprime le joint supplémentaire et son groupe de transformation auxiliaire et oublie le conteneur. Rafraîchit ensuite l'état du verrou. |
| `HookLiftTrailer:onUpdateAnimation(name: any)` | 334 | ✍ Pour l'animation de référence, met à jour l'état du verrou et fait tourner les rouleaux visuels qui touchent la ligne du bas du conteneur, selon la distance parcourue le long de celle-ci. Sur le serveur, pendant l'animation de déchargement, réoriente le repère du joint supplémentaire. |
| `HookLiftTrailer:startTipping()` | 398 | ✍ Joue l'animation de déchargement en avant à la vitesse configurée depuis le temps courant, ce qui fait basculer le conteneur. |
| `HookLiftTrailer:stopTipping()` | 405 | ✍ Joue l'animation de déchargement en arrière à la vitesse inverse configurée depuis le temps courant. |
| `HookLiftTrailer:getIsTippingAllowed() → boolean` | 413 | ✍ Renvoie true seulement quand l'animation de référence est exactement au début (temps 0), c'est-à-dire conteneur entièrement posé sur la remorque. |
| `HookLiftTrailer:getCanDetachContainer()` | 420 | ✍ Renvoie true seulement quand l'animation de référence est exactement à la fin (temps 1), c'est-à-dire conteneur entièrement descendu au sol. |
| `HookLiftTrailer:updateHookLiftContainerLockState()` | 427 | ✍ Met à jour le verrou du conteneur (vrai quand le bras est entièrement chargé et qu'un conteneur est attelé), applique les changements d'objets et prévient le conteneur. Sur le serveur, bascule aussi l'état du joint supplémentaire selon son temps de verrouillage. |
| `HookLiftTrailer:updateAdditionalHookLiftContainerJoint()` | 453 | ✍ Crée le joint physique supplémentaire entre conteneur et remorque lorsqu'il doit être actif et que les deux sont dans la physique, avec les limites du joint supplémentaire, ou le supprime avec son nœud auxiliaire sinon. Sans effet sans nœud de joint supplémentaire. Suppose que des limites existent à la création. |
| `HookLiftTrailer:setHookLiftContainerPhysicsState(container: any, state: any)` | 511 | ✍ Appelée quand le conteneur porté entre ou sort de la physique : rafraîchit ou met à zéro l'indice de joint mémorisé (en réinitialisant le verrouillage des limites au retour), puis met à jour le joint supplémentaire. |
| `HookLiftTrailer:addToPhysics(superFunc: any) → boolean` | 532 | ✍ Après le parent, indique à nouveau l'état physique vrai pour le conteneur porté. Renvoie false si le parent a échoué. |
| `HookLiftTrailer:removeFromPhysics(superFunc: any)` | 547 | ✍ Met l'état physique du conteneur porté sur false avant que le parent retire la remorque. Renvoie false si le parent a échoué. |
| `HookLiftTrailer:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any) → boolean` | 564 | ✍ Refuse le repli tant que l'animation de déchargement n'est pas au début, sinon s'en remet au parent. |
| `HookLiftTrailer:isDetachAllowed(superFunc: any) → boolean` | 576 | ✍ N'autorise le détachement de la remorque (décision du parent) que si l'animation de déchargement est à 0, sinon renvoie false avec nil. |
| `HookLiftTrailer:getDoConsumePtoPower(superFunc: any) → boolean` | 587 | ✍ Renvoie true si le parent le fait ou si l'animation de référence ou de déchargement est en cours, de sorte que le bras consomme de la puissance de prise de force en mouvement. |
| `HookLiftTrailer:getPtoRpm(superFunc: any) → number` | 597 | ✍ Pendant l'une des deux animations, renvoie le régime de prise de force de la spécialisation de consommateur de puissance, sinon la valeur du parent. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `startTipping` | 77 |
| registerFunction | `stopTipping` | 78 |
| registerFunction | `getIsTippingAllowed` | 79 |
| registerFunction | `getCanDetachContainer` | 80 |
| registerFunction | `updateHookLiftContainerLockState` | 81 |
| registerFunction | `updateAdditionalHookLiftContainerJoint` | 82 |
| registerFunction | `setHookLiftContainerPhysicsState` | 83 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 89 |
| registerOverwrittenFunction | `isDetachAllowed` | 90 |
| registerOverwrittenFunction | `getDoConsumePtoPower` | 91 |
| registerOverwrittenFunction | `getPtoRpm` | 92 |
| registerOverwrittenFunction | `addToPhysics` | 93 |
| registerOverwrittenFunction | `removeFromPhysics` | 94 |
| registerEventListener | `onLoad` | 100 |
| registerEventListener | `onPostLoad` | 101 |
| registerEventListener | `onUpdateTick` | 102 |
| registerEventListener | `onPostAttachImplement` | 103 |
| registerEventListener | `onPreDetachImplement` | 104 |
| registerEventListener | `onUpdateAnimation` | 105 |

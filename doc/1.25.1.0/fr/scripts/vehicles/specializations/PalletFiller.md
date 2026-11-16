# vehicles/specializations/PalletFiller.lua

*[English version](../../../../scripts/vehicles/specializations/PalletFiller.md)*

Source: `dataS/scripts/vehicles/specializations/PalletFiller.lua` — FS25 1.25.1.0

✍ Spécialisation des outils qui portent des palettes pendant qu'une récolteuse ou une machine les remplit (remplisseurs de palettes sur plateforme). Aucun prérequis. Le serveur retient les palettes sur des joints physiques dans des emplacements le long d'un nœud de rangée, les déplace selon les étapes de remplissage, charge depuis un trigger de ramassage, décharge, et peut acheter de nouvelles palettes via VehicleLoadingData ; l'état est IDLE, LOADING ou UNLOADING (PalletFillerState, absent du dump). Le client gère animations, son, événements d'action et un avertissement quand les palettes sont pleines. La table de la classe est déclarée hors des lignes visibles de ce dump.


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PalletFiller.prerequisitesPresent(specializations: table) → boolean` | 22 | ✍ Retourne toujours true : aucune autre spécialisation n'est requise. |
| `PalletFiller.initSpecialization()` | 28 | ✍ Enregistre les chemins XML sous vehicle.palletFiller (trigger de ramassage, fichier et espacement des palettes, rangée avec limites et étapes de remplissage, animations de déflecteur et de plateforme, limites de pliage, sons, nœuds d'animation) et les entrées sauvegardées d'état et d'emplacements. |
| `PalletFiller.registerFunctions(vehicleType: any)` | 90 | ✍ Enregistre sur le type de véhicule les fonctions de chargement, déchargement, achat, état, déflecteur, étape de remplissage et direction de mouvement des palettes. |
| `PalletFiller.registerOverwrittenFunctions(vehicleType: any)` | 104 | ✍ Surcharge les bascules de décharge, removeFromPhysics, l'autorisation de pliage, les informations de niveau, le test d'objet monté, la vérification de poursuite de l'IA et la vérification de la moissonneuse. |
| `PalletFiller.registerEventListeners(vehicleType: any)` | 117 | ✍ S'abonne aux événements de chargement, fin de chargement, suppression, lecture/écriture de flux, mise à jour, tick de mise à jour, fin d'animation, temps de pliage et enregistrement des actions. |
| `PalletFiller:onLoad(savegame: any)` | 134 | ✍ Lit le XML : trigger de ramassage (accepte les véhicules dont le fichier de config correspond à la palette), objet de boutique de la palette, rangée avec emplacements (un nœud de joint chacun), étapes de remplissage, limites, animations, sons. Retire les écouteurs de mise à jour inutiles pour le rôle courant. |
| `PalletFiller:onLoadFinished(savegame: any)` | 280 | ✍ Remplace les emplacements de délai de chargement de la moissonneuse si loadingDelay est défini, réinitialise l'animation de plateforme, puis restaure depuis la sauvegarde l'état, le déflecteur et les emplacements de palettes (les palettes sont rattachées plus tard par identifiant unique) ou applique l'état initial. |
| `PalletFiller:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 332 | ✍ Sauvegarde l'état, l'état du déflecteur et, pour chaque emplacement occupé, l'indice, l'identifiant unique de la palette et la translation et la rotation du nœud de joint. |
| `PalletFiller:onDelete()` | 352 | ✍ Supprime le trigger de ramassage et les écouteurs de suppression, supprime les échantillons sonores et décharge toutes les palettes de leurs emplacements. |
| `PalletFiller:onReadStream(streamId: integer, connection: Connection)` | 389 | ✍ Client à la connexion : lit l'état, l'état du déflecteur et l'objet palette de chaque emplacement. |
| `PalletFiller:onWriteStream(streamId: integer, connection: Connection)` | 413 | ✍ Serveur à la connexion : écrit l'état, l'état du déflecteur et l'objet palette de chaque emplacement. |
| `PalletFiller:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 431 | ✍ Client uniquement : lit l'indicateur de mouvement et les objets palette de chaque emplacement (résolus plus tard s'ils ne sont pas encore synchronisés), démarre ou arrête animation et son, et rafraîchit déflecteur et textes d'action. |
| `PalletFiller:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 472 | ✍ Serveur uniquement : quand le drapeau dirty est levé, écrit l'indicateur de mouvement et l'objet palette de chaque emplacement. |
| `PalletFiller:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 492 | ✍ Serveur uniquement : rattache les palettes de la sauvegarde, ramasse une palette à la fois depuis le trigger en état LOADING, choisit l'étape de remplissage et le point de décharge, puis interpole ou déplace chaque joint de palette, décharge en état UNLOADING, repasse seul en IDLE et met à jour l'indicateur de mouvement. |
| `PalletFiller:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 679 | ✍ Pour le joueur actif avec l'outil en marche et inactif, affiche un avertissement clignotant si aucune palette n'a de capacité libre. Sur les clients, résout aussi les identifiants de palettes pas encore synchronisés. |
| `PalletFiller:onFinishAnimation(name: any)` | 717 | ✍ À la fin de l'animation de plateforme, rafraîchit l'état du déflecteur. |
| `PalletFiller:onFoldTimeChanged(name: any)` | 726 | ✍ Rafraîchit les textes d'action quand le temps de pliage change. |
| `PalletFiller:loadPalletFillerPallet(object: any, data: any)` | 732 | ✍ Prend un véhicule palette dans un emplacement libre (ou celui indiqué par la table de données) : crée un joint physique avec les limites de départ, passe le type de montage en dynamique et lance l'interpolation de ramassage sauf en restauration de sauvegarde. Retourne true si un emplacement a été utilisé. À noter : le test de rotation compare la valeur x normalisée à pi/2, ce qui semble douteux. |
| `PalletFiller:unloadPalletFillerPallet(object: any)` | 802 | ✍ Libère l'emplacement contenant la palette donnée, supprime son joint, remet le type de montage de la palette à NONE, puis lève le drapeau de mise à jour et rafraîchit les textes d'action. |
| `PalletFiller:buyPalletFillerPallets(noEventSend: any)` | 827 | ✍ Serveur : fait apparaître une nouvelle palette dans chaque emplacement vide via VehicleLoadingData. Client : marque les emplacements en attente et envoie PalletFillerBuyPalletEvent sauf si noEventSend vaut true. |
| `PalletFiller.onCreatePalletFinished(self: any, vehicles: any, vehicleLoadState: any, arguments: any)` | 871 | ✍ Callback de chargement d'une palette achetée : la remet dans la physique, la charge dans son emplacement et, en cas de succès, débite le prix de boutique de la ferme propriétaire (PURCHASE_PALLETS) ; sinon supprime le véhicule. |
| `PalletFiller:getCanChangePalletFillerState(newState: any)` | 905 | ✍ Vérifie si le changement d'état demandé est autorisé (emplacements libres ou occupés, outil abaissé si requis, pliage dans les limites, pas de déchargement en cours). Retourne false, avec un texte d'avertissement si pertinent. |
| `PalletFiller:getCanBuyPalletFillerPallets()` | 959 | ✍ Retourne true si le temps de pliage est dans les limites ; sinon false avec un avertissement de dépliage de l'outil. |
| `PalletFiller:setPalletFillerState(state: any, updateAnimations: any, noEventSend: any)` | 971 | ✍ Fixe l'état et joue l'animation de plateforme vers le temps correspondant (0 chargement, 1 déchargement, temps médian au repos). Rafraîchit les textes d'action et envoie PalletFillerStateEvent sauf si noEventSend vaut true. |
| `PalletFiller.updatePalletFillerDeflectorState(self: any)` | 1000 | ✍ Fonction statique : active le déflecteur tant que la plateforme n'est pas à sa position médiane ou que des palettes bougent, et applique le changement si nécessaire. |
| `PalletFiller:setPalletFillerDeflectorState(state: any, updateAnimations: any)` | 1016 | ✍ Mémorise l'état du déflecteur et joue son animation en avant ou en arrière ; peut optionnellement placer l'animation immédiatement à sa fin. |
| `PalletFiller:getPalletFillerFillStep()` | 1030 | ✍ Retourne l'étape de remplissage du premier emplacement dont la palette a encore de la capacité ; sinon celle du premier emplacement vide, sinon la première étape. |
| `PalletFiller:getPalletFillerMovementDirection()` | 1057 | ✍ Retourne 1 en LOADING, -1 en UNLOADING et 0 sinon. |
| `PalletFiller:getCanToggleDischargeToObject(superFunc: any)` | 1070 | ✍ Toujours false : la décharge vers un objet ne peut pas être basculée sur cet outil. |
| `PalletFiller:getCanToggleDischargeToGround(superFunc: any)` | 1076 | ✍ Toujours false : la décharge au sol ne peut pas être basculée sur cet outil. |
| `PalletFiller:removeFromPhysics(superFunc: any)` | 1082 | ✍ Décharge toutes les palettes de leurs emplacements avant que le parent retire le véhicule de la physique. |
| `PalletFiller:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 1097 | ✍ Interdit le pliage sauf si l'état est IDLE et que tous les emplacements sont vides sans palette en attente, avec un texte d'avertissement ; sinon délègue au parent. |
| `PalletFiller:getFillLevelInformation(superFunc: any, display: any)` | 1116 | ✍ Appelle le parent, puis ajoute une entrée HUD cumulant niveau et capacité de toutes les palettes des emplacements, avec le dernier type de remplissage connu. |
| `PalletFiller:getHasObjectMounted(superFunc: table, object: table) → boolean` | 1142 | ✍ Retourne true si le parent trouve l'objet, ou s'il s'agit d'une palette d'un emplacement ou s'il est monté sur l'une d'elles. |
| `PalletFiller:getCanAIImplementContinueWork(superFunc: any, isTurning: any)` | 1167 | ✍ Si les palettes chargées n'ont plus de capacité libre, arrête l'IA avec un message de palettes pleines, ou de palettes absentes quand aucune n'est chargée ; sinon délègue au parent. |
| `PalletFiller:verifyCombine(superFunc: any, fruitType: any, outputFillType: any, ...: any)` | 1190 | ✍ Rejette le type de sortie si une palette chargée ne l'accepte pas (en retournant le type de la palette), retourne nil s'il ne reste aucune capacité, sinon délègue au parent. |
| `PalletFiller:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 1217 | ✍ Client : enregistre les événements d'action de chargement, de déchargement de la plateforme et d'achat de palettes (ce dernier seulement si un objet de boutique existe) et rafraîchit leurs textes. |
| `PalletFiller.updateActionEventTexts(self: any)` | 1244 | ✍ Fonction statique : fixe le texte et la visibilité des actions de chargement, déchargement et achat selon l'état, les transitions permises et le nombre d'emplacements vides. |
| `PalletFiller.actionEventLowerPlatformLoad(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1307 | ✍ Callback d'entrée : bascule entre IDLE et LOADING si autorisé, sinon affiche l'avertissement dans un message clignotant. |
| `PalletFiller.actionEventLowerPlatformUnload(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1321 | ✍ Callback d'entrée : bascule entre IDLE et UNLOADING si autorisé, sinon affiche l'avertissement dans un message clignotant. |
| `PalletFiller.actionEventBuyPallets(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1335 | ✍ Callback d'entrée : si l'achat est autorisé, affiche un dialogue oui/non avec le nombre d'emplacements vides et le prix total, et achète les palettes sur confirmation ; sinon affiche l'avertissement. |
| `PalletFiller.onObjectDeleted(self: any, object: any)` | 1361 | ✍ Écouteur de suppression : retire l'objet supprimé des objets suivis par le trigger de ramassage, indexés par nœud racine. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadPalletFillerPallet` | 91 |
| registerFunction | `unloadPalletFillerPallet` | 92 |
| registerFunction | `buyPalletFillerPallets` | 93 |
| registerFunction | `getCanChangePalletFillerState` | 94 |
| registerFunction | `getCanBuyPalletFillerPallets` | 95 |
| registerFunction | `setPalletFillerState` | 96 |
| registerFunction | `setPalletFillerDeflectorState` | 97 |
| registerFunction | `getPalletFillerFillStep` | 98 |
| registerFunction | `getPalletFillerMovementDirection` | 99 |
| registerOverwrittenFunction | `getCanToggleDischargeToObject` | 105 |
| registerOverwrittenFunction | `getCanToggleDischargeToGround` | 106 |
| registerOverwrittenFunction | `removeFromPhysics` | 107 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 108 |
| registerOverwrittenFunction | `getFillLevelInformation` | 109 |
| registerOverwrittenFunction | `getHasObjectMounted` | 110 |
| registerOverwrittenFunction | `getCanAIImplementContinueWork` | 111 |
| registerOverwrittenFunction | `verifyCombine` | 112 |
| registerEventListener | `onLoad` | 118 |
| registerEventListener | `onLoadFinished` | 119 |
| registerEventListener | `onDelete` | 120 |
| registerEventListener | `onReadStream` | 121 |
| registerEventListener | `onWriteStream` | 122 |
| registerEventListener | `onReadUpdateStream` | 123 |
| registerEventListener | `onWriteUpdateStream` | 124 |
| registerEventListener | `onUpdate` | 125 |
| registerEventListener | `onUpdateTick` | 126 |
| registerEventListener | `onFinishAnimation` | 127 |
| registerEventListener | `onFoldTimeChanged` | 128 |
| registerEventListener | `onRegisterActionEvents` | 129 |

# handTools/specializations/HandToolSprayCan.lua

*[English version](../../../../scripts/handTools/specializations/HandToolSprayCan.md)*

Source: `dataS/scripts/handTools/specializations/HandToolSprayCan.lua` — FS25 1.25.1.0

✍ Spécialisation d'outil à main pour la bombe de marquage d'arbres. Le joueur vise un arbre (split shape) à courte distance ; un SprayCanEvent s'exécute sur le serveur et le marqueur est appliqué via le système de marqueurs d'arbres de la mission après un délai. Le nombre de marqueurs restants est sauvegardé et synchronisé vers les clients. Plusieurs types de marqueur peuvent être parcourus.

- **HandToolSprayCan** (l.10)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HandToolSprayCan.registerXMLPaths(xmlSchema: any)` | 16 | ✍ Enregistre les attributs de `handTool.sprayCan` (nœud de secousse, emplacement de matériau coloré, couleur, distance, délai, nombre total de marqueurs) ainsi que le son et les effets de pulvérisation. |
| `HandToolSprayCan.registerSavegameXMLPaths(savegameXMLSchema: any, baseKey: any)` | 31 | ✍ Enregistre la clé de sauvegarde `sprayCan#remainingNumMarkers`. |
| `HandToolSprayCan.registerFunctions(handToolType: any)` | 37 | ✍ Enregistre `tryToAddTreeMarker`, `processDelayedMarker`, `setIsSpraying`, `changeTreeMarkerType`, `getIsSprayingAllowed` et `activateSpraying`. |
| `HandToolSprayCan.registerEventListeners(handToolType: any)` | 48 | ✍ Abonne la spécialisation aux événements de chargement, post-chargement, suppression, mise à jour, affichage, lecture/écriture des flux complet et de mise à jour, enregistrement des actions, et début/fin de prise en main. |
| `HandToolSprayCan.prerequisitesPresent(specializations: any)` | 65 | ✍ Renvoie toujours true : aucun prérequis. |
| `HandToolSprayCan:onLoad(xmlFile: any)` | 71 | ✍ Lit le nombre de marqueurs (plage valide 1 à 255, sinon 255 avec avertissement), la couleur, la distance de détection (1,5 par défaut), le délai, l'emplacement de couleur et le nœud de secousse ; charge les effets (type eau) et le son ; résout le type de marqueur et les réticules. Renvoie true. |
| `HandToolSprayCan:onPostLoad(savegame: any)` | 146 | ✍ Restaure `remainingNumMarkers` depuis la sauvegarde, borné entre 1 et le maximum, si la clé `sprayCan` existe. |
| `HandToolSprayCan:onDelete()` | 158 | ✍ Applique un éventuel marqueur différé en attente, puis libère les effets, le son de pulvérisation et les deux réticules. |
| `HandToolSprayCan:onWriteStream(streamId: any, connection: any, dirtyMask: any)` | 184 | ✍ Synchronisation initiale serveur vers client : écrit le nombre de marqueurs restants sur un octet. |
| `HandToolSprayCan:onReadStream(streamId: any, connection: any, carryingPlayer: any)` | 193 | ✍ Côté client : lit le nombre de marqueurs restants envoyé par le serveur. |
| `HandToolSprayCan:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 202 | ✍ Serveur vers client : quand l'indicateur de modification est actif, écrit le nombre de marqueurs restants sur un octet. |
| `HandToolSprayCan:onReadUpdateStream(streamId: any, timestamp: any, connection: any, carryingPlayer: any)` | 214 | ✍ Côté client : lit le nombre de marqueurs restants si l'indicateur de mise à jour est actif. |
| `HandToolSprayCan:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 225 | ✍ Sauvegarde le nombre de marqueurs restants dans `#remainingNumMarkers` sous la clé donnée. |
| `HandToolSprayCan:onUpdate(dt: any)` | 233 | ✍ Pour le joueur propriétaire, lit l'arbre visé et, à un nouvel appui, envoie un SprayCanEvent au serveur s'il reste des marqueurs et que le terrain est accessible ; sinon affiche un avertissement clignotant. Traite aussi le marqueur différé, anime la secousse et arrête la pulvérisation après sa durée. |
| `HandToolSprayCan:onDraw()` | 302 | ✍ Affiche l'icône du type de marqueur et, si un arbre est visé, le réticule d'arbre. N'affiche rien sans type de marqueur ou sans marqueur restant. |
| `HandToolSprayCan:onHeldStart()` | 324 | ✍ Pour le joueur propriétaire, ajoute un type de cible TREE (0,5 minimum, distance de détection) avec un filtre ne gardant que les maillages split shape. |
| `HandToolSprayCan:onRegisterActionEvents()` | 367 | ✍ Enregistre SPRAYCAN_CHANGE_MARKER (change le type de marqueur) et ACTIVATE_HANDTOOL (pulvériser), avec textes et priorité. Ignoré si l'outil n'est pas actif pour les entrées. |
| `HandToolSprayCan:activateSpraying(_: any, inputValue: any)` | 382 | ✍ Rappel d'entrée : enregistre si l'entrée d'activation est appuyée pour cette image. |
| `HandToolSprayCan:tryToAddTreeMarker(treeMarkerTypeIndex: any, splitShapeId: any, x: any, y: any, z: any, hitX: any, hitY: any, hitZ: any)` | 389 | ✍ Appelée au traitement de l'événement côté serveur : lance l'animation de pulvérisation, décrémente les marqueurs restants, signale la synchronisation sur le serveur et, si un arbre est fourni et autorisé, mémorise un marqueur différé à appliquer après `sprayDelay`. |
| `HandToolSprayCan:processDelayedMarker()` | 419 | ✍ Applique le marqueur différé en attente via le système de marqueurs d'arbres (basé sur la caméra, avec la couleur de la bombe) si la forme existe encore, puis l'efface. |
| `HandToolSprayCan:setIsSpraying(isSpraying: any, force: any)` | 445 | ✍ Démarre ou arrête les effets et le son de pulvérisation. Le démarrage exige que l'outil soit tenu et fixe la fin de la secousse ; l'arrêt peut réinitialiser les effets si `force` est true. |
| `HandToolSprayCan:changeTreeMarkerType(_: any, inputValue: any)` | 470 | ✍ Rappel d'entrée : passe au type de marqueur suivant (retour à 1 en fin de liste) et recrée le réticule d'icône du marqueur. |
| `HandToolSprayCan:getIsSprayingAllowed(shape: any)` | 490 | ✍ Renvoie true sans forme ; sinon true uniquement si la ferme du joueur local a accès au terrain à la position de la forme. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `tryToAddTreeMarker` | 38 |
| registerFunction | `processDelayedMarker` | 39 |
| registerFunction | `setIsSpraying` | 40 |
| registerFunction | `changeTreeMarkerType` | 41 |
| registerFunction | `getIsSprayingAllowed` | 42 |
| registerFunction | `activateSpraying` | 43 |
| registerEventListener | `onLoad` | 49 |
| registerEventListener | `onPostLoad` | 50 |
| registerEventListener | `onDelete` | 51 |
| registerEventListener | `onUpdate` | 52 |
| registerEventListener | `onDraw` | 53 |
| registerEventListener | `onWriteStream` | 54 |
| registerEventListener | `onReadStream` | 55 |
| registerEventListener | `onWriteUpdateStream` | 56 |
| registerEventListener | `onReadUpdateStream` | 57 |
| registerEventListener | `onRegisterActionEvents` | 58 |
| registerEventListener | `onHeldStart` | 59 |
| registerEventListener | `onHeldEnd` | 60 |

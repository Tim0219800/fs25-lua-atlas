# vehicles/specializations/BaleGrab.lua

*[English version](../../../../scripts/vehicles/specializations/BaleGrab.md)*

Source: `dataS/scripts/vehicles/specializations/BaleGrab.lua` — FS25 1.25.1.0

✍ Spécialisation des pinces à balles (outils de chargeur frontal ou de télescopique) qui retiennent les balles en les montant dynamiquement une fois les bras fermés. Tout se passe côté serveur : un nœud trigger recense les balles à portée et les décalages des joints de composant (rotation ou translation) indiquent la fermeture de chaque pince. La fermeture est aussi temporisée et peut bloquer des outils mobiles configurés. Elle enregistre en plus deux valeurs de boutique (tailles de balles rondes et carrées). Lit les clés XML `vehicle.baleGrab`. La constante `BaleGrab.CLOSE_TIMER` est utilisée mais non définie dans ce fichier (NON VÉRIFIÉ : où elle est fixée).

- **BaleGrab** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BaleGrab.prerequisitesPresent(specializations: any)` | 17 | ✍ Renvoie toujours true : cette spécialisation n'exige aucune autre spécialisation. |
| `BaleGrab.initSpecialization()` | 23 | ✍ Enregistre les clés XML `vehicle.baleGrab` dans le schéma (tailles, trigger, type de montage, joint et outils mobiles de chaque pince) et déclare les deux types de spécifications de boutique pour les balles rondes et carrées. |
| `BaleGrab.registerFunctions(vehicleType: any)` | 58 | ✍ Ajoute au type de véhicule les fonctions de la pince : callback du trigger, ajout/retrait d'objet monté dynamiquement, test de fermeture, montage et démontage d'une balle. |
| `BaleGrab.registerOverwrittenFunctions(vehicleType: any)` | 69 | ✍ Surcharge `getMovingToolMoveValue` pour pouvoir bloquer les outils mobiles de fermeture pendant qu'une balle est saisie. |
| `BaleGrab.registerEventListeners(vehicleType: any)` | 75 | ✍ S'abonne aux événements onLoad, onPostLoad, onDelete et onUpdateTick. |
| `BaleGrab:onLoad(savegame: table)` | 85 | ✍ Serveur uniquement : lit le trigger, le nœud racine, le type de montage, l'accélération de force et chaque pince (index de joint, axe et seuil de rotation ou de translation, outils mobiles). Crée un nœud de joint et le trigger. Sans trigger, retire les autres écouteurs. |
| `BaleGrab:onPostLoad(savegame: any)` | 190 | ✍ Convertit les nœuds d'outils mobiles de chaque pince en véritables outils mobiles et supprime ceux qui n'ont pas de correspondance. |
| `BaleGrab:onDelete()` | 206 | ✍ Retire les écouteurs de suppression et d'état de montage des balles en attente, démonte tous les objets montés et supprime le trigger. |
| `BaleGrab:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 239 | ✍ Serveur uniquement : pour chaque pince, gère la temporisation de fermeture et une somme de contrôle du joint pour que de petits chocs ne changent pas l'état. Quand toutes les pinces sont fermées, monte les balles en attente et augmente l'amortissement du joint ; sinon les démonte et rétablit l'amortissement. |
| `BaleGrab:getMovingToolMoveValue(superFunc: any, movingTool: any)` | 326 | ✍ Surcharge : renvoie la valeur de déplacement normale, mais force 0 quand une balle est en attente et que l'outil va dans le sens de fermeture pendant que la temporisation tourne. Mémorise aussi la dernière valeur. |
| `BaleGrab:addDynamicMountedObject(object: table)` | 351 | ✍ Enregistre un objet dans la table des objets actuellement montés sur la pince. |
| `BaleGrab:removeDynamicMountedObject(object: table, isDeleting: boolean)` | 360 | ✍ Appelle `unmountDynamic` sur l'objet s'il est monté dynamiquement et l'oublie. Avec `isDeleting`, il est aussi retiré de la liste des objets en attente. |
| `BaleGrab.onPendingObjectDelete(self: any, object: any)` | 375 | ✍ Écouteur de suppression : quand un objet en attente ou monté est supprimé, le retire de la pince avec l'indicateur de suppression. |
| `BaleGrab.onPendingObjectMountStateChanged(self: any, object: any, mountState: any, mountObject: any)` | 384 | ✍ Écouteur d'état de montage : si l'objet est monté par autre chose que cette pince, il est retiré des tables d'attente et de montage de la pince. |
| `BaleGrab:baleGrabTriggerCallback(triggerId: integer, otherActorId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 401 | ✍ Callback du trigger. À l'entrée, compte les formes d'un objet montable (gérant les écouteurs d'état de montage) et enregistre des écouteurs à la première forme. À la sortie, décrémente le compteur et relâche l'objet à zéro. |
| `BaleGrab:getIsBaleGrabClosed(grab: any)` | 429 | ✍ Renvoie true quand une pince est fermée : false si ses outils mobiles sont totalement ouverts, sinon true si le décalage du joint dépasse le seuil de rotation ou de translation. Met à jour les décalages en cache. |
| `BaleGrab:mountBaleGrabObject(object: table) → boolean` | 478 | ✍ Place le nœud de joint au centre de masse de l'objet et appelle `mountDynamic`. En cas de succès, règle les ressorts du joint, enregistre l'objet comme monté et renvoie true. |
| `BaleGrab:unmountBaleGrabObject(object: table) → boolean` | 503 | ✍ Libère un objet monté de la pince (sans l'indicateur de suppression). Renvoie toujours true. |
| `BaleGrab:updateDebugValues(values: any)` | 511 | ✍ Serveur uniquement : ajoute des lignes de debug à la table fournie : décalage, seuil et état par pince, direction des outils mobiles (avec indicateur de blocage), et objets en attente ou montés. |
| `BaleGrab.loadSpecValueMaxSize(xmlFile: any, minKey: any, maxKey: any)` | 572 | ✍ Lit une taille min et une taille max depuis deux clés XML, arrondies à 2 décimales. Renvoie une table minSize/maxSize, ou nil si les deux valent 0. |
| `BaleGrab.loadSpecValueMaxSizeRound(xmlFile: any, customEnvironment: any, baseDir: any)` | 585 | ✍ Chargeur de boutique pour les tailles de balles rondes, via `vehicle.baleGrab#minSizeRound` et `#maxSizeRound`. |
| `BaleGrab.loadSpecValueMaxSizeSquare(xmlFile: any, customEnvironment: any, baseDir: any)` | 591 | ✍ Chargeur de boutique pour les tailles de balles carrées, via `vehicle.baleGrab#minSizeSquare` et `#maxSizeSquare`. |
| `BaleGrab.getSpecValueMaxSize(specName: any, storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 597 | ✍ Met en forme la taille de balle stockée pour la boutique, en cm (valeurs multipliées par 100). Renvoie un texte (plage ou valeur unique), ou les nombres bruts et l'unité si `returnValues` est vrai. |
| `BaleGrab.getSpecValueMaxSizeRound(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 625 | ✍ Accesseur boutique pour la taille des balles rondes ; délègue à `getSpecValueMaxSize` avec la spec `baleGrabMaxSizeRound`. |
| `BaleGrab.getSpecValueMaxSizeSquare(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 631 | ✍ Accesseur boutique pour la taille des balles carrées ; délègue à `getSpecValueMaxSize` avec la spec `baleGrabMaxSizeSquare`. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `baleGrabTriggerCallback` | 59 |
| registerFunction | `addDynamicMountedObject` | 60 |
| registerFunction | `removeDynamicMountedObject` | 61 |
| registerFunction | `getIsBaleGrabClosed` | 62 |
| registerFunction | `mountBaleGrabObject` | 63 |
| registerFunction | `unmountBaleGrabObject` | 64 |
| registerOverwrittenFunction | `getMovingToolMoveValue` | 70 |
| registerEventListener | `onLoad` | 76 |
| registerEventListener | `onPostLoad` | 77 |
| registerEventListener | `onDelete` | 78 |
| registerEventListener | `onUpdateTick` | 79 |

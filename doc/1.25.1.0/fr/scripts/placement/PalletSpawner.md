# placement/PalletSpawner.lua

*[English version](../../../scripts/placement/PalletSpawner.md)*

Source: `dataS/scripts/placement/PalletSpawner.lua` — FS25 1.25.1.0

✍ Assistant détenu par un point de production, une boutique ou un placeable similaire, qui fait apparaître des véhicules palettes sur des emplacements définis. Il charge emplacements et palettes depuis le XML, associe les types de remplissage aux fichiers de palettes, met les demandes en file et les traite une à une via le PlacementManager et VehicleLoadingData. L'apparition se fait côté autorité (serveur) ; les codes de résultat comme PALLET_LIMITED_REACHED et RESULT_SUCCESS sont définis hors de ce fichier (NON VÉRIFIÉ).

- **PalletSpawner** (l.19)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PalletSpawner.new(baseDirectory: any, customMt: any)` | 23 | ✍ Crée un spawner avec une file vide et le répertoire de base servant à résoudre les chemins de palettes. Fixe un décalage vertical d'apparition de 0,2 si la plateforme a des palettes dynamiques, sinon 0. |
| `PalletSpawner:load(components: table, xmlFile: table, key: string, customEnv: string, i3dMappings: table) → boolean` | 42 | ✍ Lit les entrées `spawnPlaces.spawnPlace` (éventuellement limitées par `#fillTypes` ou `#fillTypeCategories`, pas les deux) et les palettes : d'abord la palette par défaut de chaque type de remplissage, puis les entrées `pallets.pallet#filename`, qui la remplacent. Renvoie false avec une erreur XML s'il n'y a aucun emplacement. |
| `PalletSpawner:delete()` | 98 | ✍ Point de nettoyage vide ; rien n'est libéré ici. |
| `PalletSpawner:loadPalletFromFilename(palletFilename: any, limitFillTypeId: any)` | 103 | ✍ Charge le XML d'un véhicule palette, lit sa taille, sa capacité et ses types de remplissage pris en charge, et l'enregistre pour ces types (ou seulement `limitFillTypeId`). Renvoie la table de la palette, ou nil si le fichier ne se charge pas ou si aucun type ne correspond. |
| `PalletSpawner:getSupportedFillTypes()` | 140 | ✍ Renvoie la table associant les identifiants de types de remplissage à leur définition de palette. |
| `PalletSpawner:spawnPallet(farmId: integer, fillTypeId: integer, callback: function, callbackTarget: table)` | 149 | ✍ Met en file une palette pour la ferme et le type de remplissage et enregistre le spawner comme updateable. Appelle aussitôt le callback avec un code d'erreur si la limite d'emplacements de palettes est atteinte ou si aucune palette n'existe pour ce type. |
| `PalletSpawner:getOrSpawnPallet(farmId: integer, fillTypeId: integer, callback: function, callbackTarget: table)` | 170 | ✍ Cherche sur les emplacements une palette existante non pleine du type de remplissage (test de chevauchement physique) et la signale avec PALLET_ALREADY_PRESENT ; sinon bascule sur spawnPallet. Le résultat passe par le callback. |
| `PalletSpawner:getAllPallets(fillTypeId: integer, callbackFunc: function, callbackTarget: table)` | 196 | ✍ Teste par chevauchement les emplacements pour trouver les palettes contenant actuellement le type de remplissage donné et les passe en liste, avec l'identifiant du type, au callback de façon synchrone. |
| `PalletSpawner:update(dt: any)` | 214 | ✍ Étape par image : au repos, prend la première demande en file et demande de façon asynchrone au gestionnaire de placement un emplacement libre. Retire le spawner des updateables quand la file est vide. |
| `PalletSpawner:onSpawnSearchFinished(location: any)` | 233 | ✍ Callback de placement. Si un emplacement est trouvé, impose un Y au moins égal à la hauteur du terrain plus le décalage et charge la palette comme véhicule possédé (paramètre spawnEmpty). Sinon, signale RESULT_NO_SPACE et retire la demande. |
| `PalletSpawner:onFinishLoadingPallet(vehicles: any, vehicleLoadState: any)` | 261 | ✍ Callback de chargement du véhicule : signale le premier véhicule chargé avec succès, ou un code d'erreur si l'état n'est pas OK, puis retire la demande en cours pour que la suivante démarre. |
| `PalletSpawner:onFindExistingPallet(node: any)` | 271 | ✍ Callback de chevauchement : retient une palette qui prend en charge le type voulu et a encore de la capacité libre dans l'unité 1, la stocke et renvoie false pour arrêter les notifications suivantes. |
| `PalletSpawner:onFindPallet(node: any)` | 285 | ✍ Callback de chevauchement : collecte dans un ensemble indexé par véhicule les palettes dont l'unité de remplissage contient actuellement le type voulu. |
| `PalletSpawner.registerXMLPaths(schema: any, basePath: any)` | 297 | ✍ Enregistre `spawnPlaces.spawnPlace(?)#fillTypes` et `#fillTypeCategories`, les clés de place de PlacementUtil, et `pallets.pallet(?)#filename` sous le chemin de base. |

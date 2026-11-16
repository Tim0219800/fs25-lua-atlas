# vehicles/specializations/Crawlers.lua

*[English version](../../../../scripts/vehicles/specializations/Crawlers.md)*

Source: `dataS/scripts/vehicles/specializations/Crawlers.lua` — FS25 1.25.1.0

✍ Spécialisation pour les véhicules à chenilles. Pour chaque chenille de la configuration de roues active, elle charge un XML et un i3d externes (chargement partagé), les lie entre deux roues ou à un noeud, puis anime le défilement des textures de chenille via des paramètres de shader et les pièces rotatives d'après la vitesse de roues ou d'un noeud de référence. Elle gère aussi les noeuds lavables (saleté, boue, neige), des obstacles d'eau peu profonde optionnels et les effets d'eau des roues. Nécessite Wheels. Crawlers.getVRamUsageFromXML est référencée dans initSpecialization mais non définie dans ce fichier (NON VÉRIFIÉ), et les constantes MAX_UPDATE_DISTANCE ne sont pas visibles.

- **Crawlers** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Crawlers.prerequisitesPresent(specializations: table) → boolean` | 23 | ✍ Renvoie true seulement si le type de véhicule possède la spécialisation Wheels. |
| `Crawlers.initSpecialization()` | 29 | ✍ Enregistre un rappel d'utilisation VRAM auprès du gestionnaire de boutique, les entrées de chenilles de chaque configuration de roues, et un schéma XML 'crawler' séparé (fichier i3d, noeuds de défilement, pièces rotatives, noeuds de saleté, animations, changements d'objets) stocké dans Crawlers.xmlSchema. |
| `Crawlers.registerFunctions(vehicleType: any)` | 89 | ✍ Enregistre updateCrawler, loadCrawlerFromXML, loadCrawlerFromConfigFile, onCrawlerI3DLoaded et getCrawlerWheelMovedDistance. |
| `Crawlers.registerOverwrittenFunctions(vehicleType: any)` | 99 | ✍ Enregistre une surcharge de validateWashableNode. |
| `Crawlers.registerEventListeners(vehicleType: any)` | 105 | ✍ S'abonne aux événements de chargement, fin de chargement, suppression, mise à jour et changement de configuration de roues. |
| `Crawlers:onLoad(savegame: table)` | 116 | ✍ Charge chaque chenille définie dans la configuration de roues active via loadCrawlerFromXML et prépare les tables des requêtes i3d partagées et des handles XML. |
| `Crawlers:onLoadFinished(savegame: table)` | 133 | ✍ Retire l'écouteur de mise à jour si aucune chenille n'est chargée ; sinon applique le matériau de jante de chaque chenille aux matériaux interne et externe et force un updateCrawler initial. |
| `Crawlers:onDelete()` | 151 | ✍ Supprime les handles XML en attente, retire les obstacles d'eau peu profonde de la simulation, vide la liste des chenilles et libère les requêtes de chargement i3d partagées. |
| `Crawlers:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 184 | ✍ Met à jour chaque chenille tant que le véhicule est à moins de Crawlers.MAX_UPDATE_DISTANCE (valeur absente de ce fichier) du joueur ; au-delà, efface la dernière position mémorisée. |
| `Crawlers:onWheelConfigurationChanged()` | 198 | ✍ Remet à 0 la saleté du noeud lavable de chaque chenille quand la configuration de roues change. |
| `Crawlers:updateCrawler(crawler: any, dt: any)` | 210 | ✍ Calcule la distance parcourue (depuis le noeud de référence de vitesse ou la rotation des roues), fait défiler les paramètres de shader de la chenille, tourne les pièces rotatives et, dans la distance d'alignement, repositionne et oriente le noeud de liaison entre les deux roues de référence. |
| `Crawlers:loadCrawlerFromXML(xmlFile: XMLFile, key: any)` | 299 | ✍ Lit une entrée de chenille : noeud de liaison ou deux roues de liaison, côté, largeur, décalage, roues ou noeud de référence de vitesse, facteurs de saleté et d'humidité, obstacle d'eau peu profonde dimensionné d'après les roues, matériau de jante, puis lance le chargement du fichier de config externe. Ne renvoie rien ; ignore la chenille avec avertissement sans noeud de liaison. |
| `Crawlers:loadCrawlerFromConfigFile(crawler: any, xmlFilename: any, linkNode: any)` | 482 | ✍ Ouvre le XML de config de la chenille et demande l'i3d partagé qu'il désigne ; onCrawlerI3DLoaded est appelée quand il est prêt. Journalise des avertissements et nettoie si le XML ou le nom de l'i3d manque. |
| `Crawlers:onCrawlerI3DLoaded(i3dNode: any, failedReason: any, args: any)` | 510 | ✍ Rappel du chargement i3d partagé : lie le noeud de chenille gauche ou droit, applique le décalage, charge noeuds de défilement, pièces rotatives, noeuds de saleté, changements d'objets et animations (ajoutées à la table d'animations du véhicule) et enregistre la chenille. À noter : le return anticipé sur un paramètre de shader précédent manquant saute le nettoyage de fin de fonction. |
| `Crawlers:getCrawlerWheelMovedDistance(crawler: table, lastName: string, useOnlyRotation: boolean) → number` | 654 | ✍ Renvoie, parmi les roues de la chenille en contact avec le sol, la plus petite différence de rotation ou distance parcourue depuis le dernier appel (stockée sous lastName) ; le signe donne le sens et 0 signifie aucune roue valide. |
| `Crawlers:validateWashableNode(superFunc: any, node: any)` | 708 | ✍ Pour les noeuds de saleté/neige et les meshes de boue de la chenille, renvoie false avec la fonction de mise à jour de saleté ou de boue de la roue et ses données (multiplicateurs, rappels de sauvegarde de la neige) ; les autres noeuds vont au parent. L'état de neige utilise g_currentMission.environment:getDirtColors, dont le code n'est pas dans le dump (NON VÉRIFIÉ). |
| `Crawlers.getShallowWaterParameters(crawler: any)` | 807 | ✍ Rappel de l'obstacle d'eau peu profonde : renvoie la vitesse x/z issue de la vitesse signée du véhicule, une perturbation aléatoire quand la roue patine ou avance, et la rotation Y du noeud de liaison. À noter : 'math.random() * 2 - 1 * slip' ne multiplie que le 1 par slip à cause de la priorité des opérateurs. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `updateCrawler` | 90 |
| registerFunction | `loadCrawlerFromXML` | 91 |
| registerFunction | `loadCrawlerFromConfigFile` | 92 |
| registerFunction | `onCrawlerI3DLoaded` | 93 |
| registerFunction | `getCrawlerWheelMovedDistance` | 94 |
| registerOverwrittenFunction | `validateWashableNode` | 100 |
| registerEventListener | `onLoad` | 106 |
| registerEventListener | `onLoadFinished` | 107 |
| registerEventListener | `onDelete` | 108 |
| registerEventListener | `onUpdate` | 109 |
| registerEventListener | `onWheelConfigurationChanged` | 110 |

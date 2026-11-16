# gui/base/MapOverlayGenerator.lua

*[English version](../../../../scripts/gui/base/MapOverlayGenerator.md)*

Source: `dataS/scripts/gui/base/MapOverlayGenerator.lua` — FS25 1.25.1.0

✍ Construit les overlays basés sur les density maps affichés sur la carte en jeu : cultures, stades de croissance, états du sol, parcelles, une parcelle seule et la couche de champs de la minicarte. Trois handles d'overlay de visualisation du moteur sont réutilisés ; la génération est asynchrone, signalée par un callback et sondée dans `update`. Dépend des gestionnaires de fruits, de types de remplissage, de parcelles et de fermes, du système de mauvaises herbes et du système de sol des champs. Des aides comme `buildFieldMapOverlay` et les tables de constantes ne sont pas définies dans ce fichier (NON VÉRIFIÉ).

- **MapOverlayGenerator** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `MapOverlayGenerator.new(l10n: table, fruitTypeManager: table, fillTypeManager: table, farmlandManager: table, farmManager: table, weedSystem: table) → MapOverlayGenerator` | 50 | ✍ Constructeur prenant l10n, les gestionnaires de fruits, de types de remplissage, de parcelles et de fermes, et le système de mauvaises herbes. Crée les overlays de density map foliage, parcelles et champs à une résolution ajustée, ainsi que les tables type vers constructeur et type vers handle. |
| `MapOverlayGenerator:delete()` | 103 | ✍ Réinitialise toute génération en cours et supprime les trois overlays moteur (état du feuillage, état des parcelles, champs). |
| `MapOverlayGenerator:adjustedOverlayResolution(default: any, limitToTwo: any)` | 121 | ✍ Met à l'échelle une résolution {l, h} par défaut selon la classe de performance : inchangée en bas de gamme, x4 en haut de gamme (sauf limite, mobile ou cas dépendant de la mission tronqué dans ce dump), sinon x2. |
| `MapOverlayGenerator:setMissionFruitTypes(missionFruitTypes: any)` | 137 | ✍ Mémorise les types de fruits de la mission (id de feuillage, indice, shownOnMap, couleurs par défaut et daltoniennes) et reconstruit les listes d'affichage des cultures, croissance et sols. |
| `MapOverlayGenerator:setColorBlindMode(isColorBlindMode: any)` | 163 | ✍ Définit l'indicateur choisissant les palettes daltoniennes pour les overlays générés ensuite ; aucun overlay n'est régénéré. |
| `MapOverlayGenerator:buildFruitTypeMapOverlay(fruitTypeFilter: any)` | 174 | ✍ Applique la couleur de type sur l'overlay de feuillage pour chaque culture affichée dont le fruit est activé dans le filtre et possède un id de feuillage valide. |
| `MapOverlayGenerator:buildFieldsOverlay(fruitTypeFilter: any)` | 189 | ✍ Constructeur du type d'overlay des champs ; il délègue seulement à `buildFieldMapOverlay`, non défini dans ce fichier (NON VÉRIFIÉ). L'argument de filtre est inutilisé. |
| `MapOverlayGenerator:buildGrowthStateMapOverlay(growthStateFilter: any, fruitTypeFilter: any)` | 195 | ✍ Colorie les stades de croissance par culture (flétri, récolté, en croissance, étêtage, récoltable) selon les filtres, puis les types de sol du système de sol (cultivé, labouré, déchaumé, lit de semence et lit roulé). |
| `MapOverlayGenerator:buildSoilStateMapOverlay(soilStateFilter: any)` | 285 | ✍ Colorie les états du sol choisis dans le filtre : mauvaises herbes et cailloux (si activés dans la sauvegarde), labour requis, roulage, broyé, chaux (hors mobile), niveaux de fertilisation et arrosé, via les density maps du système de sol. |
| `MapOverlayGenerator:buildFarmlandsMapOverlay(selectedFarmland: any)` | 395 | ✍ Colorie chaque parcelle achetable : la sélectionnée avec une couleur de surbrillance, les possédées avec la couleur de la ferme propriétaire, les autres comme non possédées. Ajoute des bordures en haute performance, puis la couche des champs. |
| `MapOverlayGenerator:buildSingleFarmlandsMapOverlay(selectedFarmland: any)` | 432 | ✍ Ne met en évidence que la parcelle sélectionnée (rien si nil), puis ajoute la couche des champs. Le paramètre est une table de parcelle avec `id`, bien que l'enveloppe publique parle d'une position de carte. |
| `MapOverlayGenerator:generateOverlay(mapOverlayType: any, finishedCallback: any, overlayState: any, overlayState2: any)` | 461 | ✍ Point d'entrée interne : valide le type d'overlay, mémorise le callback, réinitialise le handle, exécute le constructeur correspondant, lance la génération moteur et vérifie une fin immédiate. Renvoie false avec un avertissement si le type est invalide. |
| `MapOverlayGenerator:generateFruitTypeOverlay(finishedCallback: any, fruitTypeFilter: any)` | 491 | ✍ Lance la génération de l'overlay des cultures ; le callback reçoit l'id de l'overlay une fois prêt. Le filtre associe un indice de fruit à un booléen. |
| `MapOverlayGenerator:generateFieldsOverlay(finishedCallback: any)` | 501 | ✍ Lance la génération de l'overlay des champs utilisé par la minicarte ; le callback reçoit l'id de l'overlay. Utilisé par `update` pour le rafraîchir périodiquement. |
| `MapOverlayGenerator:generateGrowthStateOverlay(finishedCallback: any, growthStateFilter: any, fruitTypeFilter: any)` | 512 | ✍ Lance la génération de l'overlay des stades de croissance à partir d'un filtre de stades et d'un filtre de fruits ; le callback reçoit l'id de l'overlay. |
| `MapOverlayGenerator:generateSoilStateOverlay(finishedCallback: any, soilStateFilter: any)` | 523 | ✍ Lance la génération de l'overlay des états du sol à partir d'un filtre d'états ; le callback reçoit l'id de l'overlay. |
| `MapOverlayGenerator:generateSingleFarmlandOverlay(finishedCallback: any, mapPosition: any)` | 532 | ✍ Lance la génération d'un overlay ne mettant en évidence qu'une parcelle. Le second argument est transmis au constructeur comme parcelle sélectionnée (voir `buildSingleFarmlandsMapOverlay`). |
| `MapOverlayGenerator:generateFarmlandOverlay(finishedCallback: any, mapPosition: any)` | 541 | ✍ Lance la génération de l'overlay des parcelles (toutes colorées par propriétaire) ; le second argument est la parcelle sélectionnée à mettre en évidence. |
| `MapOverlayGenerator:checkOverlayFinished()` | 547 | ✍ Si un overlay est en cours de génération et que le moteur le déclare prêt, appelle le callback de fin avec le handle et efface le handle courant. |
| `MapOverlayGenerator:reset()` | 558 | ✍ Réinitialise les trois overlays moteur et oublie la génération en cours ; le callback en attente n'est pas appelé. |
| `MapOverlayGenerator:update(dt: any)` | 568 | ✍ Mise à jour par image : si aucun rafraîchissement des champs n'est en cours et que le minuteur est écoulé, régénère l'overlay des champs et planifie le suivant, puis appelle `checkOverlayFinished`. |
| `MapOverlayGenerator:getDisplayCropTypes()` | 593 | ✍ Construit la liste des entrées d'affichage des cultures (couleurs par mode daltonien, icône, UV, titre, indice de fruit, id de feuillage) pour les fruits visibles sur la carte. Prévu pour être surchargé par des mods. |
| `MapOverlayGenerator:getDisplayGrowthStates() → array` | 625 | ✍ Renvoie la table de légende des stades de croissance (couleurs par mode daltonien et description localisée) pour cultivé, déchaumé, lit de semence, croissance, récolte, récolté, étêtage et labouré, plus flétri si la plateforme le gère. |
| `MapOverlayGenerator:getDisplaySoilStates() → array` | 699 | ✍ Construit la légende des états du sol, en commençant par les couleurs d'engrais réduites au niveau de pulvérisation maximal du système de sol. Le reste de la table sort de la partie examinée ici (NON VÉRIFIÉ). |

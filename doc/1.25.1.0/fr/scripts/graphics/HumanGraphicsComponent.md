# graphics/HumanGraphicsComponent.lua

*[English version](../../../scripts/graphics/HumanGraphicsComponent.md)*

Source: `dataS/scripts/graphics/HumanGraphicsComponent.lua` — FS25 1.25.1.0

✍ Partie visuelle d'un personnage humain (joueur ou PNJ). Elle possède le nœud racine de scène, un nœud de caméra d'épaule, un nœud de pliage du feuillage, le HumanModel, les objets PlayerStyle, une animation faciale optionnelle, l'objet de sons et une ConditionalAnimation avec ses paramètres enregistrés (vitesse, au sol, nage, accroupi, tronçonneuse...). Les classes de modèle, style et animation faciale sont définies ailleurs (NON VÉRIFIÉ).

- **HumanGraphicsComponent** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HumanGraphicsComponent.new() → HumanGraphicsComponent` | 20 | ✍ Construit le composant avec un modèle vide, deux PlayerStyle (courant et de base), les sons, et une ConditionalAnimation enregistrant une vingtaine de paramètres typés. Appelle ensuite defaultAllParameters, non défini dans ce fichier (NON VÉRIFIÉ). |
| `HumanGraphicsComponent:initialize()` | 95 | ✍ Crée les nœuds de scène sous le nœud racine : racine graphique, nœud de caméra d'épaule droite (décalage local fixe) et nœud de pliage du feuillage. À appeler une fois à l'arrivée du personnage sur la carte. |
| `HumanGraphicsComponent:show()` | 113 | ✍ Rend le modèle du personnage visible en appelant setModelVisibility(true). |
| `HumanGraphicsComponent:hide()` | 119 | ✍ Masque le modèle du personnage via setModelVisibility(false), ce qui retire aussi le pliage du feuillage. |
| `HumanGraphicsComponent:delete()` | 125 | ✍ Libère tout : animation faciale, sons, animation, modèle, nœud racine graphique et objet de pliage du feuillage enregistré dans le foliageBendingSystem de la mission. |
| `HumanGraphicsComponent:setModel(model: HumanModel)` | 156 | ✍ Remplace le modèle courant par un autre ayant un nœud racine (erreur et retour sinon). Supprime l'ancien modèle, rattache la nouvelle racine au nœud graphique, puis appelle loadAnimation et loadSounds (non définis ici, NON VÉRIFIÉ) et l'affiche. |
| `HumanGraphicsComponent:setModelVisibility(visibility: boolean, overrideFoliageBending: any)` | 309 | ✍ Affiche ou masque le modèle, réapplique la visibilité du nœud racine, et crée ou détruit le rectangle de pliage du feuillage (environ 1 m de côté) selon la visibilité ou la surcharge optionnelle. |
| `HumanGraphicsComponent:applyCustomWorkStyle(presetName: string, isOwner: any)` | 374 | ✍ Applique un préréglage de style nommé (par exemple tenue de travail) sur une copie du style de base, comme style temporaire. Avec un nom vide ou inconnu, revient au style de base. Le chargement du style est asynchrone. |
| `HumanGraphicsComponent:getStyle(currentStyle: boolean?) → PlayerStyle` | 398 | ✍ Retourne le style courant si le drapeau est true, sinon le style de base (avec repli sur le courant si aucun style de base). |
| `HumanGraphicsComponent:getRequiresModelReload(style: PlayerStyle) → boolean` | 411 | ✍ Retourne true si le style utilise un XML de modèle différent du modèle courant, ce qui recharge le modèle et invalide ses identifiants de nœuds. |
| `HumanGraphicsComponent:setStyleAsync(style: PlayerStyle, callback: function?, callbackObject: table?, callbackArgs: table?, isTempStyle: boolean?, xmlFile: XMLFile?, isOwner: boolean?)` | 436 | ✍ Applique un style, soit en mettant à jour les parties du modèle existant, soit en chargeant d'abord un nouveau modèle, puis charge éventuellement l'animation faciale. Le rappel reçoit l'état de chargement et si un nouveau modèle a été chargé ; il peut ne pas s'exécuter en multijoueur. Un échec de chargement du modèle ne produit qu'un avertissement. |
| `HumanGraphicsComponent:update(dt: number)` | 530 | ✍ Mise à jour à chaque image (dt en ms) de l'animation, des sons et, si présente, de l'animation faciale et de ses émotions. |
| `HumanGraphicsComponent:debugDraw(x: number, y: number, textSize: number, debugDrawModel: boolean?) → number` | 603 | ✍ Dessine les surcouches de débogage : le modèle (sauf désactivation), les nœuds racine et caméra d'épaule, un titre, le lacet du nœud racine et les infos de style. Retourne la prochaine position y à l'écran. |
| `HumanGraphicsComponent:debugDrawAnimator(x: number, y: number, textSize: number) → number` | 634 | ✍ Dessine les infos de débogage de l'animation à la position donnée et retourne la nouvelle position y. |

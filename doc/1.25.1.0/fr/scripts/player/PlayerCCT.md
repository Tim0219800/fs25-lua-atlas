# player/PlayerCCT.lua

*[English version](../../../scripts/player/PlayerCCT.md)*

Source: `dataS/scripts/player/PlayerCCT.lua` — FS25 1.25.1.0

✍ Fine enveloppe autour de la capsule du contrôleur de personnage (CCT) du moteur pour un joueur : création, suppression, déplacement, position et test de contact avec le sol, plus l'affichage de debug. Elle conserve la taille de la capsule, les limites de pente et de marche et les groupes/masques de collision ; `rootNode`, `getSkinWidth`, `getBottomOffsetY`, `setMass` et accesseurs similaires ne sont pas définis dans ce fichier (origine NON VÉRIFIÉE). Utilisée par Player comme `capsuleController`.

- **PlayerCCT** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlayerCCT.new() → PlayerCCT` | 45 | ✍ Crée l'enveloppe CCT avec rayon 0,35, limite de pente 60, hauteur de marche 0,4, masse 0 et les groupes et masques de collision par défaut. Aucune capsule moteur n'existe avant l'appel de `rebuild`. |
| `PlayerCCT:delete()` | 116 | ✍ Supprime le CCT du moteur avec `removeCCT` s'il existe et efface son id. |
| `PlayerCCT:rebuild()` | 226 | ✍ Supprime toute capsule existante et en crée une nouvelle avec `createCCT` sur le noeud racine, avec la taille, les limites, les groupes et la masse stockés. La hauteur actuelle devient la hauteur souhaitée. |
| `PlayerCCT:move(movementX: number, movementY: number, movementZ: number)` | 247 | ✍ Déplace la capsule d'un déplacement en mètres par axe avec `moveCCT`, selon le groupe et le masque de collision de déplacement. |
| `PlayerCCT:getPosition() → number, number, number` | 271 | ✍ Retourne la position monde des pieds du joueur : x et z du noeud racine, avec y décalé du décalage inférieur. |
| `PlayerCCT:setPosition(x: number, y: number, z: number, setNodeTranslation: boolean?)` | 282 | ✍ Place la capsule à partir d'une position des pieds avec `setCCTPosition` ; si le dernier argument est true, le noeud racine est aussi déplacé à la position correspondante. |
| `PlayerCCT:calculateIfBottomTouchesGround() → boolean` | 294 | ✍ Retourne la troisième valeur de `getCCTCollisionFlags`, c'est-à-dire si le bas de la capsule touche le sol. |
| `PlayerCCT:debugDraw(x: number, y: number, textSize: number) → number` | 331 | ✍ Affiche des lignes de texte de debug pour la hauteur de capsule, la hauteur physique et la hauteur souhaitée, et retourne la position y d'écran suivante. |

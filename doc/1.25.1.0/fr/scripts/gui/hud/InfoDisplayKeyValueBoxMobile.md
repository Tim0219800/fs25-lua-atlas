# gui/hud/InfoDisplayKeyValueBoxMobile.lua

*[English version](../../../../scripts/gui/hud/InfoDisplayKeyValueBoxMobile.md)*

Source: `dataS/scripts/gui/hud/InfoDisplayKeyValueBoxMobile.lua` — FS25 1.25.1.0

✍ Variante mobile de la boîte d'information clé/valeur (étend InfoDisplayBox). Elle garde un pool de tables de lignes réutilisables (en cache/actives) et dessine un panneau noir translucide aux coins arrondis, avec la clé en gras à gauche et la valeur à droite, tronquée par des points de suspension. Elle doit être réarmée à chaque frame avec showNextFrame. Côté client uniquement.

- **InfoDisplayKeyValueBoxMobile** hérite de `InfoDisplayBox` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `InfoDisplayKeyValueBoxMobile.new(infoDisplay: any, uiScale: any)` | 16 | ✍ Crée la boîte avec des pools de lignes vides et un décalage vertical calculé à partir de 160 pixels de référence mis à l'échelle de la hauteur d'écran actuelle. |
| `InfoDisplayKeyValueBoxMobile:canDraw()` | 35 | ✍ Retourne true seulement si showNextFrame a été appelé depuis le dernier dessin. |
| `InfoDisplayKeyValueBoxMobile:getDisplayHeight() → number` | 42 | ✍ Retourne la hauteur du panneau pour les lignes actives (marges plus lignes) plus un petit décalage de libellé. |
| `InfoDisplayKeyValueBoxMobile:draw(posX: any, posY: any)` | 48 | ✍ Dessine le panneau arrondi aligné à droite dans la marge de zone sûre, puis les lignes actives de bas en haut avec une couleur de mise en avant optionnelle. Efface le drapeau show-next-frame. |
| `InfoDisplayKeyValueBoxMobile:clear()` | 103 | ✍ Remet toutes les lignes actives dans le pool de cache pour réutilisation. |
| `InfoDisplayKeyValueBoxMobile:setTitle(title: any)` | 112 | ✍ Fonction vide : la boîte mobile ignore les titres. |
| `InfoDisplayKeyValueBoxMobile:textSizeToFit(baseSize: any, text: any, maxWidth: any, minSize: any)` | 117 | ✍ Réduit la taille du texte par pas de 5 % jusqu'à ce qu'il tienne sur une ligne dans maxWidth, sans descendre sous minSize (moitié de la taille de base par défaut), et retourne la taille. Non appelée dans ce fichier. |
| `InfoDisplayKeyValueBoxMobile:addLine(key: any, value: any, accentuate: any, accentuateColor: any)` | 145 | ✍ Ajoute une ligne clé/valeur en réutilisant une table du cache si possible ; une valeur absente devient une chaîne vide. Le drapeau accentuate et la couleur optionnelle mettent la clé en évidence. |
| `InfoDisplayKeyValueBoxMobile:showNextFrame()` | 166 | ✍ Marque la boîte pour qu'elle soit dessinée à la prochaine frame. |
| `InfoDisplayKeyValueBoxMobile:setScale(uiScale: any)` | 176 | ✍ Mémorise l'échelle d'interface et recalcule les valeurs mises à l'échelle. |
| `InfoDisplayKeyValueBoxMobile:storeScaledValues()` | 183 | ✍ Convertit les constantes en pixels de référence (largeur de boîte 500, lignes 450x40, marges, décalages de texte) et HUDElement.TEXT_SIZE.DEFAULT_TEXT_MOBILE en unités écran pour l'échelle actuelle. |

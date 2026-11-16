# gui/base/ButtonOverlay.lua

*[English version](../../../../scripts/gui/base/ButtonOverlay.md)*

Source: `dataS/scripts/gui/base/ButtonOverlay.lua` — FS25 1.25.1.0

✍ Utilitaire d'overlay qui dessine un bouton de touche de clavier (extrémité gauche, milieu étiré, extrémité droite) avec du texte dessus. Utilise les overlays `gui.button_left`, `gui.button_middle` et `gui.button_right` de `g_overlayManager`.

- **ButtonOverlay** (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ButtonOverlay.new(customMt: any)` | 18 | ✍ Constructeur : crée les trois overlays du bouton, définit les ratios de taille et de décalage du texte et la couleur blanche par défaut. `minWidth` et `debugEnabled` valent nil au départ. |
| `ButtonOverlay:delete()` | 41 | ✍ Supprime les trois overlays et met leurs références à nil. Sans danger si certains sont déjà nil. |
| `ButtonOverlay:setColor(r: number?, g: number?, b: number?, a: number?, r2: number?, g2: number?, b2: number?, a2: number?)` | 66 | ✍ Définit la couleur du texte (r,g,b,a) et, en option, celle du fond (r2..a2, par défaut la couleur du texte ou l'ancien fond), en conservant les anciennes valeurs pour les arguments nil ; applique le fond aux trois overlays. |
| `ButtonOverlay:renderButton(buttonText: buttonText, posX: posX, posY: posY, height: height, colorText: any, clipX1: any, clipY1: any, clipX2: any, clipY2: any, customOffsetLeft: any, customButtonInputText: any)` | 112 | ✍ Dessine le fond du bouton et le texte de la touche en majuscules à la position et hauteur données, avec zone de découpe, décalage gauche et texte personnalisé gris optionnels. Renvoie la largeur totale ; cadres de debug si le debug UI est actif. À noter : appelle `self:renderBackground`, absent de ce fichier (NON VÉRIFIÉ). |
| `ButtonOverlay:getButtonWidth(buttonText: any, height: any, customOffsetLeft: any, customButtonInputText: any)` | 166 | ✍ Calcule la largeur du bouton pour un texte de touche et une hauteur à partir de la largeur du texte gras, du remplissage, du décalage gauche et du texte personnalisé, en respectant `minWidth`. Renvoie la largeur totale et la largeur sans décalage. |

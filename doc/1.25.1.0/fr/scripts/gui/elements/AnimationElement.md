# gui/elements/AnimationElement.lua

*[English version](../../../../scripts/gui/elements/AnimationElement.md)*

Source: `dataS/scripts/gui/elements/AnimationElement.lua` — FS25 1.25.1.0

✍ Élément GUI d'image qui s'anime soit en décalant ses coordonnées UV sur les images d'une feuille de sprites (UV_SHIFT, par défaut), soit en faisant tourner l'overlay en continu. Dérivé de BitmapElement, utilise la couche "image". Interface côté client uniquement.

- **AnimationElement** hérite de `BitmapElement` (l.20)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AnimationElement.new(target: any, custom_mt: any)` | 31 | ✍ Constructeur. Valeurs par défaut : mode UV_SHIFT, 8 images, 120 ms par pas (ou par tour en rotation), pas de pivot de rotation ; crée l'élément via BitmapElement. |
| `AnimationElement:loadFromXML(xmlFile: any, key: any)` | 51 | ✍ Lit animationOffset, animationFrames, animationSpeed, animationRotationPivot, animationUVOffset et animationMode ("uvshift", sinon rotation) depuis le nœud XML, mémorise les UV par défaut, puis calcule les données de frame. |
| `AnimationElement:loadProfile(profile: any, applyProfile: any)` | 82 | ✍ Mêmes réglages que le chargeur XML (offset, images, vitesse, pivot, décalage UV, mode) mais lus depuis un profil GUI. Ne recalcule pas lui-même les données de frame. |
| `AnimationElement:copyAttributes(src: any)` | 108 | ✍ Copie les réglages d'animation et les UV par défaut d'un élément source, remet les UV de l'image à ces valeurs et recalcule les données de frame. |
| `AnimationElement:update(dt: any)` | 125 | ✍ Mise à jour à chaque frame. En mode UV_SHIFT, passe à l'image suivante (retour à 0 en fin de cycle) à chaque écoulement du minuteur de animationSpeed ms ; en mode ROTATE, fait tourner l'overlay d'un tour complet par animationSpeed ms. |
| `AnimationElement:updateAnimationUVs()` | 149 | ✍ En mode UV_SHIFT, règle les UV de l'image sur la tranche horizontale de l'image courante (position de départ plus taille de frame et espacement optionnel multipliés par l'indice). Sans effet en mode rotation. |
| `AnimationElement:updateRotation()` | 158 | ✍ Applique l'angle de rotation courant à l'overlay autour du pivot (pivot de rotation personnalisé s'il existe, sinon pivot de l'élément) mis à l'échelle de la taille absolue. |
| `AnimationElement:setAnimationData()` | 170 | ✍ Si un overlay existe, déduit la largeur d'une image et la position de départ à partir des UV de l'overlay, du nombre d'images et de l'espacement, puis rafraîchit les UV. |

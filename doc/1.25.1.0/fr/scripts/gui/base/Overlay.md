# gui/base/Overlay.lua

*[English version](../../../../scripts/gui/base/Overlay.md)*

Source: `dataS/scripts/gui/base/Overlay.lua` — FS25 1.25.1.0

✍ Overlay image 2D de base : enveloppe un handle d'overlay image du moteur avec position, taille, alignement, UV, couleur, rotation, échelle et visibilité, et l'affiche avec découpe optionnelle. Utilisé partout dans le HUD et les menus, et créé par `OverlayManager` à partir de tranches de texture. Les constantes comme `Overlay.DEFAULT_UVS` et les valeurs ALIGN_* sont définies ailleurs (NON VÉRIFIÉ). Côté client uniquement.

- **Overlay** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Overlay.new(overlayFilename: string?, x: number, y: number, width: number, height: number, customMt: table?) → Overlay` | 39 | ✍ Crée un overlay en x, y avec la taille donnée, en chargeant l'image si un nom de fichier est fourni (sinon l'id moteur reste 0 et rien n'est dessiné). Par défaut : blanc, alignement en bas à gauche, sans rotation, UV complets. |
| `Overlay:delete()` | 87 | ✍ Libère le handle d'image du moteur s'il existe. L'overlay ne doit plus être affiché ensuite. |
| `Overlay:setColor(r: number?, g: number?, b: number?, a: number?)` | 101 | ✍ Définit la teinte RGBA multipliée avec la texture ; les canaux nil gardent leur valeur et le moteur n'est appelé que si quelque chose change. |
| `Overlay:setUVs(uvs: array)` | 117 | ✍ Mémorise et applique 8 valeurs UV définissant la zone de texture affichée ; ignoré si l'overlay n'a pas d'image. |
| `Overlay:setSliceId(sliceId: string)` | 127 | ✍ Cherche la tranche « prefix.id » dans `g_overlayManager` et applique ses UV ; sans effet si la tranche est inconnue ou s'il n'y a pas d'image. La taille n'est pas modifiée. |
| `Overlay:setPosition(x: number?, y: number?)` | 142 | ✍ Définit la position à l'écran (0 à 1) ; nil conserve la coordonnée actuelle. Les décalages d'alignement sont appliqués séparément au rendu. |
| `Overlay:getPosition() → number, number` | 151 | ✍ Renvoie la position x et y mémorisée, sans décalages d'alignement. |
| `Overlay:setDimension(width: number?, height: number?)` | 160 | ✍ Définit largeur et hauteur (nil conserve l'actuelle) et recalcule les décalages d'alignement. Ne modifie pas les facteurs d'échelle. |
| `Overlay:resetDimensions()` | 168 | ✍ Restaure la largeur et la hauteur données à la construction et remet l'échelle à 1. |
| `Overlay:setInvertX(invertX: boolean)` | 177 | ✍ Retourne l'image horizontalement en permutant les paires d'UV, ou restaure les UV normaux. N'agit que si l'état change et qu'une image existe. |
| `Overlay:setRotation(rotation: number, centerX: number, centerY: number)` | 195 | ✍ Définit la rotation en radians autour d'un pivot donné en décalage par rapport à la position de l'overlay (unités d'écran) ; le moteur n'est appelé qu'en cas de changement. |
| `Overlay:setScale(scaleWidth: number, scaleHeight: number)` | 211 | ✍ Définit la taille comme taille par défaut multipliée par les facteurs donnés, mémorise les facteurs et rafraîchit les décalages d'alignement. |
| `Overlay:getScale() → number, number` | 224 | ✍ Renvoie les facteurs d'échelle courants en largeur et hauteur. |
| `Overlay:render(clipX1: number?, clipY1: number?, clipX2: number?, clipY2: number?)` | 234 | ✍ Dessine l'overlay s'il est visible, avec une image et un alpha supérieur à 0. Avec des bornes de découpe, il affiche une partie découpée via des UV temporaires (`Overlay.getClippingUVs`, absent de ce fichier, NON VÉRIFIÉ) puis les restaure ; trace aussi des cadres de debug en build debug. |
| `Overlay:setAlignment(vertical: integer?, horizontal: integer?)` | 335 | ✍ Définit l'alignement vertical (bas, milieu, haut) et horizontal (gauche, centre, droite) et calcule les décalages de dessin selon la taille courante ; les valeurs nil retombent sur bas/gauche. |
| `Overlay:setIsVisible(visible: boolean?)` | 358 | ✍ Affiche ou masque l'overlay ; un overlay masqué n'est pas dessiné par `render`. |
| `Overlay:getIsVisible() → boolean` | 366 | ✍ Renvoie si l'overlay est actuellement visible. |
| `Overlay:setImage(overlayFilename: string)` | 375 | ✍ Passe à un autre fichier image : supprime l'ancien handle moteur et en crée un nouveau si le nom diffère. Les UV précédents ne sont pas réappliqués ici. |

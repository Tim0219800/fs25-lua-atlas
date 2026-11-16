# gui/hud/HUDElement.lua

*[English version](../../../../scripts/gui/hud/HUDElement.md)*

Source: `dataS/scripts/gui/hud/HUDElement.lua` — FS25 1.25.1.0

✍ Classe de base des widgets HUD légers. Elle enveloppe un Overlay et garde une liste d'enfants HUDElement : déplacer, mettre à l'échelle, dessiner ou supprimer un élément agit donc sur tout son sous-arbre. Elle gère aussi un pivot de rotation et une animation TweenSequence avancée dans update. La plupart des classes HUD (HUDDisplayElement, HUDFrameElement, InputGlyphElement...) en héritent. Côté client uniquement.

- **HUDElement** (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HUDElement.new(overlay: table, parentHudElement: table?, customMt: table?) → table` | 22 | ✍ Crée un élément autour de l'overlay donné, avec une liste d'enfants vide, un pivot nul et aucune animation. Si un parent est fourni, le nouvel élément lui est rattaché via addChild. |
| `HUDElement:delete()` | 47 | ✍ Supprime l'overlay (libère son handle moteur), détache l'élément de son parent puis supprime récursivement tous les enfants. L'élément ne doit plus être utilisé ensuite. |
| `HUDElement:addChild(childHudElement: table)` | 69 | ✍ Ajoute un enfant à la liste de dessin. S'il appartient déjà à un autre parent, il en est d'abord retiré ; ré-ajouter un enfant déjà présent ne fait rien. |
| `HUDElement:removeChild(childHudElement: table)` | 91 | ✍ Retire l'enfant donné de la liste de cet élément et efface sa référence de parent, uniquement si cet élément en est bien le parent. L'enfant n'est pas supprimé. |
| `HUDElement:setPosition(x: any, y: any)` | 106 | ✍ Déplace l'overlay à une position écran absolue (nil conserve la coordonnée actuelle) et décale chaque enfant direct du même écart pour que le groupe bouge ensemble. |
| `HUDElement:setRotation(rotation: number, centerX: number?, centerY: number?)` | 132 | ✍ Fait pivoter l'overlay d'un angle en radians autour du centre donné, ou autour du pivot mémorisé de l'élément si aucun centre n'est passé. Les enfants ne sont pas pivotés. |
| `HUDElement:setRotationPivot(pivotX: number, pivotY: number)` | 140 | ✍ Mémorise le décalage du pivot de rotation et l'enregistre aussi comme pivot par défaut, réutilisé après une mise à l'échelle ou une réinitialisation des dimensions. Passer nil conserve l'ancien défaut. |
| `HUDElement:getRotationPivot() → number, number` | 149 | ✍ Retourne le décalage actuel du pivot (x, y) en espace écran, éventuellement mis à l'échelle par rapport au défaut. |
| `HUDElement:getPosition() → number, number` | 157 | ✍ Retourne la position écran x et y de l'overlay. |
| `HUDElement:setScale(scaleWidth: number, scaleHeight: number)` | 166 | ✍ Met l'overlay à l'échelle et repositionne et redimensionne proportionnellement chaque enfant direct autour de la position de cet élément, puis recalcule le pivot à partir du pivot par défaut. |
| `HUDElement:getScale() → Width, Height` | 197 | ✍ Retourne les facteurs d'échelle en largeur et en hauteur de l'overlay. |
| `HUDElement:setAlignment(vertical: integer, horizontal: integer)` | 206 | ✍ Transmet à l'overlay les constantes d'alignement vertical et horizontal (Overlay.ALIGN_*), qui déterminent l'interprétation de la position. |
| `HUDElement:setVisible(isVisible: any)` | 212 | ✍ Définit le drapeau visible de l'overlay s'il existe encore. Les enfants gardent leur propre drapeau mais ne sont pas dessinés par draw quand le parent est masqué. |
| `HUDElement:getVisible()` | 220 | ✍ Retourne le drapeau visible de l'overlay. |
| `HUDElement:getColor() → number, number, number, number` | 230 | ✍ Retourne les composantes de couleur r, g, b, a de l'overlay. |
| `HUDElement:getAlpha() → number` | 237 | ✍ Retourne la valeur alpha de l'overlay. |
| `HUDElement:getWidth()` | 243 | ✍ Retourne la largeur de l'overlay en unités écran. |
| `HUDElement:getHeight()` | 249 | ✍ Retourne la hauteur de l'overlay en unités écran. |
| `HUDElement:setDimension(width: any, height: any)` | 256 | ✍ Définit largeur et hauteur de l'overlay ; passer nil pour l'une des deux la laisse inchangée. Les enfants ne sont pas modifiés. |
| `HUDElement:getDimension() → number, number` | 264 | ✍ Retourne la largeur et la hauteur de l'overlay. |
| `HUDElement:resetDimensions()` | 271 | ✍ Demande à l'overlay de restaurer ses dimensions et son échelle par défaut, et remet le pivot au pivot par défaut mémorisé. |
| `HUDElement:setColor(r: any, g: any, b: any, a: any)` | 280 | ✍ Définit uniquement la couleur de l'overlay ; les enfants gardent leurs couleurs. |
| `HUDElement:setAlpha(alpha: any)` | 286 | ✍ Modifie uniquement le canal alpha de l'overlay, sans toucher au RGB. |
| `HUDElement:setImage(imageFilename: any)` | 292 | ✍ Remplace le fichier image de l'overlay. |
| `HUDElement:setUVs(uvs: any)` | 298 | ✍ Définit les coordonnées de texture de l'overlay. |
| `HUDElement:setSliceId(sliceId: any)` | 304 | ✍ Affecte un identifiant de slice GUI à l'overlay. |
| `HUDElement:update(dt: any)` | 310 | ✍ Fait avancer l'animation de l'élément de dt millisecondes tant qu'elle n'est pas terminée. Les sous-classes l'étendent ; les enfants ne sont pas mis à jour ici. |
| `HUDElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 318 | ✍ Dessine l'overlay (avec un rectangle de clipping optionnel) puis chaque enfant dans l'ordre d'ajout, uniquement si l'overlay est visible. |
| `HUDElement:scalePixelToScreenVector(vector2D: table)` | 335 | ✍ Convertit un vecteur de deux valeurs en pixels (résolution de référence) en unités écran, via l'échelle de l'overlay, l'échelle d'aspect et g_referenceScreenWidth/Height. Retourne deux nombres. |
| `HUDElement:scalePixelToScreenHeight(height: number)` | 349 | ✍ Convertit une valeur verticale en pixels à la résolution de référence en unités écran, en tenant compte de l'échelle de l'overlay et de l'échelle d'aspect. |
| `HUDElement:scalePixelToScreenWidth(width: number)` | 356 | ✍ Convertit une valeur horizontale en pixels à la résolution de référence en unités écran, en tenant compte de l'échelle de l'overlay et de l'échelle d'aspect. |
| `HUDElement:normalizeUVPivot(uvPivot: table, size: table, uvs: table)` | 364 | ✍ Convertit un pivot exprimé en pixels de texture en pivot écran local, à partir du rapport entre la taille de l'élément et le rectangle UV. À noter : le commentaire de la fonction omet le paramètre size. |

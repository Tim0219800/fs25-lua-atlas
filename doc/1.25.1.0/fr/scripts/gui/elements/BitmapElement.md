# gui/elements/BitmapElement.lua

*[English version](../../../../scripts/gui/elements/BitmapElement.md)*

Source: `dataS/scripts/gui/elements/BitmapElement.lua` — FS25 1.25.1.0

✍ Élément GUI de base affichant un overlay d'image (couche "image"), dérivé de GuiElement. Gère des décalages par état (focalisé, sélectionné, survol, pressé), l'inversion X/Y, les tranches de texture de `g_overlayManager`, un rectangle de masque optionnel, des setters de couleur/UV/rotation et la délégation du focus aux enfants. Parent de nombreux autres éléments. Interface côté client.

- **BitmapElement** hérite de `GuiElement` (l.17)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BitmapElement.new(target: any, custom_mt: any)` | 23 | ✍ Constructeur avec une taille d'image par défaut de 2048x2048, un décalage nul, une table d'overlay vide et aucun masque. |
| `BitmapElement:delete()` | 38 | ✍ Libère l'overlay puis exécute la suppression du parent. |
| `BitmapElement:loadFromXML(xmlFile: any, key: any)` | 46 | ✍ Charge imageSize, l'overlay, les décalages de chaque état, invertX/invertY et la position/taille du masque depuis le nœud XML, puis crée l'overlay. À noter : invertY est lu depuis la clé `#invert>`, ce qui ressemble à une faute de frappe ; `#invertY` est donc probablement ignoré en XML. |
| `BitmapElement:loadProfile(profile: any, applyProfile: any)` | 69 | ✍ Mêmes attributs que le chargeur XML mais depuis un profil GUI ; recrée l'overlay si son nom de fichier ou de prévisualisation a changé. |
| `BitmapElement:copyAttributes(src: any)` | 97 | ✍ Copie la taille d'image, l'overlay, les décalages (seulement ceux définis sur la source), les données de masque et les indicateurs d'inversion depuis un élément source. |
| `BitmapElement:setAlpha(alpha: any)` | 126 | ✍ Définit l'alpha de l'élément via le parent et le répercute sur l'alpha de l'overlay. |
| `BitmapElement:getOffset()` | 135 | ✍ Retourne le décalage x/y de dessin pour l'état d'overlay courant (focalisé, sélectionné, survol ou pressé s'il est défini), sinon le décalage de base. |
| `BitmapElement:getOverlayMaskData(xOffset: any, yOffset: any)` | 158 | ✍ Retourne la position x/y et la taille x/y du masque, chacune à nil si aucun masque n'est configuré. Les paramètres de décalage sont inutilisés. |
| `BitmapElement:setIsWebOverlay(isWebOverlay: any)` | 169 | ✍ Indique si l'overlay est un overlay web (image distante) ou non. |
| `BitmapElement:setImageFilename(filename: any)` | 175 | ✍ Recrée l'overlay pour le fichier image indiqué. |
| `BitmapElement:setImageColor(state: state, r: number, g: number, b: number, a: number)` | 187 | ✍ Définit la couleur RGBA de l'overlay pour un état donné (nil = couleur par défaut) ; les canaux nil conservent leur valeur précédente. |
| `BitmapElement:setImageUVs(state: any, v0: any, u0: any, v1: any, u1: any, v2: any, u2: any, v3: any, u3: any)` | 197 | ✍ Définit les quatre paires UV de coins pour un état (par défaut l'état courant), les valeurs nil conservent les anciennes, puis applique l'inversion X/Y si activée. |
| `BitmapElement:setImageRotation(rotation: number)` | 221 | ✍ Définit la rotation de l'overlay en radians. |
| `BitmapElement:setImageSlice(state: string, sliceId: string)` | 228 | ✍ Cherche une tranche de texture par identifiant dans `g_overlayManager` ; si elle existe, applique ses UV et son fichier et mémorise l'identifiant. Ne fait rien si l'identifiant est inconnu. |
| `BitmapElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 243 | ✍ Dessine l'overlay à la position absolue plus le décalage d'état, avec découpage et masque optionnel, puis dessine les enfants via le parent. |
| `BitmapElement:canReceiveFocus()` | 255 | ✍ Retourne false si l'élément est caché ou sans enfant, et true seulement si chaque enfant peut recevoir le focus. |
| `BitmapElement:getFocusTarget()` | 272 | ✍ Retourne le premier enfant comme cible du focus, ou l'élément lui-même s'il n'en a pas. |

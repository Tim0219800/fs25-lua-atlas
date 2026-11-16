# gui/elements/PictureElement.lua

*[English version](../../../../scripts/gui/elements/PictureElement.md)*

Source: `dataS/scripts/gui/elements/PictureElement.lua` — FS25 1.25.1.0

✍ Élément bitmap qui dessine son image selon un mode de contenu (sans mise à l'échelle, remplissage, ou mise à l'échelle avec conservation du ratio) à partir d'une taille d'image source déclarée. Il étend BitmapElement et remplace son draw. L'aide qui calcule le rectangle ajusté (getAdjustedPosition) et les constantes CONTENT_MODE ne sont pas dans ce dump (NON VÉRIFIÉ).

- **PictureElement** hérite de `BitmapElement` (l.16)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PictureElement.new(target: any, custom_mt: any)` | 31 | ✍ Constructeur. Construit un BitmapElement avec le mode de contenu aspect-fit, une taille d'image par défaut de 2048 par 2048 et un ratio de 1. |
| `PictureElement:loadFromXML(xmlFile: any, key: any)` | 44 | ✍ Charge l'élément de base, lit l'attribut imageSize comme valeurs d'écran normalisées et recalcule le ratio. |
| `PictureElement:loadProfile(profile: any, applyProfile: any)` | 53 | ✍ Charge le profil de base, puis imageSize (avec le ratio) et pictureContentMode, qui accepte noScaling, scaleToFill ou scaleAspectFit ; les autres valeurs laissent le mode inchangé. |
| `PictureElement:copyAttributes(src: any)` | 71 | ✍ Copie le mode de contenu, le ratio et la taille d'image depuis un élément source après la copie de base. |
| `PictureElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 131 | ✍ Dessine l'overlay dans le rectangle ajusté avec les limites de clipping données, trace un cadre jaune de débogage si le débogage est actif, et saute le draw de BitmapElement en appelant directement celui du grand-parent. |

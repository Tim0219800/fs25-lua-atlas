# gui/elements/DynamicFadedBitmapElement.lua

*[English version](../../../../scripts/gui/elements/DynamicFadedBitmapElement.md)*

Source: `dataS/scripts/gui/elements/DynamicFadedBitmapElement.lua` — FS25 1.25.1.0

✍ DynamicFadedBitmapElement est un PictureElement qui fait un fondu enchaîné entre une liste d'images. Les réglages viennent d'attributs XML ou du profil (fadeTime, fadeInterval, imageFilenames séparés par des points-virgules). Les méthodes buildOverlays et la mise à jour de fadeAlpha/currentImageIndex sont absentes de ce dump (zone vide) : la logique de timing est NON VÉRIFIÉE.

- **DynamicFadedBitmapElement** hérite de `PictureElement` (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `DynamicFadedBitmapElement.new(target: any, custom_mt: any)` | 19 | ✍ Constructeur. Initialise fadeTime à 2500, fadeInterval à 10000, des listes vides de fichiers et d'overlays, l'index d'image à 1 et l'alpha de fondu à 0. |
| `DynamicFadedBitmapElement:delete()` | 38 | ✍ Libère tous les overlays et l'overlay modèle via GuiOverlay, puis appelle le delete du parent. |
| `DynamicFadedBitmapElement:loadFromXML(xmlFile: any, key: any)` | 49 | ✍ Lit les attributs fadeTime et fadeInterval (entiers) puis charge et crée l'overlay modèle depuis le nœud XML. |
| `DynamicFadedBitmapElement:loadProfile(profile: any, applyProfile: any)` | 61 | ✍ Lit fadeTime et fadeInterval depuis le profil, recharge l'overlay modèle (recréé seulement si ses fichiers ont changé) et, si imageFilenames existe, le découpe sur ';' et reconstruit les overlays. |
| `DynamicFadedBitmapElement:copyAttributes(src: any)` | 83 | ✍ Copie l'overlay modèle, la liste de fichiers et les durées de fondu d'un élément source, puis reconstruit les overlays. |
| `DynamicFadedBitmapElement:setAlpha(alpha: any)` | 97 | ✍ Définit l'alpha via le parent et en garde une copie utilisée comme opacité de base lors du dessin des images en fondu. |
| `DynamicFadedBitmapElement:setImageFilenames(filenames: any)` | 104 | ✍ Remplace la liste des fichiers image et reconstruit les overlays (buildOverlays absent du dump : NON VÉRIFIÉ). |
| `DynamicFadedBitmapElement:setImagesUVs(uvs: any)` | 111 | ✍ Mémorise la table d'UV des images et reconstruit les overlays. |
| `DynamicFadedBitmapElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 147 | ✍ Dessine l'image courante en entier, puis la suivante (avec rebouclage) avec un alpha smoothstep dérivé de fadeAlpha, fadeTime et fadeInterval, multiplié par l'alpha de l'élément. Suppose au moins un fichier. |
| `DynamicFadedBitmapElement:canReceiveFocus()` | 169 | ✍ Renvoie true seulement si l'élément est visible, a des enfants et que chacun d'eux peut recevoir le focus. |
| `DynamicFadedBitmapElement:getFocusTarget()` | 184 | ✍ Renvoie le premier enfant comme cible de focus s'il existe, sinon l'élément lui-même. |

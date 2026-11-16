# gui/elements/ThreePartBitmapElement.lua

*[English version](../../../../scripts/gui/elements/ThreePartBitmapElement.md)*

Source: `dataS/scripts/gui/elements/ThreePartBitmapElement.lua` — FS25 1.25.1.0

✍ Élément bitmap dessiné en trois parties : une image de début, une image centrale étirée (l'overlay normal de l'élément) et une image de fin. Dérivé de BitmapElement ; il peut être horizontal ou vertical (isHorizontal). Clés XML : startImage*, endImage*, startImageSize, endImageSize et isHorizontal.

- **ThreePartBitmapElement** hérite de `BitmapElement` (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ThreePartBitmapElement.new(target: any, custom_mt: any)` | 19 | ✍ Constructeur. Crée l'élément sur BitmapElement avec des overlays début/fin vides, des tailles de parties nulles et une disposition horizontale. |
| `ThreePartBitmapElement:delete()` | 34 | ✍ Supprime les overlays de début et de fin, puis appelle le delete du parent. |
| `ThreePartBitmapElement:loadFromXML(xmlFile: any, key: any)` | 43 | ✍ Charge depuis le XML les overlays de début/fin, leurs tailles et isHorizontal, crée les overlays et applique la couleur de l'état normal de l'overlay principal aux deux extrémités. |
| `ThreePartBitmapElement:loadProfile(profile: any, applyProfile: any)` | 62 | ✍ Applique les valeurs de profil pour les images de début/fin, leurs tailles et isHorizontal ; ne recrée un overlay que si son fichier image a changé. |
| `ThreePartBitmapElement:copyAttributes(src: any)` | 84 | ✍ Copie les tailles des parties, l'orientation et les deux overlays d'extrémité depuis un élément source. |
| `ThreePartBitmapElement:setImageColor(state: integer, r: number, g: number, b: number, a: number)` | 103 | ✍ Définit la couleur d'un état GuiOverlay sur l'overlay principal et sur les deux overlays d'extrémité ; les canaux nil gardent leur valeur, un état nil désigne la valeur par défaut. |
| `ThreePartBitmapElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 121 | ✍ Affiche les overlays début, milieu et fin côte à côte (ou empilés verticalement, début en haut) avec l'état d'overlay courant et la zone de découpe. Saute le draw propre à BitmapElement et appelle celui de GuiElement. |

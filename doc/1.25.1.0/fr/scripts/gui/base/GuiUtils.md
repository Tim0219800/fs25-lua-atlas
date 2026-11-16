# gui/base/GuiUtils.lua

*[English version](../../../../scripts/gui/base/GuiUtils.md)*

Source: `dataS/scripts/gui/base/GuiUtils.lua` — FS25 1.25.1.0

✍ Utilitaires statiques qui convertissent des attributs XML de GUI en nombres : tailles normalisées (unités px / dp), couleurs, rectangles UV, plus un test de survol d'overlay. Utilisés par la couche GUI pour lire les mises en page et les configurations de textures. Certaines fonctions appelées ailleurs (par exemple GuiUtils.rotateUVs) ne sont pas définies dans ce fichier.

- **GuiUtils** (l.10)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `GuiUtils.getNormalizedValues(data: str, refSize: refSize, defaultValue: defaultValue) → array` | 18 | ✍ Découpe une chaîne séparée par des espaces (ou lit une table) en nombres et les normalise par rapport à une taille de référence ; gère les suffixes `px` et `dp` et alterne les références X/Y. Les valeurs manquantes sont répétées selon la longueur du défaut, comme en CSS ; renvoie le défaut si l'entrée est nil. |
| `GuiUtils.getColorArray(colorStr: str, defaultValue: defaultValue) → array` | 176 | ✍ Convertit une chaîne en tableau de 4 nombres {r, v, b, a} via `string.getVector(str, 4)`, ou renvoie le défaut en cas d'échec. |
| `GuiUtils.getColorGradientArray(colorStr: str, defaultValue: defaultValue) → array` | 185 | ✍ Convertit une chaîne en vecteur et ne l'accepte que s'il compte 4 nombres (une couleur) ou 16 nombres (quatre couleurs, une par coin) ; sinon renvoie le défaut. |
| `GuiUtils.getUVs(str: str, ref: ref, defaultValue: defaultValue, rotation: any) → array` | 230 | ✍ Convertit une chaîne « x y tailleX tailleY » (pixels) en tableau de 8 valeurs UV avec la taille de texture de référence (1024x1024 par défaut), en inversant V. Applique éventuellement `GuiUtils.rotateUVs` (absent de ce fichier, NON VÉRIFIÉ) ; journalise une erreur dev si illisible. |
| `GuiUtils.checkOverlayOverlap(posX: posX, posY: posY, overlayX: overlayX, overlayY: overlayY, overlaySizeX: overlaySizeX, overlaySizeY: overlaySizeY, hotspot: hotspot)` | 268 | ✍ Renvoie vrai si un point est dans le rectangle de l'overlay, qui doit avoir une taille positive. Avec une table hotspot de 4 nombres, les bornes du rectangle sont décalées par ces valeurs. |

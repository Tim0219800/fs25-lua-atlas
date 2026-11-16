# gui/base/GuiOverlay.lua

*[English version](../../../../scripts/gui/base/GuiOverlay.md)*

Source: `dataS/scripts/gui/base/GuiOverlay.lua` — FS25 1.25.1.0

✍ Table d'aides statiques (sans instances) qui construit et affiche des overlays d'interface stockés sous forme de tables simples. Elle lit noms de fichiers, UV, slices, couleurs, rotation et masques par état (normal, focus, pressé, etc.) depuis des attributs XML ou un GuiProfile, crée les handles d'overlay du moteur et les dessine avec découpe et masque. Les constantes d'état et tables de suffixes (OVERLAY_STATE_SUFFIXES, STATE_*) sont définies hors des corps visibles (NON VÉRIFIÉ).

- **GuiOverlay** (l.9)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `GuiOverlay.loadOverlay(self: table, overlay: table, overlayName: string, imageSize: table, profile: table?, xmlFile: integer?, key: string?) → table` | 37 | ✍ Remplit une table d'overlay depuis un fichier XML/clé ou, à défaut, depuis un profil : fichiers, UV, couleurs et largeur SDF pour le nom d'overlay donné. Applique des UV par défaut, une couleur blanche et une image d'aperçu noire ; retourne nil si aucun fichier n'en résulte. |
| `GuiOverlay.loadXMLUVs(xmlFile: integer, key: string, overlay: table, overlayName: string, imageSize: table)` | 78 | ✍ Lit les UV de chaque état depuis les attributs XML, soit via un identifiant de slice résolu par g_overlayManager (avec rotation et inversion X optionnelles), soit depuis une chaîne d'UV convertie avec la taille de l'image. |
| `GuiOverlay.loadProfileUVs(profile: table, overlay: table, overlayName: string, imageSize: table)` | 115 | ✍ Comme loadXMLUVs mais lit depuis un profil, et gère aussi l'inversion Y. Avertit quand un profil du fichier UI de base utilise encore des chaînes d'UV brutes au lieu de slices. |
| `GuiOverlay.loadXMLColors(xmlFile: integer, key: string, overlay: table, overlayName: string)` | 158 | ✍ Lit depuis les attributs XML les couleurs par état (tableaux en dégradé permis), ainsi que la rotation en degrés (stockée en radians) et l'indicateur d'overlay web. |
| `GuiOverlay.loadProfileColors(profile: table, overlay: table, overlayName: string)` | 183 | ✍ Lit depuis un profil les couleurs par état, la rotation (en degrés, stockée en radians) et l'indicateur d'overlay web. |
| `GuiOverlay.loadXMLFilenames(xmlFile: integer, key: string, overlay: table, overlayName: string)` | 209 | ✍ Lit depuis les attributs XML les fichiers d'image, d'aperçu et de masque de chaque état et les résout via resolveFilename. |
| `GuiOverlay.loadProfileFilenames(profile: table, overlay: table, overlayName: string)` | 240 | ✍ Lit depuis un profil les fichiers d'image, d'aperçu et de masque de chaque état et les résout via resolveFilename. |
| `GuiOverlay.resolveFilename(filename: string) → string` | 270 | ✍ Convertit les noms g_baseUIFilename, g_baseHUDFilename et g_iconsUIFilename en leurs valeurs globales réelles et remplace $l10nSuffix par g_languageSuffix. |
| `GuiOverlay.createOverlay(overlay: table, filename: string?) → table` | 291 | ✍ Crée l'overlay moteur pour le fichier de la table (overlay web si indiqué et chemin commençant par http), ainsi que les overlays d'état et la largeur SDF. Retourne tôt s'il existe déjà pour ce fichier ; sinon supprime d'abord les anciens handles et fixe rotation 0 et alpha 1. |
| `GuiOverlay.createStateOverlays(overlay: table)` | 331 | ✍ Crée des overlays d'image pour les états non normaux ayant leur propre fichier, et des textures de masque pour tout état ayant un fichier de masque. À noter : un état sans fichier laisse imageOverlay à nil, comparé ensuite à 0 puis stocké comme nil. |
| `GuiOverlay.copyOverlay(overlay: table, overlaySrc: table, overrideFilename: string?) → table` | 364 | ✍ Copie les paramètres (fichiers, UV, couleurs, alpha, largeur SDF, slice) d'une table source vers une autre et crée un nouvel overlay moteur ; les handles ne sont pas partagés. Un nom de fichier optionnel remplace celui de la cible. |
| `GuiOverlay.deleteOverlay(overlay: table)` | 387 | ✍ Supprime les overlays d'état et textures de masque et vide leurs champs, libérant les handles d'image. Ne fait rien pour nil. |
| `GuiOverlay.getOverlayColor(overlay: table, state: integer) → Color` | 408 | ✍ Retourne la table de couleur d'un état, avec repli sur la couleur de base (l'état pressé se replie d'abord sur focus). |
| `GuiOverlay.getOverlayUVs(overlay: Overlay, state: integer) → table` | 438 | ✍ Retourne la table d'UV d'un état, avec repli sur les UV de base si l'état n'en a pas. |
| `GuiOverlay.getOverlay(overlay: table, currentState: integer) → table` | 465 | ✍ Retourne le handle d'overlay moteur d'un état ; pressé se replie sur focus, et tout élément manquant se replie sur l'overlay de base. |
| `GuiOverlay.getMaskOverlay(overlay: table, currentState: integer) → table` | 492 | ✍ Retourne le handle de texture de masque d'un état, avec le même repli pressé vers focus, puis le masque de base. Il retourne bien un masque, pas l'overlay d'image. |
| `GuiOverlay.renderOverlay(overlay: table, posX: number, posY: number, sizeX: number, sizeY: number, state: integer, clipX1: number?, clipY1: number?, clipX2: number?, clipY2: number?, maskPosX: number?, maskPosY: number?, maskSizeX: number?, maskSizeY: number?)` | 530 | ✍ Dessine l'overlay d'un état à la position et taille données, en appliquant la rotation, un rectangle de découpe optionnel (les UV sont recadrées en conséquence), un masque 2D optionnel et une couleur par coin ou unique multipliée par overlay.alpha. Ignore les couleurs totalement transparentes et les découpes vides. |
| `GuiOverlay.copyColors(overlay: table, source: table)` | 626 | ✍ Copie les références des tables de couleur de chaque état d'un overlay source (partagées, non clonées). |
| `GuiOverlay.setRotation(overlay: table, rotation: number, centerX: number, centerY: number)` | 641 | ✍ Fixe la rotation de l'overlay moteur autour d'un pivot et marque l'overlay comme ayant une rotation personnalisée, ce qui empêche renderOverlay de la réinitialiser. Ne fonctionne que si l'overlay moteur existe. |
| `GuiOverlay.setColor(overlay: table, r: number, g: number, b: number, a: number)` | 655 | ✍ Remplace la couleur de base par une nouvelle table RGBA. |
| `GuiOverlay.setSelectedColor(overlay: table, r: number, g: number, b: number, a: number)` | 666 | ✍ Remplace la couleur de l'état sélectionné par une nouvelle table RGBA. |

# gui/elements/RenderElement.lua

*[English version](../../../../scripts/gui/elements/RenderElement.md)*

Source: `dataS/scripts/gui/elements/RenderElement.lua` — FS25 1.25.1.0

✍ Élément d'interface qui charge une scène i3d de façon asynchrone via g_i3DManager et la rend depuis une caméra choisie dans un overlay de rendu, qu'il dessine ensuite dans la mise en page (utilisé pour les aperçus 3D des menus). Il expose des réglages de rendu (masques, ombres, bloom, profondeur de champ, SSAO, qualité d'atmosphère, sur-échantillonnage) et un callback appelé quand l'overlay est prêt. L'overlay n'est re-rendu que s'il est marqué sale. Les fonctions moteur comme createRenderOverlay sont NON VÉRIFIÉES (absentes du dump).

- **RenderElement** hérite de `GuiElement` (l.17)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `RenderElement.new(target: table, custom_mt: table?) → RenderElement` | 26 | ✍ Constructeur. Définit les valeurs par défaut : alpha actif, masque de formes 255, masque de lumières 67108864 (bit 26 seul), sans ombres, bloom, profondeur de champ ni SSAO, compilation asynchrone des shaders désactivée, atmosphère désactivée, rendu non sale. |
| `RenderElement:delete()` | 50 | ✍ Détruit la scène et l'overlay pour libérer les ressources, puis exécute le delete du parent. |
| `RenderElement:loadFromXML(xmlFile: integer, key: string)` | 60 | ✍ Charge l'élément de base, puis lit filename, cameraNode, superSamplingFactor, shapesMask, lightMask, ainsi que les options d'ombres, bloom, profondeur de champ, SSAO et shaders asynchrones, un nom atmosphereQuality (avertissement si invalide) et enregistre le callback onRenderLoad. |
| `RenderElement:loadProfile(profile: table, applyProfile: boolean)` | 91 | ✍ Charge filename, cameraNode, superSamplingFactor et atmosphereQuality depuis un profil. À noter : les trois premiers sont écrasés par nil si le profil ne les définit pas. Si applyProfile est vrai, détruit et recharge la scène. |
| `RenderElement:copyAttributes(src: table)` | 117 | ✍ Copie filename, chemin de caméra, facteur de sur-échantillonnage, qualité d'atmosphère et callback de chargement depuis un élément source. |
| `RenderElement:createScene()` | 130 | ✍ Lance le chargement du fichier de scène configuré et la création de l'overlay une fois chargé. À associer à destroyScene pour libérer les ressources. |
| `RenderElement:destroyScene()` | 136 | ✍ Libère la requête de chargement i3d partagée, supprime l'overlay de rendu et le nœud de scène, et remet les références à nil. |
| `RenderElement:setScene(i3dFilename: string)` | 156 | ✍ Lance le chargement asynchrone du fichier i3d donné et marque l'élément comme en chargement. Journalise une erreur et ne fait rien si une requête de scène existe déjà ; appeler d'abord destroyScene. |
| `RenderElement:onSceneLoaded(node: integer, failedReason: integer, args: table?)` | 173 | ✍ Callback de fin de chargement. En cas de succès, rattache la scène au nœud racine, la masque et crée l'overlay ; en cas d'échec, journalise une erreur (fichier introuvable ou raison inconnue) et supprime le nœud retourné s'il existe. |
| `RenderElement:createOverlay()` | 195 | ✍ (Re)crée l'overlay de rendu à la taille de l'élément à l'écran multipliée par le facteur de sur-échantillonnage, avec la caméra trouvée par chemin. Journalise des erreurs si la caméra ou l'overlay manque ; en cas de succès le marque sale et déclenche onRenderLoad avec la scène et l'overlay. |
| `RenderElement:update(dt: number)` | 237 | ✍ Mise à jour par image : si le rendu est marqué sale et qu'un overlay existe, re-rend la scène dans l'overlay et efface l'indicateur. |
| `RenderElement:draw(clipX1: number?, clipY1: number?, clipX2: number?, clipY2: number?)` | 252 | ✍ Dessine l'overlay dans le rectangle de l'élément une fois chargé, en ajustant les coordonnées UV selon les limites de clipping demandées, puis exécute le draw du parent. |
| `RenderElement:canReceiveFocus() → boolean` | 305 | ✍ Retourne toujours false : un élément de rendu ne prend jamais le focus de l'interface. |
| `RenderElement:getSceneRoot() → integer` | 312 | ✍ Retourne le nœud racine de la scène chargée, ou nil si aucune n'est chargée. |
| `RenderElement:setRenderDirty()` | 318 | ✍ Marque l'overlay pour que la prochaine mise à jour re-rende la scène dedans. |

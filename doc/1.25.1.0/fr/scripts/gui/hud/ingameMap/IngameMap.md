# gui/hud/ingameMap/IngameMap.lua

*[English version](../../../../../scripts/gui/hud/ingameMap/IngameMap.md)*

Source: `dataS/scripts/gui/hud/ingameMap/IngameMap.lua` — FS25 1.25.1.0

✍ HUDElement affichant la carte et ses points d'intérêt, à la fois dans la mini-carte du HUD et dans le menu du jeu. Il gère plusieurs dispositions (aucune, cercle, carré, grand carré, plein écran), une liste de hotspots avec filtres par catégorie initialisés depuis le réglage INGAME_MAP_FILTER, et convertit les coordonnées monde en espace carte. Côté client uniquement. Les classes de disposition et le rendu des hotspots sont définis ailleurs (NON VÉRIFIÉ).

- **IngameMap** hérite de `HUDElement` (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `IngameMap.new(customMt: table?) → table` | 43 | ✍ Crée l'élément carte : fond, les cinq dispositions, filtres de catégories depuis le réglage, taille de monde par défaut 2048x2048 et listes de hotspots vides. Démarre au premier état de disposition avec le basculement autorisé. |
| `IngameMap:delete()` | 120 | ✍ Retire les événements d'action d'entrée liés à cet élément, supprime l'élément carte et les dispositions, efface le hotspot sélectionné et supprime le parent. |
| `IngameMap:setFullscreen(isFullscreen: any)` | 139 | ✍ Passe à la disposition plein écran ou revient à celle de l'état de basculement courant, sans changer cet état. Sans effet si rien ne change. |
| `IngameMap:toggleSize(state: any, force: any)` | 177 | ✍ Définit l'état de taille de la carte (borné entre 1 et 4) ou passe au suivant de façon cyclique si state est nil, l'enregistre dans le réglage ingameMapState et applique la disposition correspondante. L'argument force est inutilisé. |
| `IngameMap:resetSettings()` | 217 | ✍ Ignorée si l'instance est déjà supprimée ; sinon efface seulement le hotspot sélectionné (les lignes de remise à zéro échelle/position sont commentées dans la source). |
| `IngameMap:setAllowToggle(isAllowed: any)` | 249 | ✍ Définit si l'utilisateur peut changer la taille de la carte. |
| `IngameMap:loadMap(filename: any, worldSizeX: any, worldSizeZ: any, fieldColor: any, grassFieldColor: any)` | 270 | ✍ Remplace la texture de la carte par le fichier donné, définit la taille du monde et réapplique l'échelle d'interface. Les arguments fieldColor et grassFieldColor ne sont pas utilisés ici. |
| `IngameMap:setWorldSize(worldSizeX: any, worldSizeZ: any)` | 293 | ✍ Mémorise la taille du monde en X et Z, en déduit les décalages de centre et transmet la taille à chaque disposition. |
| `IngameMap:addMapHotspot(mapHotspot: any)` | 313 | ✍ Ajoute un hotspot à la liste, retrie et réinitialise les caches de tri, enregistre la carte comme écouteur d'état de rendu et renvoie le hotspot. |
| `IngameMap:removeMapHotspot(mapHotspot: any)` | 327 | ✍ Retire un hotspot (nil ignoré) : le désélectionne, efface la cible de carte de la mission si c'était lui, retire l'écouteur et réinitialise le tri. |
| `IngameMap:setSelectedHotspot(hotspot: any)` | 353 | ✍ Désélectionne le hotspot précédent et marque le nouveau comme sélectionné (l'un ou l'autre peut être nil). |
| `IngameMap:drawPlayersCoordinates()` | 737 | ✍ Formate le cap du joueur en degrés et les coordonnées monde X/Z sous forme de texte et le dessine via la disposition courante. |
| `IngameMap:drawLatencyToServer()` | 746 | ✍ Dans les sessions client multijoueur, dessine la latence vers le serveur en ms, colorée bonne jusqu'à 50, moyenne sous 100, mauvaise au-delà (minimum affiché 10 ms). Ne dessine rien sinon. |
| `IngameMap:drawHotspot(hotspot: any, smallVersion: any, scale: any, doDebug: any)` | 801 | ✍ Dessine un hotspot : convertit sa position monde en espace carte, demande à la disposition la position écran et la visibilité, applique le rectangle de découpe optionnel, mémorise sur le hotspot la dernière position/rotation/disposition écran et le rend. L'argument doDebug est inutilisé. |
| `IngameMap:setScale(uiScale: number)` | 846 | ✍ Applique l'échelle d'interface via l'implémentation parente, la mémorise et recalcule les valeurs mises à l'échelle. |
| `IngameMap:storeScaledValues(uiScale: any)` | 855 | ✍ Demande à chaque disposition de mémoriser ses valeurs mises à l'échelle et mémorise le décalage d'ancrage de l'aide. |
| `IngameMap:getBackgroundPosition()` | 882 | ✍ Renvoie la position de base de l'élément, soit les décalages de la zone de sécurité en X et Y. |
| `IngameMap:createBackground()` | 895 | ✍ Crée l'overlay de fond arrondi (noir, 75 % opaque) à la position de base avec la taille configurée. |
| `IngameMap:createComponents()` | 907 | ✍ Crée les composants d'affichage de l'élément ; actuellement seulement le glyphe d'entrée servant à changer la taille de la carte. |
| `IngameMap:createToggleMapSizeGlyph(baseX: any, baseY: any, baseWidth: any, baseHeight: any)` | 916 | ✍ Crée le glyphe d'entrée lié à InputAction.TOGGLE_MAP_SIZE, le positionne relativement à l'élément et l'ajoute comme enfant. |

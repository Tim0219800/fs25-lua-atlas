# gui/elements/IngameMapElement.lua

*[English version](../../../../scripts/gui/elements/IngameMapElement.md)*

Source: `dataS/scripts/gui/elements/IngameMapElement.lua` — FS25 1.25.1.0

✍ IngameMapElement est le GuiElement qui affiche la carte en plein écran dans les pages de menu. Il délègue le dessin à un objet IngameMap (défini avec setIngameMap) et gère le déplacement, le zoom, un curseur manette, la souris et le tactile, ainsi que la sélection des hotspots. Les réglages Platform.ingameMap pilotent le zoom. Clés XML : cursorId, mapAlpha, limitMapWidth, limitCursorMovement et callbacks onDrawPreIngameMap, onDrawPostIngameMap, onDrawPostIngameMapHotspots, onClickHotspot, onClickMap. Interface côté client uniquement.

- **IngameMapElement** hérite de `GuiElement` (l.24)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `IngameMapElement.new(target: any, custom_mt: any)` | 35 | ✍ Constructeur. Initialise les limites de zoom (1 à 8, défaut venant de Platform), le centre de carte 0,5/0,5, les compteurs d'entrées cumulées, les seuils de glissement, l'état du curseur et du pincement, et la sélection de hotspots activée. |
| `IngameMapElement:delete()` | 106 | ✍ Supprime l'overlay, abandonne la référence à ingameMap et appelle le delete du parent. L'objet IngameMap lui-même n'est pas supprimé ici. |
| `IngameMapElement:loadFromXML(xmlFile: any, key: any)` | 115 | ✍ Lit cursorId, mapAlpha, limitMapWidth et limitCursorMovement et enregistre les cinq callbacks de dessin et de clic. |
| `IngameMapElement:loadProfile(profile: any, applyProfile: any)` | 132 | ✍ Lit mapAlpha, limitMapWidth et limitCursorMovement depuis le profil. |
| `IngameMapElement:copyAttributes(src: any)` | 142 | ✍ Copie le zoom, l'alpha, l'id du curseur, les deux indicateurs de limite et les cinq callbacks depuis un élément source. |
| `IngameMapElement:onGuiSetupFinished()` | 159 | ✍ Cherche l'élément curseur par cursorId sur la vue cible et le mémorise ; affiche un avertissement si la cible n'a pas ce champ. |
| `IngameMapElement:addCursorDeadzone(screenX: any, screenY: any, width: any, height: any)` | 180 | ✍ Enregistre un rectangle d'écran (x, y, largeur, hauteur) où les entrées de la carte, comme le glissement et le zoom, sont ignorées. |
| `IngameMapElement:clearCursorDeadzones()` | 186 | ✍ Supprime toutes les zones mortes du curseur enregistrées. |
| `IngameMapElement:isInputInDeadzones(inputScreenX: any, inputScreenY: any)` | 192 | ✍ Renvoie true si le point d'écran donné se trouve dans une zone morte enregistrée. |
| `IngameMapElement:mouseEvent(posX: any, posY: any, isDown: any, isUp: any, button: any, eventUsed: any)` | 206 | ✍ Gère la souris quand l'élément est actif : passe en mode souris et masque le curseur, fait glisser la carte au-delà du seuil de glissement et, au relâchement du bouton gauche sans glissement, déclenche onClickMap et la sélection de hotspot. Renvoie si l'événement a été utilisé. |
| `IngameMapElement:touchEvent(posX: any, posY: any, isDown: any, isUp: any, touchId: any, eventUsed: any)` | 289 | ✍ Version tactile de mouseEvent, suivant les positions par identifiant de toucher et gérant un mode de choix de rotation qui clique la carte en continu hors du bouton de confirmation IA. À noter : il appelle le mouseEvent du parent (pas touchEvent) en passant touchId comme argument bouton. |
| `IngameMapElement:moveCenter(x: any, y: any)` | 393 | ✍ Décale le centre de la carte de x, y, borné à l'étendue de la carte (règle différente sur mobile ou avec limitCursorMovement), et transmet le nouveau centre à la disposition plein écran. |
| `IngameMapElement:panToHotspot(hotspot: hotspot, extraOffsetX: any)` | 420 | ✍ Centre la carte sur la position monde d'un hotspot (chemin bureau) ou calcule un décalage de curseur sur mobile. Sans effet pour nil. Le chemin mobile appelle worldToScreenPos, non défini dans ce fichier : NON VÉRIFIÉ. |
| `IngameMapElement:zoom(direction: zoomTarget, zoomTarget: any)` | 456 | ✍ Modifie le zoom d'un pas signé proportionnel à la largeur de carte, ou le fixe à zoomTarget, borné entre zoomMin et zoomMax. Garde stable le point sous le pointeur en recentrant. Retourne tôt si la plateforme ne peut pas zoomer. |
| `IngameMapElement:update(dt: any)` | 519 | ✍ Mise à jour par frame : lit le dernier mode d'entrée et, sauf si un dialogue est visible, applique le zoom cumulé, affiche le curseur en mode manette et le déplace, puis remet à zéro les accumulateurs d'entrée. |
| `IngameMapElement:resetFrameInputState()` | 549 | ✍ Remet à zéro les entrées cumulées de zoom et de curseur, effectue la réinitialisation de souris en attente et, sur mobile, termine un pincement en repositionnant le curseur. |
| `IngameMapElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 568 | ✍ Déclenche le callback avant carte, dessine la carte, déclenche le callback après carte, dessine les hotspots, déclenche le callback après hotspots, puis dessine les enfants via le parent. |
| `IngameMapElement:onOpen()` | 581 | ✍ Masque le curseur, mémorise la taille initiale, passe l'IngameMap en plein écran et réinitialise le zoom si la plateforme le demande. |
| `IngameMapElement:onClose()` | 602 | ✍ Retire les événements d'action d'entrée enregistrés et sort l'IngameMap du plein écran. |
| `IngameMapElement:reset()` | 612 | ✍ Remet le centre de la carte à 0,5/0,5 et le zoom à sa valeur par défaut. |
| `IngameMapElement:updateCursor(deltaX: any, deltaY: any, dt: any)` | 625 | ✍ Déplace le curseur manette ou la carte selon l'entrée analogique, pondérée par dt et le rapport d'aspect. Sur mobile ou avec le mouvement de carte verrouillé, le curseur se déplace dans des limites de décalage ; sinon le centre de la carte bouge. |
| `IngameMapElement:selectHotspotAt(posX: any, posY: any)` | 672 | ✍ Si la sélection de hotspot est active, choisit le hotspot sous un point d'écran, en essayant d'abord les listes prioritaires du joueur via les hotspots triés de l'IngameMap. Utilise getPlayerHotspot, non défini dans ce fichier : NON VÉRIFIÉ. |
| `IngameMapElement:selectHotspotFrom(hotspots: any, posX: any, posY: any)` | 696 | ✍ Parcourt une liste de hotspots depuis la fin pour trouver les hotspots visibles, activés par le filtre et sous le pointeur, garde le meilleur selon la valeur de tri et la distance, déclenche onClickHotspot et renvoie true si un hotspot est trouvé. |
| `IngameMapElement:getLocalPosition(posX: any, posY: any)` | 733 | ✍ Convertit une position d'écran en coordonnées locales de carte à l'aide de la taille et de la position de la disposition plein écran (échelle différente sur mobile). |
| `IngameMapElement:getLocalPointerTarget()` | 754 | ✍ Renvoie la position locale sur la carte du pointeur actif : dernière position souris ou toucher en mode souris, centre du curseur sinon, ou 0, 0 sans curseur. |
| `IngameMapElement:onClickMap(localPosX: any, localPosY: any)` | 787 | ✍ Convertit une position locale de carte en coordonnées monde x, z et déclenche le callback onClickMap avec celles-ci. |
| `IngameMapElement:localToWorldPos(localPosX: any, localPosY: any)` | 795 | ✍ Convertit des coordonnées locales de carte (échelle 0 à 1) en x, z du monde via la taille du terrain, avec z inversé et l'origine au centre du terrain. |
| `IngameMapElement:isPointVisible(x: any, z: any)` | 831 | ✍ Fonction vide dans ce fichier : prend x, z, ne fait rien et renvoie nil. |
| `IngameMapElement:setIngameMap(ingameMap: any)` | 836 | ✍ Assigne l'objet IngameMap et, si limitMapWidth est actif, limite la largeur de la carte plein écran à celle de cet élément. |
| `IngameMapElement:setTerrainSize(terrainSize: any)` | 845 | ✍ Mémorise la taille du terrain utilisée pour convertir les positions de carte en coordonnées monde. |
| `IngameMapElement:registerActionEvents()` | 876 | ✍ Enregistre via g_inputBinding les actions d'entrée de défilement horizontal et vertical, de validation, de zoom avant et arrière, et un écouteur de geste de pincement si un gestionnaire tactile existe. |
| `IngameMapElement:removeActionEvents()` | 890 | ✍ Retire tous les événements d'action enregistrés pour cet élément et l'écouteur de geste de pincement. |
| `IngameMapElement:onHorizontalCursorInput(_: any, inputValue: any)` | 900 | ✍ Callback d'action : cumule l'entrée horizontale du curseur sauf si la souris est utilisée ou si la carte est fixe horizontalement, et note l'heure d'entrée sur la page d'aperçu de carte pour des valeurs supérieures à 0,05. |
| `IngameMapElement:onVerticalCursorInput(_: any, inputValue: any)` | 912 | ✍ Callback d'action : cumule l'entrée verticale du curseur sauf si la souris est utilisée, et note l'heure d'entrée sur la page d'aperçu de carte pour des valeurs supérieures à 0,05. |
| `IngameMapElement:onAccept()` | 924 | ✍ Callback d'action du bouton de validation : clique la carte à la position du curseur et sélectionne le hotspot à cet endroit si la sélection est active. Nécessite un élément curseur. |
| `IngameMapElement:onZoomInput(_: inputValue, inputValue: direction, direction: any)` | 946 | ✍ Callback d'action : ajoute l'entrée de zoom signée (direction fois valeur) sauf si la souris est utilisée au-dessus d'une zone morte. |
| `IngameMapElement:onPinchEvent(offset: number, pinchCenterX: pinchCenterX, pinchCenterY: pinchCenterY, distance: number)` | 958 | ✍ Callback du geste de pincement : déplace le curseur au centre du pincement, ajoute le décalage du pincement (fois 100) à l'entrée de zoom et signale le pincement. |
| `IngameMapElement:checkAndResetMouse()` | 976 | ✍ Renvoie si le mode souris est actif et, le cas échéant, programme la remise à zéro de l'indicateur souris à la frame suivante. |

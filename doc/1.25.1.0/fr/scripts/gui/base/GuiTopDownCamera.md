# gui/base/GuiTopDownCamera.lua

*[English version](../../../../scripts/gui/base/GuiTopDownCamera.md)*

Source: `dataS/scripts/gui/base/GuiTopDownCamera.lua` — FS25 1.25.1.0

✍ Contrôleur de caméra en vue aérienne utilisé par les modes d'interface qui agissent sur le monde, comme le placement d'objets ou l'édition du terrain. Il possède une caméra de scène sur un nœud de base, suit la hauteur du terrain, et se déplace, zoome, s'incline et pivote en douceur à partir des actions d'entrée ou du défilement par bord d'écran, borné par la limite du système de placeables. Il change la caméra active via g_cameraManager et affiche le curseur souris tant qu'il est actif. Les constantes (CAMERA_*, ROTATION_*, MOVE_*, COLLISION_MASK) et le constructeur ne figurent pas dans les corps visibles du dump (NON VÉRIFIÉ). Côté client uniquement.

- **GuiTopDownCamera** (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `GuiTopDownCamera:createCameraNodes() → integer, integer` | 114 | ✍ Crée une caméra de champ de vision 60 degrés (proche 1, lointain 10000) enfant d'un groupe de transformation de base placé à 110 de hauteur et reculé de 5, active les mises à jour rapides des ombres, et retourne le nœud caméra et le nœud de base. |
| `GuiTopDownCamera:delete()` | 130 | ✍ Désactive la caméra si elle est active, la retire de g_cameraManager, supprime le nœud de base (et la caméra enfant) et réinitialise l'état. |
| `GuiTopDownCamera:reset()` | 143 | ✍ Efface la référence et la taille du terrain, la caméra précédente mémorisée et l'indicateur de capture du curseur. |
| `GuiTopDownCamera:setTerrainRootNode(terrainRootNode: any)` | 152 | ✍ Mémorise le nœud racine du terrain utilisé pour les requêtes de hauteur et lit la taille du terrain auprès du moteur. |
| `GuiTopDownCamera:activate()` | 159 | ✍ Affiche le curseur souris, mémorise la caméra active et bascule sur celle-ci, la centre sur la position du joueur local, enregistre les actions d'entrée et s'abonne à INPUT_MODE_CHANGED. |
| `GuiTopDownCamera:deactivate()` | 179 | ✍ Marque la caméra inactive, se désabonne des messages, retire les actions d'entrée, masque le curseur et restaure la caméra précédemment active. |
| `GuiTopDownCamera:getIsActive()` | 198 | ✍ Retourne si la caméra est actuellement active. |
| `GuiTopDownCamera:setCameraPosition(mapX: number, mapZ: number)` | 206 | ✍ Place la caméra et sa cible sur une position X/Z de la carte sans lissage, puis rafraîchit les nœuds de la caméra. |
| `GuiTopDownCamera:determineMapPosition() → number, number, number, number` | 218 | ✍ Retourne X de la caméra, 0, Z, puis la rotation Y en radians moins pi, et un 0 final. À noter : le commentaire de doc annonce quatre valeurs mais cinq sont retournées. |
| `GuiTopDownCamera:getPickRay()` | 224 | ✍ Retourne le rayon de sélection pour la position souris courante à travers cette caméra, via RaycastUtil.getCameraPickingRay. Un retour anticipé pour la capture du curseur est laissé en commentaire dans le code. |
| `GuiTopDownCamera:updatePosition()` | 235 | ✍ Recalcule le placement de la caméra : hauteur de base d'après le point de terrain le plus haut sur une grille 3x3 (pas de 2 m) plus un décalage, inclinaison et distance selon les facteurs de zoom et d'inclinaison, puis relève la caméra si le terrain ou des objets en collision la placent trop près du sol. |
| `GuiTopDownCamera:applyMovement(dt: any)` | 287 | ✍ Rapproche en douceur position, zoom, inclinaison et rotation de leurs cibles, avec un pas proportionnel à la distance restante divisée par dt et un alignement direct sous 0,0001. Zoom et inclinaison sont bornés à [0, 1]. |
| `GuiTopDownCamera:setMouseEdgeScrollingActive(isActive: any)` | 330 | ✍ Active ou désactive le défilement de la caméra quand le curseur est près du bord de l'écran. |
| `GuiTopDownCamera:setEdgeScrollingOffset(xMin: number, yMin: number, xMax: number, yMax: number)` | 340 | ✍ Définit le rectangle d'écran (X et Y min/max, en coordonnées écran) dans lequel le défilement par bord est détecté, afin d'exclure les panneaux d'interface. Les valeurs nil conservent la valeur actuelle. |
| `GuiTopDownCamera:getMouseEdgeScrollingMovement() → X, Z` | 351 | ✍ Retourne des valeurs de déplacement X et Z dans [-1, 1] qui augmentent quand le curseur entre dans une fine marge aux bords du rectangle de défilement, et 0, 0 ailleurs. |
| `GuiTopDownCamera:update(dt: any)` | 380 | ✍ Mise à jour par frame : tant qu'elle est active, et en mode souris ou si le mouvement manette n'est pas désactivé, exécute updateMovement puis efface les entrées accumulées. |
| `GuiTopDownCamera:updateMovement(dt: dt)` | 393 | ✍ Applique les entrées de zoom, rotation, inclinaison et déplacement plan aux cibles (défilement par bord s'il n'y a pas d'entrée de déplacement), adapte la vitesse au zoom, oriente la direction selon le cap de la caméra, limite la cible à la frontière des placeables, puis lisse et met à jour la caméra. La doc mentionne un paramètre movementMultiplier qui n'existe pas. |
| `GuiTopDownCamera:mouseEvent(posX: any, posY: any, isDown: any, isUp: any, button: any)` | 435 | ✍ Suit la position de la souris en mode souris. Après un glissement de rotation ou d'inclinaison, elle restaure le curseur et le replace au centre de l'écran ; ignorée dans la même frame qu'une action ou quand le curseur est verrouillé. |
| `GuiTopDownCamera:resetInputState()` | 460 | ✍ Remet à zéro les accumulateurs d'entrée de zoom, latéral, avant, inclinaison et rotation. |
| `GuiTopDownCamera:registerActionEvents()` | 470 | ✍ Enregistre les événements d'entrée pour le déplacement latéral/avant du joueur et les axes de zoom, rotation et inclinaison de la caméra de construction, avec une faible priorité de texte ; les événements de déplacement sont masqués de l'aide. |
| `GuiTopDownCamera:removeActionEvents()` | 491 | ✍ Retire tous les événements d'action d'entrée enregistrés par cet objet caméra. |
| `GuiTopDownCamera:onZoom(_: any, inputValue: any, _: any, isAnalog: any, isMouse: any)` | 501 | ✍ Callback de l'axe de zoom : mémorise une entrée de zoom proportionnelle au niveau de zoom actuel, réduite de moitié pour les sticks analogiques et ajustée pour la molette ; ignoré pour la souris quand mouseDisabled est actif. |
| `GuiTopDownCamera:onMoveSide(_: any, inputValue: any)` | 518 | ✍ Callback de l'axe de déplacement latéral : mémorise l'entrée latérale mise à l'échelle par un facteur et divisée par g_currentDt. |
| `GuiTopDownCamera:onMoveForward(_: any, inputValue: any)` | 524 | ✍ Callback de l'axe de déplacement avant : mémorise l'entrée avant mise à l'échelle par un facteur et divisée par g_currentDt. |
| `GuiTopDownCamera:onRotate(_: any, inputValue: any, _: any, isAnalog: any, isMouse: any)` | 530 | ✍ Callback de l'axe de rotation : mémorise l'entrée de rotation (inversée, mise à l'échelle) ; avec la souris il masque le curseur et démarre la capture du curseur. Ignoré pour la souris quand mouseDisabled est actif. |
| `GuiTopDownCamera:onTilt(_: any, inputValue: any, _: any, isAnalog: any, isMouse: any)` | 556 | ✍ Callback de l'axe d'inclinaison : mémorise l'entrée d'inclinaison mise à l'échelle ; avec la souris il masque le curseur et démarre la capture du curseur. Ignoré pour la souris quand mouseDisabled est actif. |
| `GuiTopDownCamera:onInputModeChanged(inputMode: any)` | 582 | ✍ Active le mode souris quand le premier élément du mode d'entrée correspond au mode d'aide clavier ; sinon recentre la position souris mémorisée. |

## Messages

- s'abonne à `MessageType.INPUT_MODE_CHANGED` (l.172)

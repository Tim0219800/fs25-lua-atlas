# gui/elements/TimerElement.lua

*[English version](../../../../scripts/gui/elements/TimerElement.md)*

Source: `dataS/scripts/gui/elements/TimerElement.lua` — FS25 1.25.1.0

✍ Élément de minuteur circulaire type horloge (valeur de 0 à 1) composé d'une image avant, de deux moitiés de fond, de deux moitiés de valeur et d'un marqueur qui tourne à un rayon donné. Dérivé de GuiElement. Le fichier lui-même indique qu'il n'est pas utilisé. À noter : timerOffset n'est jamais affecté dans ce fichier, donc draw échouerait dessus sauf affectation ailleurs (NON VÉRIFIÉ).

- **TimerElement** hérite de `GuiElement` (l.21)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TimerElement.new(target: any, custom_mt: any)` | 27 | ✍ Constructeur. Initialise la valeur 0, des tailles de minuteur/marqueur unitaires, le rayon et des overlays vides pour l'avant, les fonds, les valeurs et le marqueur. |
| `TimerElement:delete()` | 51 | ✍ Supprime les six overlays, puis appelle le delete du parent. |
| `TimerElement:loadFromXML(xmlFile: any, key: any)` | 63 | ✍ Charge depuis le XML les overlays image/bgImage/valueImage/markerImage ainsi que timerSize, markerSize, value et radius, crée les overlays et fixe la valeur initiale. |
| `TimerElement:loadProfile(profile: any, applyProfile: any)` | 95 | ✍ Charge les mêmes overlays ainsi que les tailles, la valeur et le rayon depuis un profil GUI. Ne crée pas les overlays et ne règle pas les UV ici. |
| `TimerElement:copyAttributes(src: any)` | 117 | ✍ Copie les tailles, le décalage, le rayon, la valeur et tous les overlays depuis un élément source. À noter : il indexe src.timerOffset, qui est nil sauf affectation ailleurs. |
| `TimerElement:setValue(newValue: any)` | 136 | ✍ Borne la valeur entre 0 et 1 et fait pivoter les UV du premier overlay de valeur et du premier fond pour que le remplissage corresponde. |
| `TimerElement:updateUVs(overlay: any, rotation: any)` | 144 | ✍ Écrit les huit coordonnées UV d'un overlay sous forme d'un quad pivoté de l'angle donné (radians) autour de son centre. |
| `TimerElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 158 | ✍ Dessine les moitiés de fond et de valeur selon que la valeur est au-dessus ou en dessous de la moitié, puis l'image avant et le marqueur placé sur une ellipse du rayon configuré. |

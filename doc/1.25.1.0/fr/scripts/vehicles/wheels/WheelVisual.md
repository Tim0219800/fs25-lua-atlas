# vehicles/wheels/WheelVisual.lua

*[English version](../../../../scripts/vehicles/wheels/WheelVisual.md)*

Source: `dataS/scripts/vehicles/wheels/WheelVisual.lua` — FS25 1.25.1.0

✍ Une roue visuelle (pneu, jantes et extras) d'une roue de véhicule, composée de parties visuelles chargées depuis le XML sous un groupe de transformation lié à la roue. Elle gère une roue jumelée connectée, indique largeur, décalage, nœud de pneu et masse ajoutée, transmet les mises à jour à ses parties et peut enregistrer un obstacle d'eau peu profonde dans la simulation de la mission.

- **WheelVisual** (l.24)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WheelVisual.new(vehicle: any, wheel: any, linkNode: any, isLeft: any, rimOffset: any, baseDirectory: any, customMt: any)` | 28 | ✍ Crée la roue visuelle en liant un nouveau groupe de transformation nommé visualWheel au nœud donné. Largeur et rayon valent 0,5 par défaut. |
| `WheelVisual:delete()` | 52 | ✍ Supprime toutes les parties visuelles, retire l'obstacle d'eau peu profonde et supprime le nœud racine. |
| `WheelVisual:loadFromXML(xmlObject: any)` | 64 | ✍ Charge largeur/rayon physiques, diamètre de jante, un gabarit de matériau de jante optionnel et chaque type de partie visuelle de WheelVisual.PARTS, en ajoutant le décalage de jante aux parties autres que innerRim et additional. Retourne true si au moins une partie est chargée. |
| `WheelVisual:postLoad()` | 113 | ✍ Applique le matériau de jante aux parties jante intérieure et extérieure, puis appelle `postLoad` sur chaque partie. |
| `WheelVisual:setConnectedWheel(connectedVisualWheel: any, offset: any)` | 127 | ✍ Lie cette roue à une roue jumelée avec un décalage signé et positionne son nœud selon X à côté d'elle, en tenant compte des deux largeurs et du côté gauche/droit. |
| `WheelVisual:getWidthAndOffset()` | 152 | ✍ Retourne la largeur de la roue et son décalage en X ; si une partie pneu existe, le décalage inclut celui du pneu (signe selon gauche/droite). |
| `WheelVisual:getIsTireInverted()` | 165 | ✍ Retourne l'indicateur d'inversion si la roue a une partie pneu, sinon false. |
| `WheelVisual:getTireNode()` | 177 | ✍ Retourne le nœud de la première partie pneu, ou nil s'il n'y en a pas. |
| `WheelVisual:getAdditionalMass()` | 189 | ✍ Retourne la masse cumulée de toutes les parties visuelles. |
| `WheelVisual:update(x: any, y: any, z: any, xDrive: any, suspensionLength: any, steeringAngle: any, changed: any)` | 200 | ✍ Appelle `update` sur chaque partie qui en a une, en faisant circuler l'indicateur de changement et la longueur de suspension ; retourne les deux valeurs. |
| `WheelVisual:addShallowWaterObstacle()` | 212 | ✍ Enregistre cette roue comme obstacle dans `g_currentMission.shallowWaterSimulation` s'il existe, dimensionné d'après largeur et rayon. Ignoré dans la configuration de boutique ; la classe de simulation est absente du dump (NON VÉRIFIÉ). |
| `WheelVisual:removeShallowWaterObstacle()` | 235 | ✍ Retire l'obstacle d'eau peu profonde s'il a été enregistré. |
| `WheelVisual:getShallowWaterParameters()` | 244 | ✍ Callback retournant le vecteur de poussée X/Z et la rotation Y pour la simulation d'eau, d'après la vitesse du véhicule plus un bruit aléatoire quand la roue patine ou avance. À noter : `math.random() * 2 - 1 * slip` a une précédence d'opérateurs particulière, donc le glissement ne multiplie que la constante 1. |
| `WheelVisual.registerXMLPaths(schema: any, key: any)` | 269 | ✍ Enregistre les chemins du schéma XML de chaque type de partie visuelle défini dans WheelVisual.PARTS sous la clé donnée. |

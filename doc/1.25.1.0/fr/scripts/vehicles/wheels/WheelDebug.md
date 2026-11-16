# vehicles/wheels/WheelDebug.lua

*[English version](../../../../scripts/vehicles/wheels/WheelDebug.md)*

Source: `dataS/scripts/vehicles/wheels/WheelDebug.lua` — FS25 1.25.1.0

✍ Outil de debug rattaché à une roue. Il dessine à l'écran des graphes force/glissement pour les forces longitudinales et latérales du pneu et remplit le tableau de debug de la roue (glissement, charge, friction, compression de suspension, tr/min, angle de braquage, rayon, raideur, masse, type de pneu, déformation, type de contact). Il s'appuie sur des fonctions moteur de wheel shape absentes du dump (détails NON VÉRIFIÉS).

- **WheelDebug** (l.10)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WheelDebug.new(wheel: any)` | 14 | ✍ Crée l'outil de debug pour une roue et mémorise son véhicule. |
| `WheelDebug:delete()` | 25 | ✍ Libère les graphes de friction et les overlays de glissement s'ils ont été créés. |
| `WheelDebug:drawSlipGraphs()` | 42 | ✍ Dessine les courbes de friction longitudinale et latérale de cette roue (positionnées selon l'indice de roue) et superpose le point courant glissement/force. Ne fait rien tant que la wheel shape physique n'existe pas. Utilise des fonctions moteur comme `getWheelShapeSlip` et `computeWheelShapeTireForces` (comportement NON VÉRIFIÉ). |
| `WheelDebug.getDebugValueHeader()` | 125 | ✍ Retourne les 15 en-têtes de colonnes du tableau de debug des roues. |
| `WheelDebug:fillDebugValues(debugTable: any)` | 131 | ✍ Ajoute les valeurs de debug de cette roue aux colonnes du tableau, ou « n/a » partout si la wheel shape n'est pas créée. Inclut un pourcentage de compression de suspension et la déformation maximale des pneus visuels. |

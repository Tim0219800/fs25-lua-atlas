# vehicles/wheels/WheelSteering.lua

*[English version](../../../../scripts/vehicles/wheels/WheelSteering.md)*

Source: `dataS/scripts/vehicles/wheels/WheelSteering.lua` — FS25 1.25.1.0

✍ Aide visuelle au braquage d'une roue : déplace ou fait pivoter un nœud de direction et fait tourner les garde-boue selon l'angle de braquage de la roue, avec des limites issues du XML. Gère aussi une échelle d'essieu directeur réutilisant ces limites. Purement visuel ; créé par roue.

- **WheelSteering** (l.10)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WheelSteering.new(wheel: any)` | 14 | ✍ Crée l'aide au braquage d'une roue avec des limites de rotation par défaut de -1 et 1. |
| `WheelSteering:loadFromXML(xmlObject: any)` | 28 | ✍ Lit le nœud de direction, le nœud de rotation, les valeurs min/max de translation et de rotation, la liste des garde-boue avec leurs limites et les valeurs d'essieu directeur depuis le XML. Retourne toujours true. |
| `WheelSteering:setSteeringValues(rotMin: any, rotMax: any, rotSpeed: any, rotSpeedNeg: any, inverted: any)` | 67 | ✍ Reçoit la plage de braquage physique de la roue et complète les limites de garde-boue manquantes ainsi que les limites globales du nœud de direction. Si une échelle d'essieu directeur est définie, elle est inversée si demandé et prend la plage comme limites. Les arguments de vitesse sont inutilisés. |
| `WheelSteering:update(x: any, y: any, z: any, xDrive: any, suspensionLength: any, steeringAngle: any, changed: any)` | 90 | ✍ Applique visuellement l'angle de braquage : translate et/ou fait pivoter le nœud de direction proportionnellement aux limites min/max, et fait tourner chaque garde-boue autour de Y du dépassement de l'angle par rapport à ses limites. Les autres arguments sont inutilisés. |
| `WheelSteering.registerXMLPaths(schema: any, key: any)` | 135 | ✍ Enregistre les chemins du schéma XML du nœud de direction, du nœud de rotation, des limites de translation/rotation, des garde-boue et de l'essieu directeur. |

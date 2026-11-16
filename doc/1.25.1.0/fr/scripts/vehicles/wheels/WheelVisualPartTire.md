# vehicles/wheels/WheelVisualPartTire.lua

*[English version](../../../../scripts/vehicles/wheels/WheelVisualPartTire.md)*

Source: `dataS/scripts/vehicles/wheels/WheelVisualPartTire.lua` — FS25 1.25.1.0

✍ Partie visuelle de roue pour le pneu (sous-classe de WheelVisualPart). Elle peut montrer la déformation due à la pression en pilotant les paramètres shader `morphPos`/`prevMorphPos` des shapes du pneu d'après la longueur de suspension, quand le réglage de plateforme `wheelVisualPressure` est actif ; elle ajoute aussi la déformation à la longueur de suspension retournée.

- **WheelVisualPartTire** hérite de `WheelVisualPart` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WheelVisualPartTire.new(name: any, visualWheel: any, linkNode: any, customMt: any)` | 16 | ✍ Crée une partie pneu via le constructeur parent avec une déformation de 0. À noter : l'argument customMt est ignoré. |
| `WheelVisualPartTire:loadFromXML(xmlObject: any, key: any)` | 27 | ✍ Appelle le chargeur parent, puis lit maxDeformation et initialDeformation (par défaut min(0,04 ; 60 % du maximum)). Retourne false si le chargement parent échoue. |
| `WheelVisualPartTire:update(x: any, y: any, z: any, xDrive: any, suspensionLength: any, steeringAngle: any, changed: any)` | 40 | ✍ Si la pression visuelle est activée, calcule une déformation bornée d'après la longueur de suspension, met à jour les paramètres shader de morphing quand elle dépasse un seuil de plateforme, et retourne l'indicateur de changement et la longueur de suspension augmentée de la déformation. |
| `WheelVisualPartTire:setNode(node: any)` | 80 | ✍ Appelle le `setNode` parent, collecte les shapes possédant un paramètre shader `morphPos` (ou l'ancien `morphPosition`) et initialise leurs paramètres de morphing, en convertissant l'ancien format FS22. |
| `WheelVisualPartTire.registerXMLPaths(schema: any, key: any, name: any)` | 109 | ✍ Enregistre les chemins XML de la partie pneu ; se contente actuellement de déléguer à l'enregistrement parent. |

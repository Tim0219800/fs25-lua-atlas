# vehicles/wheels/WheelVisualPartConnector.lua

*[English version](../../../../scripts/vehicles/wheels/WheelVisualPartConnector.md)*

Source: `dataS/scripts/vehicles/wheels/WheelVisualPartConnector.lua` — FS25 1.25.1.0

✍ Partie visuelle de roue pour le connecteur entre roues jumelées (sous-classe de WheelVisualPart). Quand la roue visuelle a une jumelle connectée, elle positionne le nœud du connecteur et alimente les paramètres shader du connecteur, en pouces, d'après les largeurs et décalages, selon deux modes (connectorPos ou widthAndDiam).

- **WheelVisualPartConnector** hérite de `WheelVisualPart` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WheelVisualPartConnector.new(name: any, visualWheel: any, linkNode: any, customMt: any)` | 16 | ✍ Crée une partie connecteur via le constructeur parent. À noter : l'argument customMt est ignoré ; la métatable du connecteur est toujours utilisée. |
| `WheelVisualPartConnector:loadFromXML(xmlObject: any, key: any)` | 25 | ✍ Appelle le chargeur parent, puis lit les options du connecteur (useWidthAndDiam, usePosAndScale, diameter, offset, hookOffset, width, positions et décalages de début/fin, uniformScale). Retourne false si le chargement parent échoue. |
| `WheelVisualPartConnector:setNode(node: any)` | 50 | ✍ Appelle le `setNode` parent ; s'il existe une roue connectée, déplace le nœud vers elle et définit les paramètres shader connectorPos ou widthAndDiam (et connectorPosAndScale si activé) d'après les dimensions des roues. |
| `WheelVisualPartConnector.registerXMLPaths(schema: any, key: any, name: any)` | 82 | ✍ Enregistre les chemins XML du connecteur ; se contente actuellement de déléguer à l'enregistrement parent. |

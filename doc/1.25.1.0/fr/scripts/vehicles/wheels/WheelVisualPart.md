# vehicles/wheels/WheelVisualPart.lua

*[English version](../../../../scripts/vehicles/wheels/WheelVisualPart.md)*

Source: `dataS/scripts/vehicles/wheels/WheelVisualPart.lua` — FS25 1.25.1.0

✍ Classe de base d'une partie visuelle de roue (jante, pneu, connecteur, extra) : charge un i3d, éventuellement via un xml intermédiaire qui nomme le fichier et les chemins de nœud gauche/droite, puis lie, décale, met à l'échelle et applique les matériaux. WheelVisualPartTire et WheelVisualPartConnector l'étendent.

- **WheelVisualPart** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WheelVisualPart.new(name: any, visualWheel: any, linkNode: any, customMt: any)` | 16 | ✍ Crée une partie avec son nom, sa roue visuelle propriétaire et son nœud de liaison. |
| `WheelVisualPart:delete()` | 28 | ✍ Libère la requête de chargement i3d partagée. |
| `WheelVisualPart:loadFromXML(xmlObject: any, key: any)` | 36 | ✍ Lit le fichier (i3d ou xml enveloppe), le chemin de nœud gauche/droite, widthAndDiam, décalage, échelle, holeScale, masse, inversion et matériaux, puis lance le chargement i3d partagé. Retourne false s'il n'y a pas de fichier ou si le xml enveloppe est invalide. |
| `WheelVisualPart:postLoad()` | 122 | ✍ Applique chaque matériau chargé au nœud de la partie. |
| `WheelVisualPart:getDefaultMaterialSlotName()` | 130 | ✍ Retourne le nom d'emplacement de matériau par défaut selon le type de partie (jante intérieure, extérieure, extra, connecteur), ou nil pour les autres. |
| `WheelVisualPart:onPartI3DLoaded(i3dNode: any, failedReason: any, args: any)` | 144 | ✍ Callback après chargement du i3d : trouve le nœud par son chemin d'indice, le passe à `setNode` et supprime la racine chargée. |
| `WheelVisualPart:setNode(node: any)` | 157 | ✍ Lie le nœud sous le nœud de liaison, le positionne selon le décalage (inversé côté droit), puis applique l'échelle, le paramètre shader widthAndDiam (ou une échelle en pouces sans paramètre shader), l'échelle des trous et l'inversion. |
| `WheelVisualPart:setShaderParameterRec(node: any, shaderParameterName: any, x: any, y: any, z: any, w: any)` | 193 | ✍ Définit récursivement un paramètre shader sur ce nœud et tous ses enfants qui sont des shapes. |
| `WheelVisualPart:getHasShaderParameterRec(node: any, shaderParameterName: any)` | 206 | ✍ Vérifie récursivement si une shape de la hiérarchie possède un paramètre shader. À noter : la vérification est codée en dur sur le nom `widthAndDiam`, l'argument de nom est ignoré. |
| `WheelVisualPart:getMass()` | 225 | ✍ Retourne la masse de la partie issue du XML, ou 0 s'il n'y en a pas. |
| `WheelVisualPart.registerXMLPaths(schema: any, key: any, name: any)` | 231 | ✍ Enregistre les chemins XML de matériau et de matériau court d'une partie visuelle sous la clé donnée. |

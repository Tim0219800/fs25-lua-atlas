# utils/ObjectChangeUtil.lua

*[English version](../../../scripts/utils/ObjectChangeUtil.md)*

Source: `dataS/scripts/utils/ObjectChangeUtil.lua` — FS25 1.25.1.0

✍ Gère la fonctionnalité XML objectChange : un noeud peut avoir un jeu de valeurs quand une configuration est active et un autre quand elle est inactive (visibilité, translation, rotation, échelle, paramètre de shader, masse, centre de masse, noeud parent, type de corps rigide, enfant composé, suppression). Elle charge ces entrées, les applique avec interpolation optionnelle via ValueInterpolator et enregistre les chemins du schéma. L'aide loadValueType qu'elle appelle n'est pas définie dans ce fichier (NON VÉRIFIÉ).

- **ObjectChangeUtil** (l.4)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ObjectChangeUtil.loadObjectChangeFromXML(xmlFile: XMLFile, key: string, objects: table?, rootNode: integer, parent: table?) → array?` | 14 | ✍ Lit chaque enfant objectChange sous une clé, résout son noeud (avec les i3dMappings du parent s'il y en a) et charge ses valeurs. Renvoie la table fournie ou une nouvelle table d'objets de changement, ou nil si rien n'a été chargé. |
| `ObjectChangeUtil.loadValuesFromXML(xmlFile: XMLFile, key: string, node: integer, object: table, parent: table?, rootNode: integer?, i3dMappings: table?)` | 81 | ✍ Remplit un objet de changement depuis une entrée XML : réglages d'interpolation et valeurs actif/inactif pour parent, suppression, transformation, paramètre de shader, centre de masse, masse (unité XML divisée par 1000), visibilité, enfant composé et type de corps rigide. Appelle loadObjectChangeValuesFromXML du parent s'il existe. |
| `ObjectChangeUtil.setObjectChanges(objects: table, isActive: boolean, target: table?, updateFunc: function?, skipInterpolation: boolean?)` | 292 | ✍ Applique setObjectChange à chaque objet d'une table dans l'état actif ou inactif donné. Ne fait rien si la table est nil. |
| `ObjectChangeUtil.setObjectChange(object: table, isActive: boolean, target: table, updateFunc: function, skipInterpolation: boolean?)` | 307 | ✍ Applique les valeurs actives ou inactives d'un objet de changement, soit directement, soit via un ValueInterpolator si l'interpolation est activée et non ignorée, puis règle le type de corps rigide. Appelle enfin target:setObjectChangeValues et la fonction de mise à jour si fournies. |
| `ObjectChangeUtil.updateObjectChanges(xmlFile: XMLFile, key: string, configIndex: integer, rootNode: integer, parent: table)` | 374 | ✍ Parcourt les blocs objectChange numérotés sous une clé, met d'abord inactives toutes les configurations non retenues puis active celle choisie par l'index de configuration, qui l'emporte donc en cas de conflit. L'index de configuration commence à 1. |
| `ObjectChangeUtil.registerObjectChangeXMLPaths(schema: XMLSchema, basePath: string)` | 401 | ✍ Enregistre les chemins du schéma pour un groupe objectChange unique au chemin de base, via l'enregistrement partagé nommé ObjectChange_single. |
| `ObjectChangeUtil.registerObjectChangesXMLPaths(schema: XMLSchema, basePath: string)` | 411 | ✍ Enregistre les chemins du schéma pour plusieurs entrées objectChange sous un sous-élément objectChanges, via l'enregistrement partagé nommé ObjectChange_multiple. |
| `ObjectChangeUtil.registerObjectChangeSingleXMLPaths(schema: XMLSchema, basePath: string)` | 421 | ✍ Déclare chaque attribut objectChange : node, interpolation et sa durée, et les paires Active/Inactive pour delete, visibility, translation, rotation, scale, shaderParameter, mass, centerOfMass, compoundChild, rigidBodyType et parentNode. À noter : deleteInactive est enregistré avec le même texte descriptif que deleteActive. |
| `ObjectChangeUtil.addAdditionalObjectChangeXMLPaths(schema: XMLSchema, func: function)` | 472 | ✍ Met en file une fonction chargée d'enregistrer plus tard des chemins objectChange supplémentaires, via l'enregistrement différé du schéma sous le nom ObjectChange. |

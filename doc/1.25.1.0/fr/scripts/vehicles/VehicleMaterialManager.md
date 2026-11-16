# vehicles/VehicleMaterialManager.lua

*[English version](../../../scripts/vehicles/VehicleMaterialManager.md)*

Source: `dataS/scripts/vehicles/VehicleMaterialManager.lua` — FS25 1.25.1.0

✍ Gestionnaire (étend `AbstractManager`) des modèles de matériaux utilisés par le shader des véhicules (couleurs de peinture, lissage, vernis, textures de détail). Au chargement de la carte il lit les fichiers de modèles par défaut et de marques, puis les modèles déclarés par les mods. Les modèles peuvent hériter d'un modèle parent et sont indexés par nom en majuscules, préfixé de l'environnement du mod pour les mods.

- **VehicleMaterialManager** hérite de `AbstractManager` (l.21)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleMaterialManager:initDataStructures()` | 36 | ✍ Crée la liste vide de modèles, la table de recherche par nom et la file des fichiers de modèles de mods à charger. |
| `VehicleMaterialManager:loadMapData(mapXMLFile: integer, missionInfo: table, baseDirectory: string) → boolean` | 48 | ✍ Charge les fichiers de modèles par défaut et de marques, puis vide la file des XML de modèles de mods (parent par défaut `calibratedPaint`), en chargeant chacun et en le retirant de la file. |
| `VehicleMaterialManager:addModMaterialTemplatesToLoad(xmlFilename: any, key: any, baseDirectory: any, customEnvironment: any)` | 68 | ✍ Met en file le XML de modèles d'un mod (fichier, clé, dossier de base, environnement) pour un chargement au prochain `loadMapData`. |
| `VehicleMaterialManager:loadMaterialTemplates(xmlFilename: any, baseDirectory: any, customEnvironment: any)` | 74 | ✍ Charge un fichier XML de modèles avec le schéma du gestionnaire et lit sa section `templates`, puis libère le fichier. |
| `VehicleMaterialManager:loadMaterialTemplatesFromXML(xmlFile: any, key: any, baseDirectory: any, customEnvironment: any, parentTemplateDefault: any)` | 84 | ✍ Lit chaque entrée `template` : nom, parent, marque, échelles de couleur et de finition, textures de détail diffuse/normale/spéculaire. Les entrées dont le parent manque ou sans texture propre ni héritée sont ignorées avec un avertissement XML. |
| `VehicleMaterialManager:getMaterialTemplateByName(name: any, customEnvironment: any)` | 183 | ✍ Retourne le modèle pour un nom ; avec un environnement personnalisé il essaie d'abord le nom préfixé, puis le nom simple. Retourne nil sinon. |
| `VehicleMaterialManager:getMaterialTemplateColorByName(name: any, customEnvironment: any)` | 200 | ✍ Retourne l'échelle de couleur du modèle sous forme d'une table à quatre valeurs avec alpha 0, ou nil si le modèle ou son colorScale manque. |
| `VehicleMaterialManager:getMaterialTemplateColorAndTitleByName(name: any, customEnvironment: any)` | 214 | ✍ Retourne une copie de l'échelle de couleur (blanc si absente) et un titre d'affichage composé du titre de marque et du titre traduit du modèle ; retourne nil, nil si inconnu. |
| `VehicleMaterialManager:getMaterialTemplateIndexByName(name: any)` | 247 | ✍ Retourne l'index dans la liste du modèle portant ce nom, ou 1 si le nom est nil ou introuvable. |
| `VehicleMaterialManager:getMaterialTemplateNameByIndex(index: any)` | 262 | ✍ Retourne le nom du modèle à un index, avec repli sur le premier modèle si l'index est invalide. |
| `VehicleMaterialManager:getMaterialTemplateFinish(materialTemplateName: any)` | 270 | ✍ Déduit la finition d'après le nom du modèle : retourne isMetallic (le nom contient silver, copper, gold, bronze, chrome ou metallic) et isMat (contient matpaint). |
| `VehicleMaterialManager.registerXMLPaths(schema: any, basePath: any)` | 296 | ✍ Enregistre sur un schéma XML les attributs autorisés d'un fichier de modèles : nom, titre, parent, marque, échelles de couleur et de finition, textures de détail et options colorScan. |

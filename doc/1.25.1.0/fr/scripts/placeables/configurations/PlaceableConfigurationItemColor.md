# placeables/configurations/PlaceableConfigurationItemColor.lua

*[English version](../../../../scripts/placeables/configurations/PlaceableConfigurationItemColor.md)*

Source: `dataS/scripts/placeables/configurations/PlaceableConfigurationItemColor.lua` — FS25 1.25.1.0

✍ Sous-classe d'élément de configuration pour les couleurs de placeables. Elle lit les couleurs depuis le XML (valeurs RGB ou modèles de matériau de `g_vehicleMaterialManager`), peut générer la liste de couleurs par défaut plus un emplacement de couleur personnalisée, sauvegarde et synchronise les couleurs personnalisées, et applique la couleur aux matériaux par nom d'emplacement et aux nœuds via le paramètre de shader `colorScale0`. Dépend de `PlaceableConfigurationItemColor.DEFAULT_COLORS` et `DEFAULT_COLORS_PATCH_1_2`, non définis dans ce fichier (NON VÉRIFIÉ).

- **PlaceableConfigurationItemColor** hérite de `PlaceableConfigurationItem` (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableConfigurationItemColor.new(configName: any, customMt: any)` | 18 | ✍ Crée un élément de couleur via le constructeur parent, avec les indicateurs couleur personnalisée et configuration manuelle désactivés. À noter : l'argument `customMt` est ignoré. |
| `PlaceableConfigurationItemColor:loadFromXML(xmlFile: any, baseKey: any, configKey: any, baseDirectory: any, customEnvironment: any)` | 29 | ✍ Charge les données de base, puis la couleur depuis `#color` (nom de modèle de matériau ou RGB à 3 valeurs), `#uiColor`, `#materialTemplateName` et `#colorOffset` (0,71 par défaut). Blanc par défaut, et marque l'élément comme manuel. Retourne false si le chargement parent échoue. |
| `PlaceableConfigurationItemColor:saveToXMLFile(xmlFile: any, key: any, isActive: any, configurationData: any)` | 80 | ✍ Appelle la sauvegarde parente, puis pour un élément de couleur personnalisée écrit aussi la couleur choisie et le nom du modèle de matériau issus des données de configuration. |
| `PlaceableConfigurationItemColor:loadFromSavegameXMLFile(xmlFile: any, key: any, configurationData: any)` | 96 | ✍ Appelle le chargement parent, puis pour un élément de couleur personnalisée lit la couleur sauvegardée et le nom du modèle de matériau dans les données de configuration. |
| `PlaceableConfigurationItemColor:readFromStream(streamId: any, connection: any, configurationData: any)` | 107 | ✍ Pour les couleurs personnalisées, lit une couleur RGB compressée et un index de modèle de matériau depuis le flux et les stocke dans les données de configuration. |
| `PlaceableConfigurationItemColor:writeToStream(streamId: any, connection: any, configurationData: any)` | 119 | ✍ Pour les couleurs personnalisées, écrit la couleur RGB compressée (blanc si absente) et l'index du modèle de matériau, borné à la plage autorisée. |
| `PlaceableConfigurationItemColor:hasDataChanged(configurationData1: any, configurationData2: any)` | 135 | ✍ Pour les couleurs personnalisées, retourne true si deux tables de données diffèrent par la couleur (tolérance 0,00001 par canal, ou l'une absente) ou par le nom du modèle de matériau. Sinon false. |
| `PlaceableConfigurationItemColor:getColor(placeable: any)` | 157 | ✍ Retourne la couleur effective de cet élément pour un placeable (une copie) et le décalage de couleur. |
| `PlaceableConfigurationItemColor:getColorAndMaterialFromPlaceable(placeable: any)` | 164 | ✍ Retourne une copie de la couleur, le nom du modèle de matériau et le décalage de couleur, en utilisant les données de configuration du placeable si elles existent plutôt que les valeurs par défaut de l'élément. |
| `PlaceableConfigurationItemColor:onSizeLoad(xmlFile: any, sizeData: any)` | 188 | ✍ N'exécute le point d'extension parent de taille que pour les éléments ayant une clé de configuration, en ignorant les couleurs dynamiques sans définition XML. |
| `PlaceableConfigurationItemColor:onPostLoad(placeable: any, configId: any)` | 197 | ✍ Après le point d'extension parent, applique la couleur à chaque emplacement `.material` via `applyColor` sur le nœud racine du placeable, et règle le paramètre de shader `colorScale0` sur chaque entrée `.node`. |
| `PlaceableConfigurationItemColor.postLoad(xmlFile: any, baseKey: any, baseDir: any, customEnvironment: any, isMod: any, configurationItems: any, storeItem: any, configName: any)` | 241 | ✍ Construit les éléments de couleur par défaut (un par matériau de `DEFAULT_COLORS`, plus un élément de couleur personnalisée non sélectionnable) si `#useDefaultColors` est actif ou si le mod FS25_unlimitedColorConfigurations est chargé. Garantit aussi qu'un élément par défaut existe. |
| `PlaceableConfigurationItemColor.getFallbackConfigId(configs: any, configId: any, configName: any, configFileName: any)` | 309 | ✍ Convertit un ancien identifiant numérique de configuration (antérieur au patch 3) en index et identifiant de sauvegarde de l'élément dont l'identifiant correspond au nom de matériau de `DEFAULT_COLORS_PATCH_1_2`. Retourne nil, nil sans correspondance. |
| `PlaceableConfigurationItemColor.registerXMLPaths(schema: any, rootPath: any, configPath: any)` | 337 | ✍ Enregistre les chemins parents plus defaultColorIndex, useDefaultColors, price, `.material(?)#slotName`, `.node(?)#node`, colorOffset, color, uiColor et materialTemplateName. |
| `PlaceableConfigurationItemColor.registerSavegameXMLPaths(schema: any, basePath: any)` | 354 | ✍ Enregistre les chemins de sauvegarde parents plus colorOffset, color (3 valeurs) et materialTemplateName. |

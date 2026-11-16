# vehicles/configurations/VehicleConfigurationItemColor.lua

*[English version](../../../../scripts/vehicles/configurations/VehicleConfigurationItemColor.md)*

Source: `dataS/scripts/vehicles/configurations/VehicleConfigurationItemColor.lua` — FS25 1.25.1.0

✍ Entrée de configuration (sous-classe de VehicleConfigurationItem) pour les couleurs de véhicule. Elle résout couleurs et modèles de matériau via g_vehicleMaterialManager, construit des objets VehicleMaterial, génère les couleurs de marque par défaut et une option de couleur personnalisée si demandé, applique la couleur aux matériaux du véhicule et écrit les couleurs personnalisées dans la sauvegarde et le flux réseau.

- **VehicleConfigurationItemColor** hérite de `VehicleConfigurationItem` (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleConfigurationItemColor.new(configName: any, customMt: any)` | 18 | ✍ Constructeur. Appelle le constructeur parent et met isCustomColor et isManualConfig à false. À noter : l'argument customMt est ignoré, la métatable de la classe est toujours transmise au constructeur parent. |
| `VehicleConfigurationItemColor:loadFromXML(xmlFile: any, baseKey: any, configKey: any, baseDirectory: any, customEnvironment: any)` | 29 | ✍ Charge les données parentes, puis la couleur (nom de modèle ou triplet rvb, avertissement s'il n'a pas 3 valeurs), uiColor, materialTemplateName, isMetallic et isMat. Les modèles chrome et silver modifient la couleur d'interface ; blanc par défaut, et l'entrée est marquée configuration manuelle. Renvoie false si le parent échoue. |
| `VehicleConfigurationItemColor:saveToXMLFile(xmlFile: any, key: any, isActive: any, configurationData: any)` | 90 | ✍ Appelle la sauvegarde parente ; pour l'entrée de couleur personnalisée, écrit aussi la couleur choisie et le nom du modèle de matériau issus de configurationData. |
| `VehicleConfigurationItemColor:loadFromSavegameXMLFile(xmlFile: any, key: any, configurationData: any)` | 106 | ✍ Appelle la méthode parente ; pour l'entrée de couleur personnalisée, relit color et materialTemplateName dans configurationData. |
| `VehicleConfigurationItemColor:readFromStream(streamId: any, connection: any, configurationData: any)` | 117 | ✍ Lecture réseau pour l'entrée de couleur personnalisée : lit une couleur compressée et un indice de modèle de matériau (converti en nom) dans configurationData. Sans effet pour les autres entrées. |
| `VehicleConfigurationItemColor:writeToStream(streamId: any, connection: any, configurationData: any)` | 129 | ✍ Pendant d'écriture réseau : écrit la couleur compressée (blanche à défaut) et l'indice de modèle borné à la plage autorisée. Uniquement pour l'entrée de couleur personnalisée. |
| `VehicleConfigurationItemColor:hasDataChanged(configurationData1: any, configurationData2: any)` | 145 | ✍ Pour l'entrée de couleur personnalisée, renvoie true si les couleurs diffèrent de plus de 0,00001 sur un canal, si une seule a une couleur, ou si les noms de modèle diffèrent. Sinon false. |
| `VehicleConfigurationItemColor:updateMaterial(vehicle: any)` | 167 | ✍ Crée le VehicleMaterial mis en cache de cette entrée (recréé à chaque appel pour les couleurs personnalisées) avec la couleur et le modèle résolus depuis le véhicule. |
| `VehicleConfigurationItemColor:getColor()` | 184 | ✍ Renvoie une copie de la couleur sous forme de table à trois valeurs. |
| `VehicleConfigurationItemColor:getMaterial(vehicle: any)` | 190 | ✍ Met à jour le matériau pour le véhicule donné et renvoie le VehicleMaterial. |
| `VehicleConfigurationItemColor:onSizeLoad(xmlFile: any, sizeData: any)` | 198 | ✍ N'applique la gestion parente des dimensions que si l'entrée a une clé de configuration XML, donc les entrées de couleur générées dynamiquement sont ignorées. |
| `VehicleConfigurationItemColor:getColorAndMaterialFromVehicle(vehicle: any)` | 207 | ✍ Renvoie la couleur et le nom du modèle de matériau, en préférant les données de configuration du véhicule (couleur personnalisée) aux valeurs par défaut de l'entrée. |
| `VehicleConfigurationItemColor:onPostLoad(object: any, configId: any)` | 229 | ✍ Après l'étape parente, parcourt les entrées .material de la configuration dans le XML du véhicule, construit chaque matériau (couleur de contraste facultative selon un seuil de luminosité), le charge et l'applique à l'emplacement du véhicule ; avertit si le nom d'emplacement manque ou est introuvable. |
| `VehicleConfigurationItemColor.postLoad(xmlFile: any, baseKey: any, baseDir: any, customEnvironment: any, isMod: any, configurationItems: any, storeItem: any, configName: any)` | 269 | ✍ Statique. Avec useDefaultColors (ou le mod FS25_unlimitedColorConfigurations chargé), ajoute les couleurs de marque par défaut et une entrée de couleur personnalisée non sélectionnable ; choisit aussi la première entrée par défaut si aucune n'est marquée et qu'aucun defaultColorIndex n'est donné. |
| `VehicleConfigurationItemColor.getFallbackConfigId(configs: any, configId: any, configName: any, configFileName: any)` | 348 | ✍ Statique. Convertit un ancien identifiant de sauvegarde numérique (d'avant le patch 3, basé sur l'indice de couleur) vers l'identifiant actuel basé sur le matériau de marque ; renvoie indice et saveId, ou nil, nil s'il n'est pas résolu. |
| `VehicleConfigurationItemColor.getMaterialByColorConfiguration(vehicle: any, configName: any)` | 376 | ✍ Statique. Retrouve dans l'objet de boutique l'entrée sélectionnée du véhicule pour la configuration de couleur nommée et renvoie son VehicleMaterial, ou nil si ce n'est pas une entrée de couleur. |
| `VehicleConfigurationItemColor.registerXMLPaths(schema: any, rootPath: any, configPath: any)` | 396 | ✍ Statique. Enregistre les attributs XML propres aux couleurs (options de couleurs par défaut, prix, modèle de base, entrées .material avec réglages de contraste, color, uiColor, isMetallic, isMat, materialTemplateName). |
| `VehicleConfigurationItemColor.registerSavegameXMLPaths(schema: any, basePath: any)` | 420 | ✍ Statique. Enregistre les chemins de sauvegarde parents ainsi que les attributs de couleur personnalisée et materialTemplateName. |

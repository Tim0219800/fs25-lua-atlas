# vehicles/configurations/VehicleConfigurationItemTreeSapling.lua

*[English version](../../../../scripts/vehicles/configurations/VehicleConfigurationItemTreeSapling.md)*

Source: `dataS/scripts/vehicles/configurations/VehicleConfigurationItemTreeSapling.lua` — FS25 1.25.1.0

✍ Entrée de configuration (sous-classe de VehicleConfigurationItem) pour les véhicules de plants d'arbres (planteuses). Elle mémorise l'unité de remplissage des plants, le type d'arbre, la variante et un fichier i3d facultatif, et peut remplacer la liste par une entrée par type d'arbre plantable de la carte (g_treePlantManager).

- **VehicleConfigurationItemTreeSapling** hérite de `VehicleConfigurationItem` (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleConfigurationItemTreeSapling.new(configName: any, customMt: any)` | 18 | ✍ Constructeur, appelle le constructeur parent. À noter : l'argument customMt est ignoré, la métatable de la classe est toujours transmise au constructeur parent. |
| `VehicleConfigurationItemTreeSapling:loadFromXML(xmlFile: any, baseKey: any, configKey: any, baseDirectory: any, customEnvironment: any)` | 26 | ✍ Charge les données parentes, puis #useMapTreeTypes (en lisant la capacité des données de boutique comme nombre de plants), #fillUnitIndex (1 par défaut), #treeType (spruce par défaut), #variationName et #filename. Renvoie false si le parent échoue. |
| `VehicleConfigurationItemTreeSapling.postLoad(xmlFile: any, baseKey: any, baseDir: any, customEnvironment: any, isMod: any, configurationItems: any, storeItem: any, configName: any)` | 46 | ✍ Statique. Après le postLoad parent, si une entrée utilise les types d'arbres de la carte, elle remplace toute la liste par des entrées générées et s'arrête. |
| `VehicleConfigurationItemTreeSapling.generateConfigurations(configurationItems: any, xmlFile: any, configName: any, baseConfigItem: any)` | 59 | ✍ Statique. Vide la liste, puis ajoute une entrée par type d'arbre ayant plusieurs stades de croissance et supportant la plantation, au prix du plant multiplié par le nombre de plants, avec le nom du type d'arbre comme saveId. |
| `VehicleConfigurationItemTreeSapling.registerXMLPaths(schema: any, rootPath: any, configPath: any)` | 88 | ✍ Statique. Enregistre les chemins XML parents ainsi que useMapTreeTypes, fillUnitIndex, treeType, variationName et filename. |

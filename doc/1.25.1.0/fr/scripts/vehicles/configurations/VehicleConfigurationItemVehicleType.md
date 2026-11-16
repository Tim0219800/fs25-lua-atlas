# vehicles/configurations/VehicleConfigurationItemVehicleType.lua

*[English version](../../../../scripts/vehicles/configurations/VehicleConfigurationItemVehicleType.md)*

Source: `dataS/scripts/vehicles/configurations/VehicleConfigurationItemVehicleType.lua` — FS25 1.25.1.0

✍ Entrée de configuration (sous-classe de VehicleConfigurationItem) qui choisit le type de véhicule utilisé par une configuration. Elle mémorise simplement le nom vehicleType lu dans le XML.

- **VehicleConfigurationItemVehicleType** hérite de `VehicleConfigurationItem` (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleConfigurationItemVehicleType.new(configName: any, customMt: any)` | 18 | ✍ Constructeur, appelle le constructeur parent. À noter : l'argument customMt est ignoré, la métatable de la classe est toujours transmise au constructeur parent. |
| `VehicleConfigurationItemVehicleType:loadFromXML(xmlFile: any, baseKey: any, configKey: any, baseDirectory: any, customEnvironment: any)` | 26 | ✍ Charge les données parentes, puis #vehicleType. Renvoie false si le chargement parent échoue. |
| `VehicleConfigurationItemVehicleType.registerXMLPaths(schema: any, rootPath: any, configPath: any)` | 38 | ✍ Statique. Enregistre les chemins XML parents ainsi que #vehicleType. |

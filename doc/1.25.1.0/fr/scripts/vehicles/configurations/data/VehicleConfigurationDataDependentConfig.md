# vehicles/configurations/data/VehicleConfigurationDataDependentConfig.lua

*[English version](../../../../../scripts/vehicles/configurations/data/VehicleConfigurationDataDependentConfig.md)*

Source: `dataS/scripts/vehicles/configurations/data/VehicleConfigurationDataDependentConfig.lua` — FS25 1.25.1.0

✍ Module de données de configuration permettant à une entrée de configuration de lister d'autres configurations (par nom et indice) à définir en même temps qu'elle.

- **VehicleConfigurationDataDependentConfig** (l.10)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleConfigurationDataDependentConfig.registerXMLPaths(schema: any, rootPath: any, configPath: any)` | 14 | ✍ Statique. Enregistre les entrées .dependentConfiguration avec #name et #index. |
| `VehicleConfigurationDataDependentConfig.loadConfigItem(configItem: any, xmlFile: any, baseKey: any, configKey: any, baseDirectory: any, customEnvironment: any)` | 21 | ✍ Lit les configurations dépendantes d'une entrée dans configItem.dependentConfigurations, en ne gardant que celles qui ont nom et indice. Leur application n'est pas dans ce fichier (NON VÉRIFIÉ). |

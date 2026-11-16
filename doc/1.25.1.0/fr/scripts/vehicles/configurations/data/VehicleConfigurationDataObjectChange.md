# vehicles/configurations/data/VehicleConfigurationDataObjectChange.lua

*[English version](../../../../../scripts/vehicles/configurations/data/VehicleConfigurationDataObjectChange.md)*

Source: `dataS/scripts/vehicles/configurations/data/VehicleConfigurationDataObjectChange.lua` — FS25 1.25.1.0

✍ Module de données de configuration qui ajoute des changements d'objets ObjectChangeUtil à chaque configuration, appliqués au chargement ou après le post-chargement selon l'indicateur postLoadObjectChange.

- **VehicleConfigurationDataObjectChange** (l.10)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleConfigurationDataObjectChange.registerXMLPaths(schema: any, rootPath: any, configPath: any)` | 14 | ✍ Statique. Enregistre l'attribut #postLoadObjectChange et les chemins XML des changements d'objets pour la configuration. |
| `VehicleConfigurationDataObjectChange.loadConfigItem(configItem: any, xmlFile: any, baseKey: any, configKey: any, baseDirectory: any, customEnvironment: any)` | 21 | ✍ Lit postLoadObjectChange (false par défaut) depuis la clé de base dans l'entrée de configuration. |
| `VehicleConfigurationDataObjectChange.onLoad(vehicle: any, configItem: any, configId: any)` | 27 | ✍ Si l'entrée n'est pas marquée post-chargement, applique aux composants du véhicule les changements d'objets de la configuration choisie pendant le chargement. |
| `VehicleConfigurationDataObjectChange.onPostLoad(vehicle: any, configItem: any, configId: any)` | 36 | ✍ Si l'entrée est marquée post-chargement, applique plutôt les changements d'objets à l'étape de post-chargement. |

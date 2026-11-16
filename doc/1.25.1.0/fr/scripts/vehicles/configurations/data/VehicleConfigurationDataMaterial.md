# vehicles/configurations/data/VehicleConfigurationDataMaterial.lua

*[English version](../../../../../scripts/vehicles/configurations/data/VehicleConfigurationDataMaterial.md)*

Source: `dataS/scripts/vehicles/configurations/data/VehicleConfigurationDataMaterial.lua` — FS25 1.25.1.0

✍ Module de données de configuration qui ajoute des changements de matériau à chaque configuration : soit l'application d'un VehicleMaterial (couleur de base, de design, de jante ou définie en XML) à un emplacement de matériau cible, soit le remplacement d'un matériau d'emplacement par un autre sur les composants du véhicule.

- **VehicleConfigurationDataMaterial** (l.10)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleConfigurationDataMaterial.registerXMLPaths(schema: any, rootPath: any, configPath: any)` | 14 | ✍ Statique. Enregistre (enregistrement partagé) les entrées .material : chemins de VehicleMaterial, ignoreWarning, node, noms d'emplacement source et cible, useBaseColor, useDesignColorIndex (1 à 16) et useRimColor. |
| `VehicleConfigurationDataMaterial.onLoadFinished(vehicle: any, configItem: any, configId: any, ...: any)` | 34 | ✍ Pour chaque entrée .material : avec materialSlotName, applique le matériau de la configuration de couleur de base, de design ou de jante, ou un nouveau issu du XML, avec avertissement si l'emplacement manque ; sinon remplace le matériau de l'emplacement cible par celui de la source sur le véhicule ou un noeud donné, avec avertissements pour les noms manquants ou non appariés. |

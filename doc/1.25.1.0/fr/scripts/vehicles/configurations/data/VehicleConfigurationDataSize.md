# vehicles/configurations/data/VehicleConfigurationDataSize.lua

*[English version](../../../../../scripts/vehicles/configurations/data/VehicleConfigurationDataSize.md)*

Source: `dataS/scripts/vehicles/configurations/data/VehicleConfigurationDataSize.lua` — FS25 1.25.1.0

✍ Module de données de configuration permettant à chaque configuration de remplacer ou d'étendre la taille occupée du véhicule (largeur, longueur, hauteur, tailles minimales et décalages), utilisée par exemple par la boutique.

- **VehicleConfigurationDataSize** (l.10)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleConfigurationDataSize.registerXMLPaths(schema: any, rootPath: any, configPath: any)` | 14 | ✍ Statique. Enregistre (enregistrement partagé) les attributs .size width, length, height, minWidth, minLength, minHeight et les trois décalages. |
| `VehicleConfigurationDataSize.onSizeLoad(configItem: any, xmlFile: any, sizeData: any)` | 33 | ✍ Écrit largeur, longueur, hauteur et décalages configurés dans sizeData (en remplaçant les valeurs) et relève les tailles minimales au plus grand de l'ancien et du nouveau. Ignoré sans clé de configuration. |

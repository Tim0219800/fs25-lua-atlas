# vehicles/configurations/data/VehicleConfigurationDataOverwrites.lua

*[English version](../../../../../scripts/vehicles/configurations/data/VehicleConfigurationDataOverwrites.md)*

Source: `dataS/scripts/vehicles/configurations/data/VehicleConfigurationDataOverwrites.lua` — FS25 1.25.1.0

✍ Module de données de configuration permettant à une configuration de modifier le XML du véhicule en mémoire avant son chargement : supprimer des propriétés, définir des valeurs texte ou vider une liste en gardant un élément.

- **VehicleConfigurationDataOverwrites** (l.10)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleConfigurationDataOverwrites.registerXMLPaths(schema: any, rootPath: any, configPath: any)` | 14 | ✍ Statique. Enregistre les entrées .xmlOverwrites : remove (path), set (path, value) et clearList (path, keepIndex). |
| `VehicleConfigurationDataOverwrites.onPreLoad(vehicle: any, configItem: any, configId: any)` | 24 | ✍ Sur le XML du véhicule, supprime les chemins listés, définit les valeurs listées comme texte et, pour chaque clearList, supprime tous les éléments de la liste sauf keepIndex. Ignoré sans clé de configuration. |

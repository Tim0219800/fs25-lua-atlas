# internalMods/FS25_precisionFarming/scripts/specializations/configurations/VehicleConfigurationDataSprayerNodes.lua

*[English version](../../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/specializations/configurations/VehicleConfigurationDataSprayerNodes.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/specializations/configurations/VehicleConfigurationDataSprayerNodes.lua` — FS25 1.25.1.0

✍ Aide pour les données de configuration de véhicule de Precision Farming. Elle lit dans le XML du véhicule, par configuration, les noeuds de buses de pulvérisation et de capteurs de pulvérisation ciblée des mauvaises herbes, puis les transmet aux spécialisations ExtendedSprayerEffects et WeedSpotSpray.

- **VehicleConfigurationDataSprayerNodes** (l.10)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleConfigurationDataSprayerNodes.registerXMLPaths(schema: any, rootPath: any, configPath: any)` | 14 | ✍ Enregistre les clés XML de configuration : sprayerNozzles.nozzle (node, translation, rotation) et weedSpotSpraySensors.sensorNode (id, node, translation, rotation, bracketSize, 1 par défaut). |
| `VehicleConfigurationDataSprayerNodes.onPrePostLoad(vehicle: any, configItem: any, configId: any)` | 28 | ✍ Appelée pour un élément de configuration choisi. Pour chaque buse, clone un noeud d'effet de pulvérisation et l'ajoute via addExtendedSprayerNozzleEffect. Si WeedSpotSpray est activé, rassemble les noeuds de capteurs et appelle addWeedSpotSpraySensorNodes. Ne fait rien si la clé de configuration est vide. |

# internalMods/FS25_precisionFarming/scripts/misc/CropSensorLinkageData.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/misc/CropSensorLinkageData.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/misc/CropSensorLinkageData.lua` — FS25 1.25.1.0

✍ Conteneur de données de Precision Farming qui relie le capteur de culture aux véhicules. Il charge CropSensorLinkageData.xml (noms de fichiers de véhicules, nœuds de liaison, prix) et un fichier i3d de capteurs, fournit des nœuds de capteur clonés et ajoute une configuration oui/non cropSensor aux véhicules concernés en surchargeant ConfigurationUtil.getConfigurationsFromXML.

- **CropSensorLinkageData** (l.16)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `CropSensorLinkageData:delete()` | 37 | ✍ Supprime les nœuds de capteurs chargés et vide les tables de données de capteurs et de liaison. |
| `CropSensorLinkageData:loadFromXML(_: any, _: any, baseDirectory: any, configFileName: any, mapFilename: any)` | 49 | ✍ Crochet de chargement de la carte : charge les données de liaison une seule fois si ce n'est pas déjà fait. Les arguments sont ignorés et rien n'est renvoyé. |
| `CropSensorLinkageData:loadLinkageData(loadVehicleData: any, loadSensorData: any)` | 57 | ✍ Lit CropSensorLinkageData.xml : prix de configuration, entrées de véhicules avec nœuds de liaison et de rotation, et lance éventuellement le chargement asynchrone de l'i3d des capteurs. Des indicateurs peuvent désactiver le chargement des véhicules ou des capteurs. Renvoie true. |
| `CropSensorLinkageData:onSensorDataLoaded(i3dNode: any, failedReason: any, args: any)` | 116 | ✍ Callback asynchrone : enregistre chaque capteur (nœud, type, chemin du nœud de mesure, besoin de lumière du jour, nœuds de rotation), détache les nœuds, supprime la racine i3d chargée et le fichier XML. |
| `CropSensorLinkageData:getCropSensorLinkageData(configFileName: any)` | 152 | ✍ Renvoie l'entrée de liaison du véhicule dont le nom de fichier termine le nom de fichier de configuration donné, ou nil. |
| `CropSensorLinkageData:getClonedCropSensorNode(typeName: any)` | 167 | ✍ Cherche le capteur du type donné (insensible à la casse) et renvoie une copie de ses données avec un nœud cloné et les nœuds de rotation et de mesure résolus, ou nil si le type est inconnu. |
| `CropSensorLinkageData:overwriteGameFunctions(pfModule: any)` | 192 | ✍ Surcharge VehicleSystem.consoleCommandReloadVehicle (recharge d'abord les données de liaison) et ConfigurationUtil.getConfigurationsFromXML (ajoute une configuration cropSensor oui/non au prix du XML aux véhicules listés). |
| `CropSensorLinkageData:registerXMLPaths(schema: any)` | 246 | ✍ Enregistre les chemins de schéma XML des capteurs, véhicules, nœuds de liaison, nœuds de rotation et du prix de configuration utilisés par CropSensorLinkageData.xml. |

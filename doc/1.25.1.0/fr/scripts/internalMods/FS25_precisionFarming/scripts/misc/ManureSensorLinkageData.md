# internalMods/FS25_precisionFarming/scripts/misc/ManureSensorLinkageData.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/misc/ManureSensorLinkageData.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/misc/ManureSensorLinkageData.lua` — FS25 1.25.1.0

✍ Conteneur de données de Precision Farming qui relie le capteur de lisier à des véhicules. Il charge ManureSensorLinkageData.xml (noms de fichiers de véhicules, nœuds de liaison avec décalage et échelle, prix) et un fichier i3d de capteurs, fournit des nœuds de capteur clonés et ajoute une configuration oui/non manureSensor aux véhicules listés en surchargeant ConfigurationUtil.getConfigurationsFromXML. Même structure que CropSensorLinkageData.

- **ManureSensorLinkageData** (l.16)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ManureSensorLinkageData:delete()` | 37 | ✍ Supprime les nœuds de capteurs chargés et vide les tables de données de capteurs et de liaison. |
| `ManureSensorLinkageData:loadFromXML(_: any, _: any, baseDirectory: any, configFileName: any, mapFilename: any)` | 49 | ✍ Crochet de chargement de la carte : charge les données de liaison une seule fois si ce n'est pas déjà fait. Les arguments sont ignorés et rien n'est renvoyé. |
| `ManureSensorLinkageData:loadLinkageData(loadVehicleData: any, loadSensorData: any)` | 57 | ✍ Lit ManureSensorLinkageData.xml : prix de configuration et entrées de véhicules avec nœuds de liaison (type DEFAULT par défaut, translation, rotation, échelle optionnelle), et lance éventuellement le chargement asynchrone de l'i3d des capteurs. Des indicateurs permettent d'ignorer véhicules ou capteurs. Renvoie true. |
| `ManureSensorLinkageData:onSensorDataLoaded(i3dNode: any, failedReason: any, args: any)` | 108 | ✍ Callback asynchrone : enregistre chaque capteur (nœud et type), détache les nœuds, puis supprime la racine i3d chargée et le fichier XML. |
| `ManureSensorLinkageData:getManureSensorLinkageData(configFileName: any)` | 133 | ✍ Renvoie l'entrée de liaison du véhicule dont le nom de fichier termine le nom de fichier de configuration donné, ou nil. |
| `ManureSensorLinkageData:getClonedManureSensorNode(typeName: any)` | 148 | ✍ Cherche le capteur du type donné (insensible à la casse) et renvoie une copie de ses données avec un nœud cloné remis à translation et rotation nulles et à l'échelle 1, ou nil si le type est inconnu. |
| `ManureSensorLinkageData:overwriteGameFunctions(pfModule: any)` | 167 | ✍ Surcharge VehicleSystem.consoleCommandReloadVehicle (recharge d'abord les données de liaison) et ConfigurationUtil.getConfigurationsFromXML (ajoute une configuration manureSensor oui/non au prix du XML aux véhicules listés). |
| `ManureSensorLinkageData:registerXMLPaths(schema: any)` | 220 | ✍ Enregistre les chemins de schéma XML des capteurs, véhicules, nœuds de liaison et du prix de configuration. À noter : la description du prix parle encore de crop sensor, apparemment copiée de la classe du capteur de culture. |

# internalMods/FS25_precisionFarming/scripts/misc/SprayerNodeData.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/misc/SprayerNodeData.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/misc/SprayerNodeData.lua` — FS25 1.25.1.0

✍ Conteneur de données de Precision Farming pour les options de pulvérisateur (traitement localisé, See and Spray, modulation de largeur d'impulsion). Il charge SprayerNodeData.xml (prix des configurations, son de pulvérisation, types de capteurs, nœuds d'effets et de capteurs par véhicule) ainsi que les i3d de l'effet de buse et des capteurs, et fournit des nœuds et échantillons sonores clonés. Il ajoute les configurations oui/non weedSpotSpray et pulseWidthModulation aux véhicules listés via ConfigurationUtil.getConfigurationsFromXML.

- **SprayerNodeData** (l.18)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SprayerNodeData:delete()` | 42 | ✍ Supprime le nœud d'effet de buse et chaque nœud de type de capteur, libère leurs requêtes i3d partagées, supprime les échantillons sonores et vide les données de liaison. |
| `SprayerNodeData:loadFromXML(_: any, _: any, baseDirectory: any, configFileName: any, mapFilename: any)` | 69 | ✍ Crochet de chargement de la carte : appelle loadData une seule fois si ce n'est pas déjà fait. Les arguments sont ignorés et rien n'est renvoyé. |
| `SprayerNodeData:getConfigPrices()` | 77 | ✍ Renvoie trois prix lus dans le XML (par mètre de largeur de travail) : traitement localisé des herbes, See and Spray, modulation de largeur d'impulsion. |
| `SprayerNodeData:getClonedSectionSamples(name: any, linkNode: any, modifierTargetObject: any)` | 83 | ✍ Clone l'échantillon sonore nommé (par exemple spray) sur le nœud de liaison donné avec un objet cible de modificateurs. Journalise un avertissement et renvoie nil si l'échantillon n'existe pas. |
| `SprayerNodeData:loadData(loadVehicleData: any, loadEffect: any)` | 95 | ✍ Lit SprayerNodeData.xml : trois prix de configuration, le son de pulvérisation, les types de capteurs (chargement i3d partagé asynchrone) et les configurations par véhicule de nœuds d'effets et de capteurs. Lance aussi le chargement de l'i3d de l'effet de buse. Des indicateurs permettent d'ignorer effets ou données de véhicules. Renvoie true. |
| `SprayerNodeData.onSprayerEffectLoaded(self: any, i3dNode: any, failedReason: any, args: any)` | 182 | ✍ Callback asynchrone (appelé avec self en premier argument) : conserve le premier enfant de l'i3d chargé comme nœud d'effet de buse, le détache et supprime la racine i3d. |
| `SprayerNodeData.onWeedSensorLoaded(self: any, i3dNode: any, failedReason: any, sensorType: any)` | 193 | ✍ Callback asynchrone : résout le nœud du capteur par son chemin, réinitialise sa transformation, le détache et ajoute le type de capteur à self.sensorTypes, puis supprime la racine i3d. |
| `SprayerNodeData:getClonedSprayerEffectNode()` | 209 | ✍ Renvoie un clone du nœud d'effet de buse avec le matériau de pulvérisateur d'engrais liquide appliqué s'il existe, ou nil si l'effet n'est pas chargé. |
| `SprayerNodeData:getClonedSprayerWeedSensorNode(sensorTypeId: any)` | 226 | ✍ Renvoie un clone du nœud de capteur du type donné et un booléen indiquant s'il possède un support redimensionnable. Renvoie nil et false si l'identifiant est inconnu. |
| `SprayerNodeData:getSprayerNodeData(configFileName: any, configurations: any)` | 238 | ✍ Trouve l'entrée de véhicule correspondant à la fin du nom de fichier de configuration et renvoie la configuration choisie selon le nom de configuration du véhicule (la première par défaut) ainsi que l'entrée du véhicule, ou nil si le véhicule n'est pas listé. |
| `SprayerNodeData:overwriteGameFunctions(pfModule: any)` | 262 | ✍ Surcharge VehicleSystem.consoleCommandReloadVehicle (recharge d'abord les données de véhicules) et ConfigurationUtil.getConfigurationsFromXML (ajoute les configurations oui/non weedSpotSpray et pulseWidthModulation, prix 1 pour l'option oui, aux véhicules listés qui ne les ont pas). |
| `SprayerNodeData:registerXMLPaths(schema: any)` | 343 | ✍ Enregistre les chemins de schéma XML des prix de configuration, du son de pulvérisation, des types de capteurs et des nœuds d'effets et de capteurs par véhicule de SprayerNodeData.xml. |

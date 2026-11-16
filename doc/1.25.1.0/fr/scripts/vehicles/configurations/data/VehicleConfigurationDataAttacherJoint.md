# vehicles/configurations/data/VehicleConfigurationDataAttacherJoint.lua

*[English version](../../../../../scripts/vehicles/configurations/data/VehicleConfigurationDataAttacherJoint.md)*

Source: `dataS/scripts/vehicles/configurations/data/VehicleConfigurationDataAttacherJoint.lua` — FS25 1.25.1.0

✍ Module de données de configuration permettant à n'importe quelle configuration d'ajouter des attaches à un véhicule possédant la spécialisation AttacherJoints.

- **VehicleConfigurationDataAttacherJoint** (l.10)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleConfigurationDataAttacherJoint.registerXMLPaths(schema: any, rootPath: any, configPath: any)` | 14 | ✍ Statique. Enregistre les chemins XML des attaches sous le chemin de configuration via AttacherJoints.registerAttacherJointXMLPaths. |
| `VehicleConfigurationDataAttacherJoint.onPrePostLoad(vehicle: any, configItem: any, configId: any)` | 20 | ✍ Avant le post-chargement, charge chaque .attacherJoint de la configuration et l'ajoute à la liste des attaches du véhicule ; ignoré sans clé de configuration ou sans la spécialisation. |

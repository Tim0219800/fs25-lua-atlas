# vehicles/configurations/data/VehicleConfigurationDataAttacherJoint.lua

*[Version française](../../../../fr/scripts/vehicles/configurations/data/VehicleConfigurationDataAttacherJoint.md)*

Source: `dataS/scripts/vehicles/configurations/data/VehicleConfigurationDataAttacherJoint.lua` — FS25 1.25.1.0

✍ Configuration data module that lets any configuration add attacher joints to a vehicle with the AttacherJoints specialization.

- **VehicleConfigurationDataAttacherJoint** (l.10)

## Functions

| Function | Line | Description |
|---|---|---|
| `VehicleConfigurationDataAttacherJoint.registerXMLPaths(schema: any, rootPath: any, configPath: any)` | 14 | ✍ Static. Registers the attacher joint XML paths under the configuration path through AttacherJoints.registerAttacherJointXMLPaths. |
| `VehicleConfigurationDataAttacherJoint.onPrePostLoad(vehicle: any, configItem: any, configId: any)` | 20 | ✍ Before post-load, loads each .attacherJoint of the configuration and appends it to the vehicle's attacher joint list; skipped without a config key or without the specialization. |

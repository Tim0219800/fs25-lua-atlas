# vehicles/ai/AIDriveStrategyStonePicker.lua

*[Version française](../../../fr/scripts/vehicles/ai/AIDriveStrategyStonePicker.md)*

Source: `dataS/scripts/vehicles/ai/AIDriveStrategyStonePicker.lua` — FS25 1.25.1.0

✍ AI drive strategy (subclass of AIDriveStrategy) that stops the AI helper when a stone picker is full or busy discharging. It collects the vehicle and attached AI implements that have the StonePicker specialization, shows a full-tank notification and starts or stops discharge to a target object.

- **AIDriveStrategyStonePicker** inherits from `AIDriveStrategy` (l.9)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIDriveStrategyStonePicker.new(reconstructionData: any, customMt: any)` | 13 | ✍ Constructor. Creates the empty stone picker list and the full-tank notification flag. |
| `AIDriveStrategyStonePicker:setAIVehicle(vehicle: any)` | 25 | ✍ Calls the parent method, then stores the vehicle itself and each attached AI implement that has the StonePicker specialization. |
| `AIDriveStrategyStonePicker:update(dt: any)` | 40 | ✍ Empty override, does nothing. |
| `AIDriveStrategyStonePicker:getDriveData(dt: any, vX: any, vY: any, vZ: any)` | 45 | ✍ Forbids driving while discharging, while the tip state is not closed, or when full. When full it notifies once and starts discharge if a target exists; discharge stops with no target or an empty tank. Returns a stop (0, 1, true, 0, huge) or only an unlimited speed. |
| `AIDriveStrategyStonePicker:updateDriving(dt: any)` | 108 | ✍ Empty override, does nothing. |

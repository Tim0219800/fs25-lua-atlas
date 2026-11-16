# vehicles/ai/AIDriveStrategy.lua

*[Version française](../../../fr/scripts/vehicles/ai/AIDriveStrategy.md)*

Source: `dataS/scripts/vehicles/ai/AIDriveStrategy.lua` — FS25 1.25.1.0

✍ Base class for AI drive strategies. It stores the controlled vehicle and defines empty hooks (`update`, `getDriveData`, `updateDriving`) that concrete strategies override. `getDriveData` is expected to return five values, all nil here, meaning no override.

- **AIDriveStrategy** (l.8)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIDriveStrategy.new(reconstructionData: any, customMt: any)` | 12 | ✍ Constructor; creates the strategy table with the given metatable (the reconstruction data argument is unused here). |
| `AIDriveStrategy:delete()` | 20 | ✍ Empty cleanup hook for subclasses. |
| `AIDriveStrategy:setAIVehicle(vehicle: any)` | 25 | ✍ Stores the AI vehicle this strategy controls. |
| `AIDriveStrategy:update(dt: any)` | 31 | ✍ Empty per-frame hook for subclasses. |
| `AIDriveStrategy:getDriveData(dt: any, vX: any, vY: any, vZ: any)` | 36 | ✍ Default drive data query returning five nils (no steering, speed or stop request). Subclasses override it to return their driving targets. |
| `AIDriveStrategy:updateDriving(dt: any)` | 42 | ✍ Empty hook called while driving, for subclasses. |
| `AIDriveStrategy:debugPrint(text: any, ...: any)` | 47 | ✍ Prints a formatted debug line prefixed with AI DEBUG, only when the vehicle debug state is the AI mode. |

# vehicles/ai/AIDriveStrategyBaler.lua

*[Version française](../../../fr/scripts/vehicles/ai/AIDriveStrategyBaler.md)*

Source: `dataS/scripts/vehicles/ai/AIDriveStrategyBaler.lua` — FS25 1.25.1.0

✍ AI drive strategy (extends `AIDriveStrategy`) for balers. It collects the baler vehicle and attached AI implements that have the `Baler` specialization, slows the AI as the bale chamber fills and stops it while a bale is full or unloading. For balers with non-stop baling it only caps speed during platform drops.

- **AIDriveStrategyBaler** inherits from `AIDriveStrategy` (l.9)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIDriveStrategyBaler.new(reconstructionData: any, customMt: any)` | 13 | ✍ Constructor; initializes the baler list and the slow-down settings (free capacity threshold 200, start speed 20). |
| `AIDriveStrategyBaler:setAIVehicle(vehicle: any)` | 26 | ✍ Calls the parent, then collects the vehicle and its attached AI implements that carry the `Baler` specialization into the baler list. |
| `AIDriveStrategyBaler:update(dt: any)` | 41 | ✍ Empty per-frame override. |
| `AIDriveStrategyBaler:getDriveData(dt: any, vX: any, vY: any, vZ: any)` | 46 | ✍ For each baler, limits speed to 2 km/h plus a share of the start speed when free capacity is low, and forbids driving when full or unloading. Returns a stop request (0, 1, true, 0, math.huge) if blocked, else only a max speed. |
| `AIDriveStrategyBaler:updateDriving(dt: any)` | 90 | ✍ Empty override. |

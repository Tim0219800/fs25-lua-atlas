# internalMods/FS25_precisionFarming/scripts/specializations/CropSensor.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/specializations/CropSensor.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/specializations/CropSensor.lua` — FS25 1.25.1.0

✍ Vehicle specialization for the Precision Farming crop sensor (requires PrecisionFarmingStatistic). Sensors are defined in vehicle XML under vehicle.cropSensor or linked from CropSensorLinkageData through the cropSensor configuration. On the server, active sensors sample the nitrogen map inside a circle or half-circle shape each update; the state is synchronised with CropSensorStateEvent. Optionally needs daylight, and the radius can follow the working width of attached ExtendedSprayer implements.

- **CropSensor** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `CropSensor.prerequisitesPresent(specializations: table) → boolean` | 40 | ✍ Returns true when the vehicle type has the PrecisionFarmingStatistic specialization. |
| `CropSensor.initSpecialization()` | 46 | ✍ Registers the cropSensor vehicle configuration type and the XML schema paths of vehicle.cropSensor (sensor nodes, light nodes, radius, daylight requirement, shape) and of the sensor link nodes. |
| `CropSensor:onLoad(savegame: any)` | 97 | ✍ Loads the sensor nodes with their shapes (CIRCLE, HALF_CIRCLE_LEFT or HALF_CIRCLE_RIGHT), light nodes and radius, then reads the selected cropSensor configuration and links cloned sensors from XML or linkage data. Caches the soil, cover and nitrogen maps and the farmland statistics from g_precisionFarming. |
| `CropSensor:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 216 | ✍ Server only: when the sensor is available and active, calls updateSensorNode for each sensor node, skipping daylight-dependent nodes while the sun is off. |
| `CropSensor:onDraw()` | 232 | ✍ Client only: if the sensor is active, not under AI control and requires daylight while the sun is off, shows a blinking warning in the HUD. |
| `CropSensor:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 252 | ✍ Client only: if sensors are available, registers the PRECISIONFARMING_TOGGLE_CROP_SENSOR input action (high priority) when the vehicle is active for input and sets its text. |
| `CropSensor:onRootVehicleChanged(rootVehicle: table)` | 269 | ✍ Server only: registers (or re-parents) the cropSensorTurnOn action of the root vehicle's action controller, saved, with AI listeners that switch it on at field work or implement start and off at their end. Removes it if the action controller is gone. |
| `CropSensor.actionEventToggle(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 301 | ✍ Input callback that toggles the crop sensor on or off. |
| `CropSensor.updateActionEventTexts(self: any)` | 307 | ✍ Sets the toggle action text to the turn-off or turn-on label depending on the sensor state. |
| `CropSensor.actionControllerToggleEvent(self: any, direction: any)` | 317 | ✍ Action controller callback: activates the sensor when direction is 0 or more, deactivates it otherwise. Returns true. |
| `CropSensor:doCheckSpeedLimit(superFunc: any) → boolean` | 326 | ✍ Override: also reports that the speed limit applies when the vehicle is a standalone active sensor. |
| `CropSensor:getUseTurnedOnSchema(superFunc: any)` | 333 | ✍ Override: also uses the turned-on schema when the vehicle is a standalone active sensor. |
| `CropSensor:setCropSensorActive(state: any, noEventSend: any)` | 340 | ✍ Sets the sensor state (toggles when state is nil), updates lights on clients and the working width when turning on, refreshes action texts and sends CropSensorStateEvent unless noEventSend is set. |
| `CropSensor:updateCropSensorWorkingWidth()` | 373 | ✍ Recomputes the maximum working width of the vehicle combination and updates every sensor node radius from it. |
| `CropSensor:updateSensorRadius(sensorNode: any, workingWidth: any)` | 385 | ✍ Sets the sensor radius to half of the working width plus 10 percent, minus the sensor's lateral offset, not below CropSensor.MIN_SENSOR_RADIUS. Restores the original radius when the width is 0 or less. |
| `CropSensor:updateSensorNode(sensorNode: any)` | 400 | ✍ Moves the sensor shape (circle or polygon) to the node's world position and heading with its current radius, then asks the nitrogen map to update the crop sensor area for that shape. |
| `CropSensor:linkCropSensor(linkData: any)` | 419 | ✍ For each link node, clones the sensor of the matching type from g_precisionFarming, links it to the target node with the given offsets, applies or auto-computes rotation nodes, and registers its measurement node as a sensor node with a left or right polygon shape. |
| `CropSensor.getMaxWorkingWidth(sensorVehicle: any)` | 491 | ✍ Static: scans the child vehicles of the root vehicle that have ExtendedSprayer and returns the largest width found from work areas and AI markers, also taking the lateral offset from the sensor vehicle into account. |

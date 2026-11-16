---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/specializations/CropSensor.lua (generated stub, FS25 Lua Atlas)

--- Vehicle specialization for the Precision Farming crop sensor (requires PrecisionFarmingStatistic). Sensors are defined in vehicle XML under vehicle.cropSensor or linked from CropSensorLinkageData through the cropSensor configuration. On the server, active sensors sample the nitrogen map inside a circle or half-circle shape each update; the state is synchronised with CropSensorStateEvent. Optionally needs daylight, and the radius can follow the working width of attached ExtendedSprayer implements.
---@class CropSensor
CropSensor = {}

--- Returns true when the vehicle type has the PrecisionFarmingStatistic specialization.
---@param specializations table
---@return boolean
function CropSensor.prerequisitesPresent(specializations) end

--- Registers the cropSensor vehicle configuration type and the XML schema paths of vehicle.cropSensor (sensor nodes, light nodes, radius, daylight requirement, shape) and of the sensor link nodes.
function CropSensor.initSpecialization() end

--- Loads the sensor nodes with their shapes (CIRCLE, HALF_CIRCLE_LEFT or HALF_CIRCLE_RIGHT), light nodes and radius, then reads the selected cropSensor configuration and links cloned sensors from XML or linkage data. Caches the soil, cover and nitrogen maps and the farmland statistics from g_precisionFarming.
---@param savegame any
function CropSensor:onLoad(savegame) end

--- Server only: when the sensor is available and active, calls updateSensorNode for each sensor node, skipping daylight-dependent nodes while the sun is off.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function CropSensor:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Client only: if the sensor is active, not under AI control and requires daylight while the sun is off, shows a blinking warning in the HUD.
function CropSensor:onDraw() end

--- Client only: if sensors are available, registers the PRECISIONFARMING_TOGGLE_CROP_SENSOR input action (high priority) when the vehicle is active for input and sets its text.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function CropSensor:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Server only: registers (or re-parents) the cropSensorTurnOn action of the root vehicle's action controller, saved, with AI listeners that switch it on at field work or implement start and off at their end. Removes it if the action controller is gone.
---@param rootVehicle table
function CropSensor:onRootVehicleChanged(rootVehicle) end

--- Input callback that toggles the crop sensor on or off.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function CropSensor.actionEventToggle(self, actionName, inputValue, callbackState, isAnalog) end

--- Sets the toggle action text to the turn-off or turn-on label depending on the sensor state.
---@param self any
function CropSensor.updateActionEventTexts(self) end

--- Action controller callback: activates the sensor when direction is 0 or more, deactivates it otherwise. Returns true.
---@param self any
---@param direction any
function CropSensor.actionControllerToggleEvent(self, direction) end

--- Override: also reports that the speed limit applies when the vehicle is a standalone active sensor.
---@param superFunc any
---@return boolean
function CropSensor:doCheckSpeedLimit(superFunc) end

--- Override: also uses the turned-on schema when the vehicle is a standalone active sensor.
---@param superFunc any
function CropSensor:getUseTurnedOnSchema(superFunc) end

--- Sets the sensor state (toggles when state is nil), updates lights on clients and the working width when turning on, refreshes action texts and sends CropSensorStateEvent unless noEventSend is set.
---@param state any
---@param noEventSend any
function CropSensor:setCropSensorActive(state, noEventSend) end

--- Recomputes the maximum working width of the vehicle combination and updates every sensor node radius from it.
function CropSensor:updateCropSensorWorkingWidth() end

--- Sets the sensor radius to half of the working width plus 10 percent, minus the sensor's lateral offset, not below CropSensor.MIN_SENSOR_RADIUS. Restores the original radius when the width is 0 or less.
---@param sensorNode any
---@param workingWidth any
function CropSensor:updateSensorRadius(sensorNode, workingWidth) end

--- Moves the sensor shape (circle or polygon) to the node's world position and heading with its current radius, then asks the nitrogen map to update the crop sensor area for that shape.
---@param sensorNode any
function CropSensor:updateSensorNode(sensorNode) end

--- For each link node, clones the sensor of the matching type from g_precisionFarming, links it to the target node with the given offsets, applies or auto-computes rotation nodes, and registers its measurement node as a sensor node with a left or right polygon shape.
---@param linkData any
function CropSensor:linkCropSensor(linkData) end

--- Static: scans the child vehicles of the root vehicle that have ExtendedSprayer and returns the largest width found from work areas and AI markers, also taking the lateral offset from the sensor vehicle into account.
---@param sensorVehicle any
function CropSensor.getMaxWorkingWidth(sensorVehicle) end

---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Wipers.lua (generated stub, FS25 Lua Atlas)

--- Windshield wiper specialization (prerequisites: Enterable and AnimatedVehicle). It produces no particle or droplet effect: it plays vehicle animations (one animation name per wiper, vehicle.wipers.wiper(?)#animName) whose speed (state(?)#animSpeed) and pause (#animPause, in seconds, converted to ms) depend on rain intensity. The only weather data read is g_currentMission.environment.weather:getRainFallScale() on every onUpdateTick, stored in spec.lastRainScale; the value is compared to a 0.01 threshold, then spread over [0..1] in as many equal slices as there are states (state.maxRainValue = k / numberOfStates), and the chosen state is the first slice whose ceiling is >= the rain value. The behaviour of getRainFallScale (unit, range, smoothing) lives in Weather, which is absent from the dump: UNVERIFIED. The logic only runs if getIsControlled() is true (vehicle occupied/controlled) and getIsActiveForWipers() is true; it has no isServer/isClient guard of its own (animations go through AnimatedVehicle; their synchronisation is UNVERIFIED), only the dashboard update is restricted to the client. The animation loop: play to the end, then reverse playback triggered by onFinishAnimation, and the next pass is delayed by 2 x duration/speed + pause (g_currentMission.time). Extension points: registered functions loadWiperFromXML and getIsActiveForWipers (returns true; can be overwritten to disable the wipers, for instance outside the cabin); listened events onLoad, onRegisterDashboardValueTypes, onUpdateTick, onFinishAnimation; a console command to force the state through Wipers.forcedState (global to all instances). Exposed dashboard value: "wipers" / "state" (lastState field of the wiper with the most states). Useful for a wetness mod: it is a consumer of getRainFallScale, not a source of visual effects.
---@class Wipers
Wipers = {}

--- Requires the Enterable and AnimatedVehicle specializations.
---@param specializations any
function Wipers.prerequisitesPresent(specializations) end

--- Registers in Vehicle.xmlSchema the keys vehicle.wipers.wiper(?)#animName, state(?)#animSpeed and state(?)#animPause, as well as the dashboard paths vehicle.wipers.dashboards (value "state").
function Wipers.initSpecialization() end

--- Exposes loadWiperFromXML and getIsActiveForWipers to the vehicle type.
---@param vehicleType any
function Wipers.registerFunctions(vehicleType) end

--- Listens to onLoad, onRegisterDashboardValueTypes, onUpdateTick and onFinishAnimation.
---@param vehicleType any
function Wipers.registerEventListeners(vehicleType) end

--- Loads all wipers from the XML (each with lastValidState 1 and lastState 0), computes hasWipers, initialises lastRainScale to 0 and keeps the wiper with the most states for the dashboard. With no valid wiper, it removes the onUpdateTick listener.
---@param savegame any
function Wipers:onLoad(savegame) end

--- Declares the dashboard value type wipers.state (read from lastState of the main wiper, with no polling update).
function Wipers:onRegisterDashboardValueTypes() end

--- If the vehicle is controlled: reads rain through weather:getRainFallScale(), determines each wiper's state (0 if rain <= 0.01 or if getIsActiveForWipers is false), overrides it with Wipers.forcedState when that is not -1, starts the animation at the state's speed when the delay has elapsed and it is not playing, stores lastValidState, then on the client updates the dashboard value when the state changes. Note: Wipers.forcedState is not initialised in this file; its initial value (expected -1) comes from elsewhere or from a stripped part of the dump (UNVERIFIED).
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Wipers:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- When a wiper animation reaches its end (time 1), plays it again in reverse at the speed of the last valid state.
---@param name any
function Wipers:onFinishAnimation(name) end

--- Reads the animation name (it must exist, otherwise a warning and failure), its duration, and the states (animSpeed and animPause required together). Computes for each state a rain ceiling maxRainValue in equal slices of 1/N. Returns false if the animation is missing or there are no states.
---@param xmlFile any
---@param key any
---@param wiper any
function Wipers:loadWiperFromXML(xmlFile, key, wiper) end

--- Returns true by default; override point to allow or forbid automatic activation according to rain.
function Wipers:getIsActiveForWipers() end

--- Console command gsWiperStateSet: sets Wipers.forcedState (-1 to go back to the weather-derived state, 0..n to force a state, capped at 999) and returns a confirmation or error message.
---@param state any
function Wipers:consoleSetWiperState(state) end

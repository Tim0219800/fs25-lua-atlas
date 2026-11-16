---@meta
-- FS25 1.25.1.0 : gui/hud/SpeedMeterDisplay.lua (generated stub, FS25 Lua Atlas)

--- HUD display for the vehicle speedometer, built on HUDDisplay. For a motorized vehicle it draws the speed gauge, fuel (or electric charge / methane) bar, damage bar, gear selector, working hours, cruise control and AI/steering-assist status. Client-side drawing only; it reads data from the vehicle specializations (motorized, AI mode selection, damage) and must receive one update after setVehicle before drawing.
---@class SpeedMeterDisplay : HUDDisplay
SpeedMeterDisplay = {}

--- Creates the display and its overlays (backgrounds, gauge, working hours, cruise control, AI and steering icons, fuel and repair icons). Starts without a vehicle and with the draw-safe flag off.
function SpeedMeterDisplay.new() end

--- Recomputes every pixel-based position, size and offset (gauge, bars, gear box, AI block, texts) for the current UI scale and applies the dimensions to the overlays. Called again when the scale changes.
function SpeedMeterDisplay:storeScaledValues() end

--- Draws the whole speedometer for the current vehicle: backgrounds sized to the active bars, gauge, AI mode or status block, then the fuel, damage and gear sections. Does nothing without a vehicle or before the draw-safe flag is set.
function SpeedMeterDisplay:draw() end

--- Draws the three-slot gear selector at x, y using getGearInfoToDisplay of the vehicle: manual gears with neighbours, or R/N/D for automatic. Highlights the current gear, dims it while shifting and blinks the middle slot on a neutral warning.
---@param x table
---@param y any
function SpeedMeterDisplay:drawGearText(x, y) end

--- Sets the vehicle to display (only kept if it is motorized), selects the fuel icon for electric charge or methane, toggles visibility and clears the draw-safe flag so drawing waits for the next update.
---@param vehicle table
function SpeedMeterDisplay:setVehicle(vehicle) end

--- Looks up the vehicle fill unit consuming diesel, then electric charge, then methane, and returns level, capacity and fuel type. Note: with no matching unit the index is nil, which is then passed to the fill unit getters (behaviour UNVERIFIED).
---@param vehicle any
function SpeedMeterDisplay.getVehicleFuelLevelAndCapacity(vehicle) end

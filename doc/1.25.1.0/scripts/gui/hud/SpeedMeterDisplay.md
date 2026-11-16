# gui/hud/SpeedMeterDisplay.lua

*[Version française](../../../fr/scripts/gui/hud/SpeedMeterDisplay.md)*

Source: `dataS/scripts/gui/hud/SpeedMeterDisplay.lua` — FS25 1.25.1.0

✍ HUD display for the vehicle speedometer, built on HUDDisplay. For a motorized vehicle it draws the speed gauge, fuel (or electric charge / methane) bar, damage bar, gear selector, working hours, cruise control and AI/steering-assist status. Client-side drawing only; it reads data from the vehicle specializations (motorized, AI mode selection, damage) and must receive one update after setVehicle before drawing.

- **SpeedMeterDisplay** inherits from `HUDDisplay` (l.29)

## Functions

| Function | Line | Description |
|---|---|---|
| `SpeedMeterDisplay.new()` | 33 | ✍ Creates the display and its overlays (backgrounds, gauge, working hours, cruise control, AI and steering icons, fuel and repair icons). Starts without a vehicle and with the draw-safe flag off. |
| `SpeedMeterDisplay:storeScaledValues()` | 105 | ✍ Recomputes every pixel-based position, size and offset (gauge, bars, gear box, AI block, texts) for the current UI scale and applies the dimensions to the overlays. Called again when the scale changes. |
| `SpeedMeterDisplay:draw()` | 230 | ✍ Draws the whole speedometer for the current vehicle: backgrounds sized to the active bars, gauge, AI mode or status block, then the fuel, damage and gear sections. Does nothing without a vehicle or before the draw-safe flag is set. |
| `SpeedMeterDisplay:drawGearText(x: table, y: any)` | 604 | ✍ Draws the three-slot gear selector at x, y using getGearInfoToDisplay of the vehicle: manual gears with neighbours, or R/N/D for automatic. Highlights the current gear, dims it while shifting and blinks the middle slot on a neutral warning. |
| `SpeedMeterDisplay:setVehicle(vehicle: table)` | 706 | ✍ Sets the vehicle to display (only kept if it is motorized), selects the fuel icon for electric charge or methane, toggles visibility and clears the draw-safe flag so drawing waits for the next update. |
| `SpeedMeterDisplay.getVehicleFuelLevelAndCapacity(vehicle: any)` | 734 | ✍ Looks up the vehicle fill unit consuming diesel, then electric charge, then methane, and returns level, capacity and fuel type. Note: with no matching unit the index is nil, which is then passed to the fill unit getters (behaviour UNVERIFIED). |

---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AIModeSelection.lua (generated stub, FS25 Lua Atlas)

--- Specialization that lets the player switch a vehicle between the regular AI helper (WORKER) mode and the steering assist mode (STEERING_ASSIST). It requires AIDrivable and AIAutomaticSteering. It keeps the current mode, the field course settings and the user settings, saves them in the savegame, syncs them on join, and handles the TOGGLE_AI input (short press starts, long press opens the AI settings dialog). The MODE constants and NUM_BITS are defined outside this dump (UNVERIFIED).
---@class AIModeSelection
AIModeSelection = {}

--- Returns true only if the vehicle type also has the AIDrivable and AIAutomaticSteering specializations.
---@param specializations table
---@return boolean
function AIModeSelection.prerequisitesPresent(specializations) end

--- Registers the savegame keys for the current AI mode and for the AI user settings under vehicles.vehicle(?).aiModeSelection.
function AIModeSelection.initSpecialization() end

--- Registers the vehicle events onAIModeChanged and onAIModeSettingsChanged.
---@param vehicleType any
function AIModeSelection.registerEvents(vehicleType) end

--- Registers the mode getter/setter, the settings-changed handler, the field course settings accessors and the stream apply/write helpers on the vehicle type.
---@param vehicleType any
function AIModeSelection.registerFunctions(vehicleType) end

--- Empty: this specialization overrides no base vehicle function.
---@param vehicleType any
function AIModeSelection.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onDelete, onReadStream, onWriteStream, onUpdateTick, onDraw, onStateChange and onRegisterActionEvents.
---@param vehicleType any
function AIModeSelection.registerEventListeners(vehicleType) end

--- Defaults the mode to WORKER, creates the HUD extension and loads the saved mode name and user settings from the savegame (skipped when vehicles are reset).
---@param savegame table
function AIModeSelection:onLoad(savegame) end

--- Writes the current mode name and, if present, the user settings into the savegame XML.
---@param xmlFile any
---@param key any
---@param usedModNames any
function AIModeSelection:saveToXMLFile(xmlFile, key, usedModNames) end

--- Client side on join: reads the current mode (stored zero-based, so +1) and optionally the field course attributes, kept for later application in onUpdateTick.
---@param streamId integer
---@param connection Connection
function AIModeSelection:onReadStream(streamId, connection) end

--- Server side on join: writes the current mode and, if they exist, the field course settings. Mirror of onReadStream.
---@param streamId integer
---@param connection Connection
function AIModeSelection:onWriteStream(streamId, connection) end

--- On clients refreshes the action events. Unless a vehicle reload is running, it finalises loaded user settings and builds settings from field course attributes received from the server.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function AIModeSelection:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Adds this vehicle's AI mode HUD extension to the HUD help panel every frame it is drawn.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function AIModeSelection:onDraw(isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- On attach or detach (outside a vehicle reload), clears the cached field course and user settings so they are regenerated for the new vehicle combination.
---@param state any
---@param data any
function AIModeSelection:onStateChange(state, data) end

--- Client only: when the vehicle is active for input, registers the TOGGLE_AI action with high text priority and updates the action event state.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function AIModeSelection:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Handles TOGGLE_AI. Holding past MODE_CHANGE_DURATION opens the AI settings dialog. A short press in WORKER mode toggles the helper (permission hireAssistant needed), in STEERING_ASSIST mode it enables steering assist if allowed, else shows a warning.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
---@param isMouse any
---@param deviceCategory any
---@param binding any
---@param isReset any
function AIModeSelection.actionEventToggleAIState(self, actionName, inputValue, callbackState, isAnalog, isMouse, deviceCategory, binding, isReset) end

--- Sets the AI mode, or cycles to the next one when aiMode is nil. On a change it raises onAIModeChanged, refreshes the action events and sends an AISetModeEvent (unless noEventSend).
---@param aiMode any
---@param noEventSend any
function AIModeSelection:setAIModeSelection(aiMode, noEventSend) end

--- Returns the current AI mode value.
function AIModeSelection:getAIModeSelection() end

--- Callback of the settings dialog: stores the new field course settings, sends AIModeSelectionSettingsEvent, applies the chosen mode and raises onAIModeSettingsChanged.
---@param aiMode any
---@param fieldCourseSettings any
function AIModeSelection:aiModeSettingsChanged(aiMode, fieldCourseSettings) end

--- Turns settings loaded from the savegame into active user settings: generates field course settings from the root vehicle if missing, reinitialises and applies them for the current mode.
function AIModeSelection:initializeLoadedAIModeUserSettings() end

--- Returns the stored field course settings object, or nil if none has been generated yet.
function AIModeSelection:getAIModeFieldCourseSettings() end

--- Replaces the field course settings, creates default user settings if needed, reapplies them for the current mode and raises onAIModeSettingsChanged. Sends no network event itself.
---@param fieldCourseSettings any
function AIModeSelection:setAIModeFieldCourseSettings(fieldCourseSettings) end

--- Static helper: reads a flag and, if set, the field course attributes from the stream; returns a table with attributes or nil.
---@param streamId any
---@param connection any
function AIModeSelection.readAIModeSettingsFromStream(streamId, connection) end

--- Applies data from readAIModeSettingsFromStream: generates field course settings for this vehicle, applies the attributes and discards pending loaded user settings. Does nothing for nil.
---@param data any
function AIModeSelection:applyReadAIModeSettingsFromStream(data) end

--- Finalises any loaded user settings, then writes a flag and the field course settings to the stream if they exist.
---@param streamId any
---@param connection any
function AIModeSelection:writeAIModeSettingsToStream(streamId, connection) end

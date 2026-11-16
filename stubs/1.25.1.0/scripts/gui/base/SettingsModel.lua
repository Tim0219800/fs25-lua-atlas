---@meta
-- FS25 1.25.1.0 : gui/base/SettingsModel.lua (generated stub, FS25 Lua Atlas)

--- Model behind the settings screens (graphics, audio, controls, gameplay). It keeps for every setting an initial, a saved (applied) and a changed (GUI) value, with reader and writer functions that talk to GameSettings or the engine. Edits stay transient until applyChanges writes them and saveChanges persists them to the gameplay settings, the engine hardware-scalability file and the input-binding file. It also builds the option text lists for the controls and holds per-device deadzone and sensitivity state. Many add<Name>Setting helpers called from addManagedSettings, and the SETTING / SETTING_CLASS constants, are not in this dump (UNVERIFIED); the engine functions it calls (getShadowQuality, setMSAA...) are engine bindings.
---@class SettingsModel
SettingsModel = {}

--- Creates the model: empty settings tables, empty option-text lists with step constants (brightness 0.5 to 2.0, sharpness 0 to 2...), a table of quality names translated from l10n, then calls initialize. Takes no parameters. Needs g_i18n.
---@return table
function SettingsModel.new() end

--- Builds the option value and text lists, then registers all managed settings.
function SettingsModel:initialize() end

--- Registers every setting with its reader and writer. Non-console builds add the performance class first (it would overwrite the others' defaults), then engine quality settings (atmosphere, DRS, DLSS, FSR, XeSS, MSAA, post-process AA...) whose change callbacks switch off conflicting upscalers or anti-aliasing modes. Then come audio, camera, gameplay, HDR and direct GameSettings flags, with some added only on mobile or when the frame limit is adjustable.
function SettingsModel:addManagedSettings() end

--- Registers a setting under its key: reads its current value through readerFunction and stores initial, saved and changed values with the restartRequired flag, plus optional text, raw-to-value, value-to-raw and on-change functions. Also appends it to sortedSettings, which sets the apply order.
---@param gameSettingsKey string
---@param readerFunction function
---@param writerFunction function
---@param restartRequired boolean
---@param textFunction any
---@param rawToValueFunc any
---@param valueToRawFunc any
---@param onChangeFunc any
function SettingsModel:addSetting(gameSettingsKey, readerFunction, writerFunction, restartRequired, textFunction, rawToValueFunc, valueToRawFunc, onChangeFunc) end

--- Sets the changed (GUI) value of a setting without writing it to the engine, and calls its on-change function with the value, the raw value and whether it differs. Unknown keys log a warning; a nil value is ignored.
---@param settingKey string
---@param value any
function SettingsModel:setValue(settingKey, value) end

--- Returns the changed value of a setting, or 0 if the key is not registered. With trueValue it instead calls the reader and returns the live current value.
---@param settingKey string
---@param trueValue any
---@return any
function SettingsModel:getValue(settingKey, trueValue) end

--- Re-reads every setting through its reader and sets initial, changed and saved to it, discarding pending edits.
function SettingsModel:refresh() end

--- Re-reads every setting into changed and saved but keeps initial, so reset() still goes back to the older values.
function SettingsModel:refreshChangedValue() end

--- Restores every setting to its initial value, calling the writer for those that differ, then calls setUserConfirmScreenMode(true) (engine) and resets pending device changes.
function SettingsModel:reset() end

--- Returns true if any setting differs from its initial value or has pending device changes.
---@return boolean
function SettingsModel:hasChanges() end

--- Returns two booleans: whether a changed setting flagged restartRequired exists, and, if so, whether a full process restart is needed (see needsProcessRestartToApplyChanges). Returns false, false otherwise.
---@return boolean
---@return boolean
function SettingsModel:needsRestartToApplyChanges() end

--- Returns true if the screen resolution or fullscreen mode setting exists and was changed. Uses the global g_settingsModel, not self.
---@return boolean
function SettingsModel:needsProcessRestartToApplyChanges() end

--- Writes every setting whose changed value differs from the saved one through its writer, then makes changed the new initial value. Saves too unless settingClassesToSave is 0; the argument is a bit mask of SETTING_CLASS flags, not a boolean.
---@param settingClassesToSave boolean
function SettingsModel:applyChanges(settingClassesToSave) end

--- Persists applied settings according to the class bit mask: gameplay settings through g_gameSettings:save(), device changes always, and hardware scalability through saveHardwareScalability (plus executeSettingsChange on console or mobile). Does not apply pending changes.
---@param settingClassesToSave any
function SettingsModel:saveChanges(settingClassesToSave) end

--- Writes the performance class value through its writer, marks it changed and saved, then refreshes all changed values from the engine since the preset alters other settings.
---@param value any
function SettingsModel:applyPerformanceClass(value) end

--- Writes every changed-but-unsaved setting except the performance class through its writer and marks it saved; does not touch initial values or persist anything.
function SettingsModel:applyCustomSettings() end

--- Fills all option lists: volume, FOV, UI and resolution scale, camera and steering sensitivities, units, shadow and quality levels, frame limits, HDR ranges, percentage and tire-track steps, screen modes with aspect labels, languages, scaling modes available on this hardware, and device deadzone and sensitivity steps. Depends on engine and platform queries (UNVERIFIED values).
function SettingsModel:createControlDisplayValues() end

--- Returns the list of deadzone percentage labels (0% to 30%).
function SettingsModel:getDeadzoneTexts() end

--- Returns the list of sensitivity percentage labels (50% to 200%).
function SettingsModel:getSensitivityTexts() end

--- Returns the list of head-tracking sensitivity labels (0% to 100%).
function SettingsModel:getHeadTrackingSensitivityTexts() end

--- Returns true if the current device has a deadzone entry for the given axis index.
---@param axisIndex any
function SettingsModel:getDeviceHasAxisDeadzone(axisIndex) end

--- Returns true if the current device has a sensitivity entry for the given axis index.
---@param axisIndex any
function SettingsModel:getDeviceHasAxisSensitivity(axisIndex) end

--- Returns the number of input devices tracked in the device settings.
function SettingsModel:getNumDevices() end

--- Moves the current device index to the next device, wrapping to 1 after the last.
function SettingsModel:nextDevice() end

--- Returns the device name of the current device, or an empty string if none.
function SettingsModel:getCurrentDeviceName() end

--- Rebuilds the per-device state from g_inputBinding.devicesByInternalId: for each gamepad axis the device has, the deadzone and sensitivity as indices into the value lists, the mouse scale for keyboard/mouse devices, and the camera head-tracking sensitivity. Sets the current device to 1 when any device exists.
function SettingsModel:initDeviceSettings() end

--- Returns true if any device axis deadzone or sensitivity, the mouse sensitivity or the head-tracking sensitivity differs from its saved value.
function SettingsModel:hasDeviceChanges() end

--- Applies the current deadzone and sensitivity of every axis to the devices, and mouse and head-tracking sensitivities for keyboard/mouse devices, marks them saved, and if anything was applied reapplies gamepad deadzones and writes the input binding XML file. Note: axis values are always written, and head-tracking only for keyboard/mouse devices.
function SettingsModel:saveDeviceChanges() end

--- Sets every device's current deadzone, sensitivity, mouse and head-tracking values back to their saved values.
function SettingsModel:resetDeviceChanges() end

--- Sets the pending deadzone index for an axis on the current device; does nothing if there is no current device.
---@param axisIndex any
---@param value any
function SettingsModel:setDeviceDeadzoneValue(axisIndex, value) end

--- Sets the pending sensitivity index for an axis on the current device; does nothing if there is no current device.
---@param axisIndex any
---@param value any
function SettingsModel:setDeviceSensitivityValue(axisIndex, value) end

--- Returns the actual sensitivity number (not the index) for an axis on the current device, or nil when there is no current device.
---@param axisIndex any
function SettingsModel:getCurrentDeviceSensitivityValue(axisIndex) end

--- Sets the pending mouse sensitivity index on the current device if one exists.
---@param value any
function SettingsModel:setMouseSensitivity(value) end

--- Sets the pending head-tracking sensitivity index on the current device if one exists.
---@param value any
function SettingsModel:setHeadTrackingSensitivity(value) end

--- Returns the pending deadzone index of an axis on the current device. No nil check: errors if there is no current device or axis.
---@param axisIndex any
function SettingsModel:getDeviceAxisDeadzoneValue(axisIndex) end

--- Returns the pending sensitivity index of an axis on the current device. No nil check, like the deadzone getter.
---@param axisIndex any
function SettingsModel:getDeviceAxisSensitivityValue(axisIndex) end

--- Returns the pending mouse sensitivity index of the current device; the axisIndex parameter is unused.
---@param axisIndex any
function SettingsModel:getMouseSensitivityValue(axisIndex) end

--- Returns the pending head-tracking sensitivity index of the current device; the axisIndex parameter is unused.
---@param axisIndex any
function SettingsModel:getHeadTrackingSensitivityValue(axisIndex) end

--- Returns true if the current device is in the keyboard and mouse category.
function SettingsModel:getIsDeviceMouse() end

--- Returns the screen mode labels (size and aspect ratio) built from the engine's screen mode list.
function SettingsModel:getResolutionTexts() end

--- Returns the labels for windowed, borderless and exclusive fullscreen modes.
function SettingsModel:getFullscreenModeTexts() end

--- Returns the language names offered for multiplayer, as listed by the engine.
function SettingsModel:getMPLanguageTexts() end

--- Returns the frame limit option labels built from g_gameSettings.frameLimitValues.
function SettingsModel:getFrameLimitTexts() end

--- Returns the labels for input help mode: auto, keyboard, gamepad.
function SettingsModel:getInputHelpModeTexts() end

--- Returns labels for automatic and manual direction change, keyed by the VehicleMotor mode constants.
function SettingsModel:getDirectionChangeModeTexts() end

--- Returns gear shift mode labels keyed by VehicleMotor constants; the manual-with-clutch entry is omitted on console.
function SettingsModel:getGearShiftModeTexts() end

--- Returns labels for the speed gauge showing RPM or speed, keyed by SpeedMeterDisplay constants.
function SettingsModel:getHudSpeedGaugeTexts() end

--- Returns the global table of available language names, g_availableLanguageNamesTable (defined elsewhere).
function SettingsModel:getLanguageTexts() end

--- Returns true when at most one language is available or the build is the Steam version, meaning the language selector is locked.
function SettingsModel:getIsLanguageDisabled() end

--- Returns the six preset labels (very low to ultra), the current performance class and whether it is custom. On non-mobile builds the current slot is relabelled custom or auto from getPerformanceClass and getAutoPerformanceClass (engine).
function SettingsModel:getPerformanceClassTexts() end

--- Returns the HDR peak brightness labels (50 to 1000 in steps of 10).
function SettingsModel:getHDRPeakBrightnessTexts() end

--- Returns the HDR contrast labels (0.80 to 2.00 in steps of 0.01).
function SettingsModel:getHDRContrastTexts() end

--- Returns the overlay brightness labels (50 to 1000 in steps of 10).
function SettingsModel:getOverlayBrightnessTexts() end

--- Returns the post-process anti-aliasing tooltip, extended with the TAA and DLAA sentences when the engine supports them.
function SettingsModel:getPostProcessAAToolTip() end

--- Returns the dynamic resolution target FPS labels, built from the frame limit values.
function SettingsModel:getDRSTargetFPSTexts() end

--- Returns the four-level low to very high labels for shading rate quality.
function SettingsModel:getShadingRateQualityTexts() end

--- Returns the shadow quality labels: off, medium, high, very high.
function SettingsModel:getShadowQualityTexts() end

--- Returns the shadow distance labels: low, medium, high.
function SettingsModel:getShadowDistanceQualityTexts() end

--- Returns the off/on labels for soft shadows.
function SettingsModel:getSoftShadowsTexts() end

--- Returns the four-level labels for ambient occlusion quality.
function SettingsModel:getSSAOQualityTexts() end

--- Returns the four-level low to very high labels, shared with other settings.
function SettingsModel:getShaderQualityTexts() end

--- Returns the low/high labels for texture resolution.
function SettingsModel:getTextureResolutionTexts() end

--- Returns the low/high labels for shadow map filtering.
function SettingsModel:getShadowMapFilteringTexts() end

--- Returns the four-level labels for terrain quality. The name has a typo (Terraing) but is the real one.
function SettingsModel:getTerraingQualityTexts() end

--- Returns the five-level labels, low to ultra, for the lights profile.
function SettingsModel:getLightsProfileTexts() end

--- Returns the labels 1 to 10 for the maximum number of shadow-casting lights.
function SettingsModel:getShadowMapLightsTexts() end

--- Returns the shared percentage labels (50% to 200% by 5%) used for object draw distance.
function SettingsModel:getObjectDrawDistanceTexts() end

--- Returns the same shared percentage labels, used for foliage draw distance.
function SettingsModel:getFoliageDrawDistanceTexts() end

--- Returns the same shared percentage labels, used for LOD distance.
function SettingsModel:getLODDistanceTexts() end

--- Returns the same shared percentage labels, used for terrain LOD distance.
function SettingsModel:getTerrainLODDistanceTexts() end

--- Returns the same shared percentage labels, used for foliage LOD distance.
function SettingsModel:getFoliageLODDistanceTexts() end

--- Returns the same shared percentage labels, used for volume mesh tessellation (name misspelled Tessalation).
function SettingsModel:getVolumeMeshTessalationTexts() end

--- Returns the tire track percentage labels (0% to 400% in steps of 50%).
function SettingsModel:getMaxTireTracksTexts() end

--- Returns the labels 0 to 7 for the maximum number of mirrors.
function SettingsModel:getMaxMirrorsTexts() end

--- Returns the brightness labels from 0.5 to 2.0 in steps of 0.1.
function SettingsModel:getBrightnessTexts() end

--- Returns the vertical field of view labels, one per degree between the platform's min and max FOV.
function SettingsModel:getFovYTexts() end

--- Returns the 16 UI scale labels from 50% to 125% in steps of 5%.
function SettingsModel:getUiScaleTexts() end

--- Returns the volume labels: off, then 10% to 100%.
function SettingsModel:getAudioVolumeTexts() end

--- Returns the voice input threshold labels: auto, then 0% to 100% in steps of 10%.
function SettingsModel:getVoiceInputSensitivityTexts() end

--- Returns the volume label list (off to 100%), reused for force feedback strength.
function SettingsModel:getForceFeedbackTexts() end

--- Returns the microphone recording volume labels: auto, then 50% to 150%.
function SettingsModel:getRecordingVolumeTexts() end

--- Returns the voice mode labels: off, voice activity, and push-to-talk when the platform supports it.
function SettingsModel:getVoiceModeTexts() end

--- Returns the camera sensitivity labels, 50% to 300% in 25% steps.
function SettingsModel:getCameraSensitivityTexts() end

--- Returns the vehicle arm sensitivity labels, 50% to 300% in 25% steps.
function SettingsModel:getVehicleArmSensitivityTexts() end

--- Returns the beacon light brightness labels: off, then 10% to 100%.
function SettingsModel:getRealBeaconLightBrightnessTexts() end

--- Returns the steering return speed labels built from Platform.gameplay.steeringBackSpeedSettings.
function SettingsModel:getSteeringBackSpeedTexts() end

--- Returns the currency labels: euro, dollar, pound.
function SettingsModel:getMoneyUnitTexts() end

--- Returns the distance unit labels: km, miles.
function SettingsModel:getDistanceUnitTexts() end

--- Returns the temperature unit labels: Celsius, Fahrenheit.
function SettingsModel:getTemperatureUnitTexts() end

--- Returns the area unit labels: hectare, acre.
function SettingsModel:getAreaUnitTexts() end

--- Returns the radio mode labels: always, or only in vehicles.
function SettingsModel:getRadioModeTexts() end

--- Returns the 2D resolution scale labels, 50% to 200% in 10% steps.
function SettingsModel:getResolutionScaleTexts() end

--- Returns the 3D resolution scale labels, 50% to 200% in 10% steps.
function SettingsModel:getResolutionScale3dTexts() end

--- Registers the shading rate quality setting; the GUI index is the engine value plus 1 and writing subtracts 1 (never below 0), using getShadingRateQuality / setShadingRateQuality (engine).
function SettingsModel:addShadingRateQualitySetting() end

--- Registers the ambient occlusion quality setting, passed straight to getSSAOQuality and setSSAOQuality (engine).
function SettingsModel:addSSAOQualitySetting() end

--- Registers cloud shadows as a boolean: true when the engine quality equals 1, written back as 1 or 0.
function SettingsModel:addCloudShadowsQualitySetting() end

--- Registers the texture resolution setting, converting between the engine value and a GUI index with SettingsModel.getTextureResolutionIndex / ByIndex (not in this dump).
function SettingsModel:addTextureResolutionSetting() end

--- Registers shadow quality, which combines the engine's shadow quality value and its focus box flag into one GUI index through SettingsModel helpers (not in this dump).
function SettingsModel:addShadowQualitySetting() end

--- Registers shadow distance quality; the GUI index is the engine value plus 1.
function SettingsModel:addShadowDistanceQualitySetting() end

--- Registers soft shadows through the engine shadow filter quality, with a GUI index equal to the engine value plus 1.
function SettingsModel:addSoftShadowsSetting() end

--- Registers shader quality, converted with SettingsModel.getShaderQualityIndex / ByIndex (not in this dump).
function SettingsModel:addShaderQualitySetting() end

--- Registers the shadow map filter size, converted with SettingsModel.getShadowMapFilterIndex / ByIndex (not in this dump).
function SettingsModel:addShadowMapFilteringSetting() end

--- Registers the maximum number of shadow-casting lights, passed straight to getMaxNumShadowLights and setMaxNumShadowLights (engine).
function SettingsModel:addShadowMaxLightsSetting() end

--- Registers terrain quality, converted with SettingsModel helpers (not in this dump). The source comment says a restart is needed for the right shader cache, yet restartRequired is not set.
function SettingsModel:addTerrainQualitySetting() end

--- Registers object draw distance as an index into the shared percentage values, using getViewDistanceCoeff / setViewDistanceCoeff (engine).
function SettingsModel:addObjectDrawDistanceSetting() end

--- Registers foliage draw distance as an index into the percentage values, using getFoliageViewDistanceCoeff / setFoliageViewDistanceCoeff (engine).
function SettingsModel:addFoliageDrawDistanceSetting() end

--- Registers the foliage shadows flag through getAllowFoliageShadows / setAllowFoliageShadows (engine).
function SettingsModel:addFoliageShadowSetting() end

--- Registers LOD distance as an index into the percentage values, using getLODDistanceCoeff / setLODDistanceCoeff (engine).
function SettingsModel:addLODDistanceSetting() end

--- Registers terrain LOD distance as an index into the percentage values, using getTerrainLODDistanceCoeff / setTerrainLODDistanceCoeff (engine).
function SettingsModel:addTerrainLODDistanceSetting() end

--- Registers foliage LOD distance as an index into the percentage values, using getFoliageLODDistanceCoeff / setFoliageLODDistanceCoeff (engine).
function SettingsModel:addFoliageLODDistanceSetting() end

--- Registers volume mesh tessellation as an index into the percentage values, through SettingsModel.getVolumeMeshTessellationCoeff / set... (not in this dump).
function SettingsModel:addVolumeMeshTessellationSetting() end

--- Registers the maximum tire tracks setting as an index into the tire track values, using getTyreTracksSegmentsCoeff / setTyreTracksSegmentsCoeff (engine).
function SettingsModel:addMaxTireTracksSetting() end

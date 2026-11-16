# gui/base/SettingsModel.lua

*[Version française](../../../fr/scripts/gui/base/SettingsModel.md)*

Source: `dataS/scripts/gui/base/SettingsModel.lua` — FS25 1.25.1.0

✍ Model behind the settings screens (graphics, audio, controls, gameplay). It keeps for every setting an initial, a saved (applied) and a changed (GUI) value, with reader and writer functions that talk to GameSettings or the engine. Edits stay transient until applyChanges writes them and saveChanges persists them to the gameplay settings, the engine hardware-scalability file and the input-binding file. It also builds the option text lists for the controls and holds per-device deadzone and sensitivity state. Many add<Name>Setting helpers called from addManagedSettings, and the SETTING / SETTING_CLASS constants, are not in this dump (UNVERIFIED); the engine functions it calls (getShadowQuality, setMSAA...) are engine bindings.

- **SettingsModel** (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `SettingsModel.new() → table` | 152 | ✍ Creates the model: empty settings tables, empty option-text lists with step constants (brightness 0.5 to 2.0, sharpness 0 to 2...), a table of quality names translated from l10n, then calls initialize. Takes no parameters. Needs g_i18n. |
| `SettingsModel:initialize()` | 276 | ✍ Builds the option value and text lists, then registers all managed settings. |
| `SettingsModel:addManagedSettings()` | 283 | ✍ Registers every setting with its reader and writer. Non-console builds add the performance class first (it would overwrite the others' defaults), then engine quality settings (atmosphere, DRS, DLSS, FSR, XeSS, MSAA, post-process AA...) whose change callbacks switch off conflicting upscalers or anti-aliasing modes. Then come audio, camera, gameplay, HDR and direct GameSettings flags, with some added only on mobile or when the frame limit is adjustable. |
| `SettingsModel:addSetting(gameSettingsKey: string, readerFunction: function, writerFunction: function, restartRequired: boolean, textFunction: any, rawToValueFunc: any, valueToRawFunc: any, onChangeFunc: any)` | 530 | ✍ Registers a setting under its key: reads its current value through readerFunction and stores initial, saved and changed values with the restartRequired flag, plus optional text, raw-to-value, value-to-raw and on-change functions. Also appends it to sortedSettings, which sets the apply order. |
| `SettingsModel:setValue(settingKey: string, value: any)` | 551 | ✍ Sets the changed (GUI) value of a setting without writing it to the engine, and calls its on-change function with the value, the raw value and whether it differs. Unknown keys log a warning; a nil value is ignored. |
| `SettingsModel:getValue(settingKey: string, trueValue: any) → any` | 591 | ✍ Returns the changed value of a setting, or 0 if the key is not registered. With trueValue it instead calls the reader and returns the live current value. |
| `SettingsModel:refresh()` | 625 | ✍ Re-reads every setting through its reader and sets initial, changed and saved to it, discarding pending edits. |
| `SettingsModel:refreshChangedValue()` | 637 | ✍ Re-reads every setting into changed and saved but keeps initial, so reset() still goes back to the older values. |
| `SettingsModel:reset()` | 647 | ✍ Restores every setting to its initial value, calling the writer for those that differ, then calls setUserConfirmScreenMode(true) (engine) and resets pending device changes. |
| `SettingsModel:hasChanges() → boolean` | 682 | ✍ Returns true if any setting differs from its initial value or has pending device changes. |
| `SettingsModel:needsRestartToApplyChanges() → boolean, boolean` | 696 | ✍ Returns two booleans: whether a changed setting flagged restartRequired exists, and, if so, whether a full process restart is needed (see needsProcessRestartToApplyChanges). Returns false, false otherwise. |
| `SettingsModel:needsProcessRestartToApplyChanges() → boolean` | 709 | ✍ Returns true if the screen resolution or fullscreen mode setting exists and was changed. Uses the global g_settingsModel, not self. |
| `SettingsModel:applyChanges(settingClassesToSave: boolean)` | 727 | ✍ Writes every setting whose changed value differs from the saved one through its writer, then makes changed the new initial value. Saves too unless settingClassesToSave is 0; the argument is a bit mask of SETTING_CLASS flags, not a boolean. |
| `SettingsModel:saveChanges(settingClassesToSave: any)` | 750 | ✍ Persists applied settings according to the class bit mask: gameplay settings through g_gameSettings:save(), device changes always, and hardware scalability through saveHardwareScalability (plus executeSettingsChange on console or mobile). Does not apply pending changes. |
| `SettingsModel:applyPerformanceClass(value: any)` | 767 | ✍ Writes the performance class value through its writer, marks it changed and saved, then refreshes all changed values from the engine since the preset alters other settings. |
| `SettingsModel:applyCustomSettings()` | 779 | ✍ Writes every changed-but-unsaved setting except the performance class through its writer and marks it saved; does not touch initial values or persist anything. |
| `SettingsModel:createControlDisplayValues()` | 798 | ✍ Fills all option lists: volume, FOV, UI and resolution scale, camera and steering sensitivities, units, shadow and quality levels, frame limits, HDR ranges, percentage and tire-track steps, screen modes with aspect labels, languages, scaling modes available on this hardware, and device deadzone and sensitivity steps. Depends on engine and platform queries (UNVERIFIED values). |
| `SettingsModel:getDeadzoneTexts()` | 1080 | ✍ Returns the list of deadzone percentage labels (0% to 30%). |
| `SettingsModel:getSensitivityTexts()` | 1086 | ✍ Returns the list of sensitivity percentage labels (50% to 200%). |
| `SettingsModel:getHeadTrackingSensitivityTexts()` | 1092 | ✍ Returns the list of head-tracking sensitivity labels (0% to 100%). |
| `SettingsModel:getDeviceHasAxisDeadzone(axisIndex: any)` | 1098 | ✍ Returns true if the current device has a deadzone entry for the given axis index. |
| `SettingsModel:getDeviceHasAxisSensitivity(axisIndex: any)` | 1105 | ✍ Returns true if the current device has a sensitivity entry for the given axis index. |
| `SettingsModel:getNumDevices()` | 1112 | ✍ Returns the number of input devices tracked in the device settings. |
| `SettingsModel:nextDevice()` | 1118 | ✍ Moves the current device index to the next device, wrapping to 1 after the last. |
| `SettingsModel:getCurrentDeviceName()` | 1127 | ✍ Returns the device name of the current device, or an empty string if none. |
| `SettingsModel:initDeviceSettings()` | 1138 | ✍ Rebuilds the per-device state from g_inputBinding.devicesByInternalId: for each gamepad axis the device has, the deadzone and sensitivity as indices into the value lists, the mouse scale for keyboard/mouse devices, and the camera head-tracking sensitivity. Sets the current device to 1 when any device exists. |
| `SettingsModel:hasDeviceChanges()` | 1179 | ✍ Returns true if any device axis deadzone or sensitivity, the mouse sensitivity or the head-tracking sensitivity differs from its saved value. |
| `SettingsModel:saveDeviceChanges()` | 1211 | ✍ Applies the current deadzone and sensitivity of every axis to the devices, and mouse and head-tracking sensitivities for keyboard/mouse devices, marks them saved, and if anything was applied reapplies gamepad deadzones and writes the input binding XML file. Note: axis values are always written, and head-tracking only for keyboard/mouse devices. |
| `SettingsModel:resetDeviceChanges()` | 1253 | ✍ Sets every device's current deadzone, sensitivity, mouse and head-tracking values back to their saved values. |
| `SettingsModel:setDeviceDeadzoneValue(axisIndex: any, value: any)` | 1270 | ✍ Sets the pending deadzone index for an axis on the current device; does nothing if there is no current device. |
| `SettingsModel:setDeviceSensitivityValue(axisIndex: any, value: any)` | 1288 | ✍ Sets the pending sensitivity index for an axis on the current device; does nothing if there is no current device. |
| `SettingsModel:getCurrentDeviceSensitivityValue(axisIndex: any)` | 1297 | ✍ Returns the actual sensitivity number (not the index) for an axis on the current device, or nil when there is no current device. |
| `SettingsModel:setMouseSensitivity(value: any)` | 1309 | ✍ Sets the pending mouse sensitivity index on the current device if one exists. |
| `SettingsModel:setHeadTrackingSensitivity(value: any)` | 1318 | ✍ Sets the pending head-tracking sensitivity index on the current device if one exists. |
| `SettingsModel:getDeviceAxisDeadzoneValue(axisIndex: any)` | 1327 | ✍ Returns the pending deadzone index of an axis on the current device. No nil check: errors if there is no current device or axis. |
| `SettingsModel:getDeviceAxisSensitivityValue(axisIndex: any)` | 1334 | ✍ Returns the pending sensitivity index of an axis on the current device. No nil check, like the deadzone getter. |
| `SettingsModel:getMouseSensitivityValue(axisIndex: any)` | 1341 | ✍ Returns the pending mouse sensitivity index of the current device; the axisIndex parameter is unused. |
| `SettingsModel:getHeadTrackingSensitivityValue(axisIndex: any)` | 1348 | ✍ Returns the pending head-tracking sensitivity index of the current device; the axisIndex parameter is unused. |
| `SettingsModel:getIsDeviceMouse()` | 1355 | ✍ Returns true if the current device is in the keyboard and mouse category. |
| `SettingsModel:getResolutionTexts()` | 1378 | ✍ Returns the screen mode labels (size and aspect ratio) built from the engine's screen mode list. |
| `SettingsModel:getFullscreenModeTexts()` | 1384 | ✍ Returns the labels for windowed, borderless and exclusive fullscreen modes. |
| `SettingsModel:getMPLanguageTexts()` | 1390 | ✍ Returns the language names offered for multiplayer, as listed by the engine. |
| `SettingsModel:getFrameLimitTexts()` | 1396 | ✍ Returns the frame limit option labels built from g_gameSettings.frameLimitValues. |
| `SettingsModel:getInputHelpModeTexts()` | 1402 | ✍ Returns the labels for input help mode: auto, keyboard, gamepad. |
| `SettingsModel:getDirectionChangeModeTexts()` | 1408 | ✍ Returns labels for automatic and manual direction change, keyed by the VehicleMotor mode constants. |
| `SettingsModel:getGearShiftModeTexts()` | 1414 | ✍ Returns gear shift mode labels keyed by VehicleMotor constants; the manual-with-clutch entry is omitted on console. |
| `SettingsModel:getHudSpeedGaugeTexts()` | 1420 | ✍ Returns labels for the speed gauge showing RPM or speed, keyed by SpeedMeterDisplay constants. |
| `SettingsModel:getLanguageTexts()` | 1426 | ✍ Returns the global table of available language names, g_availableLanguageNamesTable (defined elsewhere). |
| `SettingsModel:getIsLanguageDisabled()` | 1432 | ✍ Returns true when at most one language is available or the build is the Steam version, meaning the language selector is locked. |
| `SettingsModel:getPerformanceClassTexts()` | 1438 | ✍ Returns the six preset labels (very low to ultra), the current performance class and whether it is custom. On non-mobile builds the current slot is relabelled custom or auto from getPerformanceClass and getAutoPerformanceClass (engine). |
| `SettingsModel:getHDRPeakBrightnessTexts()` | 1464 | ✍ Returns the HDR peak brightness labels (50 to 1000 in steps of 10). |
| `SettingsModel:getHDRContrastTexts()` | 1470 | ✍ Returns the HDR contrast labels (0.80 to 2.00 in steps of 0.01). |
| `SettingsModel:getOverlayBrightnessTexts()` | 1476 | ✍ Returns the overlay brightness labels (50 to 1000 in steps of 10). |
| `SettingsModel:getPostProcessAAToolTip()` | 1482 | ✍ Returns the post-process anti-aliasing tooltip, extended with the TAA and DLAA sentences when the engine supports them. |
| `SettingsModel:getDRSTargetFPSTexts()` | 1488 | ✍ Returns the dynamic resolution target FPS labels, built from the frame limit values. |
| `SettingsModel:getShadingRateQualityTexts()` | 1504 | ✍ Returns the four-level low to very high labels for shading rate quality. |
| `SettingsModel:getShadowQualityTexts()` | 1510 | ✍ Returns the shadow quality labels: off, medium, high, very high. |
| `SettingsModel:getShadowDistanceQualityTexts()` | 1516 | ✍ Returns the shadow distance labels: low, medium, high. |
| `SettingsModel:getSoftShadowsTexts()` | 1522 | ✍ Returns the off/on labels for soft shadows. |
| `SettingsModel:getSSAOQualityTexts()` | 1528 | ✍ Returns the four-level labels for ambient occlusion quality. |
| `SettingsModel:getShaderQualityTexts()` | 1534 | ✍ Returns the four-level low to very high labels, shared with other settings. |
| `SettingsModel:getTextureResolutionTexts()` | 1540 | ✍ Returns the low/high labels for texture resolution. |
| `SettingsModel:getShadowMapFilteringTexts()` | 1546 | ✍ Returns the low/high labels for shadow map filtering. |
| `SettingsModel:getTerraingQualityTexts()` | 1552 | ✍ Returns the four-level labels for terrain quality. The name has a typo (Terraing) but is the real one. |
| `SettingsModel:getLightsProfileTexts()` | 1558 | ✍ Returns the five-level labels, low to ultra, for the lights profile. |
| `SettingsModel:getShadowMapLightsTexts()` | 1564 | ✍ Returns the labels 1 to 10 for the maximum number of shadow-casting lights. |
| `SettingsModel:getObjectDrawDistanceTexts()` | 1570 | ✍ Returns the shared percentage labels (50% to 200% by 5%) used for object draw distance. |
| `SettingsModel:getFoliageDrawDistanceTexts()` | 1576 | ✍ Returns the same shared percentage labels, used for foliage draw distance. |
| `SettingsModel:getLODDistanceTexts()` | 1582 | ✍ Returns the same shared percentage labels, used for LOD distance. |
| `SettingsModel:getTerrainLODDistanceTexts()` | 1588 | ✍ Returns the same shared percentage labels, used for terrain LOD distance. |
| `SettingsModel:getFoliageLODDistanceTexts()` | 1594 | ✍ Returns the same shared percentage labels, used for foliage LOD distance. |
| `SettingsModel:getVolumeMeshTessalationTexts()` | 1600 | ✍ Returns the same shared percentage labels, used for volume mesh tessellation (name misspelled Tessalation). |
| `SettingsModel:getMaxTireTracksTexts()` | 1606 | ✍ Returns the tire track percentage labels (0% to 400% in steps of 50%). |
| `SettingsModel:getMaxMirrorsTexts()` | 1612 | ✍ Returns the labels 0 to 7 for the maximum number of mirrors. |
| `SettingsModel:getBrightnessTexts()` | 1618 | ✍ Returns the brightness labels from 0.5 to 2.0 in steps of 0.1. |
| `SettingsModel:getFovYTexts()` | 1624 | ✍ Returns the vertical field of view labels, one per degree between the platform's min and max FOV. |
| `SettingsModel:getUiScaleTexts()` | 1630 | ✍ Returns the 16 UI scale labels from 50% to 125% in steps of 5%. |
| `SettingsModel:getAudioVolumeTexts()` | 1636 | ✍ Returns the volume labels: off, then 10% to 100%. |
| `SettingsModel:getVoiceInputSensitivityTexts()` | 1642 | ✍ Returns the voice input threshold labels: auto, then 0% to 100% in steps of 10%. |
| `SettingsModel:getForceFeedbackTexts()` | 1648 | ✍ Returns the volume label list (off to 100%), reused for force feedback strength. |
| `SettingsModel:getRecordingVolumeTexts()` | 1655 | ✍ Returns the microphone recording volume labels: auto, then 50% to 150%. |
| `SettingsModel:getVoiceModeTexts()` | 1661 | ✍ Returns the voice mode labels: off, voice activity, and push-to-talk when the platform supports it. |
| `SettingsModel:getCameraSensitivityTexts()` | 1667 | ✍ Returns the camera sensitivity labels, 50% to 300% in 25% steps. |
| `SettingsModel:getVehicleArmSensitivityTexts()` | 1673 | ✍ Returns the vehicle arm sensitivity labels, 50% to 300% in 25% steps. |
| `SettingsModel:getRealBeaconLightBrightnessTexts()` | 1679 | ✍ Returns the beacon light brightness labels: off, then 10% to 100%. |
| `SettingsModel:getSteeringBackSpeedTexts()` | 1685 | ✍ Returns the steering return speed labels built from Platform.gameplay.steeringBackSpeedSettings. |
| `SettingsModel:getMoneyUnitTexts()` | 1696 | ✍ Returns the currency labels: euro, dollar, pound. |
| `SettingsModel:getDistanceUnitTexts()` | 1702 | ✍ Returns the distance unit labels: km, miles. |
| `SettingsModel:getTemperatureUnitTexts()` | 1708 | ✍ Returns the temperature unit labels: Celsius, Fahrenheit. |
| `SettingsModel:getAreaUnitTexts()` | 1714 | ✍ Returns the area unit labels: hectare, acre. |
| `SettingsModel:getRadioModeTexts()` | 1720 | ✍ Returns the radio mode labels: always, or only in vehicles. |
| `SettingsModel:getResolutionScaleTexts()` | 1726 | ✍ Returns the 2D resolution scale labels, 50% to 200% in 10% steps. |
| `SettingsModel:getResolutionScale3dTexts()` | 1732 | ✍ Returns the 3D resolution scale labels, 50% to 200% in 10% steps. |
| `SettingsModel:addShadingRateQualitySetting()` | 1923 | ✍ Registers the shading rate quality setting; the GUI index is the engine value plus 1 and writing subtracts 1 (never below 0), using getShadingRateQuality / setShadingRateQuality (engine). |
| `SettingsModel:addSSAOQualitySetting()` | 1937 | ✍ Registers the ambient occlusion quality setting, passed straight to getSSAOQuality and setSSAOQuality (engine). |
| `SettingsModel:addCloudShadowsQualitySetting()` | 1953 | ✍ Registers cloud shadows as a boolean: true when the engine quality equals 1, written back as 1 or 0. |
| `SettingsModel:addTextureResolutionSetting()` | 1967 | ✍ Registers the texture resolution setting, converting between the engine value and a GUI index with SettingsModel.getTextureResolutionIndex / ByIndex (not in this dump). |
| `SettingsModel:addShadowQualitySetting()` | 1981 | ✍ Registers shadow quality, which combines the engine's shadow quality value and its focus box flag into one GUI index through SettingsModel helpers (not in this dump). |
| `SettingsModel:addShadowDistanceQualitySetting()` | 1995 | ✍ Registers shadow distance quality; the GUI index is the engine value plus 1. |
| `SettingsModel:addSoftShadowsSetting()` | 2009 | ✍ Registers soft shadows through the engine shadow filter quality, with a GUI index equal to the engine value plus 1. |
| `SettingsModel:addShaderQualitySetting()` | 2023 | ✍ Registers shader quality, converted with SettingsModel.getShaderQualityIndex / ByIndex (not in this dump). |
| `SettingsModel:addShadowMapFilteringSetting()` | 2037 | ✍ Registers the shadow map filter size, converted with SettingsModel.getShadowMapFilterIndex / ByIndex (not in this dump). |
| `SettingsModel:addShadowMaxLightsSetting()` | 2051 | ✍ Registers the maximum number of shadow-casting lights, passed straight to getMaxNumShadowLights and setMaxNumShadowLights (engine). |
| `SettingsModel:addTerrainQualitySetting()` | 2065 | ✍ Registers terrain quality, converted with SettingsModel helpers (not in this dump). The source comment says a restart is needed for the right shader cache, yet restartRequired is not set. |
| `SettingsModel:addObjectDrawDistanceSetting()` | 2079 | ✍ Registers object draw distance as an index into the shared percentage values, using getViewDistanceCoeff / setViewDistanceCoeff (engine). |
| `SettingsModel:addFoliageDrawDistanceSetting()` | 2093 | ✍ Registers foliage draw distance as an index into the percentage values, using getFoliageViewDistanceCoeff / setFoliageViewDistanceCoeff (engine). |
| `SettingsModel:addFoliageShadowSetting()` | 2107 | ✍ Registers the foliage shadows flag through getAllowFoliageShadows / setAllowFoliageShadows (engine). |
| `SettingsModel:addLODDistanceSetting()` | 2121 | ✍ Registers LOD distance as an index into the percentage values, using getLODDistanceCoeff / setLODDistanceCoeff (engine). |
| `SettingsModel:addTerrainLODDistanceSetting()` | 2135 | ✍ Registers terrain LOD distance as an index into the percentage values, using getTerrainLODDistanceCoeff / setTerrainLODDistanceCoeff (engine). |
| `SettingsModel:addFoliageLODDistanceSetting()` | 2149 | ✍ Registers foliage LOD distance as an index into the percentage values, using getFoliageLODDistanceCoeff / setFoliageLODDistanceCoeff (engine). |
| `SettingsModel:addVolumeMeshTessellationSetting()` | 2163 | ✍ Registers volume mesh tessellation as an index into the percentage values, through SettingsModel.getVolumeMeshTessellationCoeff / set... (not in this dump). |
| `SettingsModel:addMaxTireTracksSetting()` | 2177 | ✍ Registers the maximum tire tracks setting as an index into the tire track values, using getTyreTracksSegmentsCoeff / setTyreTracksSegmentsCoeff (engine). |

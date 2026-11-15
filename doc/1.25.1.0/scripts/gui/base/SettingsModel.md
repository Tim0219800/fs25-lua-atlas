# gui/base/SettingsModel.lua

Source: `dataS/scripts/gui/base/SettingsModel.lua` — FS25 1.25.1.0

- **SettingsModel** (l.14)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `SettingsModel.new() → table` | 152 |  |
| `SettingsModel:initialize()` | 276 |  |
| `SettingsModel:addManagedSettings()` | 283 |  |
| `SettingsModel:addSetting(gameSettingsKey: string, readerFunction: function, writerFunction: function, restartRequired: boolean, textFunction: any, rawToValueFunc: any, valueToRawFunc: any, onChangeFunc: any)` | 530 |  |
| `SettingsModel:setValue(settingKey: string, value: any)` | 551 |  |
| `SettingsModel:getValue(settingKey: string, trueValue: any) → any` | 591 |  |
| `SettingsModel:refresh()` | 625 |  |
| `SettingsModel:refreshChangedValue()` | 637 |  |
| `SettingsModel:reset()` | 647 |  |
| `SettingsModel:hasChanges() → boolean` | 682 |  |
| `SettingsModel:needsRestartToApplyChanges() → boolean, boolean` | 696 |  |
| `SettingsModel:needsProcessRestartToApplyChanges() → boolean` | 709 |  |
| `SettingsModel:applyChanges(settingClassesToSave: boolean)` | 727 |  |
| `SettingsModel:saveChanges(settingClassesToSave: any)` | 750 |  |
| `SettingsModel:applyPerformanceClass(value: any)` | 767 |  |
| `SettingsModel:applyCustomSettings()` | 779 |  |
| `SettingsModel:createControlDisplayValues()` | 798 |  |
| `SettingsModel:getDeadzoneTexts()` | 1080 |  |
| `SettingsModel:getSensitivityTexts()` | 1086 |  |
| `SettingsModel:getHeadTrackingSensitivityTexts()` | 1092 |  |
| `SettingsModel:getDeviceHasAxisDeadzone(axisIndex: any)` | 1098 |  |
| `SettingsModel:getDeviceHasAxisSensitivity(axisIndex: any)` | 1105 |  |
| `SettingsModel:getNumDevices()` | 1112 |  |
| `SettingsModel:nextDevice()` | 1118 |  |
| `SettingsModel:getCurrentDeviceName()` | 1127 |  |
| `SettingsModel:initDeviceSettings()` | 1138 |  |
| `SettingsModel:hasDeviceChanges()` | 1179 |  |
| `SettingsModel:saveDeviceChanges()` | 1211 |  |
| `SettingsModel:resetDeviceChanges()` | 1253 |  |
| `SettingsModel:setDeviceDeadzoneValue(axisIndex: any, value: any)` | 1270 |  |
| `SettingsModel:setDeviceSensitivityValue(axisIndex: any, value: any)` | 1288 |  |
| `SettingsModel:getCurrentDeviceSensitivityValue(axisIndex: any)` | 1297 |  |
| `SettingsModel:setMouseSensitivity(value: any)` | 1309 |  |
| `SettingsModel:setHeadTrackingSensitivity(value: any)` | 1318 |  |
| `SettingsModel:getDeviceAxisDeadzoneValue(axisIndex: any)` | 1327 |  |
| `SettingsModel:getDeviceAxisSensitivityValue(axisIndex: any)` | 1334 |  |
| `SettingsModel:getMouseSensitivityValue(axisIndex: any)` | 1341 |  |
| `SettingsModel:getHeadTrackingSensitivityValue(axisIndex: any)` | 1348 |  |
| `SettingsModel:getIsDeviceMouse()` | 1355 |  |
| `SettingsModel:getResolutionTexts()` | 1378 |  |
| `SettingsModel:getFullscreenModeTexts()` | 1384 |  |
| `SettingsModel:getMPLanguageTexts()` | 1390 |  |
| `SettingsModel:getFrameLimitTexts()` | 1396 |  |
| `SettingsModel:getInputHelpModeTexts()` | 1402 |  |
| `SettingsModel:getDirectionChangeModeTexts()` | 1408 |  |
| `SettingsModel:getGearShiftModeTexts()` | 1414 |  |
| `SettingsModel:getHudSpeedGaugeTexts()` | 1420 |  |
| `SettingsModel:getLanguageTexts()` | 1426 |  |
| `SettingsModel:getIsLanguageDisabled()` | 1432 |  |
| `SettingsModel:getPerformanceClassTexts()` | 1438 |  |
| `SettingsModel:getHDRPeakBrightnessTexts()` | 1464 |  |
| `SettingsModel:getHDRContrastTexts()` | 1470 |  |
| `SettingsModel:getOverlayBrightnessTexts()` | 1476 |  |
| `SettingsModel:getPostProcessAAToolTip()` | 1482 |  |
| `SettingsModel:getDRSTargetFPSTexts()` | 1488 |  |
| `SettingsModel:getShadingRateQualityTexts()` | 1504 |  |
| `SettingsModel:getShadowQualityTexts()` | 1510 |  |
| `SettingsModel:getShadowDistanceQualityTexts()` | 1516 |  |
| `SettingsModel:getSoftShadowsTexts()` | 1522 |  |
| `SettingsModel:getSSAOQualityTexts()` | 1528 |  |
| `SettingsModel:getShaderQualityTexts()` | 1534 |  |
| `SettingsModel:getTextureResolutionTexts()` | 1540 |  |
| `SettingsModel:getShadowMapFilteringTexts()` | 1546 |  |
| `SettingsModel:getTerraingQualityTexts()` | 1552 |  |
| `SettingsModel:getLightsProfileTexts()` | 1558 |  |
| `SettingsModel:getShadowMapLightsTexts()` | 1564 |  |
| `SettingsModel:getObjectDrawDistanceTexts()` | 1570 |  |
| `SettingsModel:getFoliageDrawDistanceTexts()` | 1576 |  |
| `SettingsModel:getLODDistanceTexts()` | 1582 |  |
| `SettingsModel:getTerrainLODDistanceTexts()` | 1588 |  |
| `SettingsModel:getFoliageLODDistanceTexts()` | 1594 |  |
| `SettingsModel:getVolumeMeshTessalationTexts()` | 1600 |  |
| `SettingsModel:getMaxTireTracksTexts()` | 1606 |  |
| `SettingsModel:getMaxMirrorsTexts()` | 1612 |  |
| `SettingsModel:getBrightnessTexts()` | 1618 |  |
| `SettingsModel:getFovYTexts()` | 1624 |  |
| `SettingsModel:getUiScaleTexts()` | 1630 |  |
| `SettingsModel:getAudioVolumeTexts()` | 1636 |  |
| `SettingsModel:getVoiceInputSensitivityTexts()` | 1642 |  |
| `SettingsModel:getForceFeedbackTexts()` | 1648 |  |
| `SettingsModel:getRecordingVolumeTexts()` | 1655 |  |
| `SettingsModel:getVoiceModeTexts()` | 1661 |  |
| `SettingsModel:getCameraSensitivityTexts()` | 1667 |  |
| `SettingsModel:getVehicleArmSensitivityTexts()` | 1673 |  |
| `SettingsModel:getRealBeaconLightBrightnessTexts()` | 1679 |  |
| `SettingsModel:getSteeringBackSpeedTexts()` | 1685 |  |
| `SettingsModel:getMoneyUnitTexts()` | 1696 |  |
| `SettingsModel:getDistanceUnitTexts()` | 1702 |  |
| `SettingsModel:getTemperatureUnitTexts()` | 1708 |  |
| `SettingsModel:getAreaUnitTexts()` | 1714 |  |
| `SettingsModel:getRadioModeTexts()` | 1720 |  |
| `SettingsModel:getResolutionScaleTexts()` | 1726 |  |
| `SettingsModel:getResolutionScale3dTexts()` | 1732 |  |
| `SettingsModel:addShadingRateQualitySetting()` | 1923 |  |
| `SettingsModel:addSSAOQualitySetting()` | 1937 |  |
| `SettingsModel:addCloudShadowsQualitySetting()` | 1953 |  |
| `SettingsModel:addTextureResolutionSetting()` | 1967 |  |
| `SettingsModel:addShadowQualitySetting()` | 1981 |  |
| `SettingsModel:addShadowDistanceQualitySetting()` | 1995 |  |
| `SettingsModel:addSoftShadowsSetting()` | 2009 |  |
| `SettingsModel:addShaderQualitySetting()` | 2023 |  |
| `SettingsModel:addShadowMapFilteringSetting()` | 2037 |  |
| `SettingsModel:addShadowMaxLightsSetting()` | 2051 |  |
| `SettingsModel:addTerrainQualitySetting()` | 2065 |  |
| `SettingsModel:addObjectDrawDistanceSetting()` | 2079 |  |
| `SettingsModel:addFoliageDrawDistanceSetting()` | 2093 |  |
| `SettingsModel:addFoliageShadowSetting()` | 2107 |  |
| `SettingsModel:addLODDistanceSetting()` | 2121 |  |
| `SettingsModel:addTerrainLODDistanceSetting()` | 2135 |  |
| `SettingsModel:addFoliageLODDistanceSetting()` | 2149 |  |
| `SettingsModel:addVolumeMeshTessellationSetting()` | 2163 |  |
| `SettingsModel:addMaxTireTracksSetting()` | 2177 |  |

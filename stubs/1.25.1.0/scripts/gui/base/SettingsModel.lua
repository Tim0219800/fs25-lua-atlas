---@meta
-- FS25 1.25.1.0 : gui/base/SettingsModel.lua (stub généré, atlas Lua FS25)

---@class SettingsModel
SettingsModel = {}

---@return table
function SettingsModel.new() end

function SettingsModel:initialize() end

function SettingsModel:addManagedSettings() end

---@param gameSettingsKey string
---@param readerFunction function
---@param writerFunction function
---@param restartRequired boolean
---@param textFunction any
---@param rawToValueFunc any
---@param valueToRawFunc any
---@param onChangeFunc any
function SettingsModel:addSetting(gameSettingsKey, readerFunction, writerFunction, restartRequired, textFunction, rawToValueFunc, valueToRawFunc, onChangeFunc) end

---@param settingKey string
---@param value any
function SettingsModel:setValue(settingKey, value) end

---@param settingKey string
---@param trueValue any
---@return any
function SettingsModel:getValue(settingKey, trueValue) end

function SettingsModel:refresh() end

function SettingsModel:refreshChangedValue() end

function SettingsModel:reset() end

---@return boolean
function SettingsModel:hasChanges() end

---@return boolean
---@return boolean
function SettingsModel:needsRestartToApplyChanges() end

---@return boolean
function SettingsModel:needsProcessRestartToApplyChanges() end

---@param settingClassesToSave boolean
function SettingsModel:applyChanges(settingClassesToSave) end

---@param settingClassesToSave any
function SettingsModel:saveChanges(settingClassesToSave) end

---@param value any
function SettingsModel:applyPerformanceClass(value) end

function SettingsModel:applyCustomSettings() end

function SettingsModel:createControlDisplayValues() end

function SettingsModel:getDeadzoneTexts() end

function SettingsModel:getSensitivityTexts() end

function SettingsModel:getHeadTrackingSensitivityTexts() end

---@param axisIndex any
function SettingsModel:getDeviceHasAxisDeadzone(axisIndex) end

---@param axisIndex any
function SettingsModel:getDeviceHasAxisSensitivity(axisIndex) end

function SettingsModel:getNumDevices() end

function SettingsModel:nextDevice() end

function SettingsModel:getCurrentDeviceName() end

function SettingsModel:initDeviceSettings() end

function SettingsModel:hasDeviceChanges() end

function SettingsModel:saveDeviceChanges() end

function SettingsModel:resetDeviceChanges() end

---@param axisIndex any
---@param value any
function SettingsModel:setDeviceDeadzoneValue(axisIndex, value) end

---@param axisIndex any
---@param value any
function SettingsModel:setDeviceSensitivityValue(axisIndex, value) end

---@param axisIndex any
function SettingsModel:getCurrentDeviceSensitivityValue(axisIndex) end

---@param value any
function SettingsModel:setMouseSensitivity(value) end

---@param value any
function SettingsModel:setHeadTrackingSensitivity(value) end

---@param axisIndex any
function SettingsModel:getDeviceAxisDeadzoneValue(axisIndex) end

---@param axisIndex any
function SettingsModel:getDeviceAxisSensitivityValue(axisIndex) end

---@param axisIndex any
function SettingsModel:getMouseSensitivityValue(axisIndex) end

---@param axisIndex any
function SettingsModel:getHeadTrackingSensitivityValue(axisIndex) end

function SettingsModel:getIsDeviceMouse() end

function SettingsModel:getResolutionTexts() end

function SettingsModel:getFullscreenModeTexts() end

function SettingsModel:getMPLanguageTexts() end

function SettingsModel:getFrameLimitTexts() end

function SettingsModel:getInputHelpModeTexts() end

function SettingsModel:getDirectionChangeModeTexts() end

function SettingsModel:getGearShiftModeTexts() end

function SettingsModel:getHudSpeedGaugeTexts() end

function SettingsModel:getLanguageTexts() end

function SettingsModel:getIsLanguageDisabled() end

function SettingsModel:getPerformanceClassTexts() end

function SettingsModel:getHDRPeakBrightnessTexts() end

function SettingsModel:getHDRContrastTexts() end

function SettingsModel:getOverlayBrightnessTexts() end

function SettingsModel:getPostProcessAAToolTip() end

function SettingsModel:getDRSTargetFPSTexts() end

function SettingsModel:getShadingRateQualityTexts() end

function SettingsModel:getShadowQualityTexts() end

function SettingsModel:getShadowDistanceQualityTexts() end

function SettingsModel:getSoftShadowsTexts() end

function SettingsModel:getSSAOQualityTexts() end

function SettingsModel:getShaderQualityTexts() end

function SettingsModel:getTextureResolutionTexts() end

function SettingsModel:getShadowMapFilteringTexts() end

function SettingsModel:getTerraingQualityTexts() end

function SettingsModel:getLightsProfileTexts() end

function SettingsModel:getShadowMapLightsTexts() end

function SettingsModel:getObjectDrawDistanceTexts() end

function SettingsModel:getFoliageDrawDistanceTexts() end

function SettingsModel:getLODDistanceTexts() end

function SettingsModel:getTerrainLODDistanceTexts() end

function SettingsModel:getFoliageLODDistanceTexts() end

function SettingsModel:getVolumeMeshTessalationTexts() end

function SettingsModel:getMaxTireTracksTexts() end

function SettingsModel:getMaxMirrorsTexts() end

function SettingsModel:getBrightnessTexts() end

function SettingsModel:getFovYTexts() end

function SettingsModel:getUiScaleTexts() end

function SettingsModel:getAudioVolumeTexts() end

function SettingsModel:getVoiceInputSensitivityTexts() end

function SettingsModel:getForceFeedbackTexts() end

function SettingsModel:getRecordingVolumeTexts() end

function SettingsModel:getVoiceModeTexts() end

function SettingsModel:getCameraSensitivityTexts() end

function SettingsModel:getVehicleArmSensitivityTexts() end

function SettingsModel:getRealBeaconLightBrightnessTexts() end

function SettingsModel:getSteeringBackSpeedTexts() end

function SettingsModel:getMoneyUnitTexts() end

function SettingsModel:getDistanceUnitTexts() end

function SettingsModel:getTemperatureUnitTexts() end

function SettingsModel:getAreaUnitTexts() end

function SettingsModel:getRadioModeTexts() end

function SettingsModel:getResolutionScaleTexts() end

function SettingsModel:getResolutionScale3dTexts() end

function SettingsModel:addShadingRateQualitySetting() end

function SettingsModel:addSSAOQualitySetting() end

function SettingsModel:addCloudShadowsQualitySetting() end

function SettingsModel:addTextureResolutionSetting() end

function SettingsModel:addShadowQualitySetting() end

function SettingsModel:addShadowDistanceQualitySetting() end

function SettingsModel:addSoftShadowsSetting() end

function SettingsModel:addShaderQualitySetting() end

function SettingsModel:addShadowMapFilteringSetting() end

function SettingsModel:addShadowMaxLightsSetting() end

function SettingsModel:addTerrainQualitySetting() end

function SettingsModel:addObjectDrawDistanceSetting() end

function SettingsModel:addFoliageDrawDistanceSetting() end

function SettingsModel:addFoliageShadowSetting() end

function SettingsModel:addLODDistanceSetting() end

function SettingsModel:addTerrainLODDistanceSetting() end

function SettingsModel:addFoliageLODDistanceSetting() end

function SettingsModel:addVolumeMeshTessellationSetting() end

function SettingsModel:addMaxTireTracksSetting() end

---@meta
-- FS25 1.25.1.0 : sounds/SoundManager.lua (stub généré, atlas Lua FS25)

---@class SoundManager : AbstractManager
SoundManager = {}

---@param customMt table?
---@return SoundManager
function SoundManager.new(customMt) end

function SoundManager:initDataStructures() end

function SoundManager:delete() end

---@param typeName any
---@param func any
---@param minFunc any
---@param maxFunc any
---@return boolean
function SoundManager:registerModifierType(typeName, func, minFunc, maxFunc) end

---@param xmlFilename any
---@return boolean
function SoundManager:loadSoundTemplates(xmlFilename) end

function SoundManager:reloadSoundTemplates() end

---@param sample table
---@param linkNode integer
---@param modifierTargetObject any
---@return table
function SoundManager:cloneSample(sample, linkNode, modifierTargetObject) end

---@param sample table
---@param linkNode integer
---@param modifierTargetObject any
---@return table
function SoundManager:cloneSample2D(sample, linkNode, modifierTargetObject) end

---@param xmlFile integer
---@param baseKey string
---@param sampleName string
---@param baseDir string
---@param audioGroup string
---@param is2D boolean
---@param components table
---@param i3dMappings table
---@param externalSoundsFile any
---@return boolean
---@return boolean
---@return integer
---@return string
---@return integer
function SoundManager:validateSampleDefinition(xmlFile, baseKey, sampleName, baseDir, audioGroup, is2D, components, i3dMappings, externalSoundsFile) end

---@param xmlFile integer
---@param baseKey string
---@param sampleName string
---@param baseDir string
---@param loops integer
---@param audioGroup string
---@param requiresFile boolean?
function SoundManager:loadSample2DFromXML(xmlFile, baseKey, sampleName, baseDir, loops, audioGroup, requiresFile) end

---@param xmlFile integer|XMLFile
---@param baseKey string
---@param sampleName string
---@param baseDir string
---@param components (table|integer)
---@param loops integer
---@param audioGroup integer
---@param i3dMappings table?
---@param modifierTargetObject table?
---@param requiresFile boolean?
---@return table?
function SoundManager:loadSampleFromXML(xmlFile, baseKey, sampleName, baseDir, components, loops, audioGroup, i3dMappings, modifierTargetObject, requiresFile) end

---@param xmlFile integer
---@param baseKey string
---@param sampleName string
---@param baseDir string
---@param components table
---@param loops integer
---@param audioGroup integer
---@param i3dMappings table
---@param modifierTargetObject table?
---@param samples table?
---@return table
function SoundManager:loadSamplesFromXML(xmlFile, baseKey, sampleName, baseDir, components, loops, audioGroup, i3dMappings, modifierTargetObject, samples) end

---@param sample any
---@param filename any
function SoundManager:createAudioSource(sample, filename) end

---@param sample any
---@param ignoreReverb any
function SoundManager:onCreateAudioSource(sample, ignoreReverb) end

---@param sample any
---@param filename any
function SoundManager:createAudio2d(sample, filename) end

---@param sample any
---@param ignoreReverb any
function SoundManager:onCreateAudio2d(sample, ignoreReverb) end

---@param sample any
---@param templateName any
---@param baseDir any
---@param defaultLoops any
---@param xmlFile any
---@param sampleKey any
function SoundManager:loadSampleAttributesFromTemplate(sample, templateName, baseDir, defaultLoops, xmlFile, sampleKey) end

---@param sample table
---@param xmlFile integer
---@param key string
---@param baseDir any
---@param defaultLoops any
---@param requiresFile any
function SoundManager:loadSampleAttributesFromXML(sample, xmlFile, key, baseDir, defaultLoops, requiresFile) end

---@param sample table
---@param xmlFile integer
---@param key string
function SoundManager:loadModifiersFromXML(sample, xmlFile, key) end

---@param sample table
---@param xmlFile integer
---@param key string
---@param baseDir any
function SoundManager:loadRandomizationsFromXML(sample, xmlFile, key, baseDir) end

---@param sample any
---@param filename any
function SoundManager:getRandomSample(sample, filename) end

---@param dt any
function SoundManager:update(dt) end

function SoundManager:draw() end

---@param sample table
---@param dt number
function SoundManager:updateSampleFade(sample, dt) end

---@param sample table
function SoundManager:updateSampleModifiers(sample) end

---@param sample table
---@param force boolean
function SoundManager:updateSampleAttributes(sample, force) end

---@param sample table
function SoundManager:updateSampleRandomizations(sample) end

---@param sample table
---@param attribute table
---@param typeIndex string
function SoundManager:getSampleModifierValue(sample, attribute, typeIndex) end

---@param sample table
function SoundManager:deleteSample(sample) end

---@param samples table
---@param delay any
---@param afterSample any
function SoundManager:deleteSamples(samples, delay, afterSample) end

---@param sample table
---@param delay number?
---@param afterSample table?
function SoundManager:playSample(sample, delay, afterSample) end

---@param samples table
---@param delay integer?
---@param afterSample table?
function SoundManager:playSamples(samples, delay, afterSample) end

---@param sample table
---@param delay number?
---@param fadeOut number?
function SoundManager:stopSample(sample, delay, fadeOut) end

---@param samples table
function SoundManager:stopSamples(samples) end

---@param sample table
---@param offset number
function SoundManager:setSampleVolumeOffset(sample, offset) end

---@param sample table
---@param offset number
function SoundManager:setSamplePitchOffset(sample, offset) end

---@param sample table
---@param offset number
function SoundManager:setSampleLowpassGainOffset(sample, offset) end

---@param sample table
---@param volume number
function SoundManager:setSampleVolume(sample, volume) end

---@param sample table
---@param volumeScale number
function SoundManager:setSampleVolumeScale(sample, volumeScale) end

---@param sample table
---@return number
function SoundManager:getSampleVolumeScale(sample) end

---@param sample table
---@param pitch number
function SoundManager:setSamplePitch(sample, pitch) end

---@param sample table
---@return boolean
function SoundManager:getIsSamplePlaying(sample) end

---@param sample table
---@param rpm number
---@param loadFactor number
function SoundManager:setSampleLoopSynthesisParameters(sample, rpm, loadFactor) end

---@param samples table
---@param rpm number
---@param loadFactor number
function SoundManager:setSamplesLoopSynthesisParameters(samples, rpm, loadFactor) end

---@param sample table
---@return number
function SoundManager:getSampleLoopSynthesisStartDuration(sample) end

---@param sample any
---@param isIndoor any
function SoundManager:setCurrentSampleAttributes(sample, isIndoor) end

---@param sample any
function SoundManager:getCurrentSampleVolume(sample) end

---@param sample any
function SoundManager:getCurrentSamplePitch(sample) end

---@param sample any
function SoundManager:getCurrentSampleLowpassGain(sample) end

---@param sample any
---@param attribute any
function SoundManager:getCurrentRandomizationValue(sample, attribute) end

---@param sample any
function SoundManager:getCurrentFadeFactor(sample) end

---@param isIndoor boolean
function SoundManager:setIsIndoor(isIndoor) end

---@param target any
function SoundManager:addIndoorStateChangedListener(target) end

---@param target any
function SoundManager:removeIndoorStateChangedListener(target) end

---@return boolean
function SoundManager:getIsIndoor() end

---@param sample table
---@param modifierName string
---@return number
function SoundManager:getModifierFactor(sample, modifierName) end

function SoundManager:consoleCommandToggleDebug() end

---@param schema any
---@param path any
function SoundManager.registerModifierXMLPaths(schema, path) end

---@param schema table
---@param basePath string
---@param xmlElementName string
function SoundManager.registerSampleXMLPaths(schema, basePath, xmlElementName) end

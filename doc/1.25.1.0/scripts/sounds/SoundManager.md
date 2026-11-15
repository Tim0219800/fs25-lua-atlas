# sounds/SoundManager.lua

Source: `dataS/scripts/sounds/SoundManager.lua` — FS25 1.25.1.0

- **SoundManager** inherits from `AbstractManager` (l.24)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `SoundManager.new(customMt: table?) → SoundManager` | 30 |  |
| `SoundManager:initDataStructures()` | 40 |  |
| `SoundManager:delete()` | 67 |  |
| `SoundManager:registerModifierType(typeName: any, func: any, minFunc: any, maxFunc: any) → boolean` | 77 |  |
| `SoundManager:loadSoundTemplates(xmlFilename: any) → boolean` | 104 |  |
| `SoundManager:reloadSoundTemplates()` | 135 |  |
| `SoundManager:cloneSample(sample: table, linkNode: integer, modifierTargetObject: any) → table` | 153 |  |
| `SoundManager:cloneSample2D(sample: table, linkNode: integer, modifierTargetObject: any) → table` | 204 |  |
| `SoundManager:validateSampleDefinition(xmlFile: integer, baseKey: string, sampleName: string, baseDir: string, audioGroup: string, is2D: boolean, components: table, i3dMappings: table, externalSoundsFile: any) → boolean, boolean, integer, string, integer` | 262 |  |
| `SoundManager:loadSample2DFromXML(xmlFile: integer, baseKey: string, sampleName: string, baseDir: string, loops: integer, audioGroup: string, requiresFile: boolean?)` | 325 |  |
| `SoundManager:loadSampleFromXML(xmlFile: integer\|XMLFile, baseKey: string, sampleName: string, baseDir: string, components: (table\|integer), loops: integer, audioGroup: integer, i3dMappings: table?, modifierTargetObject: table?, requiresFile: boolean?) → table?` | 385 |  |
| `SoundManager:loadSamplesFromXML(xmlFile: integer, baseKey: string, sampleName: string, baseDir: string, components: table, loops: integer, audioGroup: integer, i3dMappings: table, modifierTargetObject: table?, samples: table?) → table` | 452 |  |
| `SoundManager:createAudioSource(sample: any, filename: any)` | 470 |  |
| `SoundManager:onCreateAudioSource(sample: any, ignoreReverb: any)` | 489 |  |
| `SoundManager:createAudio2d(sample: any, filename: any)` | 523 |  |
| `SoundManager:onCreateAudio2d(sample: any, ignoreReverb: any)` | 541 |  |
| `SoundManager:loadSampleAttributesFromTemplate(sample: any, templateName: any, baseDir: any, defaultLoops: any, xmlFile: any, sampleKey: any)` | 560 |  |
| `SoundManager:loadSampleAttributesFromXML(sample: table, xmlFile: integer, key: string, baseDir: any, defaultLoops: any, requiresFile: any)` | 592 |  |
| `SoundManager:loadModifiersFromXML(sample: table, xmlFile: integer, key: string)` | 684 |  |
| `SoundManager:loadRandomizationsFromXML(sample: table, xmlFile: integer, key: string, baseDir: any)` | 726 |  |
| `SoundManager:getRandomSample(sample: any, filename: any)` | 807 |  |
| `SoundManager:update(dt: any)` | 840 |  |
| `SoundManager:draw()` | 865 |  |
| `SoundManager:updateSampleFade(sample: table, dt: number)` | 953 |  |
| `SoundManager:updateSampleModifiers(sample: table)` | 964 |  |
| `SoundManager:updateSampleAttributes(sample: table, force: boolean)` | 990 |  |
| `SoundManager:updateSampleRandomizations(sample: table)` | 1023 |  |
| `SoundManager:getSampleModifierValue(sample: table, attribute: table, typeIndex: string)` | 1095 |  |
| `SoundManager:deleteSample(sample: table)` | 1117 |  |
| `SoundManager:deleteSamples(samples: table, delay: any, afterSample: any)` | 1159 |  |
| `SoundManager:playSample(sample: table, delay: number?, afterSample: table?)` | 1172 |  |
| `SoundManager:playSamples(samples: table, delay: integer?, afterSample: table?)` | 1207 |  |
| `SoundManager:stopSample(sample: table, delay: number?, fadeOut: number?)` | 1218 |  |
| `SoundManager:stopSamples(samples: table)` | 1227 |  |
| `SoundManager:setSampleVolumeOffset(sample: table, offset: number)` | 1237 |  |
| `SoundManager:setSamplePitchOffset(sample: table, offset: number)` | 1247 |  |
| `SoundManager:setSampleLowpassGainOffset(sample: table, offset: number)` | 1257 |  |
| `SoundManager:setSampleVolume(sample: table, volume: number)` | 1267 |  |
| `SoundManager:setSampleVolumeScale(sample: table, volumeScale: number)` | 1277 |  |
| `SoundManager:getSampleVolumeScale(sample: table) → number` | 1287 |  |
| `SoundManager:setSamplePitch(sample: table, pitch: number)` | 1299 |  |
| `SoundManager:getIsSamplePlaying(sample: table) → boolean` | 1309 |  |
| `SoundManager:setSampleLoopSynthesisParameters(sample: table, rpm: number, loadFactor: number)` | 1331 |  |
| `SoundManager:setSamplesLoopSynthesisParameters(samples: table, rpm: number, loadFactor: number)` | 1352 |  |
| `SoundManager:getSampleLoopSynthesisStartDuration(sample: table) → number` | 1362 |  |
| `SoundManager:setCurrentSampleAttributes(sample: any, isIndoor: any)` | 1374 |  |
| `SoundManager:getCurrentSampleVolume(sample: any)` | 1386 |  |
| `SoundManager:getCurrentSamplePitch(sample: any)` | 1392 |  |
| `SoundManager:getCurrentSampleLowpassGain(sample: any)` | 1398 |  |
| `SoundManager:getCurrentRandomizationValue(sample: any, attribute: any)` | 1404 |  |
| `SoundManager:getCurrentFadeFactor(sample: any)` | 1416 |  |
| `SoundManager:setIsIndoor(isIndoor: boolean)` | 1429 |  |
| `SoundManager:addIndoorStateChangedListener(target: any)` | 1449 |  |
| `SoundManager:removeIndoorStateChangedListener(target: any)` | 1455 |  |
| `SoundManager:getIsIndoor() → boolean` | 1462 |  |
| `SoundManager:getModifierFactor(sample: table, modifierName: string) → number` | 1471 |  |
| `SoundManager:consoleCommandToggleDebug()` | 1484 |  |
| `SoundManager.registerModifierXMLPaths(schema: any, path: any)` | 1505 |  |
| `SoundManager.registerSampleXMLPaths(schema: table, basePath: string, xmlElementName: string)` | 1516 |  |

---@meta
-- FS25 1.25.1.0 : sounds/SoundManager.lua (generated stub, FS25 Lua Atlas)

--- Central client-side manager (extends AbstractManager) that loads sound samples from XML (3D audio sources linked to nodes, or 2D samples), applies sound templates, indoor and outdoor attributes, value modifiers driven by callbacks, volume/pitch randomisation and alternative source files, then plays, stops and deletes them. It tracks active samples, updating a limited number each frame, and has a debug overlay toggled by the console command gsSoundManagerDebug. Sample objects are plain Lua tables; most audio work is delegated to engine functions not defined in the dump (UNVERIFIED).
---@class SoundManager : AbstractManager
SoundManager = {}

--- Creates the manager and registers the console command gsSoundManagerDebug, which toggles the global debug overlay.
---@param customMt table?
---@return SoundManager
function SoundManager.new(customMt) end

--- Resets all sample lists, loads the default sound templates, creates the SoundModifierType global table, sets an open-field reverb effect on slot 0 and clears the indoor listeners.
function SoundManager:initDataStructures() end

--- Deletes the sound template XML file handle if one is open. Does not delete the samples themselves.
function SoundManager:delete() end

--- Registers a named (upper-cased) modifier type with a value callback and optional min and max callbacks, and returns its index. An existing name returns its index; a non-function callback logs an error. Used by specializations so XML modifiers can follow vehicle state.
---@param typeName any
---@param func any
---@param minFunc any
---@param maxFunc any
---@return boolean
function SoundManager:registerModifierType(typeName, func, minFunc, maxFunc) end

--- Opens the given template XML, indexes every template by name (duplicates produce a warning) and keeps the file open. Returns true on success, false if the file could not be loaded.
---@param xmlFilename any
---@return boolean
function SoundManager:loadSoundTemplates(xmlFilename) end

--- Clears the template index, closes the template XML and reloads the default one. Handy for iterating on templates during development.
function SoundManager:reloadSoundTemplates() end

--- Duplicates a sample: copies the table and modifiers, creates a new audio source linked to the given node (unless 2D), sets group and reverb, rebuilds source randomisations, and registers the copy. Returns it. Note: in the no-reverb branch the effect is removed from the original sample's sound, not the clone's.
---@param sample table
---@param linkNode integer
---@param modifierTargetObject any
---@return table
function SoundManager:cloneSample(sample, linkNode, modifierTargetObject) end

--- Duplicates a sample as a non-spatial 2D sample: loads the file into a new engine sample, applies the audio group, rebuilds randomisations and registers the copy. The link node argument is not used.
---@param sample table
---@param linkNode integer
---@param modifierTargetObject any
---@return table
function SoundManager:cloneSample2D(sample, linkNode, modifierTargetObject) end

--- Checks that a sample element exists in the XML or in an optional external sounds file, and for 3D samples resolves its link node (falling back to the root component). Returns validity, whether the external file was used, the XML handle, the element key and the link node.
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

--- Loads a non-spatial sample for client-only contexts such as the UI. Applies the template and XML attributes, creates the engine sample and registers it. Returns the sample, or nil if the definition is missing or invalid.
---@param xmlFile integer
---@param baseKey string
---@param sampleName string
---@param baseDir string
---@param loops integer
---@param audioGroup string
---@param requiresFile boolean?
function SoundManager:loadSample2DFromXML(xmlFile, baseKey, sampleName, baseDir, loops, audioGroup, requiresFile) end

--- Loads a 3D sample from XML, linked to a node, using template and XML attributes. A modifier target object can supply an external sounds file and a volume factor. Creates the audio source and registers the sample; returns nil if invalid.
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

--- Loads consecutive indexed samples (name(0), name(1), ...) until one is missing and appends them to the given or a new table, which it returns.
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

--- Replaces the sample's 3D audio source with one built from the given file, using its radii, volume and loops, then finishes setup through onCreateAudioSource. Does nothing for an empty file name.
---@param sample any
---@param filename any
function SoundManager:createAudioSource(sample, filename) end

--- Finishes a 3D source: reads duration and ranges, applies group, volume, pitch, frequency filter, optional reverb and priority, disables autoplay, and links the node with its offset.
---@param sample any
---@param ignoreReverb any
function SoundManager:onCreateAudioSource(sample, ignoreReverb) end

--- Replaces the sample's 2D engine sample by one loaded from the given file, then calls onCreateAudio2d. Does nothing for an empty file name.
---@param sample any
---@param filename any
function SoundManager:createAudio2d(sample, filename) end

--- Finishes a 2D sample: reads its duration and applies group, volume, pitch, frequency filter and optional reverb.
---@param sample any
---@param ignoreReverb any
function SoundManager:onCreateAudio2d(sample, ignoreReverb) end

--- Builds a sample from a named template of the template XML. If the template is unknown, logs an error and returns nil; returns nil too if the template attributes fail to load.
---@param sample any
---@param templateName any
---@param baseDir any
---@param defaultLoops any
---@param xmlFile any
---@param sampleKey any
function SoundManager:loadSampleAttributesFromTemplate(sample, templateName, baseDir, defaultLoops, xmlFile, sampleKey) end

--- Reads all sample attributes (file, radii, scales, indoor/outdoor volume, pitch and lowpass, loops, reverb, priority, fades, debug flag), first applying a parent template if given, then modifiers and randomisations. Returns true. Note: the missing-file check can never trigger because the file name defaults to an empty string.
---@param sample table
---@param xmlFile integer
---@param key string
---@param baseDir any
---@param defaultLoops any
---@param requiresFile any
function SoundManager:loadSampleAttributesFromXML(sample, xmlFile, key, baseDir, defaultLoops, requiresFile) end

--- Reads modifier elements for each modifiable attribute (SAMPLE_MODIFIER_ATTRIBUTES, defined elsewhere) into linear animation curves per modifier type. Unknown types are silently skipped in release builds.
---@param sample table
---@param xmlFile integer
---@param key string
function SoundManager:loadModifiersFromXML(sample, xmlFile, key) end

--- Reads volume, pitch and lowpass randomisation ranges (indoor and/or outdoor lists) and alternative source files, where '-' means silence. Warns if a range could give negative volume, and adds the base file to the alternatives once.
---@param sample table
---@param xmlFile integer
---@param key string
---@param baseDir any
function SoundManager:loadRandomizationsFromXML(sample, xmlFile, key, baseDir) end

--- Creates an alternative-source entry for a file: a 3D audio source or a 2D sample, with reverb and priority set. The file name '-' gives an empty (silent) entry.
---@param sample any
---@param filename any
function SoundManager:getRandomSample(sample, filename) end

--- Per-frame update that walks the active sample list, at most MAX_SAMPLES_PER_FRAME entries per call, resuming where it stopped. For a playing sample it updates fade, modifiers and attributes; finished samples leave the list.
---@param dt any
function SoundManager:update(dt) end

--- Debug overlay: for flagged samples near the camera, draws link nodes, radii and a text list on screen (hidden link nodes in red). Returns immediately if there are no debug samples.
function SoundManager:draw() end

--- Advances the sample's fade-in timer by dt (ms), capped at its fadeIn duration. Does nothing if fadeIn is 0.
---@param sample table
---@param dt number
function SoundManager:updateSampleFade(sample, dt) end

--- For each modifiable attribute, multiplies the values of all available modifier types and stores the result as the modifier's current value.
---@param sample table
function SoundManager:updateSampleModifiers(sample) end

--- Switches the sample to indoor or outdoor attributes when the state changed (or forced), then pushes volume, pitch and lowpass to the engine, including modifiers, and loop synthesis RPM and load when modified.
---@param sample table
---@param force boolean
function SoundManager:updateSampleAttributes(sample, force) end

--- Called before playback: picks a random volume, pitch and lowpass offset from the list matching the indoor state, and a random alternative source (retrying up to 3 times to avoid repeating the last). May stop the previous sound and switch the sample to the chosen source or to silence.
---@param sample table
function SoundManager:updateSampleRandomizations(sample) end

--- Evaluates one modifier curve for an attribute and type: calls the type's value function on the target object, normalises with min/max functions if present, and samples the curve. Returns value, input and availability.
---@param sample table
---@param attribute table
---@param typeIndex string
function SoundManager:getSampleModifierValue(sample, attribute, typeIndex) end

--- Stops the sample if playing, removes it from all internal lists and deletes its audio nodes, 2D samples and alternative sources. The delay and afterSample parameters passed by deleteSamples are ignored.
---@param sample table
function SoundManager:deleteSample(sample) end

--- Calls deleteSample on every entry of a table of samples. Nil tables are ignored.
---@param samples table
---@param delay any
---@param afterSample any
function SoundManager:deleteSamples(samples, delay, afterSample) end

--- Starts a sample: refreshes randomisation, modifiers and attributes, then plays it with its loop count, optional delay and optional chaining after another sample, and adds it to the active list. Local-only sounds play only if the target object is active for local sound.
---@param sample table
---@param delay number?
---@param afterSample table?
function SoundManager:playSample(sample, delay, afterSample) end

--- Plays every sample of a table with the same optional delay and afterSample.
---@param samples table
---@param delay integer?
---@param afterSample table?
function SoundManager:playSamples(samples, delay, afterSample) end

--- Stops a sample through the engine. The default stop delay comes from loop synthesis, and the default fade-out is the one stored in the sample.
---@param sample table
---@param delay number?
---@param fadeOut number?
function SoundManager:stopSample(sample, delay, fadeOut) end

--- Stops every sample of a table.
---@param samples table
function SoundManager:stopSamples(samples) end

--- Sets an additive volume offset on the sample, applied the next time attributes are updated.
---@param sample table
---@param offset number
function SoundManager:setSampleVolumeOffset(sample, offset) end

--- Sets an additive pitch offset on the sample, applied the next time attributes are updated.
---@param sample table
---@param offset number
function SoundManager:setSamplePitchOffset(sample, offset) end

--- Sets an additive lowpass gain offset on the sample, applied the next time attributes are updated.
---@param sample table
---@param offset number
function SoundManager:setSampleLowpassGainOffset(sample, offset) end

--- Sets the engine volume of the sample directly (it may be overwritten by the next attribute update).
---@param sample table
---@param volume number
function SoundManager:setSampleVolume(sample, volume) end

--- Sets the volume scale multiplier stored on the sample.
---@param sample table
---@param volumeScale number
function SoundManager:setSampleVolumeScale(sample, volumeScale) end

--- Returns the sample's volume scale, or 1 if the sample is nil.
---@param sample table
---@return number
function SoundManager:getSampleVolumeScale(sample) end

--- Sets the engine pitch of the sample directly (it may be overwritten by the next attribute update).
---@param sample table
---@param pitch number
function SoundManager:setSamplePitch(sample, pitch) end

--- Returns true if the sample exists, has an engine sample and the engine reports it playing; false otherwise.
---@param sample table
---@return boolean
function SoundManager:getIsSamplePlaying(sample) end

--- Sets loop synthesis RPM (divided by the sample's ratio and clamped to 0..1) and/or load factor on the engine sample. Nil arguments are skipped.
---@param sample table
---@param rpm number
---@param loadFactor number
function SoundManager:setSampleLoopSynthesisParameters(sample, rpm, loadFactor) end

--- Applies the same loop synthesis RPM and load factor to every sample of a table.
---@param samples table
---@param rpm number
---@param loadFactor number
function SoundManager:setSamplesLoopSynthesisParameters(samples, rpm, loadFactor) end

--- Returns the engine's loop synthesis start duration for .gls samples, 0 for other files or a nil sample.
---@param sample table
---@return number
function SoundManager:getSampleLoopSynthesisStartDuration(sample) end

--- Points the sample's current attributes and randomisation list to the indoor or outdoor set.
---@param sample any
---@param isIndoor any
function SoundManager:setCurrentSampleAttributes(sample, isIndoor) end

--- Computes the final volume: (current volume plus randomisation) times fade factor times volume scale plus offset, never below 0.
---@param sample any
function SoundManager:getCurrentSampleVolume(sample) end

--- Computes the final pitch: (current pitch plus randomisation) times pitch scale plus offset.
---@param sample any
function SoundManager:getCurrentSamplePitch(sample) end

--- Computes the final lowpass gain: (current gain plus randomisation) times its scale plus offset.
---@param sample any
function SoundManager:getCurrentSampleLowpassGain(sample) end

--- Returns the current randomisation value of an attribute (volume, pitch, lowpassGain), or 0 if none is set.
---@param sample any
---@param attribute any
function SoundManager:getCurrentRandomizationValue(sample, attribute) end

--- Returns the fade-in progress (elapsed over fadeIn), or 1 when the sample has no fade-in.
---@param sample any
function SoundManager:getCurrentFadeFactor(sample) end

--- Sets the global indoor state (for example when the camera enters a cabin). On change, refreshes the playing samples immediately and calls onIndoorStateChanged on every registered listener.
---@param isIndoor boolean
function SoundManager:setIsIndoor(isIndoor) end

--- Adds a target to be notified through its onIndoorStateChanged method (no duplicates).
---@param target any
function SoundManager:addIndoorStateChangedListener(target) end

--- Removes a target from the indoor state listeners.
---@param target any
function SoundManager:removeIndoorStateChangedListener(target) end

--- Returns whether sounds are currently in indoor mode.
---@return boolean
function SoundManager:getIsIndoor() end

--- Returns the current computed value of a named modifier on the sample, or 1.0 if there is none.
---@param sample table
---@param modifierName string
---@return number
function SoundManager:getModifierFactor(sample, modifierName) end

--- Console command handler: toggles SoundManager.GLOBAL_DEBUG_ENABLED, adds all 3D samples to the debug list (or keeps only the XML-flagged ones) and returns a status string.
function SoundManager:consoleCommandToggleDebug() end

--- Registers on a schema the modifier child paths (type, value, modifiedValue) under the given path. The type attribute lists the known SoundModifierType names.
---@param schema any
---@param path any
function SoundManager.registerModifierXMLPaths(schema, path) end

--- Registers on a schema the XML paths of a sound element (linkNode, linkNodeOffset, template) plus the generic ones from registerGenericSampleXMLPaths, which is not defined in this file (UNVERIFIED). Logs an error if the element name is missing or has spaces.
---@param schema table
---@param basePath string
---@param xmlElementName string
function SoundManager.registerSampleXMLPaths(schema, basePath, xmlElementName) end

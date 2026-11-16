---@meta
-- FS25 1.25.1.0 : vehicles/specializations/ConnectedAttributes.lua (generated stub, FS25 Lua Atlas)

--- Specialization that copies values from source nodes (for example a node position, rotation or scale) to target nodes, optionally combining them with sum, average, subtract, multiply or divide. Each vehicle.connectedAttributes.attribute entry declares sources, targets, combine rules, animation or Cylindered prerequisites and update triggers (every frame when isActiveDirty, on animation start/run/stop, or from Cylindered moving parts via connectedAttributeIndices). The source and target type classes (TYPES, TYPES_BY_NAME, COMBINE_OPERATION) are not defined in this dump, which ends with an empty LocalOffset class: their exact contents are UNVERIFIED.
---@class LocalOffset
LocalOffset = {}

--- Always returns true: no other specialization is required.
---@param specializations table
---@return boolean
function ConnectedAttributes.prerequisitesPresent(specializations) end

--- Registers the XML schema for connectedAttributes.attribute: each type class adds its own source and target paths, and Cylindered movingTool/movingPart entries get a connectedAttributeIndices list through delayed registration.
function ConnectedAttributes.initSpecialization() end

--- Empty hook, registers no new vehicle functions.
---@param vehicleType any
function ConnectedAttributes.registerFunctions(vehicleType) end

--- Overrides loadExtraDependentParts and updateExtraDependentParts (provided by another specialization, UNVERIFIED which one).
---@param vehicleType any
function ConnectedAttributes.registerOverwrittenFunctions(vehicleType) end

--- Registers onLoad, onLoadFinished, onUpdate, onUpdateEnd, onPlayAnimation, onUpdateAnimation and onFinishAnimation.
---@param vehicleType any
function ConnectedAttributes.registerEventListeners(vehicleType) end

--- Parses every attribute from XML: animation triggers, animation-time prerequisites, sources, combine rules and targets, where target values may be scaled (*, /) or offset (+, -) or constant. Invalid entries log XML warnings; an attribute needs at least one source and one target. Unused listeners (update, animation events) are removed afterwards.
---@param savegame any
function ConnectedAttributes:onLoad(savegame) end

--- Forces an update of every attribute once, so targets start with the values computed from the sources.
---@param savegame any
function ConnectedAttributes:onLoadFinished(savegame) end

--- Each frame, updates the attributes flagged isActiveDirty, skipping those whose maxUpdateDistance is smaller than the vehicle update distance.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function ConnectedAttributes:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Runs onUpdate once with a very large dt, so dirty attributes are refreshed one last time.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function ConnectedAttributes:onUpdateEnd(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- When an animation starts, forces an update of each attribute that lists that animation with onStart enabled.
---@param animationName any
function ConnectedAttributes:onPlayAnimation(animationName) end

--- While an animation runs, forces an update of each attribute that lists that animation with onRun enabled.
---@param animationName any
function ConnectedAttributes:onUpdateAnimation(animationName) end

--- When an animation finishes, forces an update of each attribute that lists that animation with onStop enabled.
---@param animationName any
function ConnectedAttributes:onFinishAnimation(animationName) end

--- Static. Checks the animation prerequisites, reads all sources, evaluates the combine rules (average, sum, subtract, multiply, divide) and, if something changed or forceUpdate is set, writes the scaled values to every target. Divide has no zero check.
---@param attribute any
---@param forceUpdate any
function ConnectedAttributes.updateAttribute(attribute, forceUpdate) end

--- Calls the parent, then reads connectedAttributeIndices on the moving part and stores the list on the entry. Returns false if the parent fails.
---@param superFunc any
---@param xmlFile any
---@param baseName any
---@param entry any
function ConnectedAttributes:loadExtraDependentParts(superFunc, xmlFile, baseName, entry) end

--- Calls the parent, then updates each attribute whose index is listed on the moving part, ignoring unknown indices.
---@param superFunc any
---@param part any
---@param dt any
function ConnectedAttributes:updateExtraDependentParts(superFunc, part, dt) end

--- Appends debug rows to the given list: prerequisite results, source data, current named values and target data of every attribute.
---@param values any
function ConnectedAttributes:updateDebugValues(values) end

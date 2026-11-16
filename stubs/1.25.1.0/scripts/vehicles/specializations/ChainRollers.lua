---@meta
-- FS25 1.25.1.0 : vehicles/specializations/ChainRollers.lua (generated stub, FS25 Lua Atlas)

--- Specialization for roller chains whose elements are laid out along a hidden spline; the spline control points follow reference nodes that are moved by Cylindered moving tools or parts. Configured under vehicle.chainRollers (maxUpdateDistance and chainRoller entries with elementsNode, endReferenceNode and splineNode children). Updates run in onPostUpdate only when the vehicle is closer than maxUpdateDistance (default 100), and a debug overlay is drawn in the DEBUG_ATTRIBUTES vehicle debug state.
---@class ChainRollers
ChainRollers = {}

--- Always returns true: no other specialization is required, although the extra dependent parts hooks only make sense with Cylindered.
---@param specializations any
function ChainRollers.prerequisitesPresent(specializations) end

--- Registers, via delayed registration, the chainRollers#splineNodes node-index list on Cylindered movingTool and movingPart entries.
function ChainRollers.initSpecialization() end

--- Registers loadChainRollerFromXML and updateChainRoller on the vehicle type.
---@param vehicleType any
function ChainRollers.registerFunctions(vehicleType) end

--- Overrides loadExtraDependentParts and updateExtraDependentParts (provided by another specialization, UNVERIFIED which one).
---@param vehicleType any
function ChainRollers.registerOverwrittenFunctions(vehicleType) end

--- Registers onLoad, onLoadFinished and onPostUpdate.
---@param vehicleType any
function ChainRollers.registerEventListeners(vehicleType) end

--- Reads maxUpdateDistance and loads every vehicle.chainRollers.chainRoller entry. If the block is absent or no entry loads, it removes the onLoadFinished and onPostUpdate listeners so the vehicle costs nothing.
---@param savegame any
function ChainRollers:onLoad(savegame) end

--- Forces one immediate update by calling onPostUpdate with a very large dt so the chains start in their correct pose.
---@param savegame any
function ChainRollers:onLoadFinished(savegame) end

--- When the vehicle is within maxUpdateDistance, copies the dirty spline node positions into the spline control points and re-lays the elements of every dirty chain. In the DEBUG_ATTRIBUTES state it draws the spline nodes and curve.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function ChainRollers:onPostUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Loads one chain: elementsNode (its children are the elements), optional endReferenceNode and at least two splineNode entries, then builds a hidden spline from their positions. Returns false with an XML warning if elements or nodes are missing.
---@param xmlFile any
---@param key any
---@param chainRoller any
function ChainRollers:loadChainRollerFromXML(xmlFile, key, chainRoller) end

--- Places each element at evenly spaced parameters along the spline and orients each one toward the next. The last element is aimed at endReferenceNode when set. The dt argument is not used.
---@param chainRoller any
---@param dt any
function ChainRollers:updateChainRoller(chainRoller, dt) end

--- Calls the parent, then reads chainRollers#splineNodes for the moving part and keeps the nodes on the entry. Returns false if the parent fails.
---@param superFunc any
---@param xmlFile any
---@param baseName any
---@param entry any
function ChainRollers:loadExtraDependentParts(superFunc, xmlFile, baseName, entry) end

--- Calls the parent, then marks the spline data of each spline node listed on the moving part as dirty so the next post update rebuilds the chain.
---@param superFunc any
---@param part any
---@param dt any
function ChainRollers:updateExtraDependentParts(superFunc, part, dt) end

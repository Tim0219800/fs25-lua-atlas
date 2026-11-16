---@meta
-- FS25 1.25.1.0 : vehicles/specializations/VariableWorkWidth.lua (generated stub, FS25 Lua Atlas)

--- Specialization that lets the player (or the AI) narrow or widen the working width of an implement by switching sections on the left and right side. Sections can deactivate work areas and effects, and section nodes are moved or rotated to match the chosen width. It adds a configuration type `variableWorkWidth`, saves the left/right state in the savegame, syncs it with `VariableWorkWidthStateEvent`, and shows a HUD extension. Note: `onDraw` and `onDelete` listeners are registered but no such functions are defined in this file (UNVERIFIED whether other code provides them).
---@class VariableWorkWidth
VariableWorkWidth = {}

--- Always returns true: no prerequisites.
---@param specializations any
function VariableWorkWidth.prerequisitesPresent(specializations) end

--- Adds the `variableWorkWidth` configuration type, registers the XML paths (sections, section nodes, reference work area, default and AI states, work area `section#index`) and the savegame attributes `leftSide` and `rightSide`.
function VariableWorkWidth.initSpecialization() end

--- Registers the XML paths for sections (side, center flag, width, max width node, effects) and section nodes (min/max translation or rotation, work area index) under the given base path.
---@param schema any
---@param basePath any
function VariableWorkWidth.registerSectionPaths(schema, basePath) end

--- Registers the event `onVariableWorkWidthSectionChanged`, raised each time the sections are recomputed.
---@param vehicleType any
function VariableWorkWidth.registerEvents(vehicleType) end

--- Adds the public functions (setSectionsActive, updateSections, getVariableWorkWidth, getEffectByNode, and others) to the vehicle type.
---@param vehicleType any
function VariableWorkWidth.registerFunctions(vehicleType) end

--- Overrides `loadWorkAreaFromXML` and `getIsWorkAreaActive` so work areas can be tied to a section.
---@param vehicleType any
function VariableWorkWidth.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onPostLoad, read/write stream, register action events, AI start events, onDraw and onDelete.
---@param vehicleType any
function VariableWorkWidth.registerEventListeners(vehicleType) end

--- Loads sections and section nodes from the selected configuration (or the base key), links section effects, computes each section's relative and absolute width from its max-width node, sorts sides by width, reads default/AI states, applies saved states, and creates the HUD extension. Removes listeners that are useless without sections or on a server.
---@param savegame any
function VariableWorkWidth:onPostLoad(savegame) end

--- Writes `leftSide` and `rightSide` section states to the savegame when the vehicle has sections.
---@param xmlFile any
---@param key any
---@param usedModNames any
function VariableWorkWidth:saveToXMLFile(xmlFile, key, usedModNames) end

--- Client join: reads the left and right states (fixed bit count `SEND_NUM_BITS`) and applies them without sending an event.
---@param streamId integer
---@param connection Connection
function VariableWorkWidth:onReadStream(streamId, connection) end

--- Server side on join: writes the left and right states into the stream.
---@param streamId integer
---@param connection Connection
function VariableWorkWidth:onWriteStream(streamId, connection) end

--- Registers the actions VARIABLE_WORK_WIDTH_LEFT, _RIGHT and _TOGGLE when the feature is active, and records whether any of them has a binding so the input help is drawn.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function VariableWorkWidth:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Input callback: changes the left side state by the input value (subtracts it).
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function VariableWorkWidth.actionEventWorkWidthLeft(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: changes the right side state by the input value (subtracts it).
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function VariableWorkWidth.actionEventWorkWidthRight(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: lowers both sides to one step below the smaller current state, wrapping back to the maximum when it falls under the minimum state.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function VariableWorkWidth.actionEventWorkWidthToggle(self, actionName, inputValue, callbackState, isAnalog) end

--- Server only: when the AI field worker starts and `aiKeepCurrentWidth` is false, applies the configured AI left/right states.
function VariableWorkWidth:onAIFieldWorkerStart() end

--- Server only: same as the field worker start, applies the AI states when the implement starts under AI control.
function VariableWorkWidth:onAIImplementStart() end

--- Enables or disables the feature. On the server, disabling resets both sides to their maximum. Requests an action event refresh.
---@param isActive any
function VariableWorkWidth:setVariableWorkWidthActive(isActive) end

--- Sets the left and right states (clamped between 0 and the side maximum). If something changed, recomputes sections and sends `VariableWorkWidthStateEvent` unless `noEventSend`.
---@param leftSide any
---@param rightSide any
---@param noEventSend any
function VariableWorkWidth:setSectionsActive(leftSide, rightSide, noEventSend) end

--- Moves/rotates each given section node by linear interpolation between its min and max values (translation, X translation, rotation) at the given 0..1 percentage, then updates the linked work area width.
---@param sectionNodes any
---@param percentage any
function VariableWorkWidth:setSectionNodePercentage(sectionNodes, percentage) end

--- Refreshes the active flags of both sides, positions the section nodes from the width of the current section (0 when the side is off) and raises `onVariableWorkWidthSectionChanged`.
function VariableWorkWidth:updateSections() end

--- Marks sections up to the given state as active and stops any running effect of sections that became inactive.
---@param sections any
---@param state any
function VariableWorkWidth:updateSectionStates(sections, state) end

--- Empty hook returning nothing; other specializations that own effects are expected to override it (UNVERIFIED from this file alone).
---@param node integer
function VariableWorkWidth:getEffectByNode(node) end

--- For the left or right side returns the current absolute width, the max width and whether sections exist. Without sections it returns 1, 1, false.
---@param isLeft boolean
---@return number
---@return number
---@return boolean
function VariableWorkWidth:getVariableWorkWidth(isLeft) end

--- Returns nil by default, meaning no usage value is shown; other specializations can override it.
---@return number
function VariableWorkWidth:getVariableWorkWidthUsage() end

--- Override: reads the optional `section#index` of the work area, then calls the previous implementation.
---@param superFunc any
---@param workArea any
---@param xmlFile any
---@param key any
function VariableWorkWidth:loadWorkAreaFromXML(superFunc, workArea, xmlFile, key) end

--- Override: a work area linked to an inactive section is inactive; otherwise the previous result applies.
---@param superFunc any
---@param workArea any
function VariableWorkWidth:getIsWorkAreaActive(superFunc, workArea) end

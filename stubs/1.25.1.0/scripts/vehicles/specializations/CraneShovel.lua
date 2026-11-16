---@meta
-- FS25 1.25.1.0 : vehicles/specializations/CraneShovel.lua (generated stub, FS25 Lua Atlas)

--- Always returns true: no other specialization is required.
---@param specializations table
---@return boolean
function CraneShovel.prerequisitesPresent(specializations) end

--- Registers the 'vehicle.craneShovel' XML schema (input action, animation name and speed, default open, close while folding, fill unit and discharge node indices, texts) and the savegame state key.
function CraneShovel.initSpecialization() end

--- Registers loadCraneShovelFromXML, setCraneShovelState and getCraneShovelStateChangedAllowed on the vehicle type.
---@param vehicleType table
function CraneShovel.registerFunctions(vehicleType) end

--- Registers overrides of getIsDischargeNodeActive and getShovelNodeIsActive.
---@param vehicleType table
function CraneShovel.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to load, post-load, stream read/write, fold state change and action event registration.
---@param vehicleType table
function CraneShovel.registerEventListeners(vehicleType) end

--- Loads the shovel settings and starts in the default open/closed state. If loading fails (no animation name), removes all other listeners; keeps the fold listener only on the server with 'closeWhileFolding'.
---@param savegame table
function CraneShovel:onLoad(savegame) end

--- Takes the saved state from the savegame (unless vehicles are reset) and applies it instantly, without animation and without sending an event.
---@param savegame any
function CraneShovel:onPostLoad(savegame) end

--- Writes the open/closed state to the savegame if an animation is configured.
---@param xmlFile any
---@param key any
---@param usedModNames any
function CraneShovel:saveToXMLFile(xmlFile, key, usedModNames) end

--- Client on join: reads the open/closed boolean and applies it instantly without sending an event.
---@param streamId any
---@param connection any
function CraneShovel:onReadStream(streamId, connection) end

--- Server on join: writes the open/closed boolean into the stream.
---@param streamId any
---@param connection any
function CraneShovel:onWriteStream(streamId, connection) end

--- When the fold direction is not the work-ready direction and the shovel is open, closes it (this listener is only kept on the server with 'closeWhileFolding').
---@param direction any
---@param moveToMiddle any
function CraneShovel:onFoldStateChanged(direction, moveToMiddle) end

--- Registers the configured input action to toggle the shovel when the vehicle is active for input, with high text priority, and sets its label. Does not check isClient.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function CraneShovel:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Input callback: toggles the shovel state if getCraneShovelStateChangedAllowed permits; otherwise shows the returned warning for 5 s.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function CraneShovel.actionEvent(self, actionName, inputValue, callbackState, isAnalog) end

--- Sets the input label to the close text when the shovel is open, the open text otherwise.
---@param self any
function CraneShovel.updateActionEvents(self) end

--- Reads the shovel configuration into the given spec table (input action, animation, speed, defaults, fill unit and discharge node indices, texts). Returns false if no animation name is defined.
---@param spec any
---@param xmlFile any
---@param key any
function CraneShovel:loadCraneShovelFromXML(spec, xmlFile, key) end

--- Sets the open (true) or closed (false) state, plays the animation in the matching direction (or finishes it instantly with skipAnimation) and updates the label. Always sends CraneShovelEvent afterwards unless noEventSend, even when unchanged.
---@param state any
---@param skipAnimation any
---@param noEventSend any
function CraneShovel:setCraneShovelState(state, skipAnimation, noEventSend) end

--- Returns whether toggling is allowed plus an optional warning; the default returns true, nil. Override point.
---@param spec any
function CraneShovel:getCraneShovelStateChangedAllowed(spec) end

--- Makes the configured discharge node inactive while the shovel is closed; otherwise defers to the parent.
---@param superFunc any
---@param dischargeNode any
function CraneShovel:getIsDischargeNodeActive(superFunc, dischargeNode) end

--- Makes shovel nodes inactive unless the animation is playing in the closing (negative speed) direction; otherwise defers to the parent.
---@param superFunc any
---@param shovelNode any
function CraneShovel:getShovelNodeIsActive(superFunc, shovelNode) end

---@meta
-- FS25 1.25.1.0 : vehicles/DashboardValueType.lua (generated stub, FS25 Lua Atlas)

--- Descriptor of one kind of value that a vehicle dashboard can display, identified by a specialization name and a value name (full name `spec.name`). It records where the value comes from, an optional range, centre, factor, comparison set and interpolation speed, and where its XML definitions are read from through `vehicle:loadDashboardsFromXML`. Specializations create and configure these objects; the Dashboard specialization itself is not in this file (UNVERIFIED here). Its header comment wrongly says animation value.
---@class DashboardValueType
DashboardValueType = {}

--- Constructor. Builds the full name from specialization and value name, with polling enabled, factor 1, and every getter (source, min, max, center, interpolation speed) defaulting to a function returning nil.
---@param specName any
---@param name any
---@param customMt any
function DashboardValueType.new(specName, name, customMt) end

--- Sets a custom XML key from which dashboard definitions of this value type are loaded.
---@param xmlKey any
function DashboardValueType:setXMLKey(xmlKey) end

--- Asks the vehicle to load dashboards from the XML, using the custom key if set, otherwise `<root>.<specName>.dashboards`, passing this value type.
---@param xmlFile any
---@param vehicle any
function DashboardValueType:loadFromXML(xmlFile, vehicle) end

--- Sets the poll flag stored on this type. How the dashboard system uses it is UNVERIFIED (not in this file).
---@param pollUpdate any
function DashboardValueType:setPollUpdate(pollUpdate) end

--- Stores an optional load function and an optional state function. They are only stored here and used elsewhere (UNVERIFIED).
---@param loadFunction any
---@param stateFunction any
function DashboardValueType:setAdditionalFunctions(loadFunction, stateFunction) end

--- Sets the multiplier applied to numeric values in `getValue`.
---@param valueFactor any
function DashboardValueType:setValueFactor(valueFactor) end

--- Builds a set from the given arguments. Once set, `getValue` returns a boolean telling whether the source value is in this set instead of the raw value.
function DashboardValueType:setValueCompare(...) end

--- Stores the value to use when idle. It is only stored here; its consumer is outside this file (UNVERIFIED).
---@param idleValue any
function DashboardValueType:setIdleValue(idleValue) end

--- Declares the object that provides the value and the source: a constant, a function called with the object, or the name of a field or method on it. Also remembers the object for the later range, centre and speed setters.
---@param object any
---@param func any
function DashboardValueType:setValue(object, func) end

--- Sets the source of the centre value (constant, function or member name on the value object). Call `setValue` first so the object is known.
---@param centerFunc any
function DashboardValueType:setCenter(centerFunc) end

--- Sets the sources of the minimum and maximum values, each as a constant, function or member name on the value object. Call `setValue` first.
---@param min any
---@param max any
function DashboardValueType:setRange(min, max) end

--- Sets the source of the interpolation speed (constant, function or member name on the value object). Call `setValue` first.
---@param interpolationSpeed any
function DashboardValueType:setInterpolationSpeed(interpolationSpeed) end

--- Reads the source value for a dashboard. Applies the compare set if any, and for numbers the factor, then returns value, min, max, center and an is-number flag (min, max and center are nil for non-numbers).
---@param dashboard any
function DashboardValueType:getValue(dashboard) end

--- Internal helper. Replaces the named getter by a closure built from a constant, a function, or a field or method name looked up on the object. If the type is unsupported or the member missing, the getter is left unchanged.
---@param funcName any
---@param object any
---@param value any
function DashboardValueType:setFunction(funcName, object, value) end

--- Default getter; always returns nil.
function DashboardValueType:getDefaultValue() end

# vehicles/DashboardValueType.lua

*[Version française](../../fr/scripts/vehicles/DashboardValueType.md)*

Source: `dataS/scripts/vehicles/DashboardValueType.lua` — FS25 1.25.1.0

✍ Descriptor of one kind of value that a vehicle dashboard can display, identified by a specialization name and a value name (full name `spec.name`). It records where the value comes from, an optional range, centre, factor, comparison set and interpolation speed, and where its XML definitions are read from through `vehicle:loadDashboardsFromXML`. Specializations create and configure these objects; the Dashboard specialization itself is not in this file (UNVERIFIED here). Its header comment wrongly says animation value.

- **DashboardValueType** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `DashboardValueType.new(specName: any, name: any, customMt: any)` | 16 | ✍ Constructor. Builds the full name from specialization and value name, with polling enabled, factor 1, and every getter (source, min, max, center, interpolation speed) defaulting to a function returning nil. |
| `DashboardValueType:setXMLKey(xmlKey: any)` | 45 | ✍ Sets a custom XML key from which dashboard definitions of this value type are loaded. |
| `DashboardValueType:loadFromXML(xmlFile: any, vehicle: any)` | 51 | ✍ Asks the vehicle to load dashboards from the XML, using the custom key if set, otherwise `<root>.<specName>.dashboards`, passing this value type. |
| `DashboardValueType:setPollUpdate(pollUpdate: any)` | 62 | ✍ Sets the poll flag stored on this type. How the dashboard system uses it is UNVERIFIED (not in this file). |
| `DashboardValueType:setAdditionalFunctions(loadFunction: any, stateFunction: any)` | 68 | ✍ Stores an optional load function and an optional state function. They are only stored here and used elsewhere (UNVERIFIED). |
| `DashboardValueType:setValueFactor(valueFactor: any)` | 75 | ✍ Sets the multiplier applied to numeric values in `getValue`. |
| `DashboardValueType:setValueCompare(...: any)` | 81 | ✍ Builds a set from the given arguments. Once set, `getValue` returns a boolean telling whether the source value is in this set instead of the raw value. |
| `DashboardValueType:setIdleValue(idleValue: any)` | 91 | ✍ Stores the value to use when idle. It is only stored here; its consumer is outside this file (UNVERIFIED). |
| `DashboardValueType:setValue(object: any, func: any)` | 97 | ✍ Declares the object that provides the value and the source: a constant, a function called with the object, or the name of a field or method on it. Also remembers the object for the later range, centre and speed setters. |
| `DashboardValueType:setCenter(centerFunc: any)` | 104 | ✍ Sets the source of the centre value (constant, function or member name on the value object). Call `setValue` first so the object is known. |
| `DashboardValueType:setRange(min: any, max: any)` | 110 | ✍ Sets the sources of the minimum and maximum values, each as a constant, function or member name on the value object. Call `setValue` first. |
| `DashboardValueType:setInterpolationSpeed(interpolationSpeed: any)` | 117 | ✍ Sets the source of the interpolation speed (constant, function or member name on the value object). Call `setValue` first. |
| `DashboardValueType:getValue(dashboard: any)` | 123 | ✍ Reads the source value for a dashboard. Applies the compare set if any, and for numbers the factor, then returns value, min, max, center and an is-number flag (min, max and center are nil for non-numbers). |
| `DashboardValueType:setFunction(funcName: any, object: any, value: any)` | 149 | ✍ Internal helper. Replaces the named getter by a closure built from a constant, a function, or a field or method name looked up on the object. If the type is unsupported or the member missing, the getter is left unchanged. |
| `DashboardValueType:getDefaultValue()` | 180 | ✍ Default getter; always returns nil. |

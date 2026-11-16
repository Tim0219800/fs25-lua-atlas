# triggers/UnloadTrigger.lua

*[Version française](../../fr/scripts/triggers/UnloadTrigger.md)*

Source: `dataS/scripts/triggers/UnloadTrigger.lua` — FS25 1.25.1.0

✍ Base class (subclass of Object) for unload triggers, such as sell points and storages: it mimics a fill unit so vehicles can discharge into it, forwarding the fill to a target object that provides getIsFillTypeAllowed, getIsToolTypeAllowed, addFillLevelFromTool and getFreeCapacity. It reads accepted fill types, tool types, price scale, AI node and optional fill type conversions with a ratio. PalletUnloadTrigger and WoodUnloadTrigger derive from it. Parts of the file are empty in the dump, so some methods are not visible (UNVERIFIED).

- **UnloadTrigger** inherits from `Object` (l.63)

## Functions

| Function | Line | Description |
|---|---|---|
| `UnloadTrigger.registerXMLPaths(schema: any, basePath: any)` | 51 | ✍ Registers the XML attributes of an unload trigger: exactFillRootNode, priceScale, acceptedToolTypes, the shared fill type config paths, aiNode, and repeated fillTypeConversion entries (incomingFillType, outgoingFillType, ratio default 1). |
| `UnloadTrigger.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 71 | ✍ Creates the unload trigger as a network Object with empty fill type, tool type and conversion tables. |
| `UnloadTrigger:load(components: table, xmlFile: table, xmlNode: string, target: table, extraAttributes: table, i3dMappings: table) → boolean` | 93 | ✍ Reads the exact fill root node (must have the FILLABLE collision group, else returns false) and registers it as a node object. Reads aiNode, priceScale, fill type conversions (ratio clamped 0.01 to 10000), sets the target if given, loads fill and tool types and enables the trigger. Returns true. |
| `UnloadTrigger:delete()` | 140 | ✍ Removes the exact fill root node from the mission's node objects if there is one, then calls the parent delete. |
| `UnloadTrigger:loadAcceptedToolType(xmlFile: XMLFile, xmlNode: string)` | 152 | ✍ Parses the acceptedToolTypes attribute into a set of tool type indices. If the attribute is absent, acceptedToolTypes is set to nil, meaning every tool type passes this filter. |
| `UnloadTrigger:loadFillTypes(xmlFile: XMLFile, xmlNode: string)` | 171 | ✍ Loads the combined fill types from the XML config through g_fillTypeManager into a set. If none are configured the set becomes nil, which means no restriction by this trigger. |
| `UnloadTrigger:setTarget(object: table)` | 186 | ✍ Sets the object that receives the unloaded goods. Asserts it implements getIsFillTypeAllowed, getIsToolTypeAllowed, addFillLevelFromTool and getFreeCapacity; it errors otherwise. |
| `UnloadTrigger:getFillUnitIndexFromNode(node: integer)` | 202 | ✍ Fill unit emulation: always returns 1, whatever the node. |
| `UnloadTrigger:getFillUnitExactFillRootNode(fillUnitIndex: integer)` | 209 | ✍ Fill unit emulation: returns the exact fill root node, ignoring the fill unit index. |
| `UnloadTrigger:addFillUnitFillLevel(farmId: integer, fillUnitIndex: integer, fillLevelDelta: number, fillTypeIndex: integer, toolType: table, fillPositionData: table, extraAttributes: any) → number` | 221 | ✍ Passes a delivery to the target via addFillLevelFromTool and returns the amount accepted, in incoming units. If a conversion exists for the fill type, the amount is multiplied by the ratio and sent as the outgoing type, and the result is divided back. |
| `UnloadTrigger:getFillUnitAllowsFillType(fillUnitIndex: integer, fillType: integer) → boolean` | 247 | ✍ Fill unit emulation: returns whether the fill type is allowed, delegating to getIsFillTypeAllowed; the index is ignored. |
| `UnloadTrigger:getIsFillTypeAllowed(fillType: integer) → boolean` | 255 | ✍ Returns whether the fill type is allowed, which currently just delegates to getIsFillTypeSupported. |
| `UnloadTrigger:getIsFillTypeSupported(fillType: integer) → boolean` | 263 | ✍ Returns false if a type list exists and does not contain the type. Otherwise, if a target exists, converts the type through the conversion table and asks the target getIsFillTypeAllowed. True when no check rejects it. |
| `UnloadTrigger:getFillUnitFreeCapacity(fillUnitIndex: integer, fillTypeIndex: integer, farmId: any) → number` | 296 | ✍ Returns the target's free capacity for the fill type and farm, divided by the ratio when a conversion applies, so it is expressed in incoming units. Returns 0 if the target has no getFreeCapacity. |
| `UnloadTrigger:getIsToolTypeAllowed(toolType: integer) → boolean` | 311 | ✍ Returns false if an accepted tool type list exists and lacks the tool type; otherwise returns the target's own getIsToolTypeAllowed answer. |
| `UnloadTrigger:getCustomDischargeNotAllowedWarning()` | 329 | ✍ Returns the custom warning text shown when discharging is refused (nil by default, set by subclasses or other code). |
| `UnloadTrigger.loadSpecValueFillTypes(xmlFile: XMLFile, xmlPath: string, customEnvironment: string?, baseDir: string?) → table?` | 349 | ✍ Signature only (no body in the SDK dump): by its name and parameters it likely returns the set of fill type names an unload trigger supports, read from the XML at the given path, for use in specification displays. UNVERIFIED. |

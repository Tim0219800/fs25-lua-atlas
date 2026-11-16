# handTools/specializations/HandToolStorable.lua

*[Version française](../../../fr/scripts/handTools/specializations/HandToolStorable.md)*

Source: `dataS/scripts/handTools/specializations/HandToolStorable.lua` — FS25 1.25.1.0

✍ Hand tool specialization for tools that can be hung in a hand tool holder. It reads a list of holder types from the tool XML, each with an optional node used to orient the tool in that holder, and exposes a lookup by holder type. It has no prerequisites and only listens to onLoad.

- **HandToolStorable** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `HandToolStorable.registerXMLPaths(xmlSchema: any)` | 15 | ✍ Registers the repeated handTool.storable.holderType XML entries: a required #type string and an optional #node index pointing at the orientation node. |
| `HandToolStorable.registerFunctions(handToolType: any)` | 26 | ✍ Registers the function getHolsterNodeByType on the hand tool type. |
| `HandToolStorable.registerEventListeners(handToolType: any)` | 32 | ✍ Subscribes the specialization to the onLoad event. |
| `HandToolStorable.prerequisitesPresent(specializations: any)` | 38 | ✍ Always returns true: this specialization has no prerequisites. |
| `HandToolStorable:onLoad(xmlFile: any)` | 44 | ✍ Builds a table of holder type to orientation node from the XML. Entries without a type are logged as XML errors and skipped; entries without a resolvable node are not stored, so that holder type is not accepted. |
| `HandToolStorable:getHolsterNodeByType(typeName: any)` | 66 | ✍ Returns the orientation node registered for the given holder type name, or nil if the tool cannot be stored in that kind of holder. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `getHolsterNodeByType` | 27 |
| registerEventListener | `onLoad` | 33 |

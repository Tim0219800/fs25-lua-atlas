# vehicles/specializations/CraneShovel.lua

*[Version française](../../../fr/scripts/vehicles/specializations/CraneShovel.md)*

Source: `dataS/scripts/vehicles/specializations/CraneShovel.lua` — FS25 1.25.1.0

✍ Specialization for a crane grab/shovel that opens and closes through an animation, toggled by an input action. The state is saved, synchronized (CraneShovelEvent) and can auto-close when the crane folds; the discharge node and shovel node are only active in the matching state. No prerequisites; reads the 'vehicle.craneShovel' XML block and does nothing if no animation name is set.


## Functions

| Function | Line | Description |
|---|---|---|
| `CraneShovel.prerequisitesPresent(specializations: table) → boolean` | 20 | ✍ Always returns true: no other specialization is required. |
| `CraneShovel.initSpecialization()` | 26 | ✍ Registers the 'vehicle.craneShovel' XML schema (input action, animation name and speed, default open, close while folding, fill unit and discharge node indices, texts) and the savegame state key. |
| `CraneShovel.registerFunctions(vehicleType: table)` | 53 | ✍ Registers loadCraneShovelFromXML, setCraneShovelState and getCraneShovelStateChangedAllowed on the vehicle type. |
| `CraneShovel.registerOverwrittenFunctions(vehicleType: table)` | 62 | ✍ Registers overrides of getIsDischargeNodeActive and getShovelNodeIsActive. |
| `CraneShovel.registerEventListeners(vehicleType: table)` | 70 | ✍ Subscribes to load, post-load, stream read/write, fold state change and action event registration. |
| `CraneShovel:onLoad(savegame: table)` | 82 | ✍ Loads the shovel settings and starts in the default open/closed state. If loading fails (no animation name), removes all other listeners; keeps the fold listener only on the server with 'closeWhileFolding'. |
| `CraneShovel:onPostLoad(savegame: any)` | 102 | ✍ Takes the saved state from the savegame (unless vehicles are reset) and applies it instantly, without animation and without sending an event. |
| `CraneShovel:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 116 | ✍ Writes the open/closed state to the savegame if an animation is configured. |
| `CraneShovel:onReadStream(streamId: any, connection: any)` | 125 | ✍ Client on join: reads the open/closed boolean and applies it instantly without sending an event. |
| `CraneShovel:onWriteStream(streamId: any, connection: any)` | 132 | ✍ Server on join: writes the open/closed boolean into the stream. |
| `CraneShovel:onFoldStateChanged(direction: any, moveToMiddle: any)` | 139 | ✍ When the fold direction is not the work-ready direction and the shovel is open, closes it (this listener is only kept on the server with 'closeWhileFolding'). |
| `CraneShovel:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 150 | ✍ Registers the configured input action to toggle the shovel when the vehicle is active for input, with high text priority, and sets its label. Does not check isClient. |
| `CraneShovel.actionEvent(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 164 | ✍ Input callback: toggles the shovel state if getCraneShovelStateChangedAllowed permits; otherwise shows the returned warning for 5 s. |
| `CraneShovel.updateActionEvents(self: any)` | 176 | ✍ Sets the input label to the close text when the shovel is open, the open text otherwise. |
| `CraneShovel:loadCraneShovelFromXML(spec: any, xmlFile: any, key: any)` | 187 | ✍ Reads the shovel configuration into the given spec table (input action, animation, speed, defaults, fill unit and discharge node indices, texts). Returns false if no animation name is defined. |
| `CraneShovel:setCraneShovelState(state: any, skipAnimation: any, noEventSend: any)` | 212 | ✍ Sets the open (true) or closed (false) state, plays the animation in the matching direction (or finishes it instantly with skipAnimation) and updates the label. Always sends CraneShovelEvent afterwards unless noEventSend, even when unchanged. |
| `CraneShovel:getCraneShovelStateChangedAllowed(spec: any)` | 237 | ✍ Returns whether toggling is allowed plus an optional warning; the default returns true, nil. Override point. |
| `CraneShovel:getIsDischargeNodeActive(superFunc: any, dischargeNode: any)` | 243 | ✍ Makes the configured discharge node inactive while the shovel is closed; otherwise defers to the parent. |
| `CraneShovel:getShovelNodeIsActive(superFunc: any, shovelNode: any)` | 256 | ✍ Makes shovel nodes inactive unless the animation is playing in the closing (negative speed) direction; otherwise defers to the parent. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadCraneShovelFromXML` | 54 |
| registerFunction | `setCraneShovelState` | 55 |
| registerFunction | `getCraneShovelStateChangedAllowed` | 56 |
| registerOverwrittenFunction | `getIsDischargeNodeActive` | 63 |
| registerOverwrittenFunction | `getShovelNodeIsActive` | 64 |
| registerEventListener | `onLoad` | 71 |
| registerEventListener | `onPostLoad` | 72 |
| registerEventListener | `onReadStream` | 73 |
| registerEventListener | `onWriteStream` | 74 |
| registerEventListener | `onFoldStateChanged` | 75 |
| registerEventListener | `onRegisterActionEvents` | 76 |

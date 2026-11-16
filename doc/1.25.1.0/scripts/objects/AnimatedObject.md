# objects/AnimatedObject.lua

*[Version française](../../fr/scripts/objects/AnimatedObject.md)*

Source: `dataS/scripts/objects/AnimatedObject.lua` — FS25 1.25.1.0

✍ Networked Object subclass for placeable or map animated objects such as doors, gates and barriers. An animation has a normalised time from 0 to 1 and a direction (-1, 0, 1) driven by the server: node keyframes (translation, rotation, scale, visibility), shader parameter keyframes, an optional i3d clip and rolling gate animations. Optional features: player trigger with input actions, opening hours linked to the hour-changed message, moving and end sounds. The file also holds AnimatedObjectBuilder, a helper to build an animated object from code, and the XML schema registration.

- **AnimatedObject** inherits from `Object` (l.12)
- **AnimatedObjectBuilder** (l.807)

## Functions

| Function | Line | Description |
|---|---|---|
| `AnimatedObject.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 22 | ✍ Constructor: creates the Object with its server/client flags and initialises the controls table, network time and animation-time interpolators, and an AnimatedObjectActivatable bound to this object. |
| `AnimatedObject:load(rootNode: integer\|table, xmlFile: XMLFile, key: string, xmlFilename: string, i3dMappings: table?) → boolean` | 53 | ✍ Loads the object from an XML key: reads saveId, animation duration, part and shader keyframes (normalised by the largest key time into animation curves), optional clip (shared i3d loaded asynchronously), rolling gates, initialTime, openingHours, trigger node with posAction/negAction controls, and sounds on clients. Static rigid-body parts are skipped with a warning. Calls applyAnimation and onSharedAnimationFileLoaded, which are not defined in this file (UNVERIFIED). Returns true. |
| `AnimatedObject:loadFrameValues(xmlFile: XMLFile, key: string, node: integer) → number, number, number, number, number, number, number, number, number, integer` | 311 | ✍ Reads one keyframe from XML and returns ten values (translation, rotation, scale, visibility 1 or 0). Any missing component defaults to the node's current transform; visibility defaults to visible. |
| `AnimatedObject:delete()` | 381 | ✍ Releases everything the object owns: trigger callbacks, sounds, the shared i3d request, the activatable registration and message-center subscriptions, flags it deleted, then calls the parent delete. |
| `AnimatedObject:readStream(streamId: integer, connection: table)` | 426 | ✍ Client side, when joining: after the parent read, reads the animation time (float32) and direction (2 bits, stored as direction + 1), applies the time at once and resets the network interpolators. |
| `AnimatedObject:writeStream(streamId: integer, connection: table)` | 444 | ✍ Server side, when a client joins: after the parent write, sends the current animation time (float32) and direction (2 bits, direction + 1). |
| `AnimatedObject:readUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 457 | ✍ Client side: when the dirty bit is set, starts a new network interpolation phase and reads the target animation time and direction sent by the server. |
| `AnimatedObject:writeUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 475 | ✍ Server side: writes a bool for the object's dirty flag, and if set, the last sent animation time (animation.timeSend) and the direction. |
| `AnimatedObject:loadFromXMLFile(xmlFile: XMLFile, key: string) → boolean` | 490 | ✍ Restores state from a savegame key: if #time exists, applies it (and #direction, default 0), then re-evaluates the opening hours. Returns true. |
| `AnimatedObject:update(dt: number)` | 542 | ✍ Per-frame update. Server: advances the animation time by direction * dt / duration (ms), stops at 0 or 1, reopens the AI blocking region when it ends, and raises the dirty flag when time changed. Client: interpolates toward the network time. Both manage moving and end sounds and keep the object active while moving. |
| `AnimatedObject:setAnimTime(t: number, omitSound: any)` | 632 | ✍ Clamps t to 0..1 and applies it to every part (translation, rotation, scale, visibility), shader parameter, i3d clip and rolling gate, then stores the time and flags the object as moving. Returns the clamped time. The omitSound argument is not used in the body. |
| `AnimatedObject:setFrameValues(node: integer, v: table)` | 676 | ✍ Applies a table of ten values (translation, rotation, scale, visibility flag) directly to a node. |
| `AnimatedObject:hourChanged()` | 685 | ✍ Server only. Compares the environment's current hour with the opening hours: starts opening (direction 1) or closing (direction -1) once on each transition and, if disableIfClosed is set, toggles isEnabled. Does nothing without opening hours or an environment. |
| `AnimatedObject:triggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 730 | ✍ Trigger callback. In career savegames only, when the local player's root node enters or leaves the trigger, adds or removes the activatable from the activatable objects system and keeps the object active. |
| `AnimatedObject.registerXMLPaths(schema: any, basePath: any)` | 749 | ✍ Registers the XML schema paths of an animatedObject entry: saveId, animation (parts, shaders, clip, rolling gate, duration, initialTime), openingHours, controls and sounds. |
| `AnimatedObject.registerSavegameXMLPaths(schema: any, basePath: any)` | 799 | ✍ Registers the savegame XML attributes #time (float) and #direction (int, default 0). |
| `AnimatedObjectBuilder.registerXMLPaths(schema: any, basePath: any)` | 811 | ✍ Registers only the sound sample paths (moving, posEnd, negEnd) under the given base path for builder-created objects. |
| `AnimatedObjectBuilder.new(animatedObject: any, xmlFilename: any, saveId: any)` | 819 | ✍ Creates a builder for an existing animated object: sets its base directory, mod name and saveId, and gives it an empty animation (duration 1000 ms, time 0, direction 0) and isEnabled = true. |
| `AnimatedObjectBuilder:build(rootNodeId: any)` | 844 | ✍ Finalises construction: applies animation time 0, subscribes to the hour-changed message if opening hours exist, registers trigger callbacks on the trigger node and its children, and allocates the dirty flag. Returns true. The rootNodeId argument is unused. |
| `AnimatedObjectBuilder:setTrigger(node: any)` | 871 | ✍ Stores the player trigger node on the animated object. |
| `AnimatedObjectBuilder:setActions(posAction: any, posText: any, negAction: any, negText: any)` | 877 | ✍ Sets the positive and optional negative input actions and their texts (translated when a matching l10n entry exists). Unknown action names produce a warning and are ignored. |
| `AnimatedObjectBuilder:addSimplePart(node: any, openRotation: any, openTranslation: any)` | 912 | ✍ Adds a node animated between its current transform (time 0) and the given open rotation and/or translation (time 1), with scale unchanged and visibility on. |
| `AnimatedObjectBuilder:setDuration(duration: any)` | 953 | ✍ Sets the animation duration. The value is stored as is; elsewhere in the file it is treated in milliseconds (the builder default is 1000). |
| `AnimatedObjectBuilder:setSounds(xmlFile: any, key: any, rootNode: any)` | 959 | ✍ On clients only, loads the moving, posEnd and negEnd samples from an XML key, attached to the given root node (i3d mappings are not supported here). |
| `AnimatedObjectBuilder:setOpeningTimes(startTime: any, endTime: any, disableIfClosed: any, closedText: any)` | 970 | ✍ Stores opening hours (start, end, disableIfClosed, closed text) when both start and end are given; without them the object is always usable. |

## Messages

- subscribes `MessageType.HOUR_CHANGED` (l.228)
- subscribes `MessageType.HOUR_CHANGED` (l.851)

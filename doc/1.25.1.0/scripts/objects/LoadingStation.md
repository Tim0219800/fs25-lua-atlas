# objects/LoadingStation.lua

*[Version française](../../fr/scripts/objects/LoadingStation.md)*

Source: `dataS/scripts/objects/LoadingStation.lua` — FS25 1.25.1.0

✍ Station that lets vehicles load fill types out of one or more source storages through load triggers (class extends Object). In this dump only a few members have bodies: stream sync of the load triggers, activation forwarding to the owning placeable, removal of fill level and XML schema registration. Most of the class (loading, storage registration, access rules) is not present in the SDK dump and its behaviour is UNVERIFIED.

- **LoadingStation** inherits from `Object` (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `LoadingStation:readStream(streamId: integer, connection: table)` | 106 | ✍ Client-side join: after the parent readStream, when the connection is the server it reads each load trigger's network id and state and completes its registration with the client. |
| `LoadingStation:writeStream(streamId: integer, connection: table)` | 121 | ✍ Server-side join: after the parent writeStream, writes each load trigger's network id and state and registers the trigger in the stream for the connecting client. |
| `LoadingStation:raiseActive()` | 145 | ✍ Calls the parent raiseActive and also wakes the owning placeable, if any, so both keep updating. |
| `LoadingStation:removeFillLevel(fillTypeIndex: integer, fillDelta: number, farmId: integer) → number` | 299 | ✍ Takes fillDelta of a fill type out of the source storages the farm may access and returns the amount still missing (0 once below 0.0001). Note: each storage is asked for the full fillDelta, not the remaining amount, so later storages may lose more than needed. |
| `LoadingStation.registerXMLPaths(schema: any, basePath: any)` | 376 | ✍ Registers the XML schema entries for a loading station: node, stationName, storageRadius, supportsExtension, fillTypes, fillTypeCategories, plus repeated loadTrigger children (via LoadTrigger.registerXMLPaths) with a class attribute. |

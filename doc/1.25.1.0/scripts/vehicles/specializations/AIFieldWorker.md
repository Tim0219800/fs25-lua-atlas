# vehicles/specializations/AIFieldWorker.lua

*[Version française](../../../fr/scripts/vehicles/specializations/AIFieldWorker.md)*

Source: `dataS/scripts/vehicles/specializations/AIFieldWorker.lua` — FS25 1.25.1.0

✍ Specialization that lets a drivable vehicle with AIJobVehicle perform AI field work: it keeps a list of drive strategies (registered in AIFieldWorker.registeredDriveStrategies) and turns their steering targets into driving commands each frame. In this dump most of the file is blank, so the registration, start and stop logic (startFieldWorker, getIsFieldWorkActive and so on) and the XML keys are UNVERIFIED; only seven functions are visible.

- **AIFieldWorker** (l.20)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIFieldWorker.prerequisitesPresent(specializations: table) → boolean` | 43 | ✍ Returns true only if the vehicle type has both AIJobVehicle and Drivable. |
| `AIFieldWorker:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 202 | ✍ Writes the isActive flag, asks each drive strategy to fill reconstruction data, then lets every registered strategy class save that data into the vehicle's savegame entry through its optional saveToXML. |
| `AIFieldWorker:onReadStream(streamId: integer, connection: Connection)` | 228 | ✍ Client side on join: reads a bool and, if true, calls startFieldWorker so the client mirrors an already running field work (startFieldWorker is not in the dump, UNVERIFIED). |
| `AIFieldWorker:onWriteStream(streamId: integer, connection: Connection)` | 238 | ✍ Server side on join: writes whether the field worker is active. Note: spec.isActive is written without a nil guard, and saveToXMLFile does guard against nil. |
| `AIFieldWorker:updateAIFieldWorker(dt: number)` | 318 | ✍ Per-frame AI step while field work is active: asks each drive strategy for a target point and speed until one answers, ends the job as finished if none gives a valid target, limits speed near the stop point, the vehicle speed limit and cruise control, then drives to the point with AIVehicleUtil.driveToPoint and raises onAIFieldWorkerActive. Speeds are in the units used by driveToPoint (km/h, UNVERIFIED). |
| `AIFieldWorker:updateAIFieldWorkerDriveStrategies()` | 575 | ✍ Rebuilds the drive strategy list when AI implements exist: deletes the old strategies, then creates one instance per registered strategy whose test function accepts any vehicle in the attached tree, and links each to this vehicle. |
| `AIFieldWorker:aiContinue(superFunc: any)` | 655 | ✍ Override: calls the parent, then, if field work is active and the vehicle is not turning, raises onAIFieldWorkerContinue and the matching implement event, and clears the blocked flag. |

# objects/PackedBale.lua

*[Version française](../../fr/scripts/objects/PackedBale.md)*

Source: `dataS/scripts/objects/PackedBale.lua` — FS25 1.25.1.0

✍ Subclass of Bale for a bale made of several smaller bales (a packed/stacked bale). It reads the single-bale config and the child nodes from the bale XML (bale.packedBale#singleBale and singleBale#node), and lets a player on foot cut it open through PackedBaleActivatable. Unpacking spawns normal Bale objects at those nodes on the server; clients send a BaleUnpackEvent (defined elsewhere).

- **PackedBale** inherits from `Bale` (l.17)
- **PackedBaleActivatable** (l.140)

## Functions

| Function | Line | Description |
|---|---|---|
| `PackedBale.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 27 | ✍ Creates the packed bale: registers the class name, prepares the list of single-bale nodes, creates the activatable and sets the maximum unpack distance from PackedBale.MAX_UNPACK_DISTANCE (defined outside this file). |
| `PackedBale:delete()` | 41 | ✍ Removes the activatable from the activatable system, then calls the parent delete. |
| `PackedBale:loadBaleAttributesFromXML(xmlFile: table)` | 50 | ✍ Loads parent attributes, then the single-bale file (must exist, otherwise logs an XML error and returns false) and the list of single-bale nodes. Registers the activatable and returns true on success. |
| `PackedBale:unpack(noEventSend: boolean)` | 78 | ✍ Server: for each single-bale node, spawns a normal Bale with the same fill type and as much fill level as it can hold, owned by the same farm, then deletes the packed bale. Client: sends a BaleUnpackEvent to the server. Removes the activatable first. |
| `PackedBale:getCanInteract()` | 108 | ✍ True if the player's interaction position exists and is closer than the maximum unpack distance. |
| `PackedBale:getInteractionPosition()` | 123 | ✍ Returns the local player's position, or nothing if the player is in a vehicle or has no access to this bale. |
| `PackedBaleActivatable.new(packedBale: any)` | 144 | ✍ Creates the activatable for a packed bale and loads the 'action_cutBale' text. |
| `PackedBaleActivatable:getIsActivatable()` | 155 | ✍ Active when the player can interact with the packed bale. |
| `PackedBaleActivatable:run()` | 165 | ✍ Calls unpack on the packed bale. |

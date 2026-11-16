# objects/InlineBaleSingle.lua

*[Version française](../../fr/scripts/objects/InlineBaleSingle.md)*

Source: `dataS/scripts/objects/InlineBaleSingle.lua` — FS25 1.25.1.0

✍ Subclass of Bale for one bale that is part of an InlineBale chain. It cannot be opened or loaded by a bale loader on its own, remembers the owning InlineBale, and manages the skinned connector mesh (loaded from an I3D) that visually links it to the neighbouring bale. Wrapping state changes also toggle the connector visibility.

- **InlineBaleSingle** inherits from `Bale` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `InlineBaleSingle.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 17 | ✍ Creates the bale through Bale.new with this class's metatable, registers the class name 'InlineBaleSingle' and starts with no connected inline bale. |
| `InlineBaleSingle:getBaleSupportsBaleLoader()` | 28 | ✍ Always returns false: a bale in an inline chain cannot be picked up by a bale loader. |
| `InlineBaleSingle:getCanBeOpened()` | 34 | ✍ Always returns false; opening is done on the whole InlineBale instead. |
| `InlineBaleSingle:setConnectedInlineBale(inlineBale: any)` | 40 | ✍ Stores the owning InlineBale (nil to detach). |
| `InlineBaleSingle:getConnectedInlineBale()` | 46 | ✍ Returns the owning InlineBale, or nil. |
| `InlineBaleSingle:setConnector(connectedBale: any, filename: any, axis: any, offset: any)` | 52 | ✍ Loads the connector I3D (shared) and links its end node to the neighbour bale, its start node and skinned mesh to this bale, offset along the given axis. Copies the neighbour's wrap color and sets visibility from the wrapping state. Returns false if the I3D fails to load. |
| `InlineBaleSingle:setConnectorVisibility(state: any)` | 92 | ✍ Shows or hides the connector mesh if one exists. |
| `InlineBaleSingle:getHasConnector()` | 100 | ✍ Returns true if this bale currently has a connector. |
| `InlineBaleSingle:removeConnector()` | 106 | ✍ Deletes the connector nodes and mesh when they still exist and releases the shared I3D request. Clears the connector reference. |
| `InlineBaleSingle:setWrappingState(wrappingState: number, noEventSend: any)` | 129 | ✍ Makes the connector visible when the state is above 0, then calls Bale's setWrappingState (noEventSend is forwarded). |

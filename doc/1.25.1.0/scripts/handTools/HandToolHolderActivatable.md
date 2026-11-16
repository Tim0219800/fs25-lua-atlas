# handTools/HandToolHolderActivatable.lua

*[Version française](../../fr/scripts/handTools/HandToolHolderActivatable.md)*

Source: `dataS/scripts/handTools/HandToolHolderActivatable.lua` — FS25 1.25.1.0

✍ Activatable (interaction prompt) object attached to a `HandToolHolder`. It lets the local player take the stored hand tool or store the one currently held, depending on which side is empty. It can optionally require that the holder is the one targeted by the player's targeter.

- **HandToolHolderActivatable** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `HandToolHolderActivatable.new(handToolHolder: any, takeText: any, storeText: any, needTargeting: any)` | 16 | ✍ Creates the activatable for a holder with its take and store texts (format strings receiving the tool type description) and a flag saying whether targeting is required. |
| `HandToolHolderActivatable:getIsActivatable()` | 31 | ✍ Returns true when the local player can take the holder's tool (hands empty, holder full) or store their held tool (holder empty); sets `activateText` accordingly. With targeting on, the holder must be the targeted one. |
| `HandToolHolderActivatable:getDistance(positionX: any, positionY: any, positionZ: any)` | 78 | ✍ Returns 0 if targeting is required and the prompt is currently activatable; otherwise the distance from the given position to the holder node. |
| `HandToolHolderActivatable:run()` | 93 | ✍ Executes the interaction: either sets the holder's tool to the local player and makes it the current hand tool, or sets the held tool's holder to this holder. Local player only. |

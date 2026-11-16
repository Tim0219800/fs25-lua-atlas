# handTools/HandToolUtil.lua

*[Version française](../../fr/scripts/handTools/HandToolUtil.md)*

Source: `dataS/scripts/handTools/HandToolUtil.lua` — FS25 1.25.1.0

✍ Static helper class for hand tools: targeting of holders and node placement helpers. It uses constants (`HOLDER_DEFAULT_*_DISTANCE`, `CLICK_BOX_TARGET_MASK`) and `transformRelativeToParent` that are not defined in this file (UNVERIFIED).

- **HandToolUtil** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `HandToolUtil.addHandToolHolderTarget(playerTargeter: PlayerTargeter, minDistance: number?, maxDistance: number?)` | 28 | ✍ Registers `HandToolHolder` as a target type on a player targeter, with optional min and max distances (defaults from `HandToolUtil` constants), filtered so that only nodes that are click boxes of a known holder in `handToolSystem` count. |
| `HandToolUtil.linkAndTransformRelativeToParent(rootNode: integer, childNode: integer, parentNode: integer)` | 71 | ✍ Links `rootNode` under `parentNode`, then calls `HandToolUtil.transformRelativeToParent` so that `childNode` ends up at the parent's position and rotation (that function is UNVERIFIED here). |

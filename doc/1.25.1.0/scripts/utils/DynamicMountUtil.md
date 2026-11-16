# utils/DynamicMountUtil.lua

*[Version française](../../fr/scripts/utils/DynamicMountUtil.md)*

Source: `dataS/scripts/utils/DynamicMountUtil.lua` — FS25 1.25.1.0

> ⚠ In the SDK dump this file only contains **signatures** (no bodies).

✍ Signature only (no body in the SDK dump): helper for mounting objects onto a node with physics joints, normally reached through mountable classes rather than called directly. The mount types it accepts include fork, several auto-attach variants and fixed attach (names taken from the parameter list, UNVERIFIED).

- **DynamicMountUtil** (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `DynamicMountUtil.mountDynamic(mountable: table, nodeId: integer, object: table, objectActorId: integer, jointNode: integer, mountType: integer, forceAcceleration: number, jointNode2: integer) → boolean` | 32 | ✍ Signature only (no body in the SDK dump): presumably mounts an object onto a node through a joint of the chosen mount type, with a force acceleration and optional second joint node, and returns a success boolean. UNVERIFIED. |
| `DynamicMountUtil.unmountDynamic(mountable: table, remove: boolean?)` | 122 | ✍ Signature only (no body in the SDK dump): presumably releases a dynamically mounted object, with an optional flag to remove it. UNVERIFIED. |

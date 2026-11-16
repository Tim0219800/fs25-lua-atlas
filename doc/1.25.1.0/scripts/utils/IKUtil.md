# utils/IKUtil.lua

*[Version française](../../fr/scripts/utils/IKUtil.md)*

Source: `dataS/scripts/utils/IKUtil.lua` — FS25 1.25.1.0

✍ Registers the XML schema paths used by inverse kinematics (IK) chains. It defines no runtime behaviour in this file: one function declares the chain description (target, per-node rotation limits, damping, poses, iteration count) and the other declares the targets that select chains and poses. The code that evaluates IK chains is not in this file (UNVERIFIED).


## Functions

| Function | Line | Description |
|---|---|---|
| `IKUtil.registerIKChainTargetsXMLPaths(schema: any, basePath: any)` | 398 | ✍ Registers the target entries below a base path: chain name, target node, translation and rotation offsets, a set-dirty flag (default true), per-index rotation nodes and a pose id. |
| `IKUtil.registerIKChainXMLPaths(schema: any, basePath: any)` | 411 | ✍ Registers the XML paths of one IK chain: id, target and offsets, chain nodes with per-axis angle limits (default -180 to 180), damping (30), local limits, rotation nodes, poses, iteration counts (20, init double), position threshold 0.005 and dirty-on-load. |

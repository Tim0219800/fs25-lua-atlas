# utils/FillPlaneUtil.lua

*[Version française](../../fr/scripts/utils/FillPlaneUtil.md)*

Source: `dataS/scripts/utils/FillPlaneUtil.lua` — FS25 1.25.1.0

> ⚠ In the SDK dump this file only contains **signatures** (no bodies).

✍ Static helpers for fill planes, the visual meshes that show bulk material inside vehicles and trailers. The dump only contains signatures: XML path registration, creation from XML, default material assignment from the terrain and fill type switching. Behaviour is inferred from names and parameters and is UNVERIFIED.

- **FillPlaneUtil** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `FillPlaneUtil.registerFillPlaneXMLPaths(schema: XMLSchema, key: string)` | 17 | ✍ Signature only (no body in the SDK dump): Registers the XML paths used to describe a fill plane in the given schema, under the given key. |
| `FillPlaneUtil.createFromXML(xmlFile: XMLFile, key: string, baseNode: integer, capacity: number) → integer?` | 37 | ✍ Signature only (no body in the SDK dump): Presumably builds a fill plane from an XML file at a key, attached to a base node, with a default capacity when the XML gives none. Returns the fill plane node or nil. UNVERIFIED. |
| `FillPlaneUtil.assignDefaultMaterialsFromTerrain(fillPlane: integer, terrainRootNodeId: integer) → boolean` | 70 | ✍ Signature only (no body in the SDK dump): Presumably assigns default materials taken from the terrain root node to the fill plane mesh and returns a success boolean. UNVERIFIED. |
| `FillPlaneUtil.setFillType(fillPlane: integer, fillTypeIndex: integer)` | 94 | ✍ Signature only (no body in the SDK dump): Presumably switches the fill plane to the look of the given fill type index. UNVERIFIED. |

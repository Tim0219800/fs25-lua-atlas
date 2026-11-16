# utils/FillPlaneUtil.lua

*[English version](../../../scripts/utils/FillPlaneUtil.md)*

Source: `dataS/scripts/utils/FillPlaneUtil.lua` — FS25 1.25.1.0

> ⚠ Dans le dump du SDK, ce fichier ne contient que des **signatures** (pas de corps).

✍ Utilitaires statiques pour les fill planes, les maillages visuels qui montrent la matière en vrac dans les véhicules et remorques. Le dump ne contient que des signatures : enregistrement des chemins XML, création depuis le XML, attribution des matériaux par défaut depuis le terrain et changement de type de remplissage. Le comportement est déduit des noms et paramètres et NON VÉRIFIÉ.

- **FillPlaneUtil** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FillPlaneUtil.registerFillPlaneXMLPaths(schema: XMLSchema, key: string)` | 17 | ✍ Signature seule (pas de corps dans le dump du SDK) : Enregistre dans le schéma donné les chemins XML décrivant un fill plane, sous la clé donnée. |
| `FillPlaneUtil.createFromXML(xmlFile: XMLFile, key: string, baseNode: integer, capacity: number) → integer?` | 37 | ✍ Signature seule (pas de corps dans le dump du SDK) : Construit probablement un fill plane depuis un fichier XML à une clé, rattaché à un noeud de base, avec une capacité par défaut si le XML n'en donne pas. Renvoie le noeud du fill plane ou nil. NON VÉRIFIÉ. |
| `FillPlaneUtil.assignDefaultMaterialsFromTerrain(fillPlane: integer, terrainRootNodeId: integer) → boolean` | 70 | ✍ Signature seule (pas de corps dans le dump du SDK) : Attribue probablement au maillage du fill plane des matériaux par défaut pris sur le noeud racine du terrain et renvoie un booléen de succès. NON VÉRIFIÉ. |
| `FillPlaneUtil.setFillType(fillPlane: integer, fillTypeIndex: integer)` | 94 | ✍ Signature seule (pas de corps dans le dump du SDK) : Fait probablement passer le fill plane à l'apparence du type de remplissage donné par son index. NON VÉRIFIÉ. |

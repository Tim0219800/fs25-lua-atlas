# utils/SplitShapeUtil.lua

*[English version](../../../scripts/utils/SplitShapeUtil.md)*

Source: `dataS/scripts/utils/SplitShapeUtil.lua` — FS25 1.25.1.0

> ⚠ Dans le dump du SDK, ce fichier ne contient que des **signatures** (pas de corps).

✍ Utilitaires statiques autour des split shapes du moteur (arbres et grumes) : découpe, localisation du centre et du rayon d'un arbre, création d'une sangle de tension autour d'un arbre et recherche du split shape dans une hiérarchie de noeuds. Le dump ne contient que des signatures ; le comportement est déduit et NON VÉRIFIÉ.

- **SplitShapeUtil** (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SplitShapeUtil.onSplitShapeCallback(unused: any, shape: integer, isBelow: boolean, isAbove: boolean, minY: number, maxY: number, minZ: number, maxZ: number)` | 29 | ✍ Signature seule (pas de corps dans le dump du SDK) : Forme de callback recevant le split shape, des drapeaux dessous et dessus et des étendues Y/Z. Son rôle de gestionnaire de résultat de découpe est déduit et NON VÉRIFIÉ. |
| `SplitShapeUtil.splitShape(shape: integer, x: number, y: number, z: number, nx: number, ny: number, nz: number, yx: number, yy: number, yz: number, cutSizeY: number, callback: string, cutSizeZ: number, callback: string, target: table?)` | 64 | ✍ Signature seule (pas de corps dans le dump du SDK) : Découpe probablement un split shape avec un plan défini par une position, une normale et une direction Y, avec des tailles de coupe, puis appelle un callback nommé, éventuellement sur une table cible. La signature liste deux fois le paramètre callback, l'ordre réel des paramètres est donc NON VÉRIFIÉ. |
| `SplitShapeUtil.getTreeOffsetPosition(shapeId: integer, x: number, y: number, z: number, maxRadius: number, minLength: number) → number, number, number, number, number, number, number` | 122 | ✍ Signature seule (pas de corps dans le dump du SDK) : Renvoie la position du centre, la normale vers le haut et le rayon d'un arbre près d'une position monde, dans un rayon maximal et pour une longueur minimale. NON VÉRIFIÉ au-delà des annotations. |
| `SplitShapeUtil.createTreeBelt(beltData: table, shapeId: integer, tx: number, ty: number, tz: number, sx: number, sy: number, sz: number, upX: number, upY: number, upZ: number, hookOffset: number, ignoreYDirection: boolean, spacing: number) → integer` | 167 | ✍ Signature seule (pas de corps dans le dump du SDK) : Crée une forme de sangle de tension autour d'un arbre à partir du centre de l'arbre, d'une position cible, de la direction haute du tronc, d'un décalage de crochet, d'une option ignorant la direction Y et d'un espacement ; remplit la table de données de sangle et renvoie l'id de la forme. NON VÉRIFIÉ. |
| `SplitShapeUtil.getSplitShapeId(node: integer) → integer` | 228 | ✍ Signature seule (pas de corps dans le dump du SDK) : Renvoie le premier maillage split shape trouvé dans la hiérarchie d'un noeud, ou nil. |

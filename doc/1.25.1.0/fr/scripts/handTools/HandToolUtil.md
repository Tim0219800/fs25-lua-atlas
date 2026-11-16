# handTools/HandToolUtil.lua

*[English version](../../../scripts/handTools/HandToolUtil.md)*

Source: `dataS/scripts/handTools/HandToolUtil.lua` — FS25 1.25.1.0

✍ Classe d'aides statiques pour les outils à main : ciblage des holders et placement de noeuds. Elle utilise des constantes (`HOLDER_DEFAULT_*_DISTANCE`, `CLICK_BOX_TARGET_MASK`) et `transformRelativeToParent` absentes de ce fichier (NON VÉRIFIÉ).

- **HandToolUtil** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HandToolUtil.addHandToolHolderTarget(playerTargeter: PlayerTargeter, minDistance: number?, maxDistance: number?)` | 28 | ✍ Enregistre `HandToolHolder` comme type de cible sur un targeter de joueur, avec distances min et max optionnelles (valeurs par défaut des constantes de `HandToolUtil`), filtré pour ne retenir que les noeuds qui sont des click boxes d'un holder connu de `handToolSystem`. |
| `HandToolUtil.linkAndTransformRelativeToParent(rootNode: integer, childNode: integer, parentNode: integer)` | 71 | ✍ Lie `rootNode` sous `parentNode`, puis appelle `HandToolUtil.transformRelativeToParent` pour que `childNode` se retrouve à la position et à la rotation du parent (cette fonction est NON VÉRIFIÉE ici). |

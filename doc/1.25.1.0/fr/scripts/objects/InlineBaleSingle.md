# objects/InlineBaleSingle.lua

*[English version](../../../scripts/objects/InlineBaleSingle.md)*

Source: `dataS/scripts/objects/InlineBaleSingle.lua` — FS25 1.25.1.0

✍ Sous-classe de Bale pour une balle faisant partie d'une chaîne InlineBale. Elle ne peut pas être ouverte seule ni chargée par un chargeur de balles, mémorise l'InlineBale propriétaire et gère le mesh skinné du connecteur (chargé depuis un I3D) qui la relie visuellement à la balle voisine. Le changement d'état d'enrubannage bascule aussi la visibilité du connecteur.

- **InlineBaleSingle** hérite de `Bale` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `InlineBaleSingle.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 17 | ✍ Crée la balle via Bale.new avec la metatable de cette classe, enregistre le nom de classe 'InlineBaleSingle' et démarre sans InlineBale associée. |
| `InlineBaleSingle:getBaleSupportsBaleLoader()` | 28 | ✍ Retourne toujours false : une balle d'une chaîne en ligne ne peut pas être chargée par un chargeur de balles. |
| `InlineBaleSingle:getCanBeOpened()` | 34 | ✍ Retourne toujours false ; l'ouverture se fait sur l'InlineBale entière. |
| `InlineBaleSingle:setConnectedInlineBale(inlineBale: any)` | 40 | ✍ Mémorise l'InlineBale propriétaire (nil pour détacher). |
| `InlineBaleSingle:getConnectedInlineBale()` | 46 | ✍ Retourne l'InlineBale propriétaire, ou nil. |
| `InlineBaleSingle:setConnector(connectedBale: any, filename: any, axis: any, offset: any)` | 52 | ✍ Charge l'I3D du connecteur (partagé) et lie son noeud de fin à la balle voisine, son noeud de départ et son mesh skinné à cette balle, décalés sur l'axe donné. Copie la couleur du film de la voisine et règle la visibilité selon l'état d'enrubannage. Retourne false si l'I3D ne se charge pas. |
| `InlineBaleSingle:setConnectorVisibility(state: any)` | 92 | ✍ Affiche ou masque le mesh du connecteur s'il existe. |
| `InlineBaleSingle:getHasConnector()` | 100 | ✍ Retourne true si cette balle possède actuellement un connecteur. |
| `InlineBaleSingle:removeConnector()` | 106 | ✍ Supprime les noeuds et le mesh du connecteur s'ils existent encore et libère la requête I3D partagée. Efface la référence au connecteur. |
| `InlineBaleSingle:setWrappingState(wrappingState: number, noEventSend: any)` | 129 | ✍ Rend le connecteur visible si l'état est supérieur à 0, puis appelle setWrappingState de Bale (noEventSend est transmis). |

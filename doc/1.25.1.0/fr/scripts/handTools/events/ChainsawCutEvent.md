# handTools/events/ChainsawCutEvent.lua

*[English version](../../../../scripts/handTools/events/ChainsawCutEvent.md)*

Source: `dataS/scripts/handTools/events/ChainsawCutEvent.lua` — FS25 1.25.1.0

✍ Événement réseau client vers serveur qui transporte une coupe de tronçonneuse : identifiant de split shape, position de coupe, vecteurs normal et axe Y, dimensions de coupe et identifiant de ferme. La coupe est appliquée côté serveur dans `readStream` via `ChainsawUtil.cutSplitShape` ; `run` n'est pas censé s'exécuter.

- **ChainsawCutEvent** hérite de `Event` (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ChainsawCutEvent.emptyNew() → table` | 18 | ✍ Crée une instance d'événement vide que la couche réseau remplira dans `readStream`. |
| `ChainsawCutEvent.new(splitShapeId: integer, x: number, y: number, z: number, nx: number, ny: number, nz: number, yx: number, yy: number, yz: number, cutSizeY: number, cutSizeZ: number, farmId: integer) → any` | 39 | ✍ Crée l'événement avec l'identifiant du split shape, la position de coupe (x, y, z), la normale (nx, ny, nz), l'axe Y (yx, yy, yz), les dimensions de coupe en Y et Z et l'identifiant de ferme. |
| `ChainsawCutEvent:readStream(streamId: integer, connection: Connection)` | 63 | ✍ Côté serveur uniquement (l'émetteur est un client) : lit l'identifiant du split shape, onze float32 et l'identifiant de ferme puis, si l'identifiant n'est pas 0, effectue la coupe avec `ChainsawUtil.cutSplitShape`. Ne fait rien chez un client. |
| `ChainsawCutEvent:writeStream(streamId: integer, connection: Connection)` | 89 | ✍ Côté client uniquement (connexion vers le serveur) : écrit l'identifiant du split shape, les onze float32 et l'identifiant de ferme dans l'ordre où `readStream` les lit. |
| `ChainsawCutEvent:run(connection: Connection)` | 110 | ✍ Se contente d'afficher un message d'erreur, car cet événement ne doit pas s'exécuter sur un client local ; le vrai travail est fait dans `readStream`. |

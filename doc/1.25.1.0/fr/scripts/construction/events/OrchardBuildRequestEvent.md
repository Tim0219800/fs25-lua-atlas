# construction/events/OrchardBuildRequestEvent.lua

*[English version](../../../../scripts/construction/events/OrchardBuildRequestEvent.md)*

Source: `dataS/scripts/construction/events/OrchardBuildRequestEvent.lua` — FS25 1.25.1.0

✍ Événement réseau envoyé par un client pour demander au serveur de construire un verger sur un placeable de clôture à partir de rangées déjà calculées côté client. Il transporte le placeable de clôture, un modèle de segment facultatif, les segments de rangées, la polyligne de limite et les indices d'options du pinceau. Le serveur le lit avec des limites de taille, le valide et le confie à `orchardBuildManager` ; les constantes `MAX_ROWS`, `MAX_BOUNDARY_POINTS`, `MIN_BOUNDARY_POINTS`, `OFFSET_LINE_INDEX_NUM_BITS` et la méthode `getHasValidTemplate` ne sont pas dans le dump (NON VÉRIFIÉ).

- **OrchardBuildRequestEvent** hérite de `Event` (l.18)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `OrchardBuildRequestEvent.emptyNew() → OrchardBuildRequestEvent` | 38 | ✍ Crée un événement vide sur le canal réseau principal, utilisé lors de la lecture d'un flux. |
| `OrchardBuildRequestEvent.new(requestId: table, fencePlaceable: table, templateId: table?, courseSegments: table, boundaryLine: table, optionStates: table?) → OrchardBuildRequestEvent` | 54 | ✍ Crée une requête à partir de l'id de construction, du placeable de clôture, de l'id de modèle (nil possible), des segments de rangées, de la ligne de limite et des états d'options. Limite et options valent par défaut des tables vides. |
| `OrchardBuildRequestEvent:readStream(streamId: integer, connection: Connection)` | 73 | ✍ Côté serveur : lit l'id de requête, l'objet clôture, l'index de modèle facultatif (converti en id via la clôture), les rangées (début/fin XZ compressés plus index de ligne de décalage), les points de limite et les octets d'options, puis appelle `run`. Les comptes au-delà des limites sont lus pour garder le flux aligné mais marqués `isTooLarge` et non conservés. |
| `OrchardBuildRequestEvent:writeStream(streamId: integer, connection: Connection)` | 148 | ✍ Côté client : écrit les mêmes champs dans la disposition attendue par `readStream`. Seules la première et la dernière position de chaque segment sont envoyées, en XZ compressé ; les hauteurs ne sont pas envoyées car le serveur échantillonne lui-même le terrain. |
| `OrchardBuildRequestEvent:run(connection: Connection)` | 188 | ✍ Serveur uniquement, et seulement si `orchardBuildManager` existe. Rejette avec `STATUS.INVALID_REQUEST` si les données sont trop volumineuses, sans rangées, sans assez de points de limite ou avec un modèle invalide ; sinon appelle `manager:addRequest`. |

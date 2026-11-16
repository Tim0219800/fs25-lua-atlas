# placeables/specializations/events/PlaceableRiceFieldEffectStateEvent.lua

*[English version](../../../../../scripts/placeables/specializations/events/PlaceableRiceFieldEffectStateEvent.md)*

Source: `dataS/scripts/placeables/specializations/events/PlaceableRiceFieldEffectStateEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui transporte la visibilité des effets d'une rizière (effets d'eau de remplissage ou de vidage) d'un PlaceableRiceField, afin que les effets apparaissent côté récepteur. Il dérive de `Event` avec le canal par défaut et n'a pas de fonction d'envoi ; il est créé par le code du placeable, absent de ce fichier.

- **PlaceableRiceFieldEffectStateEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableRiceFieldEffectStateEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide avec la métatable de la classe, utilisée par la couche réseau avant la lecture d'un flux. |
| `PlaceableRiceFieldEffectStateEvent.new(placeableRiceField: any, fieldIndex: any, isFilling: any, isEmptying: any)` | 20 | ✍ Construit l'événement avec le placeable de rizière, un index de champ et deux booléens indiquant si les effets d'eau de remplissage ou de vidage sont affichés. |
| `PlaceableRiceFieldEffectStateEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Lit l'objet rizière, un index de champ UInt8 et les deux indicateurs, puis exécute l'événement immédiatement. Aucune distinction serveur/client dans le code. |
| `PlaceableRiceFieldEffectStateEvent:writeStream(streamId: integer, connection: Connection)` | 48 | ✍ Écrit l'objet rizière, l'index de champ UInt8 et les deux indicateurs booléens, en miroir de `readStream`. |
| `PlaceableRiceFieldEffectStateEvent:run(connection: Connection)` | 58 | ✍ Ignoré si la rizière est nil ou pas encore synchronisée ; sinon appelle `setEffectVisibility` dessus avec l'index du champ et les indicateurs de remplissage/vidage. |

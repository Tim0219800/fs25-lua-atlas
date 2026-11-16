# objects/ProductionPointActivatable.lua

*[English version](../../../scripts/objects/ProductionPointActivatable.md)*

Source: `dataS/scripts/objects/ProductionPointActivatable.lua` — FS25 1.25.1.0

✍ Activatable affiché quand le joueur se trouve dans le déclencheur d'interaction d'un point de production. Selon la propriété, il propose d'acheter le point de production ou de le gérer (ouvrir le menu de production). Il est créé et enregistré par le callback du déclencheur d'interaction de ProductionPoint.

- **ProductionPointActivatable** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ProductionPointActivatable.new(productionPoint: any)` | 15 | ✍ Crée l'activatable d'un point de production, conserve sa mission et définit le texte d'action. |
| `ProductionPointActivatable:updateText()` | 28 | ✍ Définit le texte d'action sur 'acheter' si le point n'a pas de propriétaire et que l'achat passe par le déclencheur d'interaction, sinon sur 'gérer'. |
| `ProductionPointActivatable:getIsActivatable()` | 38 | ✍ True si la ferme locale a accès au point de production selon l'access handler. |
| `ProductionPointActivatable:run()` | 44 | ✍ Si le point n'a pas de propriétaire (EVERYONE) et s'achète via le déclencheur, lance la demande d'achat ; si la ferme locale le possède, ouvre le menu de production. |
| `ProductionPointActivatable:getDistance(x: any, y: any, z: any)` | 56 | ✍ Retourne la distance entre la position et le noeud du déclencheur d'interaction pour un point possédé qui ne s'achète pas via le déclencheur ; sinon math.huge, il n'est donc jamais prioritaire. |

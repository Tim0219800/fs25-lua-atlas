# placeables/specializations/activatables/BuyBuildingActivatable.lua

*[English version](../../../../../scripts/placeables/specializations/activatables/BuyBuildingActivatable.md)*

Source: `dataS/scripts/placeables/specializations/activatables/BuyBuildingActivatable.lua` — FS25 1.25.1.0

✍ Objet activable qui affiche l'action d'achat d'un bâtiment pour un placeable sans propriétaire. Il est utilisable si la ferme locale peut accéder au placeable, et son exécution demande au placeable de lancer l'achat s'il n'a toujours pas de propriétaire.

- **BuyBuildingActivatable** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BuyBuildingActivatable.new(placeable: any)` | 15 | ✍ Crée l'activable pour un placeable et fixe le texte localisé `action_buyBuilding`. |
| `BuyBuildingActivatable:getIsActivatable()` | 26 | ✍ Renvoie si la ferme courante peut accéder au placeable selon le gestionnaire d'accès de la mission. |
| `BuyBuildingActivatable:run()` | 32 | ✍ Si le propriétaire du placeable est le marqueur sans propriétaire (`AccessHandler.EVERYONE`), appelle son `buyRequest` ; sinon ne fait rien. |

# placeables/specializations/activatables/WardrobeActivatable.lua

*[English version](../../../../../scripts/placeables/specializations/activatables/WardrobeActivatable.md)*

Source: `dataS/scripts/placeables/specializations/activatables/WardrobeActivatable.lua` — FS25 1.25.1.0

✍ Objet activable pour un placeable de garde-robe qui ouvre l'écran de personnalisation du personnage. Il est disponible si la garde-robe est libre d'accès ou appartient à la ferme locale, et il est bloqué pendant une visite guidée.

- **WardrobeActivatable** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WardrobeActivatable.new(placeable: any)` | 15 | ✍ Crée l'activable pour un placeable de garde-robe et fixe le texte `action_openWardrobe`. |
| `WardrobeActivatable:getIsActivatable()` | 26 | ✍ Renvoie true si la garde-robe est libre d'accès ou si la ferme locale possède le placeable. |
| `WardrobeActivatable:run()` | 32 | ✍ Affiche une boîte d'information pendant une visite guidée ; sinon fait passer l'interface à WardrobeScreen. |

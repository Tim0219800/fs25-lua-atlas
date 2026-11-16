# placeables/specializations/activatables/DestructibleActivatable.lua

*[English version](../../../../../scripts/placeables/specializations/activatables/DestructibleActivatable.md)*

Source: `dataS/scripts/placeables/specializations/activatables/DestructibleActivatable.lua` — FS25 1.25.1.0

✍ Objet activable qui permet à un joueur de lancer la réparation d'un placeable destructible. La disponibilité dépend du placeable, et son exécution envoie un PlaceableDestructibleRepairEvent au serveur, sauf pendant une visite guidée où une boîte d'information s'affiche à la place.

- **DestructibleActivatable** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `DestructibleActivatable.new(placeable: any)` | 15 | ✍ Crée l'activable pour un placeable et fixe le texte `action_destructibleStartRepairing`. |
| `DestructibleActivatable:getIsActivatable()` | 26 | ✍ Renvoie le résultat de `getCanRepairDestructible` du placeable pour l'identifiant de la ferme locale. |
| `DestructibleActivatable:run()` | 32 | ✍ Affiche une boîte d'information et s'arrête si une visite guidée est en cours ; sinon envoie un PlaceableDestructibleRepairEvent à la connexion serveur. |

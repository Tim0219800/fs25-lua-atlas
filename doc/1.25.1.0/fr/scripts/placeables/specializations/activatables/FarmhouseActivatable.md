# placeables/specializations/activatables/FarmhouseActivatable.lua

*[English version](../../../../../scripts/placeables/specializations/activatables/FarmhouseActivatable.md)*

Source: `dataS/scripts/placeables/specializations/activatables/FarmhouseActivatable.lua` — FS25 1.25.1.0

✍ Objet activable d'un placeable de maison de ferme qui permet au joueur d'aller dormir. Il est disponible si le placeable autorise la ferme locale à dormir et que personne ne dort déjà, et il ouvre la boîte de dialogue du gestionnaire de sommeil.

- **FarmhouseActivatable** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FarmhouseActivatable.new(placeable: any)` | 16 | ✍ Crée l'activable pour un placeable et fixe le texte `ui_inGameSleep`. |
| `FarmhouseActivatable:getIsActivatable()` | 27 | ✍ Renvoie true si le placeable autorise la ferme locale à dormir et que le gestionnaire de sommeil ne dort pas déjà. |
| `FarmhouseActivatable:run()` | 33 | ✍ Ouvre la boîte de dialogue de sommeil via `g_sleepManager:showDialog()`. |

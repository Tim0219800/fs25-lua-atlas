# gui/hud/AchievementMessage.lua

*[English version](../../../../scripts/gui/hud/AchievementMessage.md)*

Source: `dataS/scripts/gui/hud/AchievementMessage.lua` — FS25 1.25.1.0

✍ Widget HUD destiné à afficher une bannière de succès débloqué, dérivé de HUDDisplay. Le fichier ne construit que l'état (file de messages en attente, texte d'en-tête l10n message_achievementUnlocked, overlay d'icône, minuteurs) et la mise en page à l'échelle ; la logique d'affichage et de dessin n'est pas dans ce fichier (emplacement NON VÉRIFIÉ).

- **AchievementMessage** hérite de `HUDDisplay` (l.23)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AchievementMessage.new(customMt: any?) → any` | 30 | ✍ Constructeur. Crée l'affichage avec une liste de messages en attente vide, sans message courant, un texte d'en-tête en majuscules et un overlay d'icône vide. L'argument customMt est ignoré (la métatable de la classe est toujours utilisée). |
| `AchievementMessage:storeScaledValues()` | 51 | ✍ Calcule la mise en page de la bannière à partir de valeurs en pixels (boîte 600x100 centrée horizontalement sur l'ancre basse du HUD, icône 90x90, tailles et décalages des textes de titre et de description, largeur max de la description), mises à l'échelle de l'interface. |

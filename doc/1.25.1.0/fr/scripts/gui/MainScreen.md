# gui/MainScreen.lua

*[English version](../../../scripts/gui/MainScreen.md)*

Source: `dataS/scripts/gui/MainScreen.lua` — FS25 1.25.1.0

✍ Écran du menu principal affiché au lancement du jeu (étend `ScreenElement`). Seule la surcharge de gestion des entrées est décrite ici.

- **MainScreen** hérite de `ScreenElement` (l.25)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `MainScreen:inputEvent(action: any, value: any, eventUsed: any)` | 815 | ✍ Appelle le gestionnaire d'entrées parent puis, sur Android, transforme MENU_BACK en boîte de dialogue oui/non pour quitter (`onYesNoEnd`) et marque toujours l'événement comme consommé. Renvoie l'indicateur d'événement utilisé. |

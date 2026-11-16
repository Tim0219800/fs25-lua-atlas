# gui/elements/DialogElement.lua

*[English version](../../../../scripts/gui/elements/DialogElement.md)*

Source: `dataS/scripts/gui/elements/DialogElement.lua` — FS25 1.25.1.0

✍ DialogElement est la classe de base des boîtes de dialogue modales. Elle étend ScreenElement et se configure par une classe Lua de dialogue et un fichier XML associés. Elle ajoute un indicateur d'autorisation de fermeture et un type de dialogue qui choisit l'icône visible. Les constantes utilisées (DialogElement.TYPE_*, DIALOG_CIRCLE_PROFILE*, TYPE_ICON_ID_MAPPING) ne sont pas définies dans ce fichier du dump : NON VÉRIFIÉ.

- **DialogElement** hérite de `ScreenElement` (l.50)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `DialogElement.new(target: any, custom_mt: any)` | 54 | ✍ Constructeur. Crée un dialogue basé sur ScreenElement et met isCloseAllowed à true. |
| `DialogElement:close()` | 64 | ✍ Ferme ce dialogue en demandant à g_gui de fermer le dialogue enregistré sous le nom de cet élément. |
| `DialogElement:onClickBack(forceBack: any, usedMenuButton: any)` | 70 | ✍ Gestionnaire du bouton retour. Ferme le dialogue et renvoie false (événement consommé) si la fermeture est permise ou forcée et que le bouton de menu n'a pas été utilisé ; sinon renvoie true (événement non utilisé). |
| `DialogElement:setDialogType(dialogType: any)` | 81 | ✍ Mémorise le type de dialogue (par défaut DialogElement.TYPE_WARNING) et n'affiche que l'icône correspondante. Masque le cercle pour le type chargement et applique un profil de cercle d'avertissement ou normal. À noter : TYPE_ICON_ID_MAPPING est lu comme global nu, pas comme champ de DialogElement. |
| `DialogElement:setIsCloseAllowed(isAllowed: any)` | 107 | ✍ Définit si le joueur peut fermer le dialogue avec l'action retour. |

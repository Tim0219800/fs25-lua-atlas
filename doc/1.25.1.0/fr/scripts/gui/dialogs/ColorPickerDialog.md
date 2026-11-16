# gui/dialogs/ColorPickerDialog.lua

*[English version](../../../../scripts/gui/dialogs/ColorPickerDialog.md)*

Source: `dataS/scripts/gui/dialogs/ColorPickerDialog.lua` — FS25 1.25.1.0

✍ Boîte de dialogue permettant au joueur de choisir une couleur parmi des préréglages, avec en option une couleur personnalisée et un choix de matériau, dérivée de MessageDialog. Seuls `show` et deux gestionnaires d'entrée de curseur analogique subsistent dans ce dump ; l'essentiel du fichier de 887 lignes est vide, le reste du comportement est donc NON VÉRIFIÉ. Interface côté client.

- **ColorPickerDialog** hérite de `MessageDialog` (l.15)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ColorPickerDialog.show(callback: function, target: table, args: table?, colors: table?, defaultColorIndex: integer?, defaultMaterial: string?, customColor: table?, customColorsEnabled: boolean?, disableOpenSound: boolean?, materialSelectionDisabled: boolean?)` | 47 | ✍ Mémorise sur l'instance partagée la liste de couleurs, l'indice et le matériau par défaut et la couleur personnalisée, règle les options personnalisées/matériau, le callback et le son d'ouverture, puis ouvre la boîte. Sans instance, ne fait rien. |
| `ColorPickerDialog:onHorizontalCursorInput(_: any, inputValue: any)` | 879 | ✍ Événement d'entrée du déplacement horizontal du curseur (axe gauche/droite de choix de couleur) ; ajoute la valeur reçue à `accumHorizontalInput`. L'endroit où cet accumulateur est consommé n'est pas visible dans le dump. |
| `ColorPickerDialog:onVerticalCursorInput(_: any, inputValue: any)` | 885 | ✍ Événement d'entrée du déplacement vertical du curseur (axe haut/bas de choix de couleur) ; ajoute la valeur reçue à `accumVerticalInput`. L'endroit où cet accumulateur est consommé n'est pas visible dans le dump. |

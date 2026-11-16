# gui/hud/HUDTextButtonElement.lua

*[English version](../../../../scripts/gui/hud/HUDTextButtonElement.md)*

Source: `dataS/scripts/gui/hud/HUDTextButtonElement.lua` — FS25 1.25.1.0

✍ Bouton texte minimal pour le HUD. Ce fichier ne définit que setText, qui délègue à un membre textDisplay ; le constructeur et la création de ce membre ne sont pas dans le fichier (NON VÉRIFIÉ). Il ne dérive pas de HUDElement ici (Class simple).

- **HUDTextButtonElement** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HUDTextButtonElement:setText(text: string, textSize: number, textAlignment: integer, textColor: table, textBold: boolean)` | 63 | ✍ Transmet texte, taille, alignement, couleur et gras à textDisplay:setText en interne. Nécessite que self.textDisplay existe. |

# gui/WardrobeScreen.lua

*[English version](../../../scripts/gui/WardrobeScreen.md)*

Source: `dataS/scripts/gui/WardrobeScreen.lua` — FS25 1.25.1.0

✍ Écran de garde-robe (personnalisation du personnage), basé sur `TabbedMenuWithDetails`. Seul le nettoyage de son événement d'action d'entrée non-GUI est décrit ici.

- **WardrobeScreen** hérite de `TabbedMenuWithDetails` (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WardrobeScreen:removeActionEvents()` | 702 | ✍ Désenregistre de `g_inputBinding` l'événement d'action gauche/droite de la manette (`eventIdLeftRightController`) et efface l'identifiant stocké. |

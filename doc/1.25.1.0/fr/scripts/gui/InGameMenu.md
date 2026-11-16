# gui/InGameMenu.lua

*[English version](../../../scripts/gui/InGameMenu.md)*

Source: `dataS/scripts/gui/InGameMenu.lua` — FS25 1.25.1.0

✍ Menu principal en jeu (pause), dérivé de TabbedMenu, qui héberge des pages comme les réglages et l'aide. Seuls les deux gestionnaires de navigation entre pages sont décrits ici. L'essentiel du fichier est hors des entrées décrites.

- **InGameMenu** hérite de `TabbedMenu` (l.30)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `InGameMenu:onPageNext()` | 973 | ✍ Gestionnaire de page suivante. Ignore l'appel une fois si un drapeau de blocage est posé ; sinon demande à la page courante de se fermer et, si elle accepte, ouvre l'écran de sauvegarde en quittant réglages ou aide, puis appelle onPageNext de TabbedMenu. |
| `InGameMenu:onPagePrevious()` | 989 | ✍ Gestionnaire de page précédente. Demande à la page courante de se fermer ; si elle accepte, ouvre l'écran de sauvegarde en quittant réglages ou aide, puis appelle onPagePrevious de TabbedMenu. Contrairement à onPageNext, il n'a pas de drapeau de blocage. |

# gui/elements/TabbedMenuFrameElement.lua

*[English version](../../../../scripts/gui/elements/TabbedMenuFrameElement.md)*

Source: `dataS/scripts/gui/elements/TabbedMenuFrameElement.lua` — FS25 1.25.1.0

✍ Classe de base (dérivée de FrameElement) des cadres affichés dans le menu de jeu à onglets. Elle conserve les infos de boutons de menu personnalisés avec un indicateur « sale » pour que le menu conteneur rafraîchisse ses boutons, le numéro de page, un titre et un point d'entrée de demande de fermeture pour les cadres qui doivent terminer un travail. Le conteneur n'est pas dans ce fichier : son usage de ces valeurs est NON VÉRIFIÉ.

- **TabbedMenuFrameElement** hérite de `FrameElement` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TabbedMenuFrameElement.new(target: any, customMt: any)` | 18 | ✍ Constructeur. Initialise des infos de boutons vides, les indicateurs sales, la page courante à 1 (une seule page) et un callback de fermeture sans effet. |
| `TabbedMenuFrameElement:initialize(...: any)` | 39 | ✍ Point d'extension vide pour l'initialisation tardive d'un cadre ; les sous-classes le surchargent. Accepte tous arguments et ne fait rien ici. |
| `TabbedMenuFrameElement:getHasCustomMenuButtons()` | 44 | ✍ Indique si ce cadre fournit ses propres boutons de menu. |
| `TabbedMenuFrameElement:getMenuButtonInfo() → table` | 51 | ✍ Retourne le tableau enregistré des descriptions de boutons personnalisés (action d'entrée, texte et callback optionnels). |
| `TabbedMenuFrameElement:setMenuButtonInfo(menuButtonInfo: table?)` | 58 | ✍ Enregistre les infos de boutons et indique des boutons personnalisés, sauf si nil est passé, ce qui réinitialise. Ne marque pas les infos comme sales. |
| `TabbedMenuFrameElement:setMenuButtonInfoDirty()` | 65 | ✍ Lève l'indicateur sale pour que le menu conteneur reconstruise ses boutons à partir des infos de ce cadre. |
| `TabbedMenuFrameElement:isMenuButtonInfoDirty()` | 71 | ✍ Indique si les infos de boutons ont changé depuis le dernier effacement de l'indicateur. |
| `TabbedMenuFrameElement:clearMenuButtonInfoDirty()` | 77 | ✍ Efface l'indicateur sale des infos de boutons. |
| `TabbedMenuFrameElement:getMainElementSize()` | 83 | ✍ Retourne la taille par défaut du contenu principal {1, 1} (plein écran en unités normalisées). Les sous-classes la surchargent. |
| `TabbedMenuFrameElement:getMainElementPosition()` | 89 | ✍ Retourne la position par défaut du contenu principal {0, 0}. Les sous-classes la surchargent. |
| `TabbedMenuFrameElement:requestClose(callback: any)` | 98 | ✍ Mémorise le callback donné (ou un callback sans effet) et retourne true, donc la fermeture est autorisée immédiatement. Les sous-classes la surchargent pour différer la fermeture, par exemple pour sauvegarder, et appellent le callback plus tard. |
| `TabbedMenuFrameElement:onFrameOpen()` | 105 | ✍ Appelée par le conteneur à l'ouverture du cadre. Exécute onOpen de la classe parente puis appelle updatePagingButtons, non défini dans ce fichier (NON VÉRIFIÉ, probablement issu de FrameElement). |
| `TabbedMenuFrameElement:onFrameClose()` | 113 | ✍ Appelée par le conteneur à la fermeture du cadre. Ne fait que transmettre à onClose de la classe parente. |
| `TabbedMenuFrameElement:setTitle(title: any)` | 121 | ✍ Enregistre le titre du cadre et, si un élément pagingTitle existe sur le cadre, met aussi son texte à jour. |

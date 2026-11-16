# gui/elements/ScreenElement.lua

*[English version](../../../../scripts/gui/elements/ScreenElement.md)*

Source: `dataS/scripts/gui/elements/ScreenElement.lua` — FS25 1.25.1.0

✍ Classe de base des vues d'interface plein écran, qui étend FrameElement. Elle suit l'état d'ouverture, affiche le curseur de la souris pendant l'ouverture et le restaure à la fermeture, et centralise la gestion d'entrée commune : page précédente/suivante pour un sélecteur de pages, actions de défilement de liste transmises à l'élément focalisé, et envoi vers les actions de boutons. Quelques aides qu'elle référence (callButtonsWithAction, onPagePrevious, onPageNext) ne sont pas dans ce dump (NON VÉRIFIÉ).

- **ScreenElement** hérite de `FrameElement` (l.17)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ScreenElement.new(target: any, custom_mt: any)` | 21 | ✍ Constructeur. Construit un FrameElement et définit les valeurs par défaut : retour autorisé, gestion du curseur active, pas de classe d'écran de retour, fermé, non initialisé, son de clic non coupé. |
| `ScreenElement:onOpen()` | 37 | ✍ Appelé à l'ouverture de l'écran : exécute initializeScreen une seule fois, mémorise la visibilité courante du curseur, force le curseur visible via g_inputBinding et active l'indicateur d'ouverture. |
| `ScreenElement:initializeScreen()` | 50 | ✍ Initialisation unique qui marque l'écran comme initialisé ; si un pageSelector existe, désactive les sons de clic de ses boutons car les sons de pagination sont gérés ailleurs. |
| `ScreenElement:onClose()` | 61 | ✍ Appelé à la fermeture de l'écran : restaure l'état précédent du curseur si handleCursorVisibility est actif et efface l'indicateur d'ouverture. |
| `ScreenElement:invalidateScreen()` | 144 | ✍ Point d'accroche vide que les sous-classes peuvent surcharger pour rafraîchir leur contenu ; ne fait rien ici. |
| `ScreenElement:inputEvent(action: any, value: any, eventUsed: any)` | 169 | ✍ Gère l'entrée après le parent : les actions page précédente/suivante appellent onPagePrevious/onPageNext si un pageSelector existe (toujours consommées), les actions de début/fin/page de liste appellent la méthode de défilement correspondante de l'élément focalisé si elle existe, et les actions restantes sont essayées sur les boutons enfants. Sans effet tant que inputDisableTime est positif. |
| `ScreenElement:setReturnScreenClass(returnScreenClass: any)` | 252 | ✍ Mémorise la classe d'écran qui sera ouverte quand l'utilisateur revient en arrière depuis cet écran. |
| `ScreenElement:getIsOpen()` | 258 | ✍ Retourne si l'écran est actuellement ouvert. |
| `ScreenElement:canReceiveFocus()` | 264 | ✍ Retourne true seulement si l'écran est visible et si chaque élément enfant peut lui-même recevoir le focus. |
| `ScreenElement:setNextScreenClickSoundMuted(value: any)` | 281 | ✍ Définit l'indicateur qui coupe le prochain son de clic, utilisé pour remplacer les sons des actions d'activation et d'annulation. Sans argument, il vaut true. |

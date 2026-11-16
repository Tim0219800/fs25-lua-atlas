# gui/base/GuiTopDownCursor.lua

*[English version](../../../../scripts/gui/base/GuiTopDownCursor.md)*

Source: `dataS/scripts/gui/base/GuiTopDownCursor.lua` — FS25 1.25.1.0

✍ Aide de curseur pour les vues du dessus (type construction) : affiche un nœud de curseur 3D, écoute les changements de mode d'entrée et suit une position de souris ou de centre d'écran. Dans ce dump la plupart des corps de méthodes sont vides ; seuls les gestionnaires listés (cycle de vie, entrées, souris) sont visibles.

- **GuiTopDownCursor** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `GuiTopDownCursor:delete()` | 86 | ✍ Désactive le curseur s'il est actif, supprime l'overlay du curseur et le nœud racine, et annule une requête de streaming I3D en attente. À appeler à la destruction de l'écran propriétaire. |
| `GuiTopDownCursor:activate()` | 150 | ✍ Marque le curseur actif, applique le mode d'entrée courant, charge ses formes au premier usage, affiche le nœud racine selon son indicateur de visibilité, enregistre les événements d'action et s'abonne à INPUT_MODE_CHANGED. |
| `GuiTopDownCursor:deactivate()` | 168 | ✍ Masque le nœud racine, se désabonne de tous les messages du centre de messages, retire les événements d'action enregistrés et efface l'indicateur d'activité. |
| `GuiTopDownCursor:registerActionEvents()` | 565 | ✍ Enregistre l'action AXIS_CONSTRUCTION_CURSOR_ROTATE sur le gestionnaire `onRotate`, ne l'active que si la rotation est autorisée et donne une priorité normale à son texte d'aide. `onRotate` n'est pas visible dans ce dump (NON VÉRIFIÉ). |
| `GuiTopDownCursor:removeActionEvents()` | 575 | ✍ Oublie l'identifiant de l'événement de rotation et retire tous les événements d'action enregistrés avec ce curseur pour cible. |
| `GuiTopDownCursor:mouseEvent(posX: any, posY: any, isDown: any, isUp: any, button: any)` | 583 | ✍ Gestionnaire souris brut, ignoré si la souris est désactivée ou si une action a eu lieu dans cette image. Si le curseur était capturé, il restaure la position verrouillée et le curseur système ; sinon il mémorise la position en mode souris. |
| `GuiTopDownCursor:onInputModeChanged(inputMode: any)` | 656 | ✍ Callback de changement de mode d'entrée : le mode souris est vrai quand la première entrée vaut le mode d'aide clavier. Hors mode souris, la position stockée du curseur est remise au centre de l'écran (0.5, 0.5). |

## Messages

- s'abonne à `MessageType.INPUT_MODE_CHANGED` (l.163)

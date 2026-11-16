# gui/dialogs/TourDialog.lua

*[English version](../../../../scripts/gui/dialogs/TourDialog.md)*

Source: `dataS/scripts/gui/dialogs/TourDialog.lua` — FS25 1.25.1.0

✍ Boîte de dialogue d'information avec un texte et un bouton de confirmation, dérivée de MessageDialog, apparemment utilisée pour les messages de visite guidée (le nom le suggère ; aucune logique de visite dans ce fichier). Seule la gestion de la touche retour Android y est définie.

- **TourDialog** hérite de `MessageDialog` (l.15)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TourDialog:inputEvent(action: any, value: any, eventUsed: any)` | 184 | ✍ Étend la gestion d'entrée du parent ; sous Android, une fois le délai de blocage écoulé, l'action de retour déclenche `onClickOk` et l'événement est toujours consommé pour qu'aucun autre élément focalisé ne réagisse. |

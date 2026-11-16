# gui/dialogs/MultiOptionDialog.lua

*[English version](../../../../scripts/gui/dialogs/MultiOptionDialog.md)*

Source: `dataS/scripts/gui/dialogs/MultiOptionDialog.lua` — FS25 1.25.1.0

✍ Boîte de dialogue proposant jusqu'à quatre choix liés aux actions de menu activer, accepter, retour et annuler, dérivée de MessageDialog. Seule la gestion de la touche retour Android est définie ici ; le reste est hérité. Interface côté client uniquement.

- **MultiOptionDialog** hérite de `MessageDialog` (l.21)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `MultiOptionDialog:inputEvent(action: any, value: any, eventUsed: any)` | 241 | ✍ Étend la gestion d'entrée du parent ; sous Android, une fois le délai de blocage écoulé, l'action de retour déclenche `onNo` et l'événement est toujours consommé pour qu'aucun autre élément focalisé ne réagisse. |

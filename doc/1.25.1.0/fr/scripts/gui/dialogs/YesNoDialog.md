# gui/dialogs/YesNoDialog.lua

*[English version](../../../../scripts/gui/dialogs/YesNoDialog.md)*

Source: `dataS/scripts/gui/dialogs/YesNoDialog.lua` — FS25 1.25.1.0

✍ Boîte de dialogue de confirmation oui/non, dérivée de MessageDialog et conçue comme base pour les dialogues qui confirment ou annulent une action. Ce fichier n'ajoute que la gestion de la touche retour Android ; le reste est hérité. Interface côté client uniquement.

- **YesNoDialog** hérite de `MessageDialog` (l.18)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `YesNoDialog:inputEvent(action: any, value: any, eventUsed: any)` | 209 | ✍ Étend la gestion d'entrée du parent ; sous Android, une fois le délai de blocage écoulé, l'action de retour déclenche `onNo` et l'événement est toujours consommé pour qu'aucun autre élément focalisé ne réagisse. |

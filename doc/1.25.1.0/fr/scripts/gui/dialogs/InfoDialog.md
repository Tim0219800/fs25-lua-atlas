# gui/dialogs/InfoDialog.lua

*[English version](../../../../scripts/gui/dialogs/InfoDialog.md)*

Source: `dataS/scripts/gui/dialogs/InfoDialog.lua` — FS25 1.25.1.0

✍ Boîte de dialogue d'information simple avec un texte et un bouton de confirmation, dérivée de MessageDialog. Une instance unique (`InfoDialog.INSTANCE`) est réutilisée via l'aide statique `show`. Interface côté client uniquement.

- **InfoDialog** hérite de `MessageDialog` (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `InfoDialog.show(text: string, callback: function?, target: table?, dialogType: integer?, okText: string?, buttonAction: string?, callbackArgs: any, disableOpenSound: boolean?)` | 33 | ✍ Configure l'instance partagée (callback, type de dialogue par défaut TYPE_INFO, texte et action du bouton, message, son d'ouverture) et l'ouvre via `g_gui:showDialog`. Ne fait rien si l'instance n'existe pas. |
| `InfoDialog:inputEvent(action: any, value: any, eventUsed: any)` | 179 | ✍ Étend la gestion d'entrée du parent ; sous Android, une fois le délai de blocage écoulé, l'action de retour déclenche `onClickOk` et l'événement est toujours consommé pour qu'aucun autre élément focalisé ne réagisse. |

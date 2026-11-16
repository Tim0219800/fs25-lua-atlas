# ai/errors/AIMessageErrorVehicleDeleted.lua

*[English version](../../../../scripts/ai/errors/AIMessageErrorVehicleDeleted.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorVehicleDeleted.lua` — FS25 1.25.1.0

✍ Classe de message IA pour le cas où le véhicule a été supprimé. Elle étend `AIMessage`, est enregistrée dans `AIMessageManager` et s'affiche quand un travail d'assistant s'arrête avec cette erreur.

- **AIMessageErrorVehicleDeleted** hérite de `AIMessage` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIMessageErrorVehicleDeleted.new(customMt: any)` | 16 | ✍ Constructeur du message d'erreur IA signifiant : le véhicule a été supprimé. Hérite de `AIMessage` et n'ajoute aucun état. |
| `AIMessageErrorVehicleDeleted:getI18NText()` | 23 | ✍ Renvoie le texte localisé de la clé `ai_messageErrorVehicleDeleted` via `g_i18n`, utilisé par `AIMessage:getMessage`. |

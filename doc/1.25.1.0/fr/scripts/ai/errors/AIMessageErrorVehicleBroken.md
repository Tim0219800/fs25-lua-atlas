# ai/errors/AIMessageErrorVehicleBroken.lua

*[English version](../../../../scripts/ai/errors/AIMessageErrorVehicleBroken.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorVehicleBroken.lua` — FS25 1.25.1.0

✍ Classe de message IA pour le cas où le véhicule est en panne. Elle étend `AIMessage`, est enregistrée dans `AIMessageManager` et s'affiche quand un travail d'assistant s'arrête avec cette erreur.

- **AIMessageErrorVehicleBroken** hérite de `AIMessage` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIMessageErrorVehicleBroken.new(customMt: any)` | 16 | ✍ Constructeur du message d'erreur IA signifiant : le véhicule est en panne. Hérite de `AIMessage` et n'ajoute aucun état. |
| `AIMessageErrorVehicleBroken:getI18NText()` | 23 | ✍ Renvoie le texte localisé de la clé `ai_messageErrorVehicleBroken` via `g_i18n`, utilisé par `AIMessage:getMessage`. |

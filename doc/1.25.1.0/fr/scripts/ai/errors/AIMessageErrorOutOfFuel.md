# ai/errors/AIMessageErrorOutOfFuel.lua

*[English version](../../../../scripts/ai/errors/AIMessageErrorOutOfFuel.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorOutOfFuel.lua` — FS25 1.25.1.0

✍ Classe de message IA pour le cas où le véhicule est à court de carburant. Elle étend `AIMessage`, est enregistrée dans `AIMessageManager` et s'affiche quand un travail d'assistant s'arrête avec cette erreur.

- **AIMessageErrorOutOfFuel** hérite de `AIMessage` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIMessageErrorOutOfFuel.new(customMt: any)` | 16 | ✍ Constructeur du message d'erreur IA signifiant : le véhicule est à court de carburant. Hérite de `AIMessage` et n'ajoute aucun état. |
| `AIMessageErrorOutOfFuel:getI18NText()` | 23 | ✍ Renvoie le texte localisé de la clé `ai_messageErrorOutOfFuel` via `g_i18n`, utilisé par `AIMessage:getMessage`. |

# ai/errors/AIMessageErrorUnknown.lua

*[English version](../../../../scripts/ai/errors/AIMessageErrorUnknown.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorUnknown.lua` — FS25 1.25.1.0

✍ Classe de message IA pour le cas où une erreur non précisée s'est produite. Elle étend `AIMessage`, est enregistrée dans `AIMessageManager` et s'affiche quand un travail d'assistant s'arrête avec cette erreur.

- **AIMessageErrorUnknown** hérite de `AIMessage` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIMessageErrorUnknown.new(customMt: any)` | 16 | ✍ Constructeur du message d'erreur IA signifiant : une erreur non précisée s'est produite. Hérite de `AIMessage` et n'ajoute aucun état. |
| `AIMessageErrorUnknown:getI18NText()` | 23 | ✍ Renvoie le texte localisé de la clé `ai_messageErrorUnknown` via `g_i18n`, utilisé par `AIMessage:getMessage`. |

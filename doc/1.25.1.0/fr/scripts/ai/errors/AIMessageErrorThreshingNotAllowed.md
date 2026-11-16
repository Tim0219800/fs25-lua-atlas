# ai/errors/AIMessageErrorThreshingNotAllowed.lua

*[English version](../../../../scripts/ai/errors/AIMessageErrorThreshingNotAllowed.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorThreshingNotAllowed.lua` — FS25 1.25.1.0

✍ Classe de message IA pour le cas où le battage n'est pas autorisé actuellement. Elle étend `AIMessage`, est enregistrée dans `AIMessageManager` et s'affiche quand un travail d'assistant s'arrête avec cette erreur.

- **AIMessageErrorThreshingNotAllowed** hérite de `AIMessage` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIMessageErrorThreshingNotAllowed.new(customMt: any)` | 16 | ✍ Constructeur du message d'erreur IA signifiant : le battage n'est pas autorisé actuellement. Hérite de `AIMessage` et n'ajoute aucun état. |
| `AIMessageErrorThreshingNotAllowed:getI18NText()` | 23 | ✍ Renvoie le texte localisé de la clé `ai_messageErrorThreshingNotAllowed` via `g_i18n`, utilisé par `AIMessage:getMessage`. |

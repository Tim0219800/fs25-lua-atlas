# ai/errors/AIMessageErrorNotReachable.lua

*[English version](../../../../scripts/ai/errors/AIMessageErrorNotReachable.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorNotReachable.lua` — FS25 1.25.1.0

✍ Classe de message IA pour le cas où la cible est inaccessible. Elle étend `AIMessage`, est enregistrée dans `AIMessageManager` et s'affiche quand un travail d'assistant s'arrête avec cette erreur.

- **AIMessageErrorNotReachable** hérite de `AIMessage` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIMessageErrorNotReachable.new(customMt: any)` | 16 | ✍ Constructeur du message d'erreur IA signifiant : la cible est inaccessible. Hérite de `AIMessage` et n'ajoute aucun état. |
| `AIMessageErrorNotReachable:getI18NText()` | 23 | ✍ Renvoie le texte localisé de la clé `ai_messageErrorNotReachable` via `g_i18n`, utilisé par `AIMessage:getMessage`. |

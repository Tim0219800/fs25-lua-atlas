# ai/errors/AIMessageErrorNoVineFound.lua

*[English version](../../../../scripts/ai/errors/AIMessageErrorNoVineFound.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorNoVineFound.lua` — FS25 1.25.1.0

✍ Classe de message IA pour le cas où aucune vigne n'a été trouvée. Elle étend `AIMessage`, est enregistrée dans `AIMessageManager` et s'affiche quand un travail d'assistant s'arrête avec cette erreur.

- **AIMessageErrorNoVineFound** hérite de `AIMessage` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIMessageErrorNoVineFound.new(customMt: any)` | 16 | ✍ Constructeur du message d'erreur IA signifiant : aucune vigne n'a été trouvée. Hérite de `AIMessage` et n'ajoute aucun état. |
| `AIMessageErrorNoVineFound:getI18NText()` | 23 | ✍ Renvoie le texte localisé de la clé `ai_messageErrorNoVineFound` via `g_i18n`, utilisé par `AIMessage:getMessage`. |

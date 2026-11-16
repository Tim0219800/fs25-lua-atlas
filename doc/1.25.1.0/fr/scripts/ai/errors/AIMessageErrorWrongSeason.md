# ai/errors/AIMessageErrorWrongSeason.lua

*[English version](../../../../scripts/ai/errors/AIMessageErrorWrongSeason.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorWrongSeason.lua` — FS25 1.25.1.0

✍ Classe de message IA pour le cas où le travail est impossible à la saison actuelle. Elle étend `AIMessage`, est enregistrée dans `AIMessageManager` et s'affiche quand un travail d'assistant s'arrête avec cette erreur.

- **AIMessageErrorWrongSeason** hérite de `AIMessage` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIMessageErrorWrongSeason.new(customMt: any)` | 16 | ✍ Constructeur du message d'erreur IA signifiant : le travail est impossible à la saison actuelle. Hérite de `AIMessage` et n'ajoute aucun état. |
| `AIMessageErrorWrongSeason:getI18NText()` | 23 | ✍ Renvoie le texte localisé de la clé `ai_messageErrorWrongSeason` via `g_i18n`, utilisé par `AIMessage:getMessage`. |

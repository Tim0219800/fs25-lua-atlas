# ai/errors/AIMessageErrorImplementWrongWay.lua

*[English version](../../../../scripts/ai/errors/AIMessageErrorImplementWrongWay.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorImplementWrongWay.lua` — FS25 1.25.1.0

✍ Classe de message IA pour le cas où l'outil est attelé dans le mauvais sens. Elle étend `AIMessage`, est enregistrée dans `AIMessageManager` et s'affiche quand un travail d'assistant s'arrête avec cette erreur.

- **AIMessageErrorImplementWrongWay** hérite de `AIMessage` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIMessageErrorImplementWrongWay.new(customMt: any)` | 16 | ✍ Constructeur du message d'erreur IA signifiant : l'outil est attelé dans le mauvais sens. Hérite de `AIMessage` et n'ajoute aucun état. |
| `AIMessageErrorImplementWrongWay:getI18NText()` | 23 | ✍ Renvoie le texte localisé de la clé `ai_messageErrorImplementWrongWay` via `g_i18n`, utilisé par `AIMessage:getMessage`. |

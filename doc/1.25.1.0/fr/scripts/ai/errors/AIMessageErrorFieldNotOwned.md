# ai/errors/AIMessageErrorFieldNotOwned.lua

*[English version](../../../../scripts/ai/errors/AIMessageErrorFieldNotOwned.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorFieldNotOwned.lua` — FS25 1.25.1.0

✍ Classe de message IA pour le cas où le champ n'appartient pas à la ferme. Elle étend `AIMessage`, est enregistrée dans `AIMessageManager` et s'affiche quand un travail d'assistant s'arrête avec cette erreur.

- **AIMessageErrorFieldNotOwned** hérite de `AIMessage` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIMessageErrorFieldNotOwned.new(customMt: any)` | 16 | ✍ Constructeur du message d'erreur IA signifiant : le champ n'appartient pas à la ferme. Hérite de `AIMessage` et n'ajoute aucun état. |
| `AIMessageErrorFieldNotOwned:getI18NText()` | 23 | ✍ Renvoie le texte localisé de la clé `ai_messageErrorFieldNotOwned` via `g_i18n`, utilisé par `AIMessage:getMessage`. |

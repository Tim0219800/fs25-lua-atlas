# ai/errors/AIMessageErrorFieldNotReady.lua

*[English version](../../../../scripts/ai/errors/AIMessageErrorFieldNotReady.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorFieldNotReady.lua` — FS25 1.25.1.0

✍ Classe de message IA pour le cas où le champ n'est pas prêt pour le travail. Elle étend `AIMessage`, est enregistrée dans `AIMessageManager` et s'affiche quand un travail d'assistant s'arrête avec cette erreur.

- **AIMessageErrorFieldNotReady** hérite de `AIMessage` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIMessageErrorFieldNotReady.new(customMt: any)` | 16 | ✍ Constructeur du message d'erreur IA signifiant : le champ n'est pas prêt pour le travail. Hérite de `AIMessage` et n'ajoute aucun état. |
| `AIMessageErrorFieldNotReady:getI18NText()` | 23 | ✍ Renvoie le texte localisé de la clé `ai_messageErrorFieldNotReady` via `g_i18n`, utilisé par `AIMessage:getMessage`. |

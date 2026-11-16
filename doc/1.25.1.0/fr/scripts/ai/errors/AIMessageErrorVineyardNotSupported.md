# ai/errors/AIMessageErrorVineyardNotSupported.lua

*[English version](../../../../scripts/ai/errors/AIMessageErrorVineyardNotSupported.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorVineyardNotSupported.lua` — FS25 1.25.1.0

✍ Classe de message IA pour le cas où le vignoble n'est pas pris en charge par ce travail. Elle étend `AIMessage`, est enregistrée dans `AIMessageManager` et s'affiche quand un travail d'assistant s'arrête avec cette erreur.

- **AIMessageErrorVineyardNotSupported** hérite de `AIMessage` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIMessageErrorVineyardNotSupported.new(customMt: any)` | 16 | ✍ Constructeur du message d'erreur IA signifiant : le vignoble n'est pas pris en charge par ce travail. Hérite de `AIMessage` et n'ajoute aucun état. |
| `AIMessageErrorVineyardNotSupported:getI18NText()` | 23 | ✍ Renvoie le texte localisé de la clé `ai_messageErrorVineyardNotSupported` via `g_i18n`, utilisé par `AIMessage:getMessage`. |

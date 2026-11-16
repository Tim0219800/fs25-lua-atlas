# ai/errors/AIMessageErrorOutOfMoney.lua

*[English version](../../../../scripts/ai/errors/AIMessageErrorOutOfMoney.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorOutOfMoney.lua` — FS25 1.25.1.0

✍ Classe de message IA pour le cas où la ferme ne peut plus payer le travail. Elle étend `AIMessage`, est enregistrée dans `AIMessageManager` et s'affiche quand un travail d'assistant s'arrête avec cette erreur.

- **AIMessageErrorOutOfMoney** hérite de `AIMessage` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIMessageErrorOutOfMoney.new(customMt: any)` | 16 | ✍ Constructeur du message d'erreur IA signifiant : la ferme ne peut plus payer le travail. Hérite de `AIMessage` et n'ajoute aucun état. |
| `AIMessageErrorOutOfMoney:getI18NText()` | 23 | ✍ Renvoie le texte localisé de la clé `ai_messageErrorOutOfMoney` via `g_i18n`, utilisé par `AIMessage:getMessage`. |

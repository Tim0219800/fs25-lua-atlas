# ai/errors/AIMessageErrorNoFieldFound.lua

*[English version](../../../../scripts/ai/errors/AIMessageErrorNoFieldFound.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorNoFieldFound.lua` — FS25 1.25.1.0

✍ Classe de message IA pour le cas où aucun champ n'a été trouvé à la position de départ. Elle étend `AIMessage`, est enregistrée dans `AIMessageManager` et s'affiche quand un travail d'assistant s'arrête avec cette erreur.

- **AIMessageErrorNoFieldFound** hérite de `AIMessage` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIMessageErrorNoFieldFound.new(customMt: any)` | 16 | ✍ Constructeur du message d'erreur IA signifiant : aucun champ n'a été trouvé à la position de départ. Hérite de `AIMessage` et n'ajoute aucun état. |
| `AIMessageErrorNoFieldFound:getI18NText()` | 23 | ✍ Renvoie le texte localisé de la clé `ai_messageErrorNoFieldFound` via `g_i18n`, utilisé par `AIMessage:getMessage`. |

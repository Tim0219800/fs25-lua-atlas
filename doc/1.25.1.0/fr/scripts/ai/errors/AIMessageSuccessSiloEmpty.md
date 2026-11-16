# ai/errors/AIMessageSuccessSiloEmpty.lua

*[English version](../../../../scripts/ai/errors/AIMessageSuccessSiloEmpty.md)*

Source: `dataS/scripts/ai/errors/AIMessageSuccessSiloEmpty.lua` — FS25 1.25.1.0

✍ Classe de message IA pour une fin sans erreur où le silo est vide, donc le travail s'est arrêté. Elle étend `AIMessage` et signale `AIMessageType.OK`.

- **AIMessageSuccessSiloEmpty** hérite de `AIMessage` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIMessageSuccessSiloEmpty.new(customMt: any)` | 16 | ✍ Constructeur du message de succès signifiant : le silo est vide, donc le travail s'est arrêté. Hérite de `AIMessage`, sans état supplémentaire. |
| `AIMessageSuccessSiloEmpty:getI18NText()` | 23 | ✍ Renvoie le texte localisé de la clé `ai_messageSuccessSiloEmpty` via `g_i18n`. |
| `AIMessageSuccessSiloEmpty:getType()` | 29 | ✍ Renvoie `AIMessageType.OK`, ce qui marque le message comme une issue sans erreur. |

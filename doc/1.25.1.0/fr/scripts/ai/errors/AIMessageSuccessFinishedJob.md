# ai/errors/AIMessageSuccessFinishedJob.lua

*[English version](../../../../scripts/ai/errors/AIMessageSuccessFinishedJob.md)*

Source: `dataS/scripts/ai/errors/AIMessageSuccessFinishedJob.lua` — FS25 1.25.1.0

✍ Classe de message IA pour une fin sans erreur où le travail s'est terminé avec succès. Elle étend `AIMessage` et signale `AIMessageType.OK`.

- **AIMessageSuccessFinishedJob** hérite de `AIMessage` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIMessageSuccessFinishedJob.new(customMt: any)` | 16 | ✍ Constructeur du message de succès signifiant : le travail s'est terminé avec succès. Hérite de `AIMessage`, sans état supplémentaire. |
| `AIMessageSuccessFinishedJob:getI18NText()` | 23 | ✍ Renvoie le texte localisé de la clé `ai_messageSuccessFinishedJob` via `g_i18n`. |
| `AIMessageSuccessFinishedJob:getType()` | 29 | ✍ Renvoie `AIMessageType.OK`, ce qui marque le message comme une issue sans erreur. |

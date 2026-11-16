# ai/errors/AIMessageSuccessStoppedByUser.lua

*[English version](../../../../scripts/ai/errors/AIMessageSuccessStoppedByUser.md)*

Source: `dataS/scripts/ai/errors/AIMessageSuccessStoppedByUser.lua` — FS25 1.25.1.0

✍ Classe de message IA pour une fin sans erreur où le joueur a arrêté le travail. Elle étend `AIMessage` et signale `AIMessageType.OK`.

- **AIMessageSuccessStoppedByUser** hérite de `AIMessage` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIMessageSuccessStoppedByUser.new(customMt: any)` | 16 | ✍ Constructeur du message de succès signifiant : le joueur a arrêté le travail. Hérite de `AIMessage`, sans état supplémentaire. |
| `AIMessageSuccessStoppedByUser:getI18NText()` | 23 | ✍ Renvoie le texte localisé de la clé `ai_messageSuccessStoppedByUser` via `g_i18n`. |
| `AIMessageSuccessStoppedByUser:getType()` | 29 | ✍ Renvoie `AIMessageType.OK`, ce qui marque le message comme une issue sans erreur. |

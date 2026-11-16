# ai/errors/AIMessage.lua

*[English version](../../../../scripts/ai/errors/AIMessage.md)*

Source: `dataS/scripts/ai/errors/AIMessage.lua` — FS25 1.25.1.0

✍ Classe de base des messages affichés quand un travail d'assistant IA se termine, en erreur ou avec succès. Les sous-classes fournissent le texte localisé via `getI18NText` et peuvent redéfinir le type et la sérialisation réseau ; `AIMessageManager` les enregistre et `AIJobStopEvent` les transmet.

- **AIMessage** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIMessage.new(customMt: any)` | 16 | ✍ Crée une instance de message avec la métatable optionnelle donnée, ce qui permet aux sous-classes de la réutiliser. |
| `AIMessage:getMessage(job: any)` | 23 | ✍ Formate le texte de `self:getI18NText()` avec le nom d'assistant du job donné, ou "Unknown" si job ou nom est nil. Renvoie une chaîne vide s'il n'y a pas de texte. `getI18NText` n'est pas défini dans cette classe. |
| `AIMessage:getType()` | 43 | ✍ Renvoie `AIMessageType.ERROR` par défaut ; les sous-classes de succès le redéfinissent. |
| `AIMessage:readStream(streamId: any, connection: any)` | 49 | ✍ Point d'extension vide pour lire les données du message depuis un flux réseau ; les sous-classes avec état le redéfinissent. |
| `AIMessage:writeStream(streamId: any, connection: any)` | 54 | ✍ Point d'extension vide pour écrire les données du message dans un flux réseau ; les sous-classes avec état le redéfinissent. |

# ai/errors/AIMessageErrorUnloadingStationDeleted.lua

*[English version](../../../../scripts/ai/errors/AIMessageErrorUnloadingStationDeleted.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorUnloadingStationDeleted.lua` — FS25 1.25.1.0

✍ Classe de message IA pour le cas où la station de déchargement a été supprimée. Elle étend `AIMessage`, est enregistrée dans `AIMessageManager` et s'affiche quand un travail d'assistant s'arrête avec cette erreur.

- **AIMessageErrorUnloadingStationDeleted** hérite de `AIMessage` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIMessageErrorUnloadingStationDeleted.new(customMt: any)` | 16 | ✍ Constructeur du message d'erreur IA signifiant : la station de déchargement a été supprimée. Hérite de `AIMessage` et n'ajoute aucun état. |
| `AIMessageErrorUnloadingStationDeleted:getI18NText()` | 23 | ✍ Renvoie le texte localisé de la clé `ai_messageErrorUnloadingStationDeleted` via `g_i18n`, utilisé par `AIMessage:getMessage`. |

# ai/errors/AIMessageErrorLoadingStationDeleted.lua

*[English version](../../../../scripts/ai/errors/AIMessageErrorLoadingStationDeleted.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorLoadingStationDeleted.lua` — FS25 1.25.1.0

✍ Classe de message IA pour le cas où la station de chargement a été supprimée. Elle étend `AIMessage`, est enregistrée dans `AIMessageManager` et s'affiche quand un travail d'assistant s'arrête avec cette erreur.

- **AIMessageErrorLoadingStationDeleted** hérite de `AIMessage` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIMessageErrorLoadingStationDeleted.new(customMt: any)` | 16 | ✍ Constructeur du message d'erreur IA signifiant : la station de chargement a été supprimée. Hérite de `AIMessage` et n'ajoute aucun état. |
| `AIMessageErrorLoadingStationDeleted:getI18NText()` | 23 | ✍ Renvoie le texte localisé de la clé `ai_messageErrorLoadingStationDeleted` via `g_i18n`, utilisé par `AIMessage:getMessage`. |

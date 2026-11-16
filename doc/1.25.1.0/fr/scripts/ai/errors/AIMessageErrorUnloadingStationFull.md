# ai/errors/AIMessageErrorUnloadingStationFull.lua

*[English version](../../../../scripts/ai/errors/AIMessageErrorUnloadingStationFull.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorUnloadingStationFull.lua` — FS25 1.25.1.0

✍ Classe de message IA pour le cas où la station de déchargement est pleine. Elle étend `AIMessage`, est enregistrée dans `AIMessageManager` et s'affiche quand un travail d'assistant s'arrête avec cette erreur.

- **AIMessageErrorUnloadingStationFull** hérite de `AIMessage` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIMessageErrorUnloadingStationFull.new(customMt: any)` | 16 | ✍ Constructeur du message d'erreur IA signifiant : la station de déchargement est pleine. Hérite de `AIMessage` et n'ajoute aucun état. |
| `AIMessageErrorUnloadingStationFull:getI18NText()` | 23 | ✍ Renvoie le texte localisé de la clé `ai_messageErrorUnloadingStationFull` via `g_i18n`, utilisé par `AIMessage:getMessage`. |

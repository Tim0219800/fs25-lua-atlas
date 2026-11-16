# ai/errors/AIMessageErrorGraintankIsFull.lua

*[English version](../../../../scripts/ai/errors/AIMessageErrorGraintankIsFull.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorGraintankIsFull.lua` — FS25 1.25.1.0

✍ Classe de message IA pour le cas où la trémie à grain est pleine. Elle étend `AIMessage`, est enregistrée dans `AIMessageManager` et s'affiche quand un travail d'assistant s'arrête avec cette erreur.

- **AIMessageErrorGraintankIsFull** hérite de `AIMessage` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIMessageErrorGraintankIsFull.new(customMt: any)` | 16 | ✍ Constructeur du message d'erreur IA signifiant : la trémie à grain est pleine. Hérite de `AIMessage` et n'ajoute aucun état. |
| `AIMessageErrorGraintankIsFull:getI18NText()` | 23 | ✍ Renvoie le texte localisé de la clé `ai_messageErrorTankIsFull` via `g_i18n`, utilisé par `AIMessage:getMessage`. |

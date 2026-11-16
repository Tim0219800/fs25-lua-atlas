# ai/errors/AIMessageErrorOutOfFill.lua

*[English version](../../../../scripts/ai/errors/AIMessageErrorOutOfFill.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorOutOfFill.lua` — FS25 1.25.1.0

✍ Classe de message IA pour le cas où le véhicule n'a plus de matière à utiliser. Elle étend `AIMessage`, est enregistrée dans `AIMessageManager` et s'affiche quand un travail d'assistant s'arrête avec cette erreur.

- **AIMessageErrorOutOfFill** hérite de `AIMessage` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIMessageErrorOutOfFill.new(customMt: any)` | 16 | ✍ Constructeur du message d'erreur IA signifiant : le véhicule n'a plus de matière à utiliser. Hérite de `AIMessage` et n'ajoute aucun état. |
| `AIMessageErrorOutOfFill:getI18NText()` | 23 | ✍ Renvoie le texte localisé de la clé `ai_messageErrorOutOfFill` via `g_i18n`, utilisé par `AIMessage:getMessage`. |

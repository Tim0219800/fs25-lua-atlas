# ai/errors/AIMessageErrorNoValidFillTypeLoaded.lua

*[English version](../../../../scripts/ai/errors/AIMessageErrorNoValidFillTypeLoaded.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorNoValidFillTypeLoaded.lua` — FS25 1.25.1.0

✍ Classe de message IA pour le cas où aucun type de remplissage valide n'est chargé. Elle étend `AIMessage`, est enregistrée dans `AIMessageManager` et s'affiche quand un travail d'assistant s'arrête avec cette erreur.

- **AIMessageErrorNoValidFillTypeLoaded** hérite de `AIMessage` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIMessageErrorNoValidFillTypeLoaded.new(customMt: any)` | 16 | ✍ Constructeur du message d'erreur IA signifiant : aucun type de remplissage valide n'est chargé. Hérite de `AIMessage` et n'ajoute aucun état. |
| `AIMessageErrorNoValidFillTypeLoaded:getI18NText()` | 23 | ✍ Renvoie le texte localisé de la clé `ai_messageErrorNoValidFillTypeLoaded` via `g_i18n`, utilisé par `AIMessage:getMessage`. |

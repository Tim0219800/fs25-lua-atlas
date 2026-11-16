# ai/errors/AIMessageErrorNoPalletsLoaded.lua

*[English version](../../../../scripts/ai/errors/AIMessageErrorNoPalletsLoaded.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorNoPalletsLoaded.lua` — FS25 1.25.1.0

✍ Classe de message IA pour le cas où aucune palette n'est chargée. Elle étend `AIMessage`, est enregistrée dans `AIMessageManager` et s'affiche quand un travail d'assistant s'arrête avec cette erreur.

- **AIMessageErrorNoPalletsLoaded** hérite de `AIMessage` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIMessageErrorNoPalletsLoaded.new(customMt: any)` | 16 | ✍ Constructeur du message d'erreur IA signifiant : aucune palette n'est chargée. Hérite de `AIMessage` et n'ajoute aucun état. |
| `AIMessageErrorNoPalletsLoaded:getI18NText()` | 23 | ✍ Renvoie le texte localisé de la clé `ai_messageErrorNoPalletsLoaded` via `g_i18n`, utilisé par `AIMessage:getMessage`. |
| `AIMessageErrorNoPalletsLoaded:getType()` | 29 | ✍ Renvoie `AIMessageType.ERROR`, valeur identique à celle de la classe de base : la redéfinition est redondante. |

# ai/errors/AIMessageErrorPalletsFull.lua

*[English version](../../../../scripts/ai/errors/AIMessageErrorPalletsFull.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorPalletsFull.lua` — FS25 1.25.1.0

✍ Classe de message IA pour le cas où le stockage de palettes est plein. Elle étend `AIMessage`, est enregistrée dans `AIMessageManager` et s'affiche quand un travail d'assistant s'arrête avec cette erreur.

- **AIMessageErrorPalletsFull** hérite de `AIMessage` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIMessageErrorPalletsFull.new(customMt: any)` | 16 | ✍ Constructeur du message d'erreur IA signifiant : le stockage de palettes est plein. Hérite de `AIMessage` et n'ajoute aucun état. |
| `AIMessageErrorPalletsFull:getI18NText()` | 23 | ✍ Renvoie le texte localisé de la clé `ai_messageErrorPalletsFull` via `g_i18n`, utilisé par `AIMessage:getMessage`. |
| `AIMessageErrorPalletsFull:getType()` | 29 | ✍ Renvoie `AIMessageType.ERROR`, valeur identique à celle de la classe de base : la redéfinition est redondante. |

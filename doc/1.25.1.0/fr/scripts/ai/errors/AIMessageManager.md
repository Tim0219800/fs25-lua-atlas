# ai/errors/AIMessageManager.lua

*[English version](../../../../scripts/ai/errors/AIMessageManager.md)*

Source: `dataS/scripts/ai/errors/AIMessageManager.lua` — FS25 1.25.1.0

✍ Gestionnaire qui enregistre chaque classe de message IA sous un nom en majuscules et un index, et crée des instances à partir de cet index. `loadMapData` enregistre les 24 messages d'erreur et 3 de succès du jeu de base ; l'index est ce que `AIJobStopEvent` envoie sur le réseau.

- **AIMessageManager** (l.48)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIMessageManager.new(customMt: any) → table` | 53 | ✍ Crée l'instance du gestionnaire ; les tables ne sont remplies que plus tard par `loadMapData`. |
| `AIMessageManager:loadMapData(xmlFile: any, missionInfo: any, baseDirectory: any) → boolean` | 61 | ✍ Réinitialise les tables et enregistre tous les messages IA du jeu de base (ERROR_* et SUCCESS_*). L'ordre d'enregistrement définit les index réseau. Ne renvoie rien malgré la convention de chargement de carte. |
| `AIMessageManager:delete()` | 98 | ✍ Vide la liste des messages et les deux tables de recherche. |
| `AIMessageManager:registerMessage(name: any, classObject: any)` | 106 | ✍ Enregistre une classe de message sous un nom mis en majuscules. Renvoie nil avec un avertissement si le nom est invalide, déjà pris ou la classe nil ; sinon renvoie l'entrée. Les mods peuvent l'utiliser pour ajouter des messages. |
| `AIMessageManager:getMessageIndex(messageObject: any)` | 137 | ✍ Renvoie l'index d'enregistrement de la classe de l'objet message donné, ou nil si sa classe est inconnue. |
| `AIMessageManager:createMessage(messageIndex: any)` | 149 | ✍ Instancie la classe de message enregistrée à l'index en appelant son `new()` sans argument. Renvoie nil si l'index est nil ou inconnu. À noter : les classes qui exigent des arguments, comme `AIMessageErrorCouldNotPrepare`, reçoivent nil et s'appuient sur `readStream`. |

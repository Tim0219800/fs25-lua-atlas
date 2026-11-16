# ai/errors/AIMessageErrorCouldNotPrepare.lua

*[English version](../../../../scripts/ai/errors/AIMessageErrorCouldNotPrepare.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorCouldNotPrepare.lua` — FS25 1.25.1.0

✍ Message d'erreur IA pour un véhicule qui n'a pas pu être préparé avant le travail. Contrairement à la plupart, il porte une référence de véhicule, formate le texte avec le nom de l'assistant et celui du véhicule, et sérialise le véhicule sur le réseau.

- **AIMessageErrorCouldNotPrepare** hérite de `AIMessage` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIMessageErrorCouldNotPrepare.new(vehicle: any, customMt: any)` | 16 | ✍ Constructeur qui reçoit le véhicule non préparable et le stocke dans `self.vehicle`. |
| `AIMessageErrorCouldNotPrepare:getMessage(job: any)` | 26 | ✍ Construit le texte à partir de `getI18NText` (non défini dans ce fichier, NON VÉRIFIÉ), du nom d'assistant du job ("Unknown" si absent) et du nom du véhicule (vide si aucun). |
| `AIMessageErrorCouldNotPrepare:readStream(streamId: any, connection: any)` | 50 | ✍ Lit le véhicule comme objet réseau depuis le flux, pour que le client retrouve le même véhicule. |
| `AIMessageErrorCouldNotPrepare:writeStream(streamId: any, connection: any)` | 56 | ✍ Écrit le véhicule comme objet réseau dans le flux (pendant de `readStream`). |

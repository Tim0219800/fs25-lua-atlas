# animals/husbandry/placeables/events/HusbandryMeadowCreateEvent.lua

*[English version](../../../../../../scripts/animals/husbandry/placeables/events/HusbandryMeadowCreateEvent.md)*

Source: `dataS/scripts/animals/husbandry/placeables/events/HusbandryMeadowCreateEvent.lua` — FS25 1.25.1.0

✍ Événement réseau indiquant si la prairie d'un élevage est créée ou non, selon un booléen. Un client l'envoie au serveur, qui le rediffuse aux autres clients et l'applique localement.

- **HusbandryMeadowCreateEvent** hérite de `Event` (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HusbandryMeadowCreateEvent.emptyNew()` | 17 | ✍ Crée une instance d'événement vide que la couche réseau remplira dans `readStream`. |
| `HusbandryMeadowCreateEvent.new(placeable: any, createMeadow: any)` | 24 | ✍ Crée l'événement pour un placeable et un booléen indiquant si la prairie doit être créée. |
| `HusbandryMeadowCreateEvent:readStream(streamId: any, connection: any)` | 35 | ✍ Lit le placeable (objet-noeud) et le booléen de création dans le flux, puis exécute l'événement. |
| `HusbandryMeadowCreateEvent:writeStream(streamId: any, connection: any)` | 43 | ✍ Écrit le placeable comme objet-noeud et le booléen de création dans le flux. |
| `HusbandryMeadowCreateEvent:run(connection: any)` | 50 | ✍ Si le serveur le reçoit, le rediffuse aux autres clients. Quand le placeable est synchronisé, appelle `createMeadow(createMeadow, true)` dessus. |

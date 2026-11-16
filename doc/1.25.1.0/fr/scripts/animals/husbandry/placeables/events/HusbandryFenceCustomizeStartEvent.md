# animals/husbandry/placeables/events/HusbandryFenceCustomizeStartEvent.lua

*[English version](../../../../../../scripts/animals/husbandry/placeables/events/HusbandryFenceCustomizeStartEvent.md)*

Source: `dataS/scripts/animals/husbandry/placeables/events/HusbandryFenceCustomizeStartEvent.lua` — FS25 1.25.1.0

✍ Événement réseau annonçant qu'un joueur commence à personnaliser la clôture d'un placeable d'élevage. Envoyé par un client au serveur, qui le rediffuse aux autres clients et l'applique localement.

- **HusbandryFenceCustomizeStartEvent** hérite de `Event` (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HusbandryFenceCustomizeStartEvent.emptyNew()` | 17 | ✍ Crée une instance d'événement vide que la couche réseau remplira dans `readStream`. |
| `HusbandryFenceCustomizeStartEvent.new(placeable: any)` | 24 | ✍ Crée l'événement pour le placeable d'élevage donné. |
| `HusbandryFenceCustomizeStartEvent:readStream(streamId: any, connection: any)` | 34 | ✍ Lit le placeable comme objet-noeud dans le flux, puis exécute l'événement. |
| `HusbandryFenceCustomizeStartEvent:writeStream(streamId: any, connection: any)` | 42 | ✍ Écrit le placeable comme objet-noeud dans le flux. |
| `HusbandryFenceCustomizeStartEvent:run(connection: any)` | 48 | ✍ Si le serveur le reçoit, le rediffuse aux autres clients. Quand le placeable est synchronisé, retrouve l'utilisateur émetteur (serveur seulement) et appelle `startFenceCustomization(user, true)`. |

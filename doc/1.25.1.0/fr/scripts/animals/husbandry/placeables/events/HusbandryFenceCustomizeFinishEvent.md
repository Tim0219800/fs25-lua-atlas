# animals/husbandry/placeables/events/HusbandryFenceCustomizeFinishEvent.lua

*[English version](../../../../../../scripts/animals/husbandry/placeables/events/HusbandryFenceCustomizeFinishEvent.md)*

Source: `dataS/scripts/animals/husbandry/placeables/events/HusbandryFenceCustomizeFinishEvent.lua` — FS25 1.25.1.0

✍ Événement réseau annonçant qu'un joueur a terminé la personnalisation de la clôture d'un placeable d'élevage, avec un indicateur de réussite. Un client l'envoie au serveur, qui le rediffuse aux autres clients et l'applique localement.

- **HusbandryFenceCustomizeFinishEvent** hérite de `Event` (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HusbandryFenceCustomizeFinishEvent.emptyNew()` | 17 | ✍ Crée une instance d'événement vide que la couche réseau remplira dans `readStream`. |
| `HusbandryFenceCustomizeFinishEvent.new(placeable: any, success: any)` | 24 | ✍ Crée l'événement pour le placeable d'élevage donné et un booléen indiquant si la personnalisation a réussi. |
| `HusbandryFenceCustomizeFinishEvent:readStream(streamId: any, connection: any)` | 35 | ✍ Lit le placeable (objet-noeud) et le booléen de réussite dans le flux, puis exécute l'événement. |
| `HusbandryFenceCustomizeFinishEvent:writeStream(streamId: any, connection: any)` | 44 | ✍ Écrit le placeable comme objet-noeud et le booléen de réussite dans le flux. |
| `HusbandryFenceCustomizeFinishEvent:run(connection: any)` | 51 | ✍ Si le serveur le reçoit, le rediffuse aux autres clients. Quand le placeable est synchronisé, retrouve l'utilisateur émetteur (serveur seulement) et appelle `finishFenceCustomization(user, success, true)`. |

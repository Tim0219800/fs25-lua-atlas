# animals/husbandry/placeables/events/HusbandryFenceUpdateEvent.lua

*[English version](../../../../../../scripts/animals/husbandry/placeables/events/HusbandryFenceUpdateEvent.md)*

Source: `dataS/scripts/animals/husbandry/placeables/events/HusbandryFenceUpdateEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui demande au destinataire de reconstruire la clôture d'un placeable d'élevage, en supprimant éventuellement d'abord ses segments personnalisables. Le fichier n'indique ni l'émetteur ni le sens d'envoi (NON VÉRIFIÉ).

- **HusbandryFenceUpdateEvent** hérite de `Event` (l.6)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HusbandryFenceUpdateEvent.emptyNew()` | 12 | ✍ Crée une instance d'événement vide que la couche réseau remplira dans `readStream`. |
| `HusbandryFenceUpdateEvent.new(placeable: any, deleteCustomizableSegments: any)` | 19 | ✍ Crée l'événement pour un placeable et un indicateur précisant s'il faut supprimer les segments de clôture personnalisables. |
| `HusbandryFenceUpdateEvent:readStream(streamId: any, connection: any)` | 30 | ✍ Lit le placeable (objet-noeud) et l'indicateur de suppression dans le flux, puis exécute l'événement. |
| `HusbandryFenceUpdateEvent:writeStream(streamId: any, connection: any)` | 39 | ✍ Écrit le placeable comme objet-noeud et l'indicateur de suppression dans le flux. |
| `HusbandryFenceUpdateEvent:run(connection: any)` | 46 | ✍ Quand le placeable est synchronisé, appelle éventuellement `deleteCustomizableSegments()`, puis toujours `finalizeHusbandryFence()`. Aucune rediffusion n'est faite ici. |

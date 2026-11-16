# internalMods/FS25_precisionFarming/scripts/events/PurchaseSoilMapsEvent.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/events/PurchaseSoilMapsEvent.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/events/PurchaseSoilMapsEvent.lua` — FS25 1.25.1.0

✍ Événement réseau (sous-classe de Event) envoyé par un client pour acheter les cartes de sol d'une parcelle. Le serveur effectue l'achat via l'objet soilMap de g_precisionFarming.

- **PurchaseSoilMapsEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PurchaseSoilMapsEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de PurchaseSoilMapsEvent avec la métatable Event ; la couche réseau l'appelle avant que readStream ne remplisse les champs. |
| `PurchaseSoilMapsEvent.new(farmlandId: table)` | 22 | ✍ Crée l'événement pour un id de parcelle. |
| `PurchaseSoilMapsEvent:readStream(streamId: integer, connection: Connection)` | 32 | ✍ Côté serveur : lit l'id de parcelle, puis appelle run. |
| `PurchaseSoilMapsEvent:writeStream(streamId: integer, connection: Connection)` | 41 | ✍ Côté client : écrit l'id de parcelle. |
| `PurchaseSoilMapsEvent:run(connection: Connection)` | 48 | ✍ S'exécute uniquement sur le serveur : appelle g_precisionFarming.soilMap:purchaseSoilMaps pour la parcelle, puis updatePrecisionFarmingOverlays. Rien n'est diffusé ici. |

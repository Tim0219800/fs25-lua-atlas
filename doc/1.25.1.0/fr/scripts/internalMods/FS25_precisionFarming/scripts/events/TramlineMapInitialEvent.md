# internalMods/FS25_precisionFarming/scripts/events/TramlineMapInitialEvent.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/events/TramlineMapInitialEvent.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/events/TramlineMapInitialEvent.lua` — FS25 1.25.1.0

✍ Événement réseau (sous-classe de Event) qui envoie tous les réglages de traces de jalonnement par parcelle (largeur de travail, direction de travail, espacement) du serveur vers un client qui rejoint.

- **TramlineMapInitialEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TramlineMapInitialEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de TramlineMapInitialEvent avec la métatable Event ; la couche réseau l'appelle avant que readStream ne remplisse les champs. |
| `TramlineMapInitialEvent.new(farmlandTramlineStates: table)` | 22 | ✍ Crée l'événement avec une table d'états de jalonnement indexée par id de parcelle. |
| `TramlineMapInitialEvent:readStream(streamId: integer, connection: Connection)` | 33 | ✍ Côté client : lit un nombre de parcelles, puis pour chacune son id et trois flottants 32 bits (workingWidth, workDirection, spacing) ; puis appelle run. |
| `TramlineMapInitialEvent:writeStream(streamId: integer, connection: Connection)` | 54 | ✍ Côté serveur : écrit le nombre de parcelles, puis chaque id de parcelle avec ses trois valeurs flottantes. |
| `TramlineMapInitialEvent:run(connection: Connection)` | 69 | ✍ Remplace g_precisionFarming.tramlineMap.farmlandTramlineStates par la table reçue, si la carte de jalonnement existe. |

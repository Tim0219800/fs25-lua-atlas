# vehicles/specializations/events/WaterTrailerSetIsFillingEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/WaterTrailerSetIsFillingEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/WaterTrailerSetIsFillingEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui synchronise le remplissage en cours d'une citerne à eau entre serveur et clients. Fait partie des événements des spécialisations de véhicule ; le récepteur n'agit que si l'objet cible est synchronisé.

- **WaterTrailerSetIsFillingEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WaterTrailerSetIsFillingEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide avec la métatable de l'événement, utilisée quand la couche réseau reçoit cet événement. |
| `WaterTrailerSetIsFillingEvent.new(vehicle: table, isFilling: boolean)` | 23 | ✍ Construit l'événement avec les données à envoyer (un objet nœud et un booléen de remplissage) ; elles sont conservées sur l'instance pour `writeStream`. |
| `WaterTrailerSetIsFillingEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Lit un objet nœud et un booléen de remplissage depuis le flux, puis appelle `run(connection)`. |
| `WaterTrailerSetIsFillingEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Écrit un objet nœud et un booléen de remplissage dans le flux (même ordre que `readStream`). |
| `WaterTrailerSetIsFillingEvent:run(connection: Connection)` | 52 | ✍ Applique l'événement côté récepteur : sur le serveur, se retransmet, puis appelle `setIsWaterTrailerFilling(indicateur, true)` sur le véhicule s'il est synchronisé. |
| `WaterTrailerSetIsFillingEvent.sendEvent(vehicle: table, isFilling: boolean, noEventSend: boolean)` | 67 | ✍ Fonction utilitaire d'envoi : diffuse l'événement depuis le serveur, ou l'envoie au serveur quand elle est appelée sur un client. Ne fait rien si noEventSend est vrai. |

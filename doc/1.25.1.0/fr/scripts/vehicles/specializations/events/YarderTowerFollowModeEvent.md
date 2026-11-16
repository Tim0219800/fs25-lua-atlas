# vehicles/specializations/events/YarderTowerFollowModeEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/YarderTowerFollowModeEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/YarderTowerFollowModeEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui synchronise le mode de suivi du chariot d'une tour de débardage par câble (valeur sur 2 bits). Fait partie des événements des spécialisations de véhicule ; le récepteur n'agit que si l'objet cible est synchronisé.

- **YarderTowerFollowModeEvent** hérite de `Event` (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `YarderTowerFollowModeEvent.emptyNew() → table` | 20 | ✍ Crée une instance d'événement vide avec la métatable de l'événement, utilisée quand la couche réseau reçoit cet événement. |
| `YarderTowerFollowModeEvent.new(object: table, state: table) → table` | 30 | ✍ Construit l'événement avec les données à envoyer (un objet nœud et un mode de suivi sur 2 bits) ; elles sont conservées sur l'instance pour `writeStream`. |
| `YarderTowerFollowModeEvent:readStream(streamId: integer, connection: Connection)` | 42 | ✍ Lit un objet nœud et un mode de suivi sur 2 bits depuis le flux, puis appelle `run(connection)`. |
| `YarderTowerFollowModeEvent:writeStream(streamId: integer, connection: Connection)` | 52 | ✍ Écrit un objet nœud et un mode de suivi sur 2 bits dans le flux (même ordre que `readStream`). |
| `YarderTowerFollowModeEvent:run(connection: Connection)` | 60 | ✍ Applique l'événement côté récepteur : sur le serveur, se retransmet, puis appelle `setYarderCarriageFollowMode(état, connexion, true)` sur l'objet s'il est synchronisé. |
| `YarderTowerFollowModeEvent.sendEvent(vehicle: table, state: integer, noEventSend: boolean)` | 75 | ✍ Fonction utilitaire d'envoi : diffuse l'événement depuis le serveur, ou l'envoie au serveur quand elle est appelée sur un client. Ne fait rien si noEventSend est vrai. |

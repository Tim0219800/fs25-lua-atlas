# vehicles/specializations/events/YarderTowerSetTargetEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/YarderTowerSetTargetEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/YarderTowerSetTargetEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui synchronise la cible du câble principal d'une tour de débardage : un indicateur d'activation et, s'il est actif, une position monde. Fait partie des événements des spécialisations de véhicule ; le récepteur n'agit que si l'objet cible est synchronisé.

- **YarderTowerSetTargetEvent** hérite de `Event` (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `YarderTowerSetTargetEvent.emptyNew() → table` | 20 | ✍ Crée une instance d'événement vide avec la métatable de l'événement, utilisée quand la couche réseau reçoit cet événement. |
| `YarderTowerSetTargetEvent.new(object: table, state: table, x: any, y: any, z: any) → table` | 30 | ✍ Construit l'événement avec les données à envoyer (un objet nœud, un booléen d'état et, seulement s'il est vrai, trois coordonnées float32) ; elles sont conservées sur l'instance pour `writeStream`. |
| `YarderTowerSetTargetEvent:readStream(streamId: integer, connection: Connection)` | 45 | ✍ Lit un objet nœud, un booléen d'état et, seulement s'il est vrai, trois coordonnées float32 depuis le flux, puis appelle `run(connection)`. |
| `YarderTowerSetTargetEvent:writeStream(streamId: integer, connection: Connection)` | 61 | ✍ Écrit un objet nœud, un booléen d'état et, seulement s'il est vrai, trois coordonnées float32 dans le flux (même ordre que `readStream`). |
| `YarderTowerSetTargetEvent:run(connection: Connection)` | 73 | ✍ Applique l'événement côté récepteur : sur le serveur, se retransmet, puis stocke les coordonnées comme cible du câble principal dans `spec_yarderTower`, la marque valide et appelle `setYarderTargetActive(état, true)`. |
| `YarderTowerSetTargetEvent.sendEvent(vehicle: table, state: boolean, x: boolean, y: any, z: any, noEventSend: boolean)` | 93 | ✍ Fonction utilitaire d'envoi : diffuse l'événement depuis le serveur, ou l'envoie au serveur quand elle est appelée sur un client. Ne fait rien si noEventSend est vrai. |

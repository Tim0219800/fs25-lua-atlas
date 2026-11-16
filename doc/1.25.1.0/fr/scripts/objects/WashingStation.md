# objects/WashingStation.lua

*[English version](../../../scripts/objects/WashingStation.md)*

Source: `dataS/scripts/objects/WashingStation.lua` — FS25 1.25.1.0

✍ Station de lavage de véhicules : ce fichier déclare seulement le schéma XML (noeud de trigger, durée, prix du lavage, sons, effets) et un activatable permettant au joueur de lancer un lavage. Le lavage lui-même (startWashing, effets, paiement) n'est pas dans ce fichier et reste NON VÉRIFIÉ ici. Étend Object.

- **WashingStation** hérite de `Object` (l.13)
- **WashingStationActivatable** (l.244)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WashingStation.registerXMLPaths(schema: any, basePath: any)` | 19 | ✍ Enregistre les chemins XML : noeud de trigger véhicule, `#washDuration`, `#pricePerWash`, les chemins d'échantillon sonore `active` et les chemins d'effets sous `.effects`. |
| `WashingStationActivatable.new(washingStation: any, triggerNode: any)` | 248 | ✍ Crée un activatable pour une station de lavage et son noeud de trigger, avec le texte localisé `action_startWashing` comme invite. |
| `WashingStationActivatable:getIsActivatable()` | 260 | ✍ Indique si la ferme du joueur local a accès à la station de lavage selon le gestionnaire d'accès de la mission. |
| `WashingStationActivatable:run()` | 266 | ✍ Côté client : envoie au serveur un `WashingStationEvent` pour cette station. |
| `WashingStationActivatable:getDistance(x: any, y: any, z: any)` | 272 | ✍ Renvoie la distance entre le point donné et la position monde du noeud de trigger. |

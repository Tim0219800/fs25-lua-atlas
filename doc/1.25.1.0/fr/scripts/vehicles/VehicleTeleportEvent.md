# vehicles/VehicleTeleportEvent.lua

*[English version](../../../scripts/vehicles/VehicleTeleportEvent.md)*

Source: `dataS/scripts/vehicles/VehicleTeleportEvent.lua` — FS25 1.25.1.0

✍ Événement réseau demandant au serveur de téléporter un véhicule à une position et un cap du monde. Il utilise le canal principal et le gestionnaire n'agit que si le récepteur est le serveur. Le fichier ne contient ici que le constructeur vide et `run`, pas de fonctions de flux.

- **VehicleTeleportEvent** hérite de `Event` (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleTeleportEvent.emptyNew() → table` | 18 | ✍ Crée une instance d'événement vide sur le canal réseau principal, utilisée avant la lecture d'un flux. |
| `VehicleTeleportEvent:run(connection: Connection)` | 53 | ✍ Uniquement côté serveur, si le véhicule existe et est synchronisé, appelle `g_currentMission:teleportVehicle` avec x, z et rotY stockés. Ignoré s'il est reçu par un client. |

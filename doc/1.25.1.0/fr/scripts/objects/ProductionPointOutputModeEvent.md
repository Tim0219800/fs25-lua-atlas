# objects/ProductionPointOutputModeEvent.lua

*[English version](../../../scripts/objects/ProductionPointOutputModeEvent.md)*

Source: `dataS/scripts/objects/ProductionPointOutputModeEvent.lua` — FS25 1.25.1.0

✍ Événement réseau signalant que le mode de distribution de sortie d'un type de remplissage d'un point de production a changé (voir ProductionPoint.OUTPUT_MODE, défini hors de ce dump). Un client l'envoie au serveur, qui l'applique et le rediffuse aux autres clients.

- **ProductionPointOutputModeEvent** hérite de `Event` (l.6)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ProductionPointOutputModeEvent.emptyNew() → table` | 13 | ✍ Crée une instance d'événement vide, utilisée lors de la lecture depuis un flux. |
| `ProductionPointOutputModeEvent.new(productionPoint: any, outputFillTypeId: any, outputMode: any)` | 20 | ✍ Crée l'événement avec le point de production, l'id du type de remplissage de sortie et le mode de sortie. |
| `ProductionPointOutputModeEvent:readStream(streamId: any, connection: any)` | 30 | ✍ Lit l'objet point de production, l'id du type de remplissage et le mode depuis le flux, puis exécute l'événement. |
| `ProductionPointOutputModeEvent:writeStream(streamId: any, connection: any)` | 39 | ✍ Écrit l'objet point de production, l'id du type de remplissage et le mode dans le flux. |
| `ProductionPointOutputModeEvent:run(connection: any)` | 47 | ✍ Sur le serveur, rediffuse l'événement aux autres clients ; puis, si le point de production existe encore, appelle setOutputDistributionMode avec l'indicateur sans événement pour éviter un nouvel envoi. |
| `ProductionPointOutputModeEvent.sendEvent(productionPoint: any, outputFillTypeId: any, outputMode: any, noEventSend: any)` | 59 | ✍ Envoie le changement sauf si noEventSend est true : le serveur le diffuse à tous les clients, un client l'envoie au serveur. |

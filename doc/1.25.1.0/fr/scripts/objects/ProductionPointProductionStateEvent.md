# objects/ProductionPointProductionStateEvent.lua

*[English version](../../../scripts/objects/ProductionPointProductionStateEvent.md)*

Source: `dataS/scripts/objects/ProductionPointProductionStateEvent.lua` — FS25 1.25.1.0

✍ Événement réseau signalant qu'une production d'un point de production a été activée ou désactivée, identifiée par son id texte. Un client l'envoie au serveur, qui l'applique et le rediffuse aux autres clients.

- **ProductionPointProductionStateEvent** hérite de `Event` (l.6)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ProductionPointProductionStateEvent.emptyNew() → table` | 13 | ✍ Crée une instance d'événement vide, utilisée lors de la lecture depuis un flux. |
| `ProductionPointProductionStateEvent.new(productionPoint: any, productionId: any, isEnabled: any)` | 20 | ✍ Crée l'événement avec le point de production, l'id texte de la production et l'indicateur d'activation. |
| `ProductionPointProductionStateEvent:readStream(streamId: any, connection: any)` | 30 | ✍ Lit l'objet point de production, l'id texte de la production et l'indicateur d'activation depuis le flux, puis exécute l'événement. |
| `ProductionPointProductionStateEvent:writeStream(streamId: any, connection: any)` | 39 | ✍ Écrit l'objet point de production, l'id texte de la production et l'indicateur d'activation dans le flux. |
| `ProductionPointProductionStateEvent:run(connection: any)` | 47 | ✍ Sur le serveur, rediffuse l'événement aux autres clients ; puis, si le point de production existe, appelle setProductionState avec l'indicateur sans événement. |
| `ProductionPointProductionStateEvent.sendEvent(productionPoint: any, productionId: any, isEnabled: any, noEventSend: any)` | 59 | ✍ Envoie le changement sauf si noEventSend est true : le serveur le diffuse à tous les clients, un client l'envoie au serveur. |

# objects/ProductionPointProductionStatusEvent.lua

*[English version](../../../scripts/objects/ProductionPointProductionStatusEvent.md)*

Source: `dataS/scripts/objects/ProductionPointProductionStatusEvent.lua` — FS25 1.25.1.0

✍ Événement réseau transportant le statut d'une production d'un point de production, identifiée par son index dans la liste des productions (envoyé sur 8 bits). Un client l'envoie au serveur, qui l'applique et le rediffuse aux autres clients. Les valeurs de statut viennent de constantes de ProductionPoint absentes de ce dump.

- **ProductionPointProductionStatusEvent** hérite de `Event` (l.6)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ProductionPointProductionStatusEvent.emptyNew() → table` | 13 | ✍ Crée une instance d'événement vide, utilisée lors de la lecture depuis un flux. |
| `ProductionPointProductionStatusEvent.new(productionPoint: ProductionPoint, productionIndex: integer, status: integer) → ProductionPointProductionStatusEvent` | 24 | ✍ Crée l'événement avec le point de production, l'index de la production et la valeur de statut. |
| `ProductionPointProductionStatusEvent:readStream(streamId: any, connection: any)` | 34 | ✍ Lit l'objet point de production, l'index de la production (8 bits) et le statut depuis le flux, puis exécute l'événement. |
| `ProductionPointProductionStatusEvent:writeStream(streamId: any, connection: any)` | 43 | ✍ Écrit l'objet point de production, l'index de la production (8 bits) et le statut dans le flux. |
| `ProductionPointProductionStatusEvent:run(connection: any)` | 51 | ✍ Sur le serveur, rediffuse l'événement ; puis retrouve la production par son index et appelle setProductionStatus avec l'indicateur sans événement. À noter : aucune vérification que l'index correspond à une production existante. |
| `ProductionPointProductionStatusEvent.sendEvent(productionPoint: any, productionIndex: any, status: any, noEventSend: any)` | 64 | ✍ Envoie le changement sauf si noEventSend est true : le serveur le diffuse à tous les clients, un client l'envoie au serveur. |

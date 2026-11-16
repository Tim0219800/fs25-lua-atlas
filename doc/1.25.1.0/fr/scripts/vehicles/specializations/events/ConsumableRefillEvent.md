# vehicles/specializations/events/ConsumableRefillEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/ConsumableRefillEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/ConsumableRefillEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `ConsumableRefillEvent` (hérite de `Event`) qui demande le remplissage des emplacements de stockage et de consommation d'un véhicule, en facturant la ferme. Elle transporte le véhicule, un index de type de consommable (uint8) et un index de variante (`ConsumableManager.NUM_VARIATION_BITS` bits). Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **ConsumableRefillEvent** hérite de `Event` (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ConsumableRefillEvent.emptyNew() → table` | 20 | ✍ Crée une instance vide de `ConsumableRefillEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `ConsumableRefillEvent.new(object: table, typeIndex: table, variationIndex: any) → table` | 30 | ✍ Crée l'événement avec ses données : le véhicule, un index de type de consommable (uint8) et un index de variante (`ConsumableManager.NUM_VARIATION_BITS` bits). |
| `ConsumableRefillEvent:readStream(streamId: integer, connection: Connection)` | 43 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule, un index de type de consommable (uint8) et un index de variante (`ConsumableManager.NUM_VARIATION_BITS` bits)), puis appelle `run`. |
| `ConsumableRefillEvent:writeStream(streamId: integer, connection: Connection)` | 57 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule, un index de type de consommable (uint8) et un index de variante (`ConsumableManager.NUM_VARIATION_BITS` bits)). |
| `ConsumableRefillEvent:run(connection: Connection)` | 66 | ✍ Exécute l'événement côté réception : fixe la variante consommée, ajoute des niveaux de remplissage aux emplacements de stockage et de consommation, puis débite dépenses et argent (`MoneyType.PURCHASE_CONSUMABLES`) selon le prix de la variante s'il est positif. |
| `ConsumableRefillEvent.sendEvent(vehicle: table, typeIndex: integer, variationIndex: integer)` | 94 | ✍ Fonction utilitaire d'envoi : le serveur le diffuse, un client l'envoie au serveur. Elle n'a pas de paramètre `noEventSend`. |

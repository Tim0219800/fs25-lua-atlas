# vehicles/specializations/events/PalletFillerBuyPalletEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/PalletFillerBuyPalletEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/PalletFillerBuyPalletEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `PalletFillerBuyPalletEvent` (hérite de `Event`) qui réplique l'achat de palettes pour un remplisseur de palettes. Elle transporte uniquement le véhicule. Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **PalletFillerBuyPalletEvent** hérite de `Event` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PalletFillerBuyPalletEvent.emptyNew() → table` | 19 | ✍ Crée une instance vide de `PalletFillerBuyPalletEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `PalletFillerBuyPalletEvent.new(object: table) → table` | 29 | ✍ Crée l'événement avec ses données : uniquement le véhicule. |
| `PalletFillerBuyPalletEvent:readStream(streamId: integer, connection: Connection)` | 40 | ✍ Lit les données de l'événement depuis le flux réseau (uniquement le véhicule), puis appelle `run`. |
| `PalletFillerBuyPalletEvent:writeStream(streamId: integer, connection: Connection)` | 50 | ✍ Écrit les données de l'événement dans le flux réseau (uniquement le véhicule). |
| `PalletFillerBuyPalletEvent:run(connection: Connection)` | 57 | ✍ Exécute l'événement côté réception : sur le serveur, retransmet l'événement puis appelle `buyPalletFillerPallets(true)` si la limite d'emplacements de palettes le permet, sinon envoie à l'émetteur un `BuyVehicleEvent` avec `STATE_TOO_MANY_PALLETS` ; sur un client, appelle simplement `buyPalletFillerPallets(true)`. |

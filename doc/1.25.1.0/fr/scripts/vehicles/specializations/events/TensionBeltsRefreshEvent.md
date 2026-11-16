# vehicles/specializations/events/TensionBeltsRefreshEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/TensionBeltsRefreshEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/TensionBeltsRefreshEvent.lua` — FS25 1.25.1.0

✍ Événement réseau demandant à tous les participants de recalculer les sangles de tension d'un véhicule ; il ne transporte que le véhicule. Fait partie des événements des spécialisations de véhicule ; le récepteur n'agit que si l'objet cible est synchronisé.

- **TensionBeltsRefreshEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TensionBeltsRefreshEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide avec la métatable de l'événement, utilisée quand la couche réseau reçoit cet événement. |
| `TensionBeltsRefreshEvent.new(object: table)` | 24 | ✍ Construit l'événement avec les données à envoyer (uniquement l'objet nœud) ; elles sont conservées sur l'instance pour `writeStream`. |
| `TensionBeltsRefreshEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Lit uniquement l'objet nœud depuis le flux, puis appelle `run(connection)`. |
| `TensionBeltsRefreshEvent:writeStream(streamId: integer, connection: Connection)` | 43 | ✍ Écrit uniquement l'objet nœud dans le flux (même ordre que `readStream`). |
| `TensionBeltsRefreshEvent:run(connection: Connection)` | 50 | ✍ Applique l'événement côté récepteur : sur le serveur, se retransmet, puis appelle `refreshTensionBelts()` sur l'objet s'il est synchronisé. |

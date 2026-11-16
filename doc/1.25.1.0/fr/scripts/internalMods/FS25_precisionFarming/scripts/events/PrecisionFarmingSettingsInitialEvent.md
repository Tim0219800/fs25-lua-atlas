# internalMods/FS25_precisionFarming/scripts/events/PrecisionFarmingSettingsInitialEvent.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/events/PrecisionFarmingSettingsInitialEvent.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/events/PrecisionFarmingSettingsInitialEvent.lua` — FS25 1.25.1.0

✍ Événement réseau (sous-classe de Event) qui envoie à un client les valeurs actuelles de tous les réglages Precision Farming côté serveur, typiquement à sa connexion. Les réglages marqués isServerSetting sont écrits comme un booléen chacun, dans l'ordre de la liste.

- **PrecisionFarmingSettingsInitialEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PrecisionFarmingSettingsInitialEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de PrecisionFarmingSettingsInitialEvent avec la métatable Event ; la couche réseau l'appelle avant que readStream ne remplisse les champs. |
| `PrecisionFarmingSettingsInitialEvent.new(settings: table)` | 22 | ✍ Crée l'événement avec la liste de réglages à envoyer. |
| `PrecisionFarmingSettingsInitialEvent:readStream(streamId: integer, connection: Connection)` | 33 | ✍ Côté client : lit un booléen par réglage serveur dans setting.state, dans l'ordre, puis appelle run. |
| `PrecisionFarmingSettingsInitialEvent:writeStream(streamId: integer, connection: Connection)` | 49 | ✍ Côté serveur : écrit un booléen par réglage serveur, dans l'ordre de la liste. L'ordre doit correspondre à readStream. |
| `PrecisionFarmingSettingsInitialEvent:run(connection: Connection)` | 62 | ✍ Appelle onSettingChanged(setting, true) sur l'objet de réglages pour chaque réglage serveur afin que le client applique les valeurs reçues. |

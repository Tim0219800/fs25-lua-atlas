# internalMods/FS25_precisionFarming/scripts/events/PrecisionFarmingSettingsEvent.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/events/PrecisionFarmingSettingsEvent.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/events/PrecisionFarmingSettingsEvent.lua` — FS25 1.25.1.0

✍ Événement réseau (sous-classe de Event) qui propage un réglage Precision Farming modifié. Un réglage est identifié par son indice (settingIndexNumBits bits) plus un état booléen ; seuls les réglages booléens sont gérés.

- **PrecisionFarmingSettingsEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PrecisionFarmingSettingsEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de PrecisionFarmingSettingsEvent avec la métatable Event ; la couche réseau l'appelle avant que readStream ne remplisse les champs. |
| `PrecisionFarmingSettingsEvent.new(setting: table)` | 22 | ✍ Crée l'événement pour une table de réglage. |
| `PrecisionFarmingSettingsEvent:readStream(streamId: integer, connection: Connection)` | 32 | ✍ Lit l'indice du réglage et l'état booléen, écrit l'état dans le réglage correspondant de g_precisionFarming.precisionFarmingSettings, puis appelle run. |
| `PrecisionFarmingSettingsEvent:writeStream(streamId: integer, connection: Connection)` | 47 | ✍ Écrit l'indice du réglage et son état sous forme de booléen (toute valeur autre que true est écrite comme false). |
| `PrecisionFarmingSettingsEvent:run(connection: Connection)` | 57 | ✍ Côté réception. Le serveur rediffuse aux autres clients, puis chaque côté appelle precisionFarmingSettings:onSettingChanged(setting, true), sans nouvel événement. |
| `PrecisionFarmingSettingsEvent.sendEvent(setting: table, noEventSend: boolean)` | 70 | ✍ Point d'entrée pour synchroniser un réglage modifié. Serveur : diffuse à tous les clients ; client : l'envoie au serveur. Ne fait rien si noEventSend vaut true. |

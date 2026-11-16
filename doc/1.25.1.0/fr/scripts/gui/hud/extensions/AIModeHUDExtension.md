# gui/hud/extensions/AIModeHUDExtension.lua

*[English version](../../../../../scripts/gui/hud/extensions/AIModeHUDExtension.md)*

Source: `dataS/scripts/gui/hud/extensions/AIModeHUDExtension.lua` — FS25 1.25.1.0

✍ Panneau d'extension du HUD d'informations véhicule : affiche le mode IA choisi et l'état de l'IA d'un véhicule. C'est une classe simple (pas une sous-classe de HUDDisplay) instanciée par véhicule par le HUD ; seul le constructeur est défini ici, les autres méthodes viennent d'ailleurs (fichier NON VÉRIFIÉ).

- **AIModeHUDExtension** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIModeHUDExtension.new(vehicle: table, customMt: any)` | 16 | ✍ Construit l'extension pour le véhicule donné avec la priorité GS_PRIO_VERY_HIGH : crée les overlays de fond, une ligne de séparation, conserve le véhicule et ses spécialisations aiModeSelection et aiDrivable, et met en cache les textes localisés des modes et états, appelle storeScaledValues puis le rappelle à chaque changement du réglage d'échelle de l'interface via le message center. |

## Messages

- s'abonne à `MessageType.SETTING_CHANGED` (l.52)

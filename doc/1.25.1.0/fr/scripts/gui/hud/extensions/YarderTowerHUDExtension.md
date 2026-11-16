# gui/hud/extensions/YarderTowerHUDExtension.lua

*[English version](../../../../../scripts/gui/hud/extensions/YarderTowerHUDExtension.md)*

Source: `dataS/scripts/gui/hud/extensions/YarderTowerHUDExtension.lua` — FS25 1.25.1.0

✍ Panneau d'extension du HUD d'informations véhicule : affiche l'état d'une tour de câble-mât (yarder). C'est une classe simple (pas une sous-classe de HUDDisplay) instanciée par véhicule par le HUD ; seul le constructeur est défini ici, les autres méthodes viennent d'ailleurs (fichier NON VÉRIFIÉ).

- **YarderTowerHUDExtension** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `YarderTowerHUDExtension.new(vehicle: table, customMt: any)` | 17 | ✍ Construit l'extension pour le véhicule donné avec la priorité GS_PRIO_HIGH : crée les overlays de fond (boîte en trois parties) et les icônes chariot, position, arbre et yarder, conserve la référence du véhicule et un texte de titre combinant « yarder » et le nom du véhicule, appelle storeScaledValues puis le rappelle à chaque changement du réglage d'échelle de l'interface via le message center. |

## Messages

- s'abonne à `MessageType.SETTING_CHANGED` (l.42)

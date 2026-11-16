# gui/hud/extensions/CrabSteeringHUDExtension.lua

*[English version](../../../../../scripts/gui/hud/extensions/CrabSteeringHUDExtension.md)*

Source: `dataS/scripts/gui/hud/extensions/CrabSteeringHUDExtension.lua` — FS25 1.25.1.0

✍ Panneau d'extension du HUD d'informations véhicule : affiche le mode de direction en crabe sélectionné. C'est une classe simple (pas une sous-classe de HUDDisplay) instanciée par véhicule par le HUD ; seul le constructeur est défini ici, les autres méthodes viennent d'ailleurs (fichier NON VÉRIFIÉ).

- **CrabSteeringHUDExtension** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `CrabSteeringHUDExtension.new(vehicle: table, customMt: any)` | 16 | ✍ Construit l'extension pour le véhicule donné avec la priorité GS_PRIO_HIGH : crée les overlays de fond et une ligne de séparation, conserve la référence du véhicule et le texte de mode localisé, appelle storeScaledValues puis le rappelle à chaque changement du réglage d'échelle de l'interface via le message center. |

## Messages

- s'abonne à `MessageType.SETTING_CHANGED` (l.34)

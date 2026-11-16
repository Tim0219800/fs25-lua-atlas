# gui/hud/extensions/BaleCounterHUDExtension.lua

*[English version](../../../../../scripts/gui/hud/extensions/BaleCounterHUDExtension.md)*

Source: `dataS/scripts/gui/hud/extensions/BaleCounterHUDExtension.lua` — FS25 1.25.1.0

✍ Panneau d'extension du HUD d'informations véhicule : affiche les compteurs de balles de la session et à vie. C'est une classe simple (pas une sous-classe de HUDDisplay) instanciée par véhicule par le HUD ; seul le constructeur est défini ici, les autres méthodes viennent d'ailleurs (fichier NON VÉRIFIÉ).

- **BaleCounterHUDExtension** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BaleCounterHUDExtension.new(vehicle: table, customMt: any)` | 18 | ✍ Construit l'extension pour le véhicule donné avec la priorité GS_PRIO_NORMAL : crée les overlays de fond et les icônes session/vie, conserve la référence du véhicule et le titre localisé en majuscules, appelle storeScaledValues puis le rappelle à chaque changement du réglage d'échelle de l'interface via le message center. |

## Messages

- s'abonne à `MessageType.SETTING_CHANGED` (l.39)

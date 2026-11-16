# gui/hud/extensions/BalerStationaryHUDExtension.lua

*[English version](../../../../../scripts/gui/hud/extensions/BalerStationaryHUDExtension.md)*

Source: `dataS/scripts/gui/hud/extensions/BalerStationaryHUDExtension.lua` — FS25 1.25.1.0

✍ Panneau d'extension du HUD d'informations véhicule : affiche l'état d'une presse stationnaire avec enrouleuse. C'est une classe simple (pas une sous-classe de HUDDisplay) instanciée par véhicule par le HUD ; seul le constructeur est défini ici, les autres méthodes viennent d'ailleurs (fichier NON VÉRIFIÉ).

- **BalerStationaryHUDExtension** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BalerStationaryHUDExtension.new(vehicle: table, customMt: any)` | 18 | ✍ Construit l'extension pour le véhicule donné avec la priorité GS_PRIO_HIGH : crée les overlays de fond (boîte en trois parties) et les icônes presse, balle, herbe et balle enrubannée, conserve le véhicule avec ses spécialisations baler et baleWrapper, appelle storeScaledValues puis le rappelle à chaque changement du réglage d'échelle de l'interface via le message center. |

## Messages

- s'abonne à `MessageType.SETTING_CHANGED` (l.42)

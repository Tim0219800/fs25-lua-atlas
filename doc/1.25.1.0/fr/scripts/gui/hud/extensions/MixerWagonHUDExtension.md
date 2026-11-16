# gui/hud/extensions/MixerWagonHUDExtension.lua

*[English version](../../../../../scripts/gui/hud/extensions/MixerWagonHUDExtension.md)*

Source: `dataS/scripts/gui/hud/extensions/MixerWagonHUDExtension.lua` — FS25 1.25.1.0

✍ Panneau d'extension du HUD d'informations véhicule : affiche le ratio de mélange d'une mélangeuse. C'est une classe simple (pas une sous-classe de HUDDisplay) instanciée par véhicule par le HUD ; seul le constructeur est défini ici, les autres méthodes viennent d'ailleurs (fichier NON VÉRIFIÉ).

- **MixerWagonHUDExtension** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `MixerWagonHUDExtension.new(vehicle: table, customMt: any)` | 16 | ✍ Construit l'extension pour le véhicule donné avec la priorité GS_PRIO_HIGH : crée les overlays de fond (boîte en trois parties), une barre de progression et un marqueur, conserve le véhicule et sa spécialisation mixerWagon, construit une entrée d'état (icône, niveau, pourcentages min/max) par type de remplissage du mélangeur dont le premier type existe, et définit un titre avec le nom complet du véhicule, appelle storeScaledValues puis le rappelle à chaque changement du réglage d'échelle de l'interface via le message center. |

## Messages

- s'abonne à `MessageType.SETTING_CHANGED` (l.65)

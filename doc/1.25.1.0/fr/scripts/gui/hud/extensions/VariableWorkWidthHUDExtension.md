# gui/hud/extensions/VariableWorkWidthHUDExtension.lua

*[English version](../../../../../scripts/gui/hud/extensions/VariableWorkWidthHUDExtension.md)*

Source: `dataS/scripts/gui/hud/extensions/VariableWorkWidthHUDExtension.lua` — FS25 1.25.1.0

✍ Panneau d'extension du HUD d'informations véhicule : affiche les sections de largeur de travail partielle d'un outil à largeur variable. C'est une classe simple (pas une sous-classe de HUDDisplay) instanciée par véhicule par le HUD ; seul le constructeur est défini ici, les autres méthodes viennent d'ailleurs (fichier NON VÉRIFIÉ).

- **VariableWorkWidthHUDExtension** (l.15)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VariableWorkWidthHUDExtension.new(vehicle: table, customMt: any)` | 20 | ✍ Construit l'extension pour le véhicule donné avec la priorité GS_PRIO_HIGH : crée les overlays de fond, une barre de progression et un séparateur, conserve le véhicule et sa spécialisation variableWorkWidth, mémorise le nombre de sections et le titre en majuscules, appelle storeScaledValues puis le rappelle à chaque changement du réglage d'échelle de l'interface via le message center. |

## Messages

- s'abonne à `MessageType.SETTING_CHANGED` (l.45)

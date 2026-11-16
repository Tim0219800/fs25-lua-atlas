# internalMods/FS25_precisionFarming/scripts/hud/ExtendedCombineHUDExtension.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/hud/ExtendedCombineHUDExtension.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/hud/ExtendedCombineHUDExtension.lua` — FS25 1.25.1.0

✍ Boîte de HUD affichée dans l'aide à la saisie du véhicule pour les moissonneuses-batteuses ayant la spécialisation Precision Farming ExtendedCombine. Elle affiche le dernier rendement (t/ha avec une barre de notation colorée par un dégradé), la surface travaillée depuis la dernière réinitialisation et la surface totale travaillée. Elle est créée par véhicule avec une priorité basse (GS_PRIO_LOW).

- **ExtendedCombineHUDExtension** (l.21)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ExtendedCombineHUDExtension.new(vehicle: table, customMt: any)` | 26 | ✍ Constructeur prenant le véhicule : récupère spec_combine et la spec ExtendedCombine, crée les overlays de fond, séparateur, barre et icônes, lit le réglage daltonien et s'abonne aux changements de mode daltonien et d'échelle d'interface. À noter : il abonne self.storeScaledValues au réglage UI_SCALE et l'appelle, mais cette méthode n'est pas définie dans ce fichier (origine NON VÉRIFIÉE). |
| `ExtendedCombineHUDExtension:delete()` | 71 | ✍ Supprime tous les overlays, se désabonne du message center et efface les références au véhicule et aux specs. |
| `ExtendedCombineHUDExtension:setColorBlindMode(isActive: any)` | 117 | ✍ Mémorise le nouvel indicateur daltonien quand il change ; il sert à choisir le dégradé lors du dessin. À noter : le commentaire du source dit qu'il détermine si l'extension est dessinée, ce qui ne correspond pas à ce que fait le code. |
| `ExtendedCombineHUDExtension:getHeight() → number` | 126 | ✍ Retourne la hauteur de cette boîte de HUD en espace écran (0 tant qu'elle n'est pas calculée). |
| `ExtendedCombineHUDExtension:draw(inputHelpDisplay: any, posX: any, posY: any)` | 143 | ✍ Dessine la boîte en posX/posY : dernier rendement avec unité, pourcentage de rendement avec barre en dégradé (note = (rendement% - 50) / (potentiel - 50)), surface travaillée depuis la réinitialisation et surface totale. Retourne le nouveau Y sous la boîte, ou posY inchangé sans la spec. À noter : le commentaire du source parle d'une mélangeuse, ce qui semble être un reste de copier-coller. |

## Messages

- s'abonne à `MessageType.SETTING_CHANGED` (l.61)
- s'abonne à `MessageType.SETTING_CHANGED` (l.62)

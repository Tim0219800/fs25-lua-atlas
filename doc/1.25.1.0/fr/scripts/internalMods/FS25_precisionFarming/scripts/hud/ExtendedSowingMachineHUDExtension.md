# internalMods/FS25_precisionFarming/scripts/hud/ExtendedSowingMachineHUDExtension.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/hud/ExtendedSowingMachineHUDExtension.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/hud/ExtendedSowingMachineHUDExtension.lua` — FS25 1.25.1.0

✍ Boîte de HUD affichée dans l'aide à la saisie du véhicule pour les semoirs ayant la spécialisation Precision Farming ExtendedSowingMachine. Elle affiche la dose de semis actuelle avec trois points (colorés d'après la carte de dose de semis), l'étiquette du mode auto ou les repères de recommandation en mode manuel, et la largeur de travail des traces de jalonnement. Créée par véhicule avec une priorité normale (GS_PRIO_NORMAL).

- **ExtendedSowingMachineHUDExtension** (l.22)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ExtendedSowingMachineHUDExtension.new(vehicle: table, customMt: any)` | 27 | ✍ Constructeur prenant le véhicule : récupère la spec ExtendedSowingMachine et g_precisionFarming.seedRateMap, crée les overlays (fonds, trois jeux de points, icône de graines, barre de recommandation), charge les textes et s'abonne aux changements de mode daltonien et d'échelle d'interface. À noter : il abonne self.storeScaledValues au réglage UI_SCALE et l'appelle, mais cette méthode n'est pas définie dans ce fichier (origine NON VÉRIFIÉE). |
| `ExtendedSowingMachineHUDExtension:delete()` | 84 | ✍ Supprime tous les overlays de points, de fond, de séparateur, de graines et de recommandation, se désabonne du message center et efface les références. |
| `ExtendedSowingMachineHUDExtension:setColorBlindMode(isActive: any)` | 157 | ✍ Mémorise le nouvel indicateur daltonien quand il change ; il sélectionne les couleurs des points lors du dessin. À noter : le commentaire du source dit qu'il détermine si l'extension est dessinée, ce qui ne correspond pas à ce que fait le code. |
| `ExtendedSowingMachineHUDExtension:getHeight() → number` | 166 | ✍ Retourne la hauteur de cette boîte de HUD en espace écran (0 tant qu'elle n'est pas calculée). |
| `ExtendedSowingMachineHUDExtension:draw(inputHelpDisplay: any, posX: any, posY: any)` | 183 | ✍ Dessine la section dose de semis (texte de dose, trois points, étiquette auto ou repères de recommandation manuelle, icône de graines ; "non disponible" pour les cultures non gérées) et la ligne de largeur de jalonnement. Retourne le Y sous la boîte, ou posY inchangé sans la spec. À noter : le commentaire du source parle d'une mélangeuse, ce qui semble être un reste de copier-coller. |

## Messages

- s'abonne à `MessageType.SETTING_CHANGED` (l.74)
- s'abonne à `MessageType.SETTING_CHANGED` (l.75)

# internalMods/FS25_precisionFarming/scripts/hud/ExtendedSprayerHUDExtension.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/hud/ExtendedSprayerHUDExtension.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/hud/ExtendedSprayerHUDExtension.lua` — FS25 1.25.1.0

✍ Boîte de HUD affichée dans l'aide à la saisie du véhicule pour les pulvérisateurs et épandeurs ayant la spécialisation Precision Farming ExtendedSprayer. Selon le produit chargé, elle montre un dégradé de pH (chaux) ou d'azote, avec les valeurs actuelle, cible et prévue, le taux d'application, le type de sol et un texte explicatif. Lit les cartes de sol, de pH et d'azote de g_precisionFarming. Créée par véhicule avec une priorité basse (GS_PRIO_LOW).

- **ExtendedSprayerHUDExtension** (l.22)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ExtendedSprayerHUDExtension.new(vehicle: table, customMt: any)` | 27 | ✍ Constructeur prenant le véhicule : récupère la spec ExtendedSprayer et les cartes de sol, de pH et d'azote, crée les overlays de dégradé, de barres, de drapeau et de fond, charge les nombreux textes du HUD et s'abonne aux changements de mode daltonien et d'échelle d'interface. À noter : il abonne self.storeScaledValues au réglage UI_SCALE et l'appelle, mais cette méthode n'est pas définie dans ce fichier (origine NON VÉRIFIÉE). |
| `ExtendedSprayerHUDExtension:delete()` | 116 | ✍ Supprime tous les overlays, se désabonne du message center et efface les références au véhicule et à la spec. |
| `ExtendedSprayerHUDExtension:setColorBlindMode(isActive: any)` | 193 | ✍ Quand l'indicateur daltonien change, le mémorise et demande aux cartes de pH et d'azote de reconstruire leur minicarte à la prochaine mise à jour. À noter : le commentaire du source dit qu'il détermine si l'extension est dessinée, ce qui ne correspond pas à ce que fait le code. |
| `ExtendedSprayerHUDExtension:getHeight() → number` | 205 | ✍ Retourne la hauteur de la boîte : la hauteur d'affichage de base plus la hauteur supplémentaire nécessaire à la ligne de changement et au texte de description. |
| `ExtendedSprayerHUDExtension:draw(inputHelpDisplay: any, posX: any, posY: any)` | 232 | ✍ Dessine la boîte. Avec de la chaux chargée elle montre le pH, sinon l'azote (solide, liquide, lisier ou fumier). Calcule le taux d'application, les positions actuelle, prévue et cible sur le dégradé, le type de sol et une description, puis le pied de page. Retourne le Y sous la boîte, ou posY sans la spec. À noter : le commentaire du source parle d'une mélangeuse, ce qui semble être un reste de copier-coller. |

## Messages

- s'abonne à `MessageType.SETTING_CHANGED` (l.106)
- s'abonne à `MessageType.SETTING_CHANGED` (l.107)

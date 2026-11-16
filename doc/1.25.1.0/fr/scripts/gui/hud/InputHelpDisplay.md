# gui/hud/InputHelpDisplay.lua

*[English version](../../../../scripts/gui/hud/InputHelpDisplay.md)*

Source: `dataS/scripts/gui/hud/InputHelpDisplay.lua` — FS25 1.25.1.0

✍ Panneau HUD en haut à gauche (étend HUDDisplay) qui liste les actions de saisie actives avec glyphes clavier ou manette, plus une ligne de touches de combinaison et des icônes de schéma de véhicule. À chaque frame il interroge g_inputDisplayManager et g_inputBinding, trie les extensions d'aide et d'info enregistrées par priorité, les dessine puis les vide : les extensions doivent donc se réenregistrer à chaque frame. Côté client uniquement. Plusieurs aides (drawVehicleSchema, drawInputHelpElement, drawExtraText, updateGamepadComboButtons) ne sont pas définies dans ce fichier (NON VÉRIFIÉ pour leur emplacement).

- **InputHelpDisplay** hérite de `HUDDisplay` (l.35)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `InputHelpDisplay.new()` | 39 | ✍ Crée le panneau : overlays de fond et de séparation, libellés localisés de combinaison et de groupe de contrôle, overlays de boutons, overlays de combinaisons souris issus de InputBinding.ORDERED_MOUSE_COMBOS, boutons de combinaison manette, et abonnement à INPUT_DEVICES_CHANGED. |
| `InputHelpDisplay:delete()` | 102 | ✍ Supprime tous les overlays et les overlays de schéma de véhicule en cache, se désabonne de INPUT_DEVICES_CHANGED et exécute le delete du parent. |
| `InputHelpDisplay:storeScaledValues()` | 125 | ✍ Ancre le panneau au point d'ancrage gauche/haut du HUD et convertit la mise en page en pixels de référence (ligne 330x25, boîte de combinaison 330x50, marges, tailles de texte et d'icônes) en unités écran ; remet aussi à l'échelle les overlays de schéma de véhicule en cache. |
| `InputHelpDisplay:draw(offsetX: any, offsetY: any)` | 175 | ✍ Dessine le schéma du véhicule puis, si visible, la ligne de combinaisons et les lignes d'aide pour le masque de combinaison pressé, plafonnées en nombre (plafond plus haut pour les hautes priorités). Dessine puis vide les extensions d'aide, les extensions d'info et les textes supplémentaires. |

## Messages

- s'abonne à `MessageType.INPUT_DEVICES_CHANGED` (l.95)

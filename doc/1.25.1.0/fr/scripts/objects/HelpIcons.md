# objects/HelpIcons.lua

*[English version](../../../scripts/objects/HelpIcons.md)*

Source: `dataS/scripts/objects/HelpIcons.lua` — FS25 1.25.1.0

✍ Gère les icônes d'aide à collecter placées sur une carte : un nœud racine dont les enfants sont des déclencheurs, chacun contenant une icône. Quand le véhicule du joueur local entre dans un déclencheur, l'icône est masquée, l'état trouvé est stocké dans les infos de la partie et un message est affiché via les textes i18n helpIcon_title et helpIcon_text.

- **HelpIcons** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HelpIcons:onCreate(id: integer)` | 16 | ✍ Callback de carte pour un nœud i3d : crée l'objet HelpIcons, l'ajoute aux objets non mis à jour de la mission et le stocke dans g_currentMission.helpIconsBase. |
| `HelpIcons.new(name: integer) → table` | 26 | ✍ Constructeur. Pour chaque enfant du nœud, prend le premier petit-enfant comme icône, lit l'attribut utilisateur customNumber (0 par défaut), ajoute un déclencheur avec triggerCallback et enregistre l'entrée. Démarre visible. |
| `HelpIcons:delete()` | 48 | ✍ Retire les déclencheurs de toutes les icônes d'aide. |
| `HelpIcons:triggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 69 | ✍ Callback de déclencheur, entrée seulement et joueur local seulement. Exige que le joueur soit dans un véhicule correspondant au nœud entrant. Masque l'icône, désactive son déclencheur, reconstruit la chaîne foundHelpIcons ('1' trouvée, '0' visible) et affiche le message numéroté par customNumber ou par index. |
| `HelpIcons:showHelpIcons(visible: boolean, clearIconStates: boolean)` | 124 | ✍ Affiche ou masque toutes les icônes. Sauf si clearIconStates vaut true, une icône n'est affichée que si son entrée dans foundHelpIcons vaut '0'. Fixe le masque de collision du déclencheur à 3145728 pour les icônes visibles et à 0 sinon. |
| `HelpIcons:deleteHelpIcon(i: integer)` | 148 | ✍ Masque l'icône d'index donné et désactive le masque de collision de son déclencheur. Sans effet si l'index n'existe pas. |

# triggers/LoanTrigger.lua

*[English version](../../../scripts/triggers/LoanTrigger.md)*

Source: `dataS/scripts/triggers/LoanTrigger.lua` — FS25 1.25.1.0

✍ Trigger de carte (généralement une banque) qui permet au joueur local d'ouvrir l'écran des finances. Il n'est actif qu'en mode carrière (FSCareerMissionInfo) et affiche un symbole, premier enfant du noeud trigger, seulement aux joueurs appartenant à une ferme. Inclut LoanTriggerActivatable, l'invite d'interaction à pied. Comportement côté client ; l'interface des finances n'est pas dans ce fichier.

- **LoanTrigger** (l.9)
- **LoanTriggerActivatable** (l.106)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `LoanTrigger:onCreate(id: integer)` | 14 | ✍ Point d'entrée au chargement de la carte pour un noeud de banque : construit un LoanTrigger et l'ajoute aux objets non mis à jour de la mission. |
| `LoanTrigger.new(name: integer) → table` | 22 | ✍ Crée le trigger : sur un client enregistre le callback physique, prend le premier noeud enfant comme symbole, crée l'activable, s'abonne à PLAYER_FARM_CHANGED et règle la visibilité initiale de l'icône. |
| `LoanTrigger:delete()` | 45 | ✍ Se désabonne des messages, retire le trigger physique le cas échéant, efface la référence du symbole et retire l'activable. |
| `LoanTrigger:openFinanceMenu()` | 57 | ✍ Ouvre l'InGameMenu et publie GUI_INGAME_OPEN_FINANCES_SCREEN pour que le menu passe à la page des finances. |
| `LoanTrigger:triggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 69 | ✍ À l'entrée ou la sortie du noeud racine du joueur local, ajoute ou retire l'activable. N'agit que si le trigger est actif et que la mission est une carrière. |
| `LoanTrigger:updateIconVisibility()` | 85 | ✍ Affiche le symbole seulement si le trigger est actif, que la mission est une carrière et que la ferme locale n'est pas la ferme spectateur ; le masque sinon. |
| `LoanTrigger:playerFarmChanged(player: any)` | 97 | ✍ Gestionnaire de message : rafraîchit la visibilité de l'icône quand la ferme du joueur local a changé ; les autres joueurs sont ignorés. |
| `LoanTriggerActivatable.new(loanTrigger: any)` | 110 | ✍ Crée l'activable lié à un trigger de banque, avec le texte localisé de action_checkFinances. |
| `LoanTriggerActivatable:getIsActivatable()` | 121 | ✍ Retourne true quand le trigger est actif, que le joueur local n'est pas dans un véhicule et que la ferme locale n'est pas la ferme spectateur. |
| `LoanTriggerActivatable:run()` | 127 | ✍ Exécute l'action en ouvrant le menu des finances via le trigger propriétaire. |

## Messages

- s'abonne à `MessageType.PLAYER_FARM_CHANGED` (l.36)
- publie `MessageType.GUI_INGAME_OPEN_FINANCES_SCREEN` (l.59)

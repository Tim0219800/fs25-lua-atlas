# triggers/ShopTrigger.lua

*[English version](../../../scripts/triggers/ShopTrigger.md)*

Source: `dataS/scripts/triggers/ShopTrigger.lua` — FS25 1.25.1.0

✍ Trigger de carte (un point de vente) qui permet au joueur local d'ouvrir le menu de la boutique. Son premier noeud enfant est le symbole et son second enfant est le point d'apparition où le joueur est placé à l'ouverture. Actif seulement en mode carrière, et le symbole n'est affiché que pour les membres d'une ferme et si le réglage de marqueurs de trigger est activé. Inclut ShopTriggerActivatable. Côté client.

- **ShopTrigger** (l.9)
- **ShopTriggerActivatable** (l.134)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ShopTrigger:onCreate(id: integer)` | 14 | ✍ Point d'entrée au chargement de la carte pour un noeud de boutique : construit un ShopTrigger et l'ajoute aux objets non mis à jour de la mission. |
| `ShopTrigger.new(node: integer) → table` | 22 | ✍ Crée le trigger : sur un client vérifie le bit de masque PLAYER (avertissement s'il manque) et enregistre le callback physique. Prend l'enfant 0 comme symbole et l'enfant 1 comme point d'apparition, s'abonne aux messages de changement de ferme et du réglage SHOW_TRIGGER_MARKER, règle la visibilité de l'icône et crée l'activable. |
| `ShopTrigger:delete()` | 51 | ✍ Se désabonne des messages, retire le trigger physique le cas échéant, efface la référence du symbole et retire l'activable. |
| `ShopTrigger:openShop()` | 62 | ✍ Ouvre l'écran ShopMenu, puis téléporte le joueur local au noeud d'apparition et règle son lacet d'après sa direction locale -Z. Si la visite guidée est en cours, affiche un dialogue d'information et ne fait rien d'autre. |
| `ShopTrigger:triggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 83 | ✍ À l'entrée ou la sortie du noeud racine du joueur local, ajoute ou retire l'activable (carrière et trigger actif uniquement). À l'entrée, si la plateforme active automatiquement les triggers et que l'action est disponible, il ouvre directement la boutique. |
| `ShopTrigger:updateIconVisibility()` | 103 | ✍ Affiche le symbole seulement si le trigger est actif, que la mission est une carrière, que la ferme locale n'est pas la ferme spectateur et que le réglage SHOW_TRIGGER_MARKER est activé. |
| `ShopTrigger:playerFarmChanged(player: any)` | 116 | ✍ Gestionnaire de message : rafraîchit la visibilité de l'icône quand la ferme du joueur local a changé ; les autres joueurs sont ignorés. |
| `ShopTrigger:onTriggerVisibilityChanged()` | 124 | ✍ Gestionnaire de message du réglage des marqueurs de trigger : rafraîchit la visibilité de l'icône. |
| `ShopTriggerActivatable.new(shopTrigger: any)` | 138 | ✍ Crée l'activable lié à un trigger de boutique, avec le texte localisé de action_activateShop. |
| `ShopTriggerActivatable:getIsActivatable()` | 149 | ✍ Retourne true quand le trigger est actif, que le joueur local n'est pas dans un véhicule et que la ferme locale n'est pas la ferme spectateur. |
| `ShopTriggerActivatable:run()` | 155 | ✍ Exécute l'action en ouvrant la boutique via le trigger propriétaire. |

## Messages

- s'abonne à `MessageType.PLAYER_FARM_CHANGED` (l.39)
- s'abonne à `MessageType.SETTING_CHANGED` (l.40)

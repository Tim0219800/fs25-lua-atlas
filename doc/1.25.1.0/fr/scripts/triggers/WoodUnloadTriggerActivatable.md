# triggers/WoodUnloadTriggerActivatable.lua

*[English version](../../../scripts/triggers/WoodUnloadTriggerActivatable.md)*

Source: `dataS/scripts/triggers/WoodUnloadTriggerActivatable.lua` — FS25 1.25.1.0

✍ Activable (invite d'interaction) qui permet à un joueur local à pied de vendre manuellement les grumes d'un WoodUnloadTrigger. Côté client ; la distance est mesurée jusqu'au noeud d'activation du trigger.

- **WoodUnloadTriggerActivatable** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WoodUnloadTriggerActivatable.new(woodUnloadTrigger: any)` | 15 | ✍ Crée l'activable pour un trigger de déchargement de bois, avec le texte localisé de action_sellWood. |
| `WoodUnloadTriggerActivatable:getIsActivatable()` | 26 | ✍ Retourne true quand le joueur local n'est pas dans un véhicule et que la ferme locale n'est pas la ferme spectateur. |
| `WoodUnloadTriggerActivatable:run()` | 32 | ✍ Exécute l'action en appelant processWood sur le trigger avec l'identifiant de la ferme locale. |
| `WoodUnloadTriggerActivatable:getDistance(x: any, y: any, z: any)` | 38 | ✍ Retourne la distance entre la position monde donnée et le noeud d'activation du trigger, ou math.huge s'il n'y en a pas. |

# triggers/PalletUnloadTriggerActivatable.lua

*[English version](../../../scripts/triggers/PalletUnloadTriggerActivatable.md)*

Source: `dataS/scripts/triggers/PalletUnloadTriggerActivatable.lua` — FS25 1.25.1.0

✍ Activable (invite d'interaction) utilisé par PalletUnloadTrigger quand le déchargement automatique est désactivé. Il propose une action de déchargement tant que des palettes sont à portée et que le joueur local, ou le véhicule qu'il conduit, est dans le trigger. Côté client.

- **PalletUnloadTriggerActivatable** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PalletUnloadTriggerActivatable.new(palletUnloadTrigger: any)` | 15 | ✍ Crée l'activable pour le trigger de palettes propriétaire, avec le texte localisé de button_unload. |
| `PalletUnloadTriggerActivatable:getIsActivatable()` | 26 | ✍ Retourne true seulement si le propriétaire est actif, qu'aucune interface n'est ouverte, que le joueur a accès au propriétaire, qu'au moins une palette est à portée, et que le joueur est à portée à pied ou conduit un véhicule à portée. |
| `PalletUnloadTriggerActivatable:run()` | 61 | ✍ Exécute l'action en appelant unloadPallets sur le propriétaire avec l'identifiant de la ferme locale. |
| `PalletUnloadTriggerActivatable:getDistance(x: any, y: any, z: any)` | 68 | ✍ Retourne la distance entre la position monde donnée et le noeud trigger du propriétaire, ou math.huge si le propriétaire n'a pas de noeud trigger. |

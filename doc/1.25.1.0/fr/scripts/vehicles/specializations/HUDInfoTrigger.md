# vehicles/specializations/HUDInfoTrigger.lua

*[English version](../../../../scripts/vehicles/specializations/HUDInfoTrigger.md)*

Source: `dataS/scripts/vehicles/specializations/HUDInfoTrigger.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule qui ajoute une zone de déclenchement autour d'un véhicule. Tant que le joueur local, à pied ou dans un véhicule de la même chaîne, se trouve dans la zone, les extensions HUD du véhicule racine sont dessinées bien que le joueur ne le conduise pas. Le trigger suit les objets entrés par identifiant réseau ; il sert à l'affichage du client local uniquement.


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HUDInfoTrigger.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Renvoie toujours true : aucun prérequis envers d'autres spécialisations. |
| `HUDInfoTrigger.initSpecialization()` | 24 | ✍ Enregistre la clé XML vehicle.hudInfoTrigger#triggerNode, le nœud utilisé comme trigger. |
| `HUDInfoTrigger.registerFunctions(vehicleType: table)` | 36 | ✍ Enregistre getIsPlayerInHudInfoTrigger et getAllowHudInfoTrigger sur le type de véhicule. |
| `HUDInfoTrigger.registerOverwrittenFunctions(vehicleType: table)` | 44 | ✍ Vide : rien n'est surchargé. |
| `HUDInfoTrigger.registerEventListeners(vehicleType: table)` | 50 | ✍ Abonne la spécialisation à onLoad, onDelete et onUpdate. |
| `HUDInfoTrigger:onLoad(savegame: table)` | 59 | ✍ Lit le nœud de trigger et y enregistre un callback de trigger. Sans nœud, retire les écouteurs onDelete et onUpdate. |
| `HUDInfoTrigger:onDelete()` | 75 | ✍ Retire le trigger enregistré dans onLoad, le cas échéant. |
| `HUDInfoTrigger:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 87 | ✍ Quand ce véhicule n'est pas celui contrôlé et que le joueur local est dans le trigger, dessine le HUD du véhicule racine et garde le véhicule actif avec raiseActive. |
| `HUDInfoTrigger.onHudInfoTriggerCallback(self: integer, triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 103 | ✍ Callback du trigger. Résout le nœud entrant en objet du jeu ou en joueur local et tient un compteur par identifiant réseau : incrémenté à l'entrée, décrémenté à la sortie et supprimé à zéro. Ignore le véhicule lui-même. |
| `HUDInfoTrigger:getAllowHudInfoTrigger()` | 130 | ✍ Renvoie true par défaut ; d'autres spécialisations peuvent la surcharger pour interdire l'affichage du HUD. |
| `HUDInfoTrigger:getIsPlayerInHudInfoTrigger()` | 136 | ✍ Renvoie true si le joueur local est dans le trigger : directement à pied, ou via un véhicule de la chaîne du véhicule actuel du joueur. Renvoie false si l'affichage n'est pas autorisé ou s'il n'y a pas de joueur local. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getIsPlayerInHudInfoTrigger` | 37 |
| registerFunction | `getAllowHudInfoTrigger` | 38 |
| registerEventListener | `onLoad` | 51 |
| registerEventListener | `onDelete` | 52 |
| registerEventListener | `onUpdate` | 53 |

# vehicles/specializations/activatables/WinchAttachTreeActivatable.lua

*[English version](../../../../../scripts/vehicles/specializations/activatables/WinchAttachTreeActivatable.md)*

Source: `dataS/scripts/vehicles/specializations/activatables/WinchAttachTreeActivatable.lua` — FS25 1.25.1.0

✍ Activatable du treuil forestier : permet au joueur propriétaire de basculer le mode d'attache et d'attacher un arbre à un câble du `spec_winch` du véhicule. Il existe une instance par câble. Il enregistre ses propres événements d'action lorsqu'il est sélectionné et délègue le travail réel aux méthodes de treuil du véhicule (NON VÉRIFIÉ : ces méthodes sont définies dans Winch.lua, pas ici).

- **WinchAttachTreeActivatable** (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WinchAttachTreeActivatable.new(vehicle: table, rope: any) → table` | 20 | ✍ Crée l'activatable pour un câble de treuil ; met en cache les textes et la liste des câbles de `spec_winch` et garde un texte d'invite vide. |
| `WinchAttachTreeActivatable:registerCustomInput(inputContext: any)` | 35 | ✍ Enregistre les événements d'action de bascule du mode d'attache (`WINCH_ATTACH_MODE`) et d'attache d'arbre (`WINCH_ATTACH`) avec une priorité de texte très haute, puis force un rafraîchissement via `update`. |
| `WinchAttachTreeActivatable:removeCustomInput(inputContext: any)` | 49 | ✍ Retire tous les événements d'action d'entrée enregistrés par cet objet (tous ceux dont il est la cible). |
| `WinchAttachTreeActivatable:onToggleAttachTreeMode()` | 55 | ✍ Callback d'entrée : demande au véhicule de basculer le mode d'attache de ce câble via `setWinchTreeAttachMode`. |
| `WinchAttachTreeActivatable:onAttachTree()` | 61 | ✍ Callback d'entrée : si `getCanAttachWinchTree` l'autorise pour ce câble, appelle `onAttachTreeInputEvent` sur le véhicule. |
| `WinchAttachTreeActivatable:update(dt: any)` | 69 | ✍ Rafraîchissement par frame des invites : le texte de bascule indique démarrer ou arrêter le mode d'attache, et l'action d'attache n'est active que si un arbre peut être attaché. |
| `WinchAttachTreeActivatable:getIsActivatable()` | 76 | ✍ False si le véhicule appartient à une autre ferme, si le câble porte déjà son nombre maximal d'arbres, ou si un autre câble est en mode d'attache ; true sinon. |
| `WinchAttachTreeActivatable:activate()` | 96 | ✍ Fonction vide ; rien ne se passe quand l'activatable devient celui sélectionné. |
| `WinchAttachTreeActivatable:deactivate()` | 101 | ✍ Fonction vide ; rien ne se passe quand l'activatable n'est plus celui sélectionné. |
| `WinchAttachTreeActivatable:getDistance(x: any, y: any, z: any)` | 106 | ✍ Renvoie 0 tant que ce câble est en mode d'attache (il gagne donc toujours la sélection) ; sinon la distance 3D entre le point et le nœud du câble. |
| `WinchAttachTreeActivatable:draw()` | 117 | ✍ Fonction vide ; cet activatable n'affiche rien à l'écran. |

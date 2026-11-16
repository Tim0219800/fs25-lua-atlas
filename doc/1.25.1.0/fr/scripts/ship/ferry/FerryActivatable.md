# ship/ferry/FerryActivatable.lua

*[English version](../../../../scripts/ship/ferry/FerryActivatable.md)*

Source: `dataS/scripts/ship/ferry/FerryActivatable.lua` — FS25 1.25.1.0

✍ Activatable (invite d'action) qui permet à un joueur de démarrer un ferry depuis un déclencheur. Il lit `getCanActivateDriving` du ferry, utilise le texte localisé `action_startFerry` et appelle `ferry:start()` à l'activation. La classe `Ferry` et l'affectation de `trigger` ne sont pas dans ce fichier (NON VÉRIFIÉ).

- **FerryActivatable** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FerryActivatable.new(ferry: any)` | 15 | ✍ Crée l'activatable pour un ferry. Le node `trigger` démarre à nil et doit être défini par le propriétaire ; le texte vient de `action_startFerry`. |
| `FerryActivatable:getIsActivatable()` | 32 | ✍ Retourne true quand le ferry indique pouvoir être démarré actuellement par conduite, sinon false. |
| `FerryActivatable:getDistance(posX: any, posY: any, posZ: any)` | 42 | ✍ Retourne la distance horizontale (XZ) entre la position donnée et le node du déclencheur. Échouerait si `trigger` vaut encore nil. |
| `FerryActivatable:run()` | 50 | ✍ Démarre le ferry en appelant `ferry:start()` sans argument de connexion. |

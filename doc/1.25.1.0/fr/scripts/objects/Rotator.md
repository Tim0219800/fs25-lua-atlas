# objects/Rotator.lua

*[English version](../../../scripts/objects/Rotator.md)*

Source: `dataS/scripts/objects/Rotator.lua` — FS25 1.25.1.0

✍ Updateable attaché à un noeud i3D (via l'attribut utilisateur onCreate) qui fait tourner le noeud en continu autour d'un axe. Il lit les attributs utilisateur rpm ou speed (rad/ms) et axis sur le noeud et le fait tourner à chaque image de speed multiplié par dt, donc indépendamment du taux d'images.

- **Rotator** (l.9)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Rotator:onCreate(id: integer)` | 14 | ✍ Hook onCreate d'i3D : crée un Rotator pour le noeud et l'ajoute aux updateables de la mission. |
| `Rotator.new(node: integer) → table` | 22 | ✍ Lit l'attribut utilisateur 'rpm' (converti en rad/ms) ou sinon 'speed' (0,0012 rad/ms par défaut) et l'attribut 'axis' (3 par défaut), qui choisit l'axe de rotation. À noter : si l'attribut est lu comme une chaîne, l'indexation de la table d'axes avec cette valeur est NON VÉRIFIÉE. |
| `Rotator:update(dt: number)` | 46 | ✍ Fait tourner le noeud de speed multiplié par dt autour de l'axe configuré à chaque image. |

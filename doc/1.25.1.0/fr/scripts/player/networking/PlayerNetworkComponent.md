# player/networking/PlayerNetworkComponent.lua

*[English version](../../../../scripts/player/networking/PlayerNetworkComponent.md)*

Source: `dataS/scripts/player/networking/PlayerNetworkComponent.lua` — FS25 1.25.1.0

✍ Classe de base abstraite des composants réseau du joueur. Elle mémorise le joueur propriétaire et déclare des points d'entrée vides (update, updateTick, lecture/écriture de flux, debugDraw) que les sous-classes locale, distante et serveur redéfinissent.

- **PlayerNetworkComponent** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlayerNetworkComponent.new(player: Player, custom_mt: table) → PlayerNetworkComponent` | 18 | ✍ Crée une instance avec la métatable et le joueur donnés. Destiné uniquement aux constructeurs des sous-classes. |
| `PlayerNetworkComponent:update(dt: number)` | 39 | ✍ Point d'entrée vide appelé à chaque frame, redéfini par les sous-classes. |
| `PlayerNetworkComponent:updateTick(dt: number)` | 45 | ✍ Point d'entrée vide appelé à chaque tick, redéfini par les sous-classes. |
| `PlayerNetworkComponent:writeUpdateStream(streamId: integer, connection: Connection, dirtyMask: integer)` | 53 | ✍ Point d'entrée vide que les sous-classes redéfinissent pour écrire leur état dans le flux sortant. |
| `PlayerNetworkComponent:readUpdateStream(streamId: integer, connection: Connection, timestamp: integer)` | 62 | ✍ Point d'entrée vide que les sous-classes redéfinissent pour lire leur état depuis le flux entrant. |
| `PlayerNetworkComponent:debugDraw(x: number, y: number, textSize: number) → number` | 72 | ✍ Point d'entrée de débogage qui n'affiche rien et retourne la position y inchangée ; les sous-classes peuvent le redéfinir. |

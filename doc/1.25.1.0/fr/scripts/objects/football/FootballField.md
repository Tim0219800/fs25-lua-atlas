# objects/football/FootballField.lua

*[English version](../../../../scripts/objects/football/FootballField.md)*

Source: `dataS/scripts/objects/football/FootballField.lua` — FS25 1.25.1.0

✍ Objet de terrain de football créé depuis la carte (onCreate) et enregistré dans onCreateObjectSystem. Il possède le ballon, les triggers de buts, la zone de jeu, le trigger de remise en jeu, le score et les sons ; seuls la création, la suppression et l'envoi à la connexion sont dans ce dump, `load` et le reste sont NON VÉRIFIÉS ici. Étend Object et gère le multijoueur.

- **FootballField** hérite de `Object` (l.18)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FootballField.onCreate(_: integer, id: integer)` | 51 | ✍ Callback onCreate de l'i3d : crée le terrain selon les rôles serveur/client locaux, appelle `load(id)`, puis l'enregistre dans le système d'objets onCreate et le réseau, ou le supprime si le chargement échoue. |
| `FootballField.new(isServer: boolean, isClient: boolean, customMt: table) → table` | 67 | ✍ Constructeur : construit l'Object, enregistre le nom de classe `FootballField` et initialise des tables `i3dMappings` et `components` vides. |
| `FootballField:delete()` | 193 | ✍ Supprime le ballon, retire les triggers de buts, de zone de jeu et de remise en jeu, réinitialise le minuteur du ballon, libère les sons, retire l'activatable de remise en jeu et la commande console `gsFootballFieldReload`, puis appelle le delete parent. |
| `FootballField:writeStream(streamId: integer, connection: table)` | 246 | ✍ Côté serveur à la connexion d'un client : après les données parent, écrit l'identifiant du ballon, son propre flux, enregistre le ballon auprès du serveur pour cette connexion et envoie les deux scores en UInt8. |

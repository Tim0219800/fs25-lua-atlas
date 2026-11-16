# objects/football/Football.lua

*[English version](../../../../scripts/objects/football/Football.md)*

Source: `dataS/scripts/objects/football/Football.lua` — FS25 1.25.1.0

✍ Objet physique de ballon de football, étendant PhysicsObject. Ce fichier ne contient que le constructeur et le destructeur ; le comportement du ballon est hérité ou géré par la classe du terrain.

- **Football** hérite de `PhysicsObject` (l.15)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Football.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 35 | ✍ Constructeur : construit le PhysicsObject, fixe une distance de clipping forcée de 200 et enregistre le nom de classe `Football`. |
| `Football:delete()` | 71 | ✍ Supprime les échantillons sonores, désenregistre le nom de classe, retire les enfants de l'objet noeud et appelle volontairement le `delete` du grand-parent pour ne pas supprimer l'entité du ballon. |

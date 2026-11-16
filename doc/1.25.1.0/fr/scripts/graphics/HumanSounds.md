# graphics/HumanSounds.lua

*[English version](../../../scripts/graphics/HumanSounds.md)*

Source: `dataS/scripts/graphics/HumanSounds.lua` — FS25 1.25.1.0

✍ Support des sons du modèle humain du joueur. Dans ce dump il ne reste que le constructeur : il mémorise un répertoire de base et construit un masque de collision de raycast (objets statiques, eau, terrain, delta de terrain, route, bâtiment, véhicule). Les autres membres sont absents (NON VÉRIFIÉ).

- **HumanSounds** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HumanSounds.new(baseDirectory: any, customMt: any) → table` | 44 | ✍ Crée l'objet avec isLoaded à false, le baseDirectory donné et un raycastMask combinant plusieurs valeurs CollisionFlag ; les véhicules sont inclus pour détecter un joueur sur un bateau. |

# objects/SimParticleSystem.lua

*[English version](../../../scripts/objects/SimParticleSystem.md)*

Source: `dataS/scripts/objects/SimParticleSystem.lua` — FS25 1.25.1.0

✍ Objet de carte créé depuis un noeud i3d (onCreate) qui pré-simule un système de particules de type précipitation afin qu'il paraisse déjà établi au démarrage du jeu. Il est enregistré comme non-updatable dans la mission courante et n'a ni mise à jour ni suppression.

- **SimParticleSystem** (l.9)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SimParticleSystem:onCreate(id: integer)` | 14 | ✍ Callback onCreate de l'i3d : construit un SimParticleSystem pour le noeud et l'enregistre via `g_currentMission:addNonUpdateable`. |
| `SimParticleSystem.new(name: integer) → table` | 22 | ✍ Constructeur. Si le noeud est une forme dont la géométrie a la classe précipitation, lit la durée de vie du système de particules et avance la simulation de cette durée. Les appels moteur eux-mêmes sont NON VÉRIFIÉS (absents du dump). |

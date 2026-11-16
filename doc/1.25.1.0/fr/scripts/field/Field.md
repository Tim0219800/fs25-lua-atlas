# field/Field.lua

*[English version](../../../scripts/field/Field.md)*

Source: `dataS/scripts/field/Field.lua` — FS25 1.25.1.0

✍ Représente un champ de la carte défini dans l'i3d : polygone, surface, position de l'étiquette, lien avec la parcelle et indicateurs de missions. Créé et chargé par FieldManager. Il contient une instance de FieldState remplie avec les données de sol échantillonnées.

- **Field** (l.19)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Field.new(customMt: any) → table` | 29 | ✍ Constructeur. Initialise un polygone vide, une surface de 1 ha, aucune parcelle, aucune mission en cours, culture prévue inconnue, missions autorisées et un nouveau FieldState. |
| `Field:load(id: integer) → boolean` | 55 | ✍ Lit le champ depuis un noeud i3d via les attributs utilisateur (name, polygonIndex, angle, missionAllowed, missionOnlyGrass, noeuds indicateurs). Calcule la surface en ha et la position de l'étiquette ; renvoie false si polygonIndex manque ou est introuvable, sinon true. |
| `Field:delete()` | 108 | ✍ Désabonne cet objet de tous les abonnements du message center. Ne supprime pas les noeuds du polygone. |

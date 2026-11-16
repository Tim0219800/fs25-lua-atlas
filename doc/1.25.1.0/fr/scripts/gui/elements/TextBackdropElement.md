# gui/elements/TextBackdropElement.lua

*[English version](../../../../scripts/gui/elements/TextBackdropElement.md)*

Source: `dataS/scripts/gui/elements/TextBackdropElement.lua` — FS25 1.25.1.0

✍ Élément bitmap (dérivé de BitmapElement) destiné à se dimensionner autour d'un élément texte enfant, avec un padding à quatre valeurs (gauche, haut, droite, bas) lu depuis l'attribut XML ou la clé de profil padding. Ce fichier ne gère que le chargement et la copie du padding ; la logique de redimensionnement n'y figure pas (NON VÉRIFIÉ).

- **TextBackdropElement** hérite de `BitmapElement` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TextBackdropElement.new(target: any, custom_mt: any)` | 18 | ✍ Constructeur. Met le padding à zéro sur les quatre côtés. |
| `TextBackdropElement:loadFromXML(xmlFile: any, key: any)` | 28 | ✍ Charge l'attribut padding du nœud XML en valeurs d'écran normalisées après la classe parente, avec le padding actuel par défaut. |
| `TextBackdropElement:loadProfile(profile: any, applyProfile: any)` | 36 | ✍ Charge la valeur padding du profil GUI en valeurs d'écran normalisées, avec le padding actuel par défaut. |
| `TextBackdropElement:copyAttributes(src: any)` | 44 | ✍ Copie les attributs parents et clone la table de padding de la source. |

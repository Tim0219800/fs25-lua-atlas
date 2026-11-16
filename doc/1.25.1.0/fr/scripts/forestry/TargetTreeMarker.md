# forestry/TargetTreeMarker.lua

*[English version](../../../scripts/forestry/TargetTreeMarker.md)*

Source: `dataS/scripts/forestry/TargetTreeMarker.lua` — FS25 1.25.1.0

✍ Classe simple pour l'anneau ou la bande colorée dessinée autour d'un arbre pour indiquer la cible d'un outil forestier. Elle charge un i3d de marqueur, l'affiche ou le masque, règle sa couleur émissive via un paramètre de shader, le fait éventuellement clignoter selon un sinus dans la mise à jour, et le positionne sur l'arbre avec une largeur et un rayon.

- **TargetTreeMarker** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TargetTreeMarker.new(vehicle: any, linkNode: any, customMt: any)` | 16 | ✍ Constructeur. Mémorise le véhicule (peut être nil) et le nœud de liaison ; le marqueur démarre inactif, sans clignotement, avec une intensité minimale de clignotement de 0,1. |
| `TargetTreeMarker.registerXMLPaths(schema: any, baseKey: any)` | 32 | ✍ Déclare les attributs XML du marqueur : fichier i3d, largeur, décalage par rapport à l'arbre et couleur émissive. |
| `TargetTreeMarker:loadFromXML(xmlFile: any, key: any, baseDirectory: any)` | 41 | ✍ Lit fichier, largeur, décalage et couleur, puis lance un chargement i3d partagé asynchrone via le véhicule s'il existe, sinon via g_i3DManager. onI3DLoaded termine l'initialisation. |
| `TargetTreeMarker:delete()` | 59 | ✍ Supprime le nœud du marqueur et libère l'i3d partagé s'il est chargé, et retire le marqueur des éléments mis à jour de la mission. |
| `TargetTreeMarker:setIsActive(isActive: any)` | 70 | ✍ Mémorise l'état actif et affiche ou masque en conséquence le nœud du marqueur s'il est chargé. |
| `TargetTreeMarker:setColor(r: any, g: any, b: any, isFlashing: any, flashingMinIntensity: any)` | 79 | ✍ Définit la couleur émissive RVB. Quand isFlashing est fourni et change, active le clignotement (inscription aux mises à jour et redémarrage du minuteur) ou le désactive, et peut régler l'intensité minimale de clignotement. |
| `TargetTreeMarker:update(dt: any)` | 101 | ✍ Animation de clignotement : avance le minuteur de dt et module couleur émissive et alpha par un facteur sinusoïdal entre l'intensité minimale et 1. Ne s'exécute que lorsque le clignotement est activé. |
| `TargetTreeMarker:setPosition(x: any, y: any, z: any, dx: any, dy: any, dz: any, radius: any, offset: any)` | 111 | ✍ Place le marqueur à une position monde décalée le long d'une direction par un décalage (par défaut moins la moitié de la largeur), l'oriente selon cette direction et écrit largeur et diamètre (2 x rayon) dans le shader. |
| `TargetTreeMarker:onI3DLoaded(i3dNode: any, failedReason: any)` | 122 | ✍ Rappel du chargement de l'i3d partagé. Prend le premier enfant imbriqué comme nœud du marqueur, le lie sous le nœud de liaison, applique visibilité et couleur, et supprime la racine i3d temporaire. |

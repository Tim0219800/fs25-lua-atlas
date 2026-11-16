# vehicles/wheels/WheelChock.lua

*[English version](../../../../scripts/vehicles/wheels/WheelChock.md)*

Source: `dataS/scripts/vehicles/wheels/WheelChock.lua` — FS25 1.25.1.0

✍ Une cale de roue associée à une roue : charge un modèle i3d partagé, puis la range sur un nœud de parking ou la place contre le pneu en calculant la position d'après le rayon de la roue et la hauteur de la cale. Créée par roue et pilotée par le véhicule (qui décide si les cales sont autorisées).

- **WheelChock** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WheelChock.new(wheel: any, customMt: any)` | 16 | ✍ Crée une cale pour la roue donnée ; elle n'est pas en position de rangement au départ, avec un décalage de rayon nul. |
| `WheelChock:delete()` | 29 | ✍ Supprime le nœud de la cale et libère la requête de chargement i3d partagée. |
| `WheelChock:loadFromXML(xmlObject: any, key: any)` | 43 | ✍ Lit le nom de fichier, le nœud de parking, l'échelle, l'inversion, l'état rangé par défaut, le décalage et le matériau depuis le XML, appelle le hook `onLoadWheelChockFromXML` du véhicule et lance le chargement i3d partagé. Retourne false si le nom de fichier est invalide. |
| `WheelChock:onI3DLoaded(i3dNode: integer, failedReason: table, args: table)` | 76 | ✍ Callback après chargement du i3d : prend le premier enfant comme nœud de cale, lit les attributs utilisateur `posRefNode`, `parkedNode` et `linkedNode`, applique échelle et matériau, puis appelle `update`. Avertit si `posRefNode` manque. |
| `WheelChock:update(isInParkingPosition: any)` | 106 | ✍ Place la cale soit sur son nœud de parking, soit contre la roue (calcul selon rayon du pneu, hauteur de cale et décalages) et bascule la visibilité des nœuds auxiliaires rangé/posé. Forcée en rangement si le véhicule n'autorise pas les cales. Retourne true si un nœud existe. |
| `WheelChock.registerXMLPaths(schema: any, key: any)` | 173 | ✍ Enregistre les chemins du schéma XML d'une cale (fichier, échelle, nœud de parking, inversion, rangée par défaut, décalage) ainsi que ceux du matériau de véhicule. |

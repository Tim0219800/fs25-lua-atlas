# vehicles/wheels/WheelManager.lua

*[English version](../../../../scripts/vehicles/wheels/WheelManager.md)*

Source: `dataS/scripts/vehicles/wheels/WheelManager.lua` — FS25 1.25.1.0

✍ Gestionnaire (sous-classe d'AbstractManager) qui charge au chargement de la carte la liste des modèles de roues connus depuis le XML de roues par défaut. Il indexe chaque roue par chemin, nom de fichier et dossier de base, les regroupe par marque et par nom, et répond aux recherches de rayon/largeur par taille de pneu ou nom de fichier. Il avertit quand deux roues de même taille divergent en rayon ou en largeur.

- **WheelManager** hérite de `AbstractManager` (l.23)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WheelManager.new(customMt: any) → table` | 28 | ✍ Crée le gestionnaire avec la métatable donnée ou par défaut. |
| `WheelManager:initDataStructures()` | 34 | ✍ Réinitialise les tables : liste des roues, roues par dossier de base, groupes de roues triés par type et table nom de fichier vers attributs. |
| `WheelManager:loadMapData(xmlFile: any, missionInfo: any, baseDirectory: any) → boolean` | 44 | ✍ Charge le XML de roues par défaut (WheelManager.DEFAULT_FILENAME) et remplit les listes de roues. Retourne true. Le dossier de base sert à résoudre les chemins des roues. |
| `WheelManager:loadWheelsFromXML(xmlFile: table, key: string, baseDirectory: string)` | 63 | ✍ Analyse chaque entrée `wheel` (fichier, rayon, largeur, catégorie, allowMixture, priorité), déduit marque et nom depuis le dossier, avertit des incohérences de taille, l'enregistre et trie les groupes par marque, priorité puis nom. Les entrées sans chemin, rayon ou largeur sont ignorées avec un avertissement. |
| `WheelManager:getWheelRadiusAndWidthFromDimension(dimension: string) → number, number` | 333 | ✍ Retourne le rayon et la largeur de la première roue dont le nom de fichier court correspond à la dimension donnée, ou nil, nil sinon. |
| `WheelManager:getWheelRadiusAndWidthFromFilename(filename: string) → number, number` | 350 | ✍ Retourne le rayon et la largeur de la roue dont le chemin complet est égal au nom de fichier donné, ou nil, nil si introuvable. |

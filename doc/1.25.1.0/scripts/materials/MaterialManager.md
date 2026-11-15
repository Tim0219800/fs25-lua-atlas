# materials/MaterialManager.lua

Source : `dataS/scripts/materials/MaterialManager.lua` — FS25 1.25.1.0

✍ Gestionnaire global des matériaux (g_materialManager, dérive d'AbstractManager). Il tient cinq registres : (1) types de matériau (liste de noms), (2) matériaux de base par nom, (3) matériaux par type de remplissage (self.materials), (4) matériaux de particules par type de remplissage (self.particleMaterials), (5) polices (FontMaterial). Les matériaux ne sont pas créés ici : ils sont enregistrés par des rappels « onCreate » de MaterialUtil lors du chargement des I3D « porte-matériaux » (material holders) ; ces I3D et le fichier XML des polices (MaterialManager.DEFAULT_FONT_MATERIAL_XML, constante absente du dump) ne sont pas dans le dump.

CLÉ DE RECHERCHE. Un matériau se retrouve par (fillTypeIndex, nom de type de matériau, indice). Types déclarés à loadMapData (MaterialManager.lua:60-78) : fillplane, icon, unloading, smoke, straw, chopper, soil, sprayer, sprayerCannonSolid, sprayerCannonBillboard, spreader, pipe, mower, belt, belt_cropDirt, belt_cropClean, leveler, washer, pickup. Les noms sont stockés en majuscules ; la table globale MaterialType pointe vers nameToIndex. Pour ajouter un type propre à un mod : addMaterialType (avant le chargement des porte-matériaux).

USAGE EFFETS. getParticleMaterial(fillType, type, indice) fournit le matériau à appliquer à un système de particules selon la matière (ex. grain, terre), via ParticleUtil.setMaterial dans WorkParticles ; getMaterial sert aux autres usages (ex. surfaces de remplissage, tapis, convoyeurs). Les deux renvoient nil si le type de remplissage, le type de matériau ou l'indice n'existe pas, sans journal (les avertissements sont dans des lignes marquées #debug, ignorées en production). Les matériaux déclarés plusieurs fois pour la même clé sont écrasés, avec un avertissement développeur seulement si g_showDevelopmentWarnings.

PARTAGE ET CHARGEMENT. Les porte-matériaux de mods sont mis en file par addModMaterialHolder (nom de fichier = clé : pas de doublon) puis chargés par loadModMaterialHolders en asynchrone (g_i3DManager:loadI3DFileAsync) ; au retour, chaque enfant est détaché de l'arbre et conservé dans loadedMaterialHolderNodes pour que les matériaux restent valides jusqu'à unloadMapData, qui supprime ces nœuds. Aucune des données n'est synchronisée en réseau : le chargement a lieu sur chaque pair (client, serveur) ; l'appelant est probablement l'ensemble mission/mods (NON VÉRIFIÉ : appelant absent du dump).

POINTS D'EXTENSION. Pas de registerFunction ni d'événement : un mod peut appeler g_materialManager:addMaterialType, addParticleMaterial, addBaseMaterial, addModMaterialHolder ou lire les tables. Ces appels doivent précéder la fin du chargement de la carte ; ce moment exact (loadModMaterialHolders) est NON VÉRIFIÉ ici.

- **MaterialManager** hérite de `AbstractManager` (l.23)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `MaterialManager.new(customMt: any) → MaterialManager` | 28 | ✍ Crée le gestionnaire et prépare le schéma XML des polices (FontMaterial.registerXMLPaths). |
| `MaterialManager:initDataStructures()` | 39 | ✍ Réinitialise tous les registres : noms, types, matériaux, matériaux de particules, polices, matériaux de base, porte-matériaux de mods et nœuds chargés. |
| `MaterialManager:loadMapData(xmlFile: any, missionInfo: any, baseDirectory: any, finishedLoadingCallback: any, callbackTarget: any) → boolean` | 57 | ✍ Déclare les dix-neuf types de matériau vanilla, publie la table globale MaterialType, mémorise le rappel de fin de chargement puis lance le chargement du XML de polices par défaut. Renvoie vrai. |
| `MaterialManager:unloadMapData()` | 93 | ✍ Supprime les nœuds porte-matériaux, le XML courant, les polices (nœuds, matériaux, shared I3D) puis délègue à la classe parente. |
| `MaterialManager:addMaterialType(name: string)` | 122 | ✍ Ajoute un type de matériau (nom en majuscules) après validation du nom ; sans effet si déjà connu. |
| `MaterialManager:getMaterialTypeByName(name: string) → string` | 142 | ✍ Renvoie le nom normalisé (majuscules) du type s'il existe, sinon nil. |
| `MaterialManager:addBaseMaterial(materialName: string, materialId: integer)` | 159 | ✍ Enregistre un matériau de base sous son nom (majuscules) et dans la liste des matériaux de base. |
| `MaterialManager:getBaseMaterialByName(materialName: string) → integer` | 168 | ✍ Renvoie l'identifiant du matériau de base par nom (insensible à la casse), nil si absent. |
| `MaterialManager:addMaterial(fillTypeIndex: integer, materialType: string, materialIndex: integer, materialId: integer)` | 182 | ✍ Enregistre un matériau pour un type de remplissage, un type de matériau et un indice, dans le registre des matériaux. |
| `MaterialManager:addParticleMaterial(fillTypeIndex: integer, materialType: string, materialIndex: integer, materialId: integer)` | 192 | ✍ Même chose, dans le registre des matériaux de particules. |
| `MaterialManager:addMaterialToTarget(target: table, fillTypeIndex: integer, materialType: string, materialIndex: integer, materialId: integer)` | 203 | ✍ Insère le matériau dans la table cible, à trois niveaux (remplissage, type, indice). Ignore l'appel si un argument vaut nil. L'écrasement d'un matériau existant n'est signalé que par un avertissement développeur. |
| `MaterialManager:getMaterial(fillType: integer, materialTypeName: string, materialIndex: integer) → integer` | 232 | ✍ Renvoie le matériau pour (type de remplissage, type de matériau, indice), nil sinon. |
| `MaterialManager:getParticleMaterial(fillType: integer, materialTypeName: string, materialIndex: integer) → integer` | 242 | ✍ Renvoie le matériau de particules pour (type de remplissage, type de matériau, indice), nil sinon ; c'est la fonction utilisée pour habiller les particules selon la matière. |
| `MaterialManager:getMaterialFromTarget(target: integer, fillType: integer, materialTypeName: string, materialIndex: integer) → integer` | 252 | ✍ Recherche générique dans une table cible : valide le nom du type, puis descend dans type de remplissage, type de matériau et indice ; renvoie nil dès qu'un niveau manque ou qu'un argument est nil. |
| `MaterialManager:addModMaterialHolder(filename: any)` | 279 | ✍ Met en file un fichier I3D porte-matériaux fourni par un mod (clé = nom de fichier, donc dédoublonné). |
| `MaterialManager:loadModMaterialHolders()` | 285 | ✍ Lance le chargement asynchrone de tous les porte-matériaux de mods en file ; le rappel est materialHolderLoaded. |
| `MaterialManager:materialHolderLoaded(i3dNode: any, failedReason: any, args: any)` | 293 | ✍ Rappel de chargement : détache chaque enfant de l'I3D chargé, le garde dans loadedMaterialHolderNodes, puis supprime l'I3D racine. Aucun traitement en cas d'échec (identifiant 0). |
| `MaterialManager:getFontMaterial(materialName: any, customEnvironment: any)` | 307 | ✍ Renvoie la police par nom ; essaie d'abord le nom préfixé par l'environnement du mod (« mod.nom »), puis le nom brut. |
| `MaterialManager:loadFontMaterialsXML(xmlFilename: any, customEnvironment: any, baseDirectory: any)` | 320 | ✍ Charge un XML de polices en asynchrone avec un compteur de références ; à la fin du dernier chargement, supprime le XML et appelle le rappel de fin enregistré par loadMapData. S'il n'y a aucune police, le rappel est appelé immédiatement. |

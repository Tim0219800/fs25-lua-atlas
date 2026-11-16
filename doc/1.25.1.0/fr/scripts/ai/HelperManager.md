# ai/HelperManager.lua

*[English version](../../../scripts/ai/HelperManager.md)*

Source: `dataS/scripts/ai/HelperManager.lua` — FS25 1.25.1.0

✍ Gestionnaire (enfant d'AbstractManager) qui stocke les personnages auxiliaires IA : nom, titre, couleur et un PlayerStyle pour leur apparence. Il charge data/maps/maps_helpers.xml et la section helpers de la map (entrées map.helpers.helper) et suit quels auxiliaires sont disponibles ou utilisés. Une partie d'AbstractManager et PlayerStyle:loadFromXMLFile ne sont pas dans le dump (NON VÉRIFIÉ).

- **HelperManager** hérite de `AbstractManager` (l.27)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HelperManager.new(customMt: any) → table` | 32 | ✍ Constructeur. Crée le gestionnaire via AbstractManager.new avec la métatable fournie ou par défaut. |
| `HelperManager:initDataStructures()` | 39 | ✍ Réinitialise le nombre d'auxiliaires et les tables (par nom, nom vers index, par index, liste des disponibles). |
| `HelperManager:loadDefaultTypes(missionInfo: any, baseDirectory: any)` | 49 | ✍ Charge les définitions d'auxiliaires de base depuis data/maps/maps_helpers.xml comme types de base, puis ferme le fichier XML. |
| `HelperManager:loadMapData(xmlFile: any, missionInfo: any, baseDirectory: any) → boolean` | 58 | ✍ Appelle le loadMapData parent, charge les auxiliaires par défaut, puis charge ceux du XML de la map via XMLUtil.loadDataFromMapXML. Retourne ce résultat. |
| `HelperManager:loadHelpers(xmlFileHandle: any, missionInfo: any, baseDirectory: any, isBaseType: any, customEnvironment: any) → boolean` | 68 | ✍ Lit chaque entrée map.helpers.helper (#name, #title, #color, sous-noeud playerStyle), construit un PlayerStyle et ajoute l'auxiliaire. Retourne false si le XML ne peut pas être encapsulé, true sinon. |
| `HelperManager:addHelper(name: string, title: string, color: string, playerStyle: any, baseDir: string, isBaseType: any) → boolean` | 95 | ✍ Ajoute un auxiliaire sous un nom valide en majuscules, avec un titre (par défaut le nom), une couleur et un style, et le marque disponible. Un type de base dont le nom existe déjà est rejeté ; sinon un auxiliaire existant voit son titre et son style mis à jour. |
| `HelperManager:getRandomHelper() → table` | 141 | ✍ Retourne un auxiliaire au hasard parmi ceux actuellement disponibles. Comportement NON VÉRIFIÉ sur une liste vide (math.random est appelé avec une borne supérieure de 0). |
| `HelperManager:getRandomHelperStyle() → table` | 148 | ✍ Retourne le PlayerStyle d'un auxiliaire tiré au hasard parmi tous les auxiliaires, utilisés ou non. |
| `HelperManager:getRandomIndex() → integer` | 155 | ✍ Retourne un index d'auxiliaire aléatoire entre 1 et le nombre total d'auxiliaires. |
| `HelperManager:getHelperByIndex(index: integer) → table` | 163 | ✍ Retourne l'enregistrement d'auxiliaire pour un index, ou nil si l'index est nil ou inconnu. |
| `HelperManager:getHelperByName(name: string) → table` | 174 | ✍ Retourne l'enregistrement d'auxiliaire pour un nom (insensible à la casse), ou nil. |
| `HelperManager:useHelper(helper: table) → boolean` | 186 | ✍ Marque un auxiliaire comme utilisé en le retirant de la liste des disponibles. Retourne true s'il y figurait, false sinon. |
| `HelperManager:releaseHelper(helper: table)` | 199 | ✍ Marque un auxiliaire comme libre en l'ajoutant à la liste des disponibles. Ne vérifie pas les doublons. |
| `HelperManager:getNumOfHelpers() → integer` | 206 | ✍ Retourne le nombre total d'auxiliaires enregistrés. |

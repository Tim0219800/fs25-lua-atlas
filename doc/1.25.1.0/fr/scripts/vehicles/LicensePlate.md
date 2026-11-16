# vehicles/LicensePlate.lua

*[English version](../../../scripts/vehicles/LicensePlate.md)*

Source: `dataS/scripts/vehicles/LicensePlate.lua` — FS25 1.25.1.0

✍ Objet représentant une plaque d'immatriculation : un noeud i3d avec plusieurs variations, chacune composée de noeuds de valeur (caractères ou parties statiques) et de matériaux optionnels. Les instances sont chargées depuis le XML de plaques de la carte par LicensePlateManager (global `g_licensePlateManager`), puis clonées pour chaque véhicule. Elle affiche du texte avec des objets CharacterLine via le matériau de police, peut être colorée, validée et tirée au hasard, et enregistre aussi les chemins XML de la définition de plaque. Les classes CharacterLine, VehicleMaterial et de police sont hors de ce fichier (NON VÉRIFIÉ).

- **LicensePlate** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `LicensePlate.new(customMt: table?) → LicensePlate` | 18 | ✍ Constructeur. Démarre à la variation 1, position ANY, caractères vides, et garde une référence à `g_licensePlateManager`. |
| `LicensePlate:loadFromXML(node: integer, filename: string, customEnvironment: any, xmlFile: XMLFile, key: string) → boolean` | 37 | ✍ Charge la plaque depuis le XML de la carte : type (ELONGATED par défaut), taille, réglages de police, variations avec leurs noeuds de valeur et matériaux, et un noeud de cadre optionnel. Récupère la police auprès du manager. Retourne false si le type est inconnu ou la police absente. |
| `LicensePlate:delete()` | 149 | ✍ Supprime le noeud i3d de la plaque. |
| `LicensePlate:clone(includeFrame: boolean) → LicensePlate` | 157 | ✍ Crée une copie indépendante avec un noeud cloné, des réglages et variations copiés (noeuds de valeur rattachés au clone), puis applique la variation courante. Le cadre n'est affiché et ajouté à la taille que si `includeFrame` vaut true. |
| `LicensePlate:updateData(variationIndex: integer, position: integer, characters: string, validate: boolean)` | 221 | ✍ Applique variation, position de placement et texte : change de variation si nécessaire, valide éventuellement les caractères, puis positionne chaque noeud de valeur et règle son texte ou sa visibilité selon la position et son caractère statique. À noter : l'indexation se fait par octet, sans gestion d'UTF-8. |
| `LicensePlate:setVariation(variationIndex: integer, position: any)` | 269 | ✍ Passe à une autre variation : supprime les enfants des anciens noeuds de valeur non statiques, crée une CharacterLine centrée pour chaque nouvelle valeur non statique, et applique les matériaux de la variation correspondant à la position. Sans effet pour un indice inconnu. |
| `LicensePlate:getFontSize() → number, number` | 310 | ✍ Retourne deux valeurs : la largeur maximale d'un caractère (taille de police multipliée par le ratio de largeur maximale de la police) et la taille de police. |
| `LicensePlate:setColorIndex(colorIndex: integer)` | 317 | ✍ Cherche la couleur du manager à cet indice et l'applique avec `setColor`. Sans effet si l'indice est invalide. |
| `LicensePlate:getColor(colorIndex: integer) → table` | 329 | ✍ Retourne la table de couleur (r, g, b) de la liste du manager à cet indice, ou nil si l'indice n'existe pas. |
| `LicensePlate:setColor(r: number, g: number, b: number)` | 344 | ✍ Colorie le matériau de plaque nommé par le manager et règle le paramètre de shader des caractères sur le même RVB pour tous les noeuds de valeur non statiques de chaque variation. |
| `LicensePlate:getRandomCharacters(variationIndex: integer) → table` | 365 | ✍ Retourne une table de caractères pour une variation : les caractères fixes sont conservés, les autres sont tirés au hasard dans l'ensemble de la police correspondant au type du noeud (lettres, chiffres, spéciaux). Le premier chiffre aléatoire n'est jamais zéro. |
| `LicensePlate:validateLicensePlateCharacters(characters: table) → table` | 416 | ✍ Filtre le texte donné (chaîne ou table) avec `filterText` et remplace chaque caractère modifié par le premier caractère de l'ensemble autorisé du noeud de valeur correspondant. Retourne les caractères corrigés sous la même forme. Basé sur les octets, sans gestion d'UTF-8. |
| `LicensePlate:changeCharacter(variationIndex: integer, currentCharacters: table, valueIndex: integer, direction: integer) → table` | 470 | ✍ Fait avancer le caractère d'un indice de valeur de `direction` dans les ensembles autorisés (lettres, chiffres, spéciaux) de ce noeud, en passant à l'ensemble voisin aux extrémités et en bloquant aux bornes. Modifie et retourne la table fournie. |
| `LicensePlate:getFormattedString() → string` | 534 | ✍ Construit le texte affiché à partir des caractères stockés, en ignorant les noeuds statiques et les tirets bas et en insérant un espace avant les noeuds marqués comme nouvelle section. Retourne nil si la plaque n'a pas de caractères. |
| `LicensePlate.registerXMLPaths(schema: XMLSchema, baseName: string)` | 564 | ✍ Enregistre les chemins du schéma XML d'une définition de plaque (fichier, noeud, type, taille, police, variations, valeurs, matériaux, cadre). À noter : la hauteur par défaut enregistrée est 0,2 alors que `loadFromXML` utilise 0,3. |

# misc/SprayTypeManager.lua

*[English version](../../../scripts/misc/SprayTypeManager.md)*

Source: `dataS/scripts/misc/SprayTypeManager.lua` — FS25 1.25.1.0

✍ Gestionnaire (sous-classe d'AbstractManager) des types de pulvérisation : engrais, chaux et herbicides liés à un type de remplissage de même nom, avec un débit en litres par seconde et un type de sol. Les valeurs par défaut viennent de data/maps/maps_sprayTypes.xml, puis le XML de la carte (clé map.sprayTypes.sprayType) peut ajouter ou modifier des entrées. initDataStructures publie aussi la table globale SprayType (nom vers indice).

- **SprayTypeManager** hérite de `AbstractManager` (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SprayTypeManager.new(customMt: any) → table` | 19 | ✍ Constructeur : crée le gestionnaire à partir d'AbstractManager avec la métatable fournie ou celle par défaut. |
| `SprayTypeManager:initDataStructures()` | 26 | ✍ Réinitialise les listes et tables de recherche des types de pulvérisation (par nom, indice, indice de type de remplissage) et affecte la table globale SprayType à la table nom vers indice, permettant aux mods de lire SprayType.NOM. |
| `SprayTypeManager:loadDefaultTypes()` | 74 | ✍ Charge les types de pulvérisation du jeu de base depuis data/maps/maps_sprayTypes.xml et les enregistre comme types de base, puis ferme le fichier XML. |
| `SprayTypeManager:loadMapData(xmlFile: any, missionInfo: any, baseDirectory: any) → boolean` | 83 | ✍ Appelle le chargeur parent, charge les types par défaut, puis laisse XMLUtil lire la section sprayTypes propre à la carte (et les ajouts de mods) via loadSprayTypes. Retourne le résultat de cet utilitaire. |
| `SprayTypeManager:loadSprayTypes(xmlFile: any, missionInfo: any, isBaseType: any) → boolean` | 92 | ✍ Parcourt les entrées map.sprayTypes.sprayType d'un fichier XML, lit #name, #litersPerSecond, #type et #sprayGroundType (via FieldSprayType) et appelle addSprayType pour chacune. Retourne toujours true. |
| `SprayTypeManager:addSprayType(name: string, litersPerSecond: number, typeName: any, sprayGroundType: any, isBaseType: any) → table` | 117 | ✍ Crée un type de pulvérisation lié au type de remplissage de même nom, ou met à jour un existant. Le type doit être FERTILIZER, LIME ou HERBICIDE, sinon un avertissement est affiché et nil est retourné. Un type de base déjà présent est refusé ; une définition ultérieure ne remplace que litersPerSecond et sprayGroundType (type de sol par défaut 1). |
| `SprayTypeManager:getSprayTypeByIndex(index: integer) → table` | 172 | ✍ Retourne l'objet type de pulvérisation à l'indice donné, ou nil si l'indice est nil ou inconnu. |
| `SprayTypeManager:getSprayTypeByName(name: string) → table` | 183 | ✍ Retourne le type de pulvérisation portant le nom donné (insensible à la casse, mis en majuscules en interne), ou nil. |
| `SprayTypeManager:getFillTypeNameByIndex(index: integer) → string` | 195 | ✍ Retourne le nom enregistré pour un indice de type de pulvérisation. Malgré le nom de la méthode, l'indice est celui du type de pulvérisation, pas d'un type de remplissage. |
| `SprayTypeManager:getFillTypeIndexByName(name: string) → integer` | 206 | ✍ Retourne l'indice de type de pulvérisation pour un nom (insensible à la casse), ou nil. Malgré le nom, ce n'est pas un indice de type de remplissage. |
| `SprayTypeManager:getFillTypeByName(name: string) → table` | 218 | ✍ Retourne l'objet type de pulvérisation pour un nom (insensible à la casse), ou nil. Même résultat que getSprayTypeByName malgré son nom. |
| `SprayTypeManager:getSprayTypeByFillTypeIndex(index: any)` | 228 | ✍ Retourne le type de pulvérisation lié à un indice de type de remplissage, ou nil si ce type de remplissage n'est pas un produit de pulvérisation. |
| `SprayTypeManager:getSprayTypeIndexByFillTypeIndex(index: integer) → integer` | 239 | ✍ Retourne l'indice de type de pulvérisation pour un indice de type de remplissage, ou nil si ce type de remplissage n'en a pas. |
| `SprayTypeManager:getSprayTypes() → table` | 252 | ✍ Retourne la liste ordonnée de tous les types de pulvérisation enregistrés. |

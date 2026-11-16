# shop/BrandManager.lua

*[English version](../../../scripts/shop/BrandManager.md)*

Source: `dataS/scripts/shop/BrandManager.lua` — FS25 1.25.1.0

✍ Gestionnaire (sous-classe d'AbstractManager) qui enregistre les marques de machines et de produits depuis dataS/brands.xml et depuis les mods, et les retrouve par indice ou par nom. Il publie aussi une table globale `Brand` associant les noms en majuscules aux indices (par exemple Brand.LIZARD, utilisé comme repli). Il enregistre la commande console gsBrandUsageList, dont le gestionnaire consoleCommandBrandUsageList n'est pas défini dans ce fichier (NON VÉRIFIÉ).

- **BrandManager** hérite de `AbstractManager` (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BrandManager.new(customMt: any) → table` | 18 | ✍ Crée le gestionnaire et enregistre la commande console gsBrandUsageList, qui affiche les marques utilisées (gestionnaire absent de ce fichier, NON VÉRIFIÉ). |
| `BrandManager:initDataStructures()` | 28 | ✍ Réinitialise le compteur de marques et les tables nom vers indice, nom vers marque et indice vers marque, et affecte le global `Brand` à la table nom vers indice. |
| `BrandManager:loadMapData(missionInfo: any) → boolean` | 40 | ✍ Appelle le loadMapData parent, puis lit chaque marque de dataS/brands.xml (nom, titre avec traduction $l10n_ optionnelle, images, décalage) et l'enregistre avec addBrand comme marque non-mod. Retourne true. |
| `BrandManager:addBrand(name: string, title: string, imageFilename: string, baseDir: string, isMod: boolean, imageShopOverview: string?, imageOffset: number?) → table?` | 74 | ✍ Enregistre une marque. Le nom est mis en majuscules et doit être un nom d'indice valide ; titre, image et baseDir sont requis, et l'image de la vue d'ensemble de la boutique prend par défaut l'image principale. Retourne la table de marque, false si des données manquent, ou nil si invalide ou déjà présente. |
| `BrandManager:getBrandByIndex(brandIndex: integer) → table` | 139 | ✍ Retourne la table de marque pour un indice, ou nil pour un indice nil ou inconnu. |
| `BrandManager:getBrandIconByIndex(brandIndex: integer) → string` | 150 | ✍ Retourne le chemin du fichier d'icône de la marque d'indice donné, ou nil si l'indice est nil ou inconnu. |
| `BrandManager:getBrandByName(brandName: string) → table` | 161 | ✍ Retourne la table de marque pour un nom, comparé sans tenir compte de la casse, ou nil. |
| `BrandManager:getBrandIndexByName(brandName: string) → integer` | 172 | ✍ Retourne l'indice de marque d'un nom. Un nom inconnu ou invalide logue un avertissement (avec suggestion proche) et retourne Brand.LIZARD. Un nom nil retourne nil. |

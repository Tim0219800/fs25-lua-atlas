# objects/BuyingStation.lua

*[English version](../../../scripts/objects/BuyingStation.md)*

Source: `dataS/scripts/objects/BuyingStation.lua` — FS25 1.25.1.0

✍ Station de chargement permettant d'acheter des marchandises (types de remplissage) auprès d'un placeable. Elle étend LoadingStation, déclare le schéma XML des entrées par type et fournit deux fonctions utilisées par les specs du magasin pour lister les types proposés.

- **BuyingStation** hérite de `LoadingStation` (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BuyingStation.registerXMLPaths(schema: any, basePath: any)` | 185 | ✍ Enregistre les entrées fillType(?) avec name, statsName (other par défaut) et priceScale (1 par défaut) au chemin de base, puis les chemins de LoadingStation. |
| `BuyingStation.loadSpecValueFillTypes(xmlFile: any, customEnvironment: any, baseDir: any)` | 195 | ✍ Lit placeable.buyingStation#fillTypes et chaque loadTrigger#fillTypes (noms séparés par des espaces), les met en majuscules dans un ensemble et laisse PlaceableHeapSpawner ajouter les siens. Retourne l'ensemble de noms, ou nil si rien n'est trouvé. |
| `BuyingStation.getSpecValueFillTypes(storeItem: any, realItem: any)` | 224 | ✍ Convertit l'ensemble buyingStationFillTypes des specs de l'article du magasin en types de remplissage via g_fillTypeManager. Retourne nil si la spec est absente. |

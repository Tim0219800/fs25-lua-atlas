# objects/SellingStation.lua

*[English version](../../../scripts/objects/SellingStation.md)*

Source: `dataS/scripts/objects/SellingStation.lua` — FS25 1.25.1.0

✍ Station de vente : sous-classe d'UnloadingStation qui achète des types de remplissage aux fermes avec des prix dynamiques. Ce fichier ajoute seulement l'enregistrement des chemins XML, la restauration par type de remplissage des statistiques (reçu, payé, dynamique de prix) depuis la sauvegarde et les aides de fiche de magasin listant les types acceptés par un placeable. La logique de vente est dans UnloadingStation et dans les classes de prix utilisées.

- **SellingStation** hérite de `UnloadingStation` (l.20)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SellingStation:loadFromXMLFile(xmlFile: XMLFile, key: string) → boolean` | 383 | ✍ Lit les entrées `stats(i)` de la sauvegarde : pour chaque type de remplissage accepté, restaure les totaux reçu et payé et appelle `loadFromXMLFile` sur la dynamique de prix de ce type. Les types inconnus ou non acceptés sont ignorés. Renvoie toujours true. |
| `SellingStation.registerXMLPaths(schema: any, basePath: any)` | 717 | ✍ Enregistre les attributs XML d'une station de vente (options de stats, autorisation des missions, prix dynamiques, volume de baisse de prix, heures de récupération, listes de types, nom du revenu, échelle de prix et options par type), puis les chemins d'UnloadingStation. |
| `SellingStation.registerSavegameXMLPaths(schema: any, basePath: any)` | 738 | ✍ Enregistre les chemins de sauvegarde d'une entrée `stats` par type de remplissage (nom, quantités reçue et payée) et délègue à `PricingDynamics.registerSavegameXMLPaths` pour les données de prix. |
| `SellingStation.loadSpecValueFillTypes(xmlFile: XMLFile, customEnvironment: string?, baseDir: string?) → table?` | 752 | ✍ Aide de fiche de magasin : collecte les noms de types acceptés depuis `placeable.sellingStation#fillTypes`, les définitions de triggers de déchargement et un placeable constructible éventuel. Renvoie un ensemble de noms, ou nil si rien n'est trouvé. |
| `SellingStation.getSpecValueFillTypes(storeItem: any, realItem: any)` | 782 | ✍ Aide de fiche de magasin : convertit les noms `sellingStationFillTypes` d'un article du magasin en types de remplissage via le gestionnaire de types. Renvoie nil si la spécification est absente. |

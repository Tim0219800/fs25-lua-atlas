# vehicles/VehicleMaterial.lua

*[English version](../../../scripts/vehicles/VehicleMaterial.md)*

Source: `dataS/scripts/vehicles/VehicleMaterial.lua` — FS25 1.25.1.0

✍ Conteneur de données pour la définition de peinture/matériau d'un véhicule : échelle de couleur, lissé, métallique, vernis, porosité, textures de détail et cartes diffuse/normale/spéculaire. Il peut être rempli depuis un modèle de `g_vehicleMaterialManager` ou depuis le XML (forme complète ou courte), puis appliqué aux formes d'un véhicule en écrivant des paramètres de shader et en remplaçant des cartes de matériau. Données visuelles purement côté client.

- **VehicleMaterial** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleMaterial.new(baseDirectory: any, customMt: any)` | 16 | ✍ Crée un matériau vide pour le répertoire de base donné (sert à résoudre les chemins de textures). `colorOnly` démarre à faux. |
| `VehicleMaterial:clone()` | 27 | ✍ Renvoie un nouveau `VehicleMaterial` avec les mêmes nom d'emplacement, modèle et toutes les valeurs de couleur, d'ombrage et de textures copiées (copie superficielle de la référence de la table de couleur). |
| `VehicleMaterial:setColor(r: any, g: any, b: any)` | 56 | ✍ Définit l'échelle de couleur à partir de trois nombres ou d'une table de trois ; ne fait rien si le premier argument est nil. |
| `VehicleMaterial:getBrightness()` | 70 | ✍ Renvoie la luminosité de l'échelle de couleur via `MathUtil.getBrightnessFromColor`, ou nil si aucune couleur n'est définie. |
| `VehicleMaterial:setTemplateName(templateName: any, colorOnly: any, customEnvironment: any)` | 80 | ✍ Cherche un modèle de matériau par nom dans `g_vehicleMaterialManager` et copie ses valeurs, avec repli sur le modèle parent puis sur des valeurs par défaut (ex. lissé 1, textures de détail par défaut). Avec `colorOnly`, seule la couleur est prise. Renvoie faux si le modèle est inconnu. |
| `VehicleMaterial:loadFromXML(xmlFile: any, key: any, customEnvironment: any)` | 112 | ✍ Charge la forme XML complète : nom d'emplacement, modèle optionnel, puis surcharges de couleur (vecteur ou nom de modèle), lissé, métallique, vernis, textures de détail et textures diffuse/normale/spéculaire. Renvoie faux (avec avertissement) si le modèle est inconnu ; sinon vrai si une valeur est définie. La porosité n'a pas de clé XML ici. |
| `VehicleMaterial:loadShortFromXML(xmlFile: any, key: any, customEnvironment: any)` | 173 | ✍ Charge la forme XML courte : nom d'emplacement, modèle obligatoire (`#materialTemplateName`, éventuellement couleur seule) et modèle séparé optionnel pour la couleur seule (`#materialTemplateNameColor`). Renvoie faux si le nom de modèle manque ou est inconnu. |
| `VehicleMaterial:applyToVehicle(vehicle: any, targetMaterialSlotName: any)` | 200 | ✍ Applique le matériau à l'arbre de noeuds de chaque composant du véhicule, éventuellement limité à un nom d'emplacement de matériau. Renvoie vrai si au moins un matériau a été modifié. |
| `VehicleMaterial:apply(node: any, targetMaterialSlotName: any, colorOnly: any)` | 211 | ✍ Parcourt récursivement un noeud et ses enfants et applique le matériau à chaque emplacement de matériau de forme dont le nom correspond (tous si aucun nom n'est donné). Renvoie vrai si un emplacement a été appliqué. |
| `VehicleMaterial:applyToMaterial(node: any, materialIndex: any, colorOnly: any)` | 235 | ✍ Écrit l'échelle de couleur (et, sauf `colorOnly`, lissé, métallique, vernis, porosité) comme paramètres de shader sur un emplacement de matériau, puis remplace les cartes de détail/diffuse/normale/brillance depuis des fichiers et met à jour l'emplacement si l'identifiant de matériau a changé. |
| `VehicleMaterial:getIsApplied(node: any, materialId: any, checkColor: any)` | 298 | ✍ Vérifie si un identifiant de matériau porte déjà les valeurs de ce matériau (couleur optionnelle, paramètres d'ombrage et noms de fichiers de cartes). Les valeurs non définies sont comparées aux défauts (1 pour lissé/métallique, 0 pour vernis/porosité, 1,1,1 pour la couleur). |
| `VehicleMaterial.registerXMLPaths(schema: XMLSchema, basePath: string)` | 385 | ✍ Enregistre le schéma XML de la forme complète : nom d'emplacement, nom de modèle (avec autocomplétion depuis brandMaterialTemplates.xml), indicateur couleur seule, couleur, lissé, métallique, vernis, chemins de détail et de textures. |
| `VehicleMaterial.registerShortXMLPaths(schema: XMLSchema, basePath: string)` | 411 | ✍ Enregistre le schéma XML de la forme courte : nom d'emplacement, nom de modèle, indicateur couleur seule et `#materialTemplateNameColor`. |

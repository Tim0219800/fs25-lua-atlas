# fillTypes/FillTypeDesc.lua

*[English version](../../../scripts/fillTypes/FillTypeDesc.md)*

Source: `dataS/scripts/fillTypes/FillTypeDesc.lua` — FS25 1.25.1.0

✍ Classe de données décrivant un type de remplissage (une matière comme grain, liquide ou contenu de balle) : nom, titre, unité, masse et prix par litre, facteurs de prix saisonniers, textures et paramètres physiques de couche de sol, réglages d'effets et de particules. Elle est créée et indexée par FillTypeManager et remplie depuis un XML.

- **FillTypeDesc** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FillTypeDesc.new(customMt: any)` | 16 | ✍ Constructeur. Crée un type de remplissage nommé UNKNOWN avec des valeurs par défaut (masse 0,001 par litre, angle de surface max 30 degrés, économie et données de couche vides, valeurs d'alpha clip par défaut, non finalisé). L'index est défini plus tard par FillTypeManager. |
| `FillTypeDesc:loadFromXMLFile(xmlFile: any, key: any, baseDirectory: any, customEnvironment: any)` | 89 | ✍ Lit un type de remplissage depuis un XML : nom (validé, en majuscules ; retourne false s'il est invalide), titre, unité, indicateurs vrac/palette/balle, physique, fichiers HUD et palette, prix et facteurs économiques par période, textures de sol et paramètres de couche, type d'effet, couleurs de fumée, particules et alpha clip. Les valeurs existantes servent de défauts, donc des chargements répétés remplacent sélectivement. Retourne true en cas de succès. À noter : firmnessWet retombe sur la valeur de firmness. |

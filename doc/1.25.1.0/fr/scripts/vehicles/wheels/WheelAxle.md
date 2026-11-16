# vehicles/wheels/WheelAxle.lua

*[English version](../../../../scripts/vehicles/wheels/WheelAxle.md)*

Source: `dataS/scripts/vehicles/wheels/WheelAxle.lua` — FS25 1.25.1.0

✍ Décrit une paire de roues formant un essieu, avec une suspension « dynamique » optionnelle dépendant de la charge : les multiplicateurs de raideur et d'amortissement, et éventuellement d'une articulation de composant, sont mélangés selon la charge de l'essieu. Chargé depuis le XML des roues du véhicule.

- **WheelAxle** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WheelAxle.new(vehicle: any, customMt: any)` | 16 | ✍ Crée un objet essieu lié au véhicule donné. |
| `WheelAxle:delete()` | 26 | ✍ Fonction de nettoyage vide ; l'essieu ne possède aucune ressource. |
| `WheelAxle:loadFromXML(xmlFile: any, key: any)` | 31 | ✍ Lit les deux nœuds de roue (`#wheel1`, `#wheel2`), retrouve les roues et charge les réglages optionnels de dynamicSuspension. Retourne false (avec une erreur XML si un nœud manque) si les roues sont introuvables. |
| `WheelAxle:update(dt: any)` | 76 | ✍ Mise à jour par frame : calcule la charge cumulée des pneus, lisse un alpha 0..1 vers cette valeur et, s'il a assez changé, applique aux deux roues (et à l'articulation de composant) des multiplicateurs de raideur/amortissement interpolés. À noter : elle lit `self.maxLoad`, jamais défini (la valeur XML est dans `dynamicSuspension.maxLoad`), donc le maxLoad du XML semble ignoré ici. |
| `WheelAxle.getDebugValueHeader()` | 113 | ✍ Retourne les en-têtes de colonnes utilisés par le tableau de debug des roues pour les essieux. |
| `WheelAxle:fillDebugValues(debugTable: any)` | 119 | ✍ Ajoute les valeurs de debug de cet essieu (indices de roues, charge, charge max, alpha, multiplicateurs, données d'articulation) aux colonnes du tableau donné ; n'écrit que si la suspension dynamique existe. |
| `WheelAxle.registerXMLPaths(schema: any, key: any)` | 155 | ✍ Enregistre les chemins du schéma XML d'un essieu : les deux nœuds de roue et les attributs dynamicSuspension et componentJoint. |

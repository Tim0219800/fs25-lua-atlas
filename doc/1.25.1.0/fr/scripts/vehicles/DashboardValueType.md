# vehicles/DashboardValueType.lua

*[English version](../../../scripts/vehicles/DashboardValueType.md)*

Source: `dataS/scripts/vehicles/DashboardValueType.lua` — FS25 1.25.1.0

✍ Descripteur d'un type de valeur qu'un tableau de bord de véhicule peut afficher, identifié par un nom de spécialisation et un nom de valeur (nom complet `spec.name`). Il enregistre l'origine de la valeur, une plage, un centre, un facteur, un ensemble de comparaison et une vitesse d'interpolation optionnels, ainsi que l'endroit où lire ses définitions XML via `vehicle:loadDashboardsFromXML`. Les spécialisations créent et configurent ces objets ; la spécialisation Dashboard elle-même n'est pas dans ce fichier (NON VÉRIFIÉ ici). À noter : son commentaire d'en-tête parle à tort de valeur d'animation.

- **DashboardValueType** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `DashboardValueType.new(specName: any, name: any, customMt: any)` | 16 | ✍ Constructeur. Construit le nom complet à partir de la spécialisation et du nom de la valeur, avec l'interrogation active, un facteur de 1, et tous les accesseurs (source, min, max, centre, vitesse d'interpolation) réglés par défaut sur une fonction retournant nil. |
| `DashboardValueType:setXMLKey(xmlKey: any)` | 45 | ✍ Définit une clé XML personnalisée depuis laquelle les définitions de tableau de bord de ce type de valeur sont chargées. |
| `DashboardValueType:loadFromXML(xmlFile: any, vehicle: any)` | 51 | ✍ Demande au véhicule de charger les tableaux de bord depuis le XML, avec la clé personnalisée si elle est définie, sinon `<racine>.<specName>.dashboards`, en lui passant ce type de valeur. |
| `DashboardValueType:setPollUpdate(pollUpdate: any)` | 62 | ✍ Définit l'indicateur d'interrogation stocké sur ce type. Son usage par le système de tableau de bord est NON VÉRIFIÉ (absent de ce fichier). |
| `DashboardValueType:setAdditionalFunctions(loadFunction: any, stateFunction: any)` | 68 | ✍ Stocke une fonction de chargement et une fonction d'état optionnelles. Elles sont seulement stockées ici et utilisées ailleurs (NON VÉRIFIÉ). |
| `DashboardValueType:setValueFactor(valueFactor: any)` | 75 | ✍ Définit le multiplicateur appliqué aux valeurs numériques dans `getValue`. |
| `DashboardValueType:setValueCompare(...: any)` | 81 | ✍ Construit un ensemble à partir des arguments donnés. Une fois défini, `getValue` retourne un booléen indiquant si la valeur source appartient à cet ensemble, au lieu de la valeur brute. |
| `DashboardValueType:setIdleValue(idleValue: any)` | 91 | ✍ Stocke la valeur à utiliser au repos. Elle est seulement stockée ici ; son consommateur est hors de ce fichier (NON VÉRIFIÉ). |
| `DashboardValueType:setValue(object: any, func: any)` | 97 | ✍ Déclare l'objet qui fournit la valeur et la source : une constante, une fonction appelée avec l'objet, ou le nom d'un champ ou d'une méthode de celui-ci. Mémorise aussi l'objet pour les définitions ultérieures de plage, centre et vitesse. |
| `DashboardValueType:setCenter(centerFunc: any)` | 104 | ✍ Définit la source de la valeur centrale (constante, fonction ou nom de membre sur l'objet de valeur). Appeler `setValue` d'abord pour que l'objet soit connu. |
| `DashboardValueType:setRange(min: any, max: any)` | 110 | ✍ Définit les sources des valeurs minimale et maximale, chacune sous forme de constante, fonction ou nom de membre sur l'objet de valeur. Appeler `setValue` d'abord. |
| `DashboardValueType:setInterpolationSpeed(interpolationSpeed: any)` | 117 | ✍ Définit la source de la vitesse d'interpolation (constante, fonction ou nom de membre sur l'objet de valeur). Appeler `setValue` d'abord. |
| `DashboardValueType:getValue(dashboard: any)` | 123 | ✍ Lit la valeur source pour un tableau de bord. Applique l'ensemble de comparaison s'il existe et, pour les nombres, le facteur, puis retourne valeur, min, max, centre et un indicateur de nombre (min, max et centre sont nil pour les non-nombres). |
| `DashboardValueType:setFunction(funcName: any, object: any, value: any)` | 149 | ✍ Fonction interne. Remplace l'accesseur nommé par une fermeture construite à partir d'une constante, d'une fonction, ou d'un nom de champ ou de méthode cherché sur l'objet. Si le type n'est pas géré ou si le membre est absent, l'accesseur reste inchangé. |
| `DashboardValueType:getDefaultValue()` | 180 | ✍ Accesseur par défaut ; retourne toujours nil. |

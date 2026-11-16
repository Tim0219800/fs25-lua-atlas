# gui/base/GuiDataSource.lua

*[English version](../../../../scripts/gui/base/GuiDataSource.md)*

Source: `dataS/scripts/gui/base/GuiDataSource.lua` — FS25 1.25.1.0

✍ Liste observable simple qui alimente des éléments d'interface comme les listes et tableaux. Elle contient un tableau, permet d'enregistrer un callback par table cible et prévient les écouteurs quand les données sont remplacées ou modifiées. NO_DATA et NO_CALLBACK sont des globales définies ailleurs (NON VÉRIFIÉ ici).

- **GuiDataSource** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `GuiDataSource.new(subclass_mt: any)` | 20 | ✍ Crée une source de données avec un tableau vide (NO_DATA) et une table d'écouteurs vide. Une métatable optionnelle permet aux sous-classes de réutiliser le constructeur. |
| `GuiDataSource:setData(data: any)` | 31 | ✍ Remplace le tableau sous-jacent (nil revient à NO_DATA) et prévient aussitôt tous les écouteurs. Le tableau est conservé par référence, pas copié. |
| `GuiDataSource:addChangeListener(target: any, callback: any)` | 38 | ✍ Enregistre un callback indexé par la table cible. Une seconde inscription pour la même cible écrase la première ; un callback nil est remplacé par NO_CALLBACK. |
| `GuiDataSource:removeChangeListener(target: any)` | 44 | ✍ Retire l'écouteur enregistré pour la table cible donnée. |
| `GuiDataSource:notifyChange()` | 51 | ✍ Appelle chaque callback enregistré avec sa cible comme seul argument. À appeler à la main après une modification directe du tableau. L'ordre d'itération n'est pas défini (pairs). |
| `GuiDataSource:getCount()` | 59 | ✍ Retourne le nombre d'éléments du tableau de données (opérateur de longueur). |
| `GuiDataSource:getItem(index: any)` | 65 | ✍ Retourne l'élément à l'indice donné (base 1), ou nil s'il n'existe pas. |
| `GuiDataSource:setItem(index: any, value: any, needsNotification: any)` | 72 | ✍ Stocke une valeur uniquement à un indice existant ; les indices hors limites sont ignorés sans erreur. Les écouteurs ne sont prévenus que si needsNotification est vrai. |
| `GuiDataSource:iterateRange(startIndex: any, endIndex: any)` | 85 | ✍ Retourne un itérateur de boucle for générique sur les éléments de startIndex à endIndex, qui s'arrête au premier élément nil. Il fournit (indiceSuivant, élément) : la première variable vaut donc l'indice plus un. |

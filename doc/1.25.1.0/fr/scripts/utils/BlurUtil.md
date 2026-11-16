# utils/BlurUtil.lua

*[English version](../../../scripts/utils/BlurUtil.md)*

Source: `dataS/scripts/utils/BlurUtil.lua` — FS25 1.25.1.0

✍ Fonctions génériques de flou 2D qui opèrent sur toute donnée accessible via un getter(x, y) et un setter(x, y, valeur), avec une fenêtre glissante pondérée de type stack blur (poids triangulaires). Les lignes et colonnes sont traitées indépendamment, soit de façon synchrone, soit en tâches placées dans un gestionnaire asynchrone. Les coordonnées commencent à 1 et les valeurs de bord sont répétées.

- **BlurUtil** (l.15)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BlurUtil.stackBlurAsync(dataGetter: function, dataSetter: function, width: integer, height: integer, radius: integer, asyncManager: AsyncTaskManager?, callback: function)` | 39 | ✍ Place une tâche par ligne, puis une par colonne, dans le gestionnaire asynchrone fourni (g_asyncTaskManager si nil) et appelle le callback dans la tâche de la dernière colonne. À noter : le callback est appelé sans test, donc nil provoquerait une erreur. |
| `BlurUtil.stackBlurHorizontal(dataGetter: function, dataSetter: function, width: integer, height: integer, radius: integer)` | 74 | ✍ Floute toutes les lignes des données de façon synchrone, en réutilisant une même table de file pour toutes les lignes. Écrit les résultats directement via le setter. |
| `BlurUtil.stackBlurVertical(dataGetter: function, dataSetter: function, width: integer, height: integer, radius: integer)` | 92 | ✍ Floute toutes les colonnes des données de façon synchrone, en réutilisant une même table de file pour toutes les colonnes. Écrit les résultats directement via le setter. |
| `BlurUtil.stackBlurRow(dataGetter: function, dataSetter: function, width: integer, radius: integer, y: integer, queue: table)` | 111 | ✍ Floute la ligne y : initialise la fenêtre avec la première valeur, puis avance le long de x. Les lectures au-delà du bord droit sont ramenées à la dernière colonne. Une table de file peut être réutilisée. |
| `BlurUtil.stackBlurColumn(dataGetter: function, dataSetter: function, height: integer, radius: integer, x: integer, queue: table)` | 148 | ✍ Floute la colonne x : initialise la fenêtre avec la première valeur, puis avance le long de y. Les lectures au-delà du bord bas sont ramenées à la dernière ligne. Une table de file peut être réutilisée. |
| `BlurUtil.recalculateBlurQueueAndSums(queue: table, kernelSize: integer, radius: integer, edgeValue: number) → number, number, number` | 186 | ✍ Remplit la file avec la valeur de bord et renvoie la somme pondérée initiale, la somme entrante et la somme sortante pour un noyau de la taille donnée. Utilisée au début de chaque ligne ou colonne. |
| `BlurUtil.iterateStackBlur(dataGetter: function, dataSetter: function, queue: table, kernelSize: integer, stackSize: integer, radius: integer, sum: number, inSum: number, outSum: number, queueCounter: integer, x: integer, y: integer) → number, number, number, integer` | 234 | ✍ Étape interne : écrit la valeur moyennée en (x, y), puis met à jour la file et les trois sommes courantes avec l'échantillon suivant, et renvoie les nouvelles sommes et le compteur. Non destinée à être appelée hors de cette classe. |

# specialization/SpecializationUtil.lua

*[English version](../../../scripts/specialization/SpecializationUtil.md)*

Source: `dataS/scripts/specialization/SpecializationUtil.lua` — FS25 1.25.1.0

✍ Fonctions utilitaires statiques partagées par tous les types d'objets construits à partir de spécialisations (véhicules, placeables...). Elles enregistrent fonctions, fonctions surchargées, événements et écouteurs sur une table de type, et distribuent les événements aux spécialisations à l'écoute d'un objet. Un second groupe gère un compteur de tâches de chargement et l'étape de chargement d'une classe de type.

- **SpecializationUtil** (l.10)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SpecializationUtil.raiseAsyncEvent(object: table, eventName: string, ...: any)` | 19 | ✍ Comme raiseEvent, mais chaque appel d'écouteur est mis en file sur l'objet via addAsyncTask au lieu d'être exécuté immédiatement. Les arguments sont capturés au préalable ; un événement non enregistré journalise une erreur avec la pile d'appels. |
| `SpecializationUtil.raiseEvent(object: table, eventName: string, ...: any)` | 45 | ✍ Appelle la fonction d'événement de chaque spécialisation à l'écoute de l'événement sur cet objet, dans l'ordre d'enregistrement, avec l'objet et les arguments supplémentaires. Journalise une erreur et retourne si l'événement n'est pas enregistré pour le type. |
| `SpecializationUtil.registerFunction(objectType: table, funcName: string, func: function)` | 68 | ✍ Ajoute une fonction à la table de fonctions du type sous le nom donné. Erreur (sans effet) si le nom est vide, la fonction nil, ou le nom déjà utilisé comme fonction ou événement. |
| `SpecializationUtil.registerOverwrittenFunction(objectType: table, funcName: string, func: function)` | 103 | ✍ Enveloppe une fonction de type déjà enregistrée avec un remplacement via Utils.overwrittenFunction. Si aucune fonction de ce nom n'existe, rien ne se passe et aucune erreur n'est levée. |
| `SpecializationUtil.registerEvent(objectType: table, eventName: string)` | 128 | ✍ Déclare un nouvel événement sur le type et crée sa liste d'écouteurs vide. Erreur si le nom est vide ou déjà enregistré comme fonction ou événement. |
| `SpecializationUtil.registerEventListener(objectType: table, eventName: string, specClass: table)` | 158 | ✍ Ajoute une classe de spécialisation aux écouteurs d'un événement du type. La classe doit définir une fonction du même nom que l'événement et ne pas être déjà enregistrée ; un événement inconnu du type est ignoré silencieusement. |
| `SpecializationUtil.removeEventListener(object: table, eventName: string, specClass: table)` | 207 | ✍ Retire une classe de spécialisation de la liste d'écouteurs d'un événement sur un objet précis (niveau instance, pas type). Sans effet si l'événement n'a pas de liste. |
| `SpecializationUtil.hasSpecialization(spec: table, specializations: table) → boolean` | 225 | ✍ Retourne true si la classe de spécialisation donnée figure dans la liste de spécialisations fournie. |
| `SpecializationUtil.initSpecializationsIntoTypeClass(typeManager: any, typeDef: any, target: table) → any` | 241 | ✍ Copie les références de la définition de type (type, nom, spécialisations, noms, table par nom) sur l'objet cible et lui donne son propre clone (profondeur 2) des tables d'écouteurs d'événements. Retourne le typeDef. |
| `SpecializationUtil.copyTypeFunctionsInto(typeDef: table, target: table)` | 256 | ✍ Copie chaque fonction enregistrée sur la définition de type dans la table cible, en écrasant les champs de même nom. |
| `SpecializationUtil.createLoadingTask(typeClass: table, target: any) → table` | 302 | ✍ Ajoute une nouvelle entrée de tâche contenant la cible donnée à la liste loadingTasks de la classe de type et la retourne. La classe doit déjà avoir une table loadingTasks. |
| `SpecializationUtil.finishLoadingTask(typeClass: table, task: table)` | 321 | ✍ Retire une tâche de loadingTasks (avertit si elle n'y était pas). Si readyForFinishLoading est vrai et qu'aucune tâche ne reste, appelle onFinishedLoading de la classe. |
| `SpecializationUtil.setLoadingStep(typeClass: table, loadingStep: SpecializationLoadStep)` | 342 | ✍ Enregistre l'étape de chargement sur la classe de type après validation contre SpecializationLoadStep ; une valeur invalide journalise une erreur avec pile d'appels et ne change rien. |
| `SpecializationUtil.getIsValidLoadingStep(loadingStep: SpecializationLoadStep) → boolean` | 359 | ✍ Retourne true si la valeur égale l'une des valeurs de l'énumération SpecializationLoadStep (définie ailleurs, NON VÉRIFIÉ ici). |

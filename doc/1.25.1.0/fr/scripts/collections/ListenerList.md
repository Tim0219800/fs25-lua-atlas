# collections/ListenerList.lua

*[English version](../../../scripts/collections/ListenerList.md)*

Source: `dataS/scripts/collections/ListenerList.lua` — FS25 1.25.1.0

✍ Petit assistant d'observateurs contenant une liste ordonnée d'écouteurs, chacun résolu via TargetedFunction.resolveListener (classe définie ailleurs, NON VÉRIFIÉ). Appeler la liste, ou invoke, exécute chaque écouteur dans l'ordre d'enregistrement. Ce fichier ne contient aucune fonction de désinscription.

- **ListenerList** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ListenerList.new(ignoreFirstArgument: boolean?) → ListenerList` | 18 | ✍ Crée une liste d'écouteurs vide. Avec ignoreFirstArgument à true, invoke retire son premier argument (typiquement la table propriétaire) avant d'appeler les écouteurs. |
| `ListenerList:registerListener(listenerFunction: (function\|TargetedFunction), targetObject: table?)` | 37 | ✍ Résout une fonction ou un TargetedFunction avec un objet cible optionnel et l'ajoute à la fin de la liste. Un même écouteur peut être ajouté plusieurs fois. |
| `ListenerList:invoke(targetObject: any, ...: any)` | 49 | ✍ Appelle chaque écouteur dans l'ordre avec les arguments donnés ; le premier argument est ignoré si la liste a été créée avec ignoreFirstArgument. Les valeurs de retour sont ignorées. |
| `ListenerList_mt.__call(instance: ListenerList, ...: any)` | 67 | ✍ Métaméthode permettant d'appeler la liste comme une fonction, en transmettant à invoke les mêmes arguments. |

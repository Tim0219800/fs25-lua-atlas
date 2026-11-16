# utils/TargetedFunction.lua

*[English version](../../../scripts/utils/TargetedFunction.md)*

Source: `dataS/scripts/utils/TargetedFunction.lua` — FS25 1.25.1.0

✍ Petite classe qui enveloppe une fonction avec un objet cible optionnel et des arguments liés optionnels, pour la stocker comme écouteur d'événement et l'appeler plus tard. Les instances sont appelables directement via la métaméthode __call, qui renvoie vers invoke. Lua pur, sans distinction client ou serveur.

- **TargetedFunction** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TargetedFunction.new(targetFunction: function, targetObject: table?, ...: any) → TargetedFunction` | 20 | ✍ Crée un TargetedFunction à partir d'une fonction, d'une table cible optionnelle et d'arguments supplémentaires optionnels stockés dans une table packée. Les builds de debug vérifient les types par assert. |
| `TargetedFunction:delete()` | 43 | ✍ Efface les références à la fonction et à la cible pour qu'elles puissent être libérées. Les arguments liés sont conservés. |
| `TargetedFunction.resolveListener(targetFunction: function, targetObject: table?) → TargetedFunction` | 53 | ✍ Enveloppe une fonction simple (avec cible optionnelle) dans un nouveau TargetedFunction ; toute autre valeur est supposée être déjà un TargetedFunction et renvoyée telle quelle, sans vérification. |
| `TargetedFunction:unpackCombinedArguments(...: any) → any` | 68 | ✍ Renvoie les arguments liés suivis des arguments supplémentaires donnés maintenant, comme valeurs séparées. S'appuie sur table.getListUnion, défini ailleurs (NON VÉRIFIÉ). |
| `TargetedFunction:invoke(...: any) → any` | 76 | ✍ Appelle la fonction stockée en passant d'abord l'objet cible s'il existe, puis les arguments liés (s'il y en a) suivis des arguments de l'appel. Renvoie la valeur de retour de la fonction. |
| `TargetedFunction_mt.__call(instance: TargetedFunction, ...: any) → any` | 99 | ✍ Métaméthode qui permet d'appeler l'instance comme une fonction ; elle transmet simplement les arguments à invoke et renvoie son résultat. |

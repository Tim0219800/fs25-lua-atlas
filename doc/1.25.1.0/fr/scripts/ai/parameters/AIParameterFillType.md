# ai/parameters/AIParameterFillType.lua

*[English version](../../../../scripts/ai/parameters/AIParameterFillType.md)*

Source: `dataS/scripts/ai/parameters/AIParameterFillType.lua` — FS25 1.25.1.0

✍ Paramètre de job IA pour choisir un type de remplissage dans une liste de types valides, chacun affiché avec son niveau disponible en litres. Il est sauvegardé en XML par nom de type et transmis par index de type ; utilisé par exemple par `AIJobLoadAndDeliver`.

- **AIParameterFillType** hérite de `AIParameter` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIParameterFillType.new(customMt: any)` | 16 | ✍ Crée le paramètre de type FILLTYPE, avec une liste vide et aucune sélection. |
| `AIParameterFillType:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 29 | ✍ Écrit le nom du type sélectionné dans l'attribut `#fillType`, s'il y en a un. |
| `AIParameterFillType:loadFromXMLFile(xmlFile: any, key: any)` | 38 | ✍ Lit `#fillType` et convertit le nom en index de type via `g_fillTypeManager`. |
| `AIParameterFillType:readStream(streamId: any, connection: any)` | 47 | ✍ Lit un index de type optionnel (`FillTypeManager.SEND_NUM_BITS` bits) et le sélectionne. |
| `AIParameterFillType:writeStream(streamId: any, connection: any)` | 56 | ✍ Écrit un drapeau de présence et, si sélectionné, l'index de type. |
| `AIParameterFillType:setValidFillTypes(fillTypes: any)` | 64 | ✍ Remplace la liste à partir d'une table index de type vers niveau, avec des titres « Nom (N l) » triés alphabétiquement. Si la sélection courante n'est plus dans la liste, sélectionne un type avec un niveau supérieur à 0 ou la première entrée. À noter : `maxFillLevel` n'est jamais mis à jour, donc le type retenu est le dernier parcouru avec du stock, pas le plus élevé (bug apparent). |
| `AIParameterFillType:setNextItem()` | 98 | ✍ Sélectionne l'entrée suivante de la liste, en revenant à la première. |
| `AIParameterFillType:setPreviousItem()` | 115 | ✍ Sélectionne l'entrée précédente de la liste, en revenant à la dernière. |
| `AIParameterFillType:setFillTypeByIndex(index: any)` | 132 | ✍ Sélectionne le type à la position de liste donnée ; efface la sélection si la position n'existe pas. |
| `AIParameterFillType:setFillTypeIndex(fillTypeIndex: any)` | 143 | ✍ Fixe directement l'index du type sélectionné, sans vérifier la liste. |
| `AIParameterFillType:getFillTypeIndex()` | 149 | ✍ Renvoie l'index du type sélectionné, ou nil. |
| `AIParameterFillType:getString()` | 155 | ✍ Renvoie le titre de liste du type sélectionné, ou une chaîne vide. |
| `AIParameterFillType:validate()` | 167 | ✍ Renvoie false plus une erreur localisée « aucun type de remplissage » si rien n'est sélectionné, sinon true et nil. |

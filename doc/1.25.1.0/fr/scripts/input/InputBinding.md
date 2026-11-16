# input/InputBinding.lua

*[English version](../../../scripts/input/InputBinding.md)*

Source: `dataS/scripts/input/InputBinding.lua` — FS25 1.25.1.0

✍ Gestionnaire des liaisons d'entrées (`InputBinding`, catégorie Input) : il conserve les liaisons d'actions et les événements d'action enregistrés, regroupés par contexte d'entrée, et les expose au reste des scripts. Dans ce dump du SDK, le fichier fait environ 4140 lignes mais presque tout est vide ; seuls la déclaration de la classe et le corps d'une méthode subsistent, le reste de la classe est donc NON VÉRIFIÉ ici. Les événements sont retrouvés via les tables `contexts` et `nameActions`.

- **InputBinding** (l.25)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `InputBinding:setContextEventsActive(contextName: any, actionName: any, isActive: any)` | 4134 | ✍ Active ou désactive tous les événements enregistrés dans le contexte nommé pour l'action nommée, en appelant `setEventActive` sur chacun. Aucune protection : un contexte inconnu ou une action sans événements provoque une erreur Lua. À noter : le commentaire de la source décrit un getter, ce qui ne correspond pas. |

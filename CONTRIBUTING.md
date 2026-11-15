# Contribuer

Les contributions les plus utiles sont les **descriptions** (`descriptions/<version>/<chemin>.json`) et les corrections de faits vérifiés en jeu.

## Format d'une description
```json
{
  "fichier": "vehicles/specializations/WorkParticles.lua",
  "module": "Rôle du fichier, côté client/serveur, données lues, conditions des effets, points d'extension.",
  "fonctions": {
    "WorkParticles:onUpdateTick": "Ce que fait la fonction, paramètres, valeurs de retour, pièges."
  }
}
```
- Les clés de `fonctions` doivent être **exactement** les noms du code : `Classe.fn` (point) ou `Classe:fn` (méthode).
- Langue : français. Ton sobre et factuel.

## Règles (non négociables)
1. **Ne jamais recopier** de code, de corps de fonction ni de commentaire GIANTS. Reformuler avec ses propres mots.
   Citer un nom de variable, une clé XML, une valeur par défaut ou une unité est permis.
2. **Ne rien inventer.** Indiquer le niveau de confiance :
   - **NON VÉRIFIÉ** : le comportement dépend de code absent du dump (par exemple `Weather`, `Environment`, `EffectManager`) ;
   - « non relu » : partie survolée ;
   - « non vérifié en jeu » : lu dans le code mais pas testé.
3. Signaler les bugs apparents du jeu avec « à noter : … ».
4. Renvoyer au code par `fichier:ligne` plutôt que d'en citer.

## Vérifier avant d'envoyer
```
python -I outils/generer.py 1.25.1.0
```
La CI vérifie la validité des JSON, l'absence de texte GIANTS et la syntaxe des stubs (`luajit -bl`).

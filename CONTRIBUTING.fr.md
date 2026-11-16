# Contribuer

*[English version: CONTRIBUTING.md](CONTRIBUTING.md)*

Les contributions les plus utiles sont les **corrections de descriptions** (`descriptions/<version>/<chemin>.json`) et les faits vérifiés en jeu.

## Format d'une description
Chaque description est bilingue : **anglais** (principal, utilisé par les stubs et le site anglais) et **français** (site secondaire sous `doc/<version>/fr/`).
```json
{
  "fichier": "vehicles/specializations/WorkParticles.lua",
  "module": {"en": "Role of the file, client/server side, data read, extension points.",
             "fr": "Rôle du fichier, côté client/serveur, données lues, points d'extension."},
  "fonctions": {
    "WorkParticles:onUpdateTick": {"en": "What the function does, side effects, return values, pitfalls.",
                                   "fr": "Ce que fait la fonction, effets de bord, valeurs de retour, pièges."}
  }
}
```
- Les clés de `fonctions` doivent être **exactement** les noms du code : `Classe.fn` (point) ou `Classe:fn` (méthode). Chaque fonction non locale du fichier a sa clé.
- Nouveau fichier : `python -I outils/verifier_descriptions.py 1.25.1.0 --squelette <dossier/Fichier.lua>` crée le squelette avec toutes les clés.
- Les deux langues disent les mêmes faits. Si tu n'écris qu'une langue, signale-le dans la pull request : elle sera traduite.

## Règles (non négociables)
1. **Ne jamais recopier** de code, de corps de fonction ni de commentaire GIANTS. Reformuler avec ses propres mots.
   Citer un nom de variable, une clé XML, une valeur par défaut ou une unité est permis.
2. **Ne rien inventer.** Indiquer le niveau de confiance :
   - **UNVERIFIED** / **NON VÉRIFIÉ** : le comportement dépend de code absent du dump (par exemple `Weather`, `Environment`, `EffectManager`) ;
   - « Signature only » / « Signature seule » : le fichier n'a pas de corps de fonctions dans le dump du SDK ;
   - « not tested in game » / « non vérifié en jeu » : lu dans le code mais pas testé.
3. Signaler les bugs apparents du jeu avec « Note: … » / « À noter : … ».
4. Renvoyer au code par `fichier:ligne` plutôt que d'en citer.

## Vérifier avant d'envoyer
```
python -I outils/verifier_descriptions.py 1.25.1.0
python -I outils/generer.py 1.25.1.0
```
Le vérificateur contrôle les clés, les deux langues et, si tu as les sources du jeu en local, qu'aucune suite de 8 mots n'en est recopiée.
La CI vérifie que les JSON sont valides et bilingues, l'absence de texte GIANTS et la syntaxe des stubs (`luajit -bl`).

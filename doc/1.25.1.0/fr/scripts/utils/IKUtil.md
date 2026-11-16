# utils/IKUtil.lua

*[English version](../../../scripts/utils/IKUtil.md)*

Source: `dataS/scripts/utils/IKUtil.lua` — FS25 1.25.1.0

✍ Enregistre les chemins du schéma XML utilisés par les chaînes de cinématique inverse (IK). Ce fichier ne définit aucun comportement d'exécution : une fonction déclare la description d'une chaîne (cible, limites de rotation par noeud, amortissement, poses, nombre d'itérations) et l'autre déclare les cibles qui sélectionnent chaînes et poses. Le code qui évalue les chaînes IK n'est pas dans ce fichier (NON VÉRIFIÉ).


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `IKUtil.registerIKChainTargetsXMLPaths(schema: any, basePath: any)` | 398 | ✍ Enregistre les entrées de cible sous un chemin de base : nom de chaîne, noeud cible, décalages de translation et de rotation, drapeau set-dirty (true par défaut), noeuds de rotation par index et identifiant de pose. |
| `IKUtil.registerIKChainXMLPaths(schema: any, basePath: any)` | 411 | ✍ Enregistre les chemins XML d'une chaîne IK : id, cible et décalages, noeuds de chaîne avec limites d'angle par axe (-180 à 180 par défaut), amortissement (30), limites locales, noeuds de rotation, poses, nombres d'itérations (20, le double à l'init), seuil de position 0.005 et dirty-on-load. |

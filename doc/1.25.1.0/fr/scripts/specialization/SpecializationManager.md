# specialization/SpecializationManager.lua

*[English version](../../../scripts/specialization/SpecializationManager.md)*

Source: `dataS/scripts/specialization/SpecializationManager.lua` — FS25 1.25.1.0

✍ Gestionnaire qui enregistre les classes de spécialisations (véhicules, placeables, etc.) d'une famille de types à partir d'une liste XML. Il étend AbstractManager, charge chaque script de spécialisation, puis les conserve par nom et dans l'ordre de chargement. Il pilote aussi l'initialisation en deux étapes de chaque spécialisation via le gestionnaire de tâches asynchrones.

- **SpecializationManager** hérite de `AbstractManager` (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SpecializationManager.new(typeName: string, xmlFilename: string, customMt: table?) → SpecializationManager` | 34 | ✍ Crée un gestionnaire pour le nom de type et le chemin XML donnés. Les deux valeurs sont stockées ; le XML n'est lu que plus tard dans loadMapData. |
| `SpecializationManager:initDataStructures()` | 45 | ✍ Réinitialise la table des spécialisations (par nom) et la liste ordonnée qui conserve l'ordre de chargement. |
| `SpecializationManager:loadMapData() → boolean` | 53 | ✍ Lit le XML des spécialisations et, pour chaque entrée avec name, className et filename, met en file une sous-tâche asynchrone appelant addSpecialization. Les entrées incomplètes sont ignorées avec un avertissement. Retourne false si le XML est introuvable. |
| `SpecializationManager:addSpecialization(name: string, className: string, filename: string, customEnvironment: string) → boolean` | 118 | ✍ Enregistre une spécialisation : charge son script, résout la classe par son nom et y inscrit son className. Refuse les noms en double ou un className/filename nil (retourne false) ; une classe introuvable ne produit qu'un avertissement. |
| `SpecializationManager:initSpecializations()` | 154 | ✍ Pour chaque spécialisation enregistrée, dans l'ordre de chargement, met en file une sous-tâche asynchrone appelant son initSpecialization statique, si elle en définit une. |
| `SpecializationManager:postInitSpecializations()` | 167 | ✍ Comme initSpecializations mais pour le postInitSpecialization statique optionnel, prévu pour s'exécuter après l'initialisation de toutes les spécialisations. |
| `SpecializationManager:getSpecializationByName(name: string) → table?` | 182 | ✍ Retourne l'entrée d'enregistrement (name, className, filename) d'une spécialisation, ou nil si le nom est nil ou inconnu. |
| `SpecializationManager:getSpecializationObjectByName(name: string) → table?` | 194 | ✍ Retourne la table de classe réelle d'une spécialisation, résolue via ClassUtil à partir du className enregistré, ou nil si inconnue. |
| `SpecializationManager:getSpecializations() → table` | 207 | ✍ Retourne la table interne des entrées d'enregistrement indexée par nom de spécialisation. |

# misc/TensionBeltManager.lua

*[English version](../../../scripts/misc/TensionBeltManager.md)*

Source: `dataS/scripts/misc/TensionBeltManager.lua` — FS25 1.25.1.0

✍ Gestionnaire simple (pas une sous-classe d'AbstractManager) qui stocke les définitions visuelles des sangles de tension servant à arrimer des charges. Les types de sangle sont enregistrés au chargement d'un nœud i3d de carte utilisant le rappel onCreateTensionBelt ; chacun lit des attributs utilisateur et des nœuds enfants (matériau, matériau factice, crochets, cliquet). La première sangle enregistrée devient celle par défaut.

- **TensionBeltManager** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TensionBeltManager.new(customMt: any) → table` | 17 | ✍ Constructeur : construit le gestionnaire avec la métatable fournie ou celle par défaut et initialise ses tables de données. |
| `TensionBeltManager:initDataStructures()` | 27 | ✍ Vide la table des sangles et efface la sangle par défaut. |
| `TensionBeltManager:unloadMapData()` | 34 | ✍ Appelé au déchargement de la carte : réinitialise simplement toutes les sangles stockées en relançant initDataStructures. |
| `TensionBeltManager.onCreateTensionBelt(_: any, id: any)` | 40 | ✍ Rappel onCreate i3d pour un nœud modèle de sangle. Lit les attributs utilisateur name (défaut "default") et width (défaut 0.15), puis parcourt les enfants marqués isMaterial, isDummyMaterial, isHook (premier et second crochet) et isRatchet. Avertit et ignore si le type existe déjà ou s'il manque le matériau ou le matériau factice ; enregistre la sangle et fait de la première la sangle par défaut. Utilise la globale g_tensionBeltManager. |
| `TensionBeltManager:getType(beltName: any)` | 98 | ✍ Construit la clé interne d'un nom de sangle : le nom en majuscules préfixé par BELT_TYPE_. |
| `TensionBeltManager:getBeltData(beltName: any)` | 104 | ✍ Retourne la définition de sangle pour un nom, avec repli sur la sangle par défaut si le nom est nil ou inconnu (nil si aucune sangle n'a jamais été enregistrée). |

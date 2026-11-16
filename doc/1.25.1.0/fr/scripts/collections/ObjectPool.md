# collections/ObjectPool.lua

*[English version](../../../scripts/collections/ObjectPool.md)*

Source: `dataS/scripts/collections/ObjectPool.lua` — FS25 1.25.1.0

✍ Réserve d'objets réutilisables qui distribue des tables du pool et en construit de nouvelles avec un constructeur quand elle est vide. Un ensemble empêche de remettre deux fois la même instance. ObjectPool.EMPTY_TABLE_CONSTRUCTOR est utilisé ici mais non défini dans ce fichier (NON VÉRIFIÉ).

- **ObjectPool** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ObjectPool.new(objectConstructor: function?, ...: any) → ObjectPool` | 27 | ✍ Crée un pool. Le constructeur optionnel et ses arguments supplémentaires sont conservés pour créer des objets quand le pool est vide ; sans constructeur, un constructeur de table vide par défaut est utilisé. |
| `ObjectPool:getLength() → integer` | 52 | ✍ Retourne le nombre d'objets actuellement disponibles dans le pool. |
| `ObjectPool:clear()` | 59 | ✍ Vide le pool et son ensemble de détection de doublons. Les objets du pool sont simplement oubliés, pas supprimés. |
| `ObjectPool:getOrCreateNext() → table` | 67 | ✍ Retire et retourne le dernier objet du pool, ou en crée un nouveau avec le constructeur et ses arguments mémorisés si le pool est vide. |
| `ObjectPool:returnToPool(instance: table)` | 94 | ✍ Remet une instance dans le pool. Les tables vides par défaut sont vidées, les autres objets voient leur méthode reset appelée si elle existe. Retourne false pour nil ou une instance déjà dans le pool, sinon true. |

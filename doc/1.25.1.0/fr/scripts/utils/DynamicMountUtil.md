# utils/DynamicMountUtil.lua

*[English version](../../../scripts/utils/DynamicMountUtil.md)*

Source: `dataS/scripts/utils/DynamicMountUtil.lua` — FS25 1.25.1.0

> ⚠ Dans le dump du SDK, ce fichier ne contient que des **signatures** (pas de corps).

✍ Signature seule (pas de corps dans le dump du SDK) : aide pour monter des objets sur un nœud via des joints physiques, normalement appelée par les classes montables plutôt que directement. Les types de montage acceptés incluent fourche, plusieurs variantes d'auto-attache et attache fixe (noms tirés de la liste de paramètres, NON VÉRIFIÉ).

- **DynamicMountUtil** (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `DynamicMountUtil.mountDynamic(mountable: table, nodeId: integer, object: table, objectActorId: integer, jointNode: integer, mountType: integer, forceAcceleration: number, jointNode2: integer) → boolean` | 32 | ✍ Signature seule (pas de corps dans le dump du SDK) : monte vraisemblablement un objet sur un nœud via un joint du type choisi, avec une accélération de force et un second nœud de joint optionnel, et renvoie un booléen de succès. NON VÉRIFIÉ. |
| `DynamicMountUtil.unmountDynamic(mountable: table, remove: boolean?)` | 122 | ✍ Signature seule (pas de corps dans le dump du SDK) : libère vraisemblablement un objet monté dynamiquement, avec un indicateur optionnel de suppression. NON VÉRIFIÉ. |

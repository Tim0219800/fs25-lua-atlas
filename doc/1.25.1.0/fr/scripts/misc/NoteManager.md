# misc/NoteManager.lua

*[English version](../../../scripts/misc/NoteManager.md)*

Source: `dataS/scripts/misc/NoteManager.lua` — FS25 1.25.1.0

✍ Gestionnaire de debug (étend AbstractManager) pour créer des noeuds de note à l'exécution et les exporter en fichier i3d. Dans ce dump seule l'initialisation des structures est visible ; les gestionnaires d'export et de liste sont référencés mais non définis ici (NON VÉRIFIÉ).

- **NoteManager** hérite de `AbstractManager` (l.15)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `NoteManager:initDataStructures()` | 25 | ✍ Réinitialise les champs de session et construit la liste de couleurs (blanc plus DebugUtil.COLORS). Au premier appel, enregistre les commandes console gsNoteExport et gsNoteList, dont les gestionnaires consoleCommandExportNotes et consoleCommandListNotes ne sont pas dans ce fichier. |

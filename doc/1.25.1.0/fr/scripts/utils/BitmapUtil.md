# utils/BitmapUtil.lua

*[English version](../../../scripts/utils/BitmapUtil.md)*

Source: `dataS/scripts/utils/BitmapUtil.lua` — FS25 1.25.1.0

✍ Petit utilitaire pour écrire des données de pixels sur le disque sous forme d'images portable anymap (PNM), surtout utile pour déboguer des cartes et des données de densité. La table de formats BitmapUtil.FORMAT_TO_PNM utilisée par les deux fonctions n'est pas définie dans le dump du SDK (NON VÉRIFIÉ).

- **BitmapUtil** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BitmapUtil.writeBitmapToFile(pixels: table, width: integer, height: integer, filepath: string, imageFormat: integer) → boolean` | 58 | ✍ Écrit une table de pixels dans un fichier PNM en ajoutant l'extension du format au chemin. Journalise une erreur et renvoie false si le format est inconnu ou si le fichier ne peut être créé ; renvoie true après l'écriture et le log. |
| `BitmapUtil.writeBitmapToFileFromIterator(iterator: function, width: integer, height: integer, filepath: string, imageFormat: integer) → boolean` | 107 | ✍ Comme writeBitmapToFile mais récupère les pixels depuis une fonction itératrice plutôt qu'une table, avec écriture par blocs sur le disque. Renvoie false si le format est invalide ou si le fichier n'a pu être créé, true en cas de succès. |

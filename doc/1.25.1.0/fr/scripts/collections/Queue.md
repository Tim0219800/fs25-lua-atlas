# collections/Queue.lua

*[English version](../../../scripts/collections/Queue.md)*

Source: `dataS/scripts/collections/Queue.lua` — FS25 1.25.1.0

✍ Ébauche de classe Queue : le dump ne contient que peek, qui lit un champ `first`. Aucun constructeur ni fonction d'ajout/retrait n'est présent dans ce fichier, donc la manière dont ce champ est rempli est NON VÉRIFIÉE.

- **Queue** (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Queue:peek() → table?` | 69 | ✍ Donne ce qui se trouve en premier dans la file, lu dans le champ `first`, sans le retirer ; nil s'il n'y a rien. |

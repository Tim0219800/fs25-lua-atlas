# objects/BgaSellStation.lua

*[English version](../../../scripts/objects/BgaSellStation.md)*

Source: `dataS/scripts/objects/BgaSellStation.lua` — FS25 1.25.1.0

✍ Station de déchargement utilisée par les méthaniseurs pour la vente de marchandises. Elle étend UnloadingStation et ajoute seulement l'enregistrement XML du drapeau appearsOnStats.

- **BgaSellStation** hérite de `UnloadingStation` (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BgaSellStation.registerXMLPaths(schema: any, basePath: any)` | 55 | ✍ Enregistre l'attribut XML booléen appearsOnStats (false par défaut) au chemin de base, puis les chemins d'UnloadingStation. L'attribut n'est que déclaré ici ; son usage n'est pas dans ce fichier (NON VÉRIFIÉ). |

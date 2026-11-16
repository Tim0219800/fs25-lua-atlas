# triggers/PointOfInterest.lua

*[English version](../../../scripts/triggers/PointOfInterest.md)*

Source: `dataS/scripts/triggers/PointOfInterest.lua` — FS25 1.25.1.0

✍ Fichier minimal pour un point d'intérêt : son seul contenu est la déclaration de ses attributs XML (triggerNode, text, textFormat, textParams, showOwner, showEveryone). Aucune logique de chargement ou d'exécution n'existe ici ; le code qui lit ces clés est ailleurs (NON VÉRIFIÉ).

- **PointOfInterest** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PointOfInterest.registerXMLPaths(schema: any, basePath: any)` | 16 | ✍ Enregistre les attributs XML triggerNode, text, textFormat, textParams, showOwner et showEveryone sous le chemin de base donné. |

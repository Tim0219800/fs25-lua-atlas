# objects/UnloadingStation.lua

*[English version](../../../scripts/objects/UnloadingStation.md)*

Source: `dataS/scripts/objects/UnloadingStation.lua` — FS25 1.25.1.0

✍ Classe de base des stations où les véhicules déchargent des marchandises, étendant Object. Dans ce dump elle ne contient que l'envoi réseau à la connexion de ses triggers de déchargement, une validation développeur vérifiant que les types palette, balle et vrac ont un trigger adapté, et les chemins XML communs. Le reste de la classe (chargement, gestion des triggers, liens de stockage) n'est pas dans ce fichier et reste NON VÉRIFIÉ ici. SellingStation en hérite.

- **UnloadingStation** hérite de `Object` (l.15)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `UnloadingStation:readStream(streamId: integer, connection: table)` | 164 | ✍ Synchro initiale côté client : après les données parent, lit pour chaque trigger de déchargement son identifiant et ses données de flux, puis termine son enregistrement auprès du client. |
| `UnloadingStation:writeStream(streamId: integer, connection: table)` | 179 | ✍ Synchro initiale côté serveur : après les données parent, écrit l'identifiant et les données de flux de chaque trigger de déchargement et l'enregistre dans le flux pour cette connexion. |
| `UnloadingStation:validateUnloadTriggers(xmlFile: any, key: any)` | 457 | ✍ Contrôle développeur au chargement : journalise un avertissement quand un type palette, balle ou vrac n'a pas de classe de trigger adaptée (PalletUnloadTrigger, BaleUnloadTrigger, UnloadTrigger). Les gares et stations de palettes ignorent les contrôles balle et vrac, et les clés d'élevage ignorent l'avertissement balle. Ne modifie aucun état. |
| `UnloadingStation.registerXMLPaths(schema: any, basePath: any)` | 517 | ✍ Enregistre les attributs XML de la station (noeud, nom, rayon de stockage, masquage du menu des prix, extensions, options gare et palettes seulement), les chemins des triggers de déchargement, les sons (`active`, `idle`), noeuds d'animation, noeuds d'effets et entrées `simpleFillplane`. |

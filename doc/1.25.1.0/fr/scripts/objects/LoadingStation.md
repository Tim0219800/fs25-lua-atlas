# objects/LoadingStation.lua

*[English version](../../../scripts/objects/LoadingStation.md)*

Source: `dataS/scripts/objects/LoadingStation.lua` — FS25 1.25.1.0

✍ Station permettant aux véhicules de charger des types de remplissage depuis un ou plusieurs stockages source via des load triggers (la classe hérite de Object). Dans ce dump seuls quelques membres ont un corps : synchro réseau des load triggers, transmission de l'activation au placeable propriétaire, retrait de niveau de remplissage et enregistrement du schéma XML. Le reste de la classe (chargement, enregistrement des stockages, règles d'accès) est absent du dump du SDK : comportement NON VÉRIFIÉ.

- **LoadingStation** hérite de `Object` (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `LoadingStation:readStream(streamId: integer, connection: table)` | 106 | ✍ Côté client à la connexion : après le readStream parent, si la connexion est celle du serveur, lit l'id réseau et l'état de chaque load trigger puis termine son enregistrement auprès du client. |
| `LoadingStation:writeStream(streamId: integer, connection: table)` | 121 | ✍ Côté serveur à la connexion : après le writeStream parent, écrit l'id réseau et l'état de chaque load trigger et l'enregistre dans le flux pour le client qui se connecte. |
| `LoadingStation:raiseActive()` | 145 | ✍ Appelle le raiseActive parent et réveille aussi le placeable propriétaire, s'il existe, pour que les deux continuent à être mis à jour. |
| `LoadingStation:removeFillLevel(fillTypeIndex: integer, fillDelta: number, farmId: integer) → number` | 299 | ✍ Retire fillDelta d'un type de remplissage des stockages source auxquels la ferme a accès et retourne la quantité encore manquante (0 si inférieure à 0,0001). À noter : chaque stockage reçoit la demande du fillDelta complet et non du reste, donc les stockages suivants peuvent perdre plus que nécessaire. |
| `LoadingStation.registerXMLPaths(schema: any, basePath: any)` | 376 | ✍ Enregistre les entrées du schéma XML d'une station de chargement : node, stationName, storageRadius, supportsExtension, fillTypes, fillTypeCategories, plus des enfants loadTrigger répétés (via LoadTrigger.registerXMLPaths) avec un attribut class. |

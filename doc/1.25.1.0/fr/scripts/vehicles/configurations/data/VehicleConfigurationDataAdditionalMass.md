# vehicles/configurations/data/VehicleConfigurationDataAdditionalMass.lua

*[English version](../../../../../scripts/vehicles/configurations/data/VehicleConfigurationDataAdditionalMass.md)*

Source: `dataS/scripts/vehicles/configurations/data/VehicleConfigurationDataAdditionalMass.lua` — FS25 1.25.1.0

✍ Module de données de configuration qui ajoute de la masse aux composants du véhicule selon la configuration, avec déplacement facultatif du centre de masse et réglage des facteurs de ressort et d'amortissement des articulations de composants dépendantes. L'endroit où il est enregistré dans VehicleConfigurationItem.GLOBAL_DATA n'est pas dans ce fichier (NON VÉRIFIÉ).


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleConfigurationDataAdditionalMass.registerXMLPaths(schema: any, rootPath: any, configPath: any)` | 15 | ✍ Statique. Enregistre (en enregistrement partagé) les entrées .component : node, additionalMassNode, décalage, additionalMass, useTotalMassReference et index et facteurs de dependentComponentJoint. |
| `VehicleConfigurationDataAdditionalMass.onLoad(vehicle: any, configItem: any, configId: any)` | 33 | ✍ Pour chaque entrée de composant de la configuration, ajoute additionalMass (valeur XML multipliée par 0,001, donc kg vers t supposé, NON VÉRIFIÉ) à la masse par défaut du composant, déplace son centre de masse vers le noeud ou le décalage donné selon le rapport de masse, et règle les facteurs de ressort et d'amortissement de l'articulation dépendante si possible. |

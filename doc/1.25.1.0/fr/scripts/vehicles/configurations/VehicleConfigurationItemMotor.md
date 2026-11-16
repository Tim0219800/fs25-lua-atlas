# vehicles/configurations/VehicleConfigurationItemMotor.lua

*[English version](../../../../scripts/vehicles/configurations/VehicleConfigurationItemMotor.md)*

Source: `dataS/scripts/vehicles/configurations/VehicleConfigurationItemMotor.lua` — FS25 1.25.1.0

✍ Entrée de configuration (sous-classe de VehicleConfigurationItem) pour les options de moteur. Elle ajoute seulement des valeurs affichées en boutique (puissance en ch, vitesse max) et un indice de configuration des consommateurs à utiliser.

- **VehicleConfigurationItemMotor** hérite de `VehicleConfigurationItem` (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleConfigurationItemMotor.new(configName: any, customMt: any)` | 18 | ✍ Constructeur, appelle le constructeur parent. À noter : l'argument customMt est ignoré, la métatable de la classe est toujours transmise au constructeur parent. |
| `VehicleConfigurationItemMotor:loadFromXML(xmlFile: any, baseKey: any, configKey: any, baseDirectory: any, customEnvironment: any)` | 26 | ✍ Charge les données parentes, puis #hp, #maxSpeed et #consumerConfigurationIndex. Renvoie false si le chargement parent échoue. |
| `VehicleConfigurationItemMotor.registerXMLPaths(schema: any, rootPath: any, configPath: any)` | 40 | ✍ Statique. Enregistre les chemins XML parents ainsi que hp, maxSpeed et consumerConfigurationIndex. |

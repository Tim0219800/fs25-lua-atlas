# environment/weather/Twister.lua

Source: `dataS/scripts/environment/weather/Twister.lua` — FS25 1.25.1.0

✍ Classe Twister dérivée d'Object (objet réseau) : représente une tornade comme entité synchronisée. Dans ce dump, seules les quatre fonctions réseau subsistent (lignes 231-316) ; tout le reste du fichier (lignes 12-230 : création, déplacement, apparition, disparition, effets, dégâts, etc.) est vide, donc tout ce qui concerne le comportement, les particules/effets et la lecture de données météo est NON VÉRIFIÉ. Ce qu'on peut établir à partir des fonctions présentes : l'état synchronisé est la position monde de rootNode (coordonnées compressées par NetworkUtil.readCompressedWorldPosition / writeCompressedWorldPosition avec mission.vehicleXZPosCompressionParams pour X et Z, vehicleYPosCompressionParams pour Y) et une valeur d'estompage fadeValue (float 32 bits). Le serveur fait autorité : il écrit ; le client lit uniquement quand connection:getIsServer() est vrai. À la connexion, le client applique la position directement, appelle setFadeValue(fadeValue, true) puis réinitialise networkTimeInterpolator. Pendant le jeu, la mise à jour n'est écrite que si le bit self.dirtyFlag est levé (champs serveur sendPosX/Y/Z et sendFadeValue) et le client alimente positionInterpolator, fadeInterpolator et networkTimeInterpolator (startNewPhaseNetwork) pour un mouvement interpolé. Aucune aide directe pour un moddeur dans ce fichier tel que fourni ; setFadeValue, les interpolateurs et dirtyFlag sont définis ailleurs (NON VÉRIFIÉ). La classe est référencée aussi par PlaceableDestructible.lua.

- **Twister** inherits from `Object` (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `Twister:readStream(streamId: integer, connection: table)` | 234 | ✍ Côté client à la connexion : appelle la lecture de la classe parente, puis, si la connexion vient du serveur, lit la position compressée (X, Y, Z) qu'il applique à rootNode via setWorldTranslation, lit fadeValue, appelle setFadeValue(fadeValue, true) et réinitialise networkTimeInterpolator. |
| `Twister:writeStream(streamId: integer, connection: table)` | 256 | ✍ Côté serveur à la connexion d'un client : écrit la partie parente, puis, si la connexion n'est pas celle du serveur, la position monde compressée de rootNode et fadeValue. |
| `Twister:readUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 277 | ✍ Côté client lors d'une mise à jour : lit la partie parente puis, si un booléen d'indicateur est vrai, la position compressée et fadeValue, qu'il transmet à positionInterpolator:setTargetPosition et fadeInterpolator:setTargetValue, puis démarre une nouvelle phase d'interpolation réseau (networkTimeInterpolator:startNewPhaseNetwork). |
| `Twister:writeUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 302 | ✍ Côté serveur lors d'une mise à jour : écrit la partie parente, puis un booléen indiquant que dirtyFlag est présent dans le masque, et, si oui, sendPosX/Y/Z compressés et sendFadeValue. |

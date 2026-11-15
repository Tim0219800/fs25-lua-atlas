---@meta
-- FS25 1.25.1.0 : vehicles/wheels/WheelDestruction.lua (stub généré, atlas Lua FS25)

--- Classe (pas une spécialisation) instanciée une fois par roue (Wheel.lua:57, self.destruction) qui gère l'effet des roues sur le terrain : destruction des cultures, retrait de neige fraîche et lissage des tas de matière (density height). Appelée par frame depuis Wheels:onUpdate (Wheels.lua:865) uniquement si le véhicule est actif, avec un drapeau allowFoliageDestruction = option de sauvegarde fruitDestruction, et pas d'IA active, et pas de blocage par getBlockFoliageDestruction. Exécution : serveur toujours ; client seulement sous une distance de mise à jour (WheelDestruction.MAX_UPDATE_DISTANCE, valeur non définie dans ce fichier : NON VÉRIFIÉ), mais les effets sur densité (FSDensityMapUtil, snowSystem, smoothDensityMapHeightAtWorldPos) agissent sur des données de terrain : leur synchronisation réseau n'est pas dans ce fichier (NON VÉRIFIÉ). DONNÉES LUES : contact de la roue (physics.contact, physics.hasSnowContact), vitesse réelle du véhicule (lastSpeedReal > 0.0002, soit environ 0.7 km/h d'après le commentaire du code), propriété de la ferme sur la parcelle (g_farmlandManager), hauteur de neige du monde (snowSystem.height) et hauteur locale. AUCUNE donnée de pluie ni d'humidité n'est lue. Pas d'effet visuel produit ici. Les roues dites « care wheel » (#isCareWheel) ne détruisent pas les cultures. Points d'extension : aucune fonction enregistrée ; surcharger WheelDestruction.* (partagé par toutes les roues) ou Wheel:setIsCareWheel. Le calcul de dt n'est utilisé que pour le lissage (au moins 0.3 m/s de lissage).
---@class WheelDestruction
WheelDestruction = {}

--- Crée l'objet de destruction d'une roue : références à la roue et au véhicule, liste de nœuds de destruction et accumulateur de lissage à zéro.
---@param wheel any
function WheelDestruction.new(wheel) end

--- Lit #isCareWheel (défaut false) et physics#smoothGroundRadius (défaut : max(0.6, 0.75 x largeur de roue), en mètres). Gère l'ancienne clé tire#isCareWheel.
---@param xmlObject any
function WheelDestruction:loadFromXML(xmlObject) end

--- Construit les nœuds de destruction : un par roue visuelle (nœud, largeur, rayon) ; à défaut de roue visuelle (chenilles, etc.), la roue physique elle-même sert de nœud.
function WheelDestruction:finalize() end

--- Par frame. Si la roue touche quelque chose et que le véhicule roule : (1) détruit les cultures sous un petit parallélogramme au sol (largeur de la roue, longueur au plus 0.5 m), seulement sur une parcelle appartenant à la ferme active du véhicule et hors care wheel ; (2) si contact avec la neige, retire de la neige en décalant la zone d'environ 0.75 rayon dans le sens du déplacement. Ensuite, si Platform.gameplay.wheelDensityHeightSmooth : accumule une quantité de lissage (1.2 m par mètre parcouru, au moins 0.3 m/s x dt) et la passe à smoothHeightAtPosition sous chaque nœud. Le test de distance ne s'applique qu'au client.
---@param dt any
---@param allowFoliageDestruction any
function WheelDestruction:update(dt, allowFoliageDestruction) end

--- Délègue à FSDensityMapUtil.updateWheelDestructionArea sur le triangle donné (3 points monde). Le corps de cette fonction est absent du dump (fichier de signatures) : NON VÉRIFIÉ.
---@param x0 any
---@param z0 any
---@param x1 any
---@param z1 any
---@param x2 any
---@param z2 any
function WheelDestruction:destroyFruitArea(x0, z0, x1, z1, x2, z2) end

--- Ne retire la neige que si la neige est fraîche (hauteur locale égale à la hauteur globale à 5 mm près) ou si c'est un tas non fondu (hauteur globale < 5 mm et hauteur locale > 1 m). Calcule une profondeur d'enfoncement (70 % de la neige globale, ou 10 % du tas), la convertit en couches de SnowSystem.MIN_LAYER_HEIGHT puis appelle snowSystem:removeSnow. Utile pour tout effet de neige/givre basé sur le passage des roues.
---@param x0 any
---@param z0 any
---@param x1 any
---@param z1 any
---@param x2 any
---@param z2 any
function WheelDestruction:destroySnowArea(x0, z0, x1, z1, x2, z2) end

--- Lisse un tas de matière (type de hauteur de densité) sous la roue si ce type autorise le lissage : convertit la hauteur physique en hauteur interne via les paramètres de collision du type, puis appelle smoothDensityMapHeightAtWorldPos sur le terrain (rayon donné, marge de 1.2 m). Décalage vertical fixe de -0.1 m.
---@param x any
---@param y any
---@param z any
---@param radius any
---@param amount any
function WheelDestruction:smoothHeightAtPosition(x, y, z, radius, amount) end

--- Débogage : dessine les zones de destruction des roues (parallélogramme jaune) pour les roues qui ne sont pas des care wheels.
function WheelDestruction:drawAreas() end

--- Active ou désactive le mode « care wheel » (pas de destruction de cultures).
---@param isCareWheel any
function WheelDestruction:setIsCareWheel(isCareWheel) end

--- Déclare #isCareWheel et physics#smoothGroundRadius.
---@param schema any
---@param key any
function WheelDestruction.registerXMLPaths(schema, key) end

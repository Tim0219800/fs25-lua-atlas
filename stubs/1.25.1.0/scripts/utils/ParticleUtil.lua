---@meta
-- FS25 1.25.1.0 : utils/ParticleUtil.lua (stub généré, atlas Lua FS25)

--- Utilitaires de systèmes de particules : chargement depuis le XML ou un nœud I3D, émission, vitesses, échelles, durée de vie, matériau et copie. ⚠ Le dump du SDK ne contient que les signatures : le comportement interne n'est pas lisible. Les descriptions ci-dessous viennent de l'usage observé dans le code vanilla (WorkParticles notamment) ; le reste est NON VÉRIFIÉ. Les fonctions qui portent sur « particleSystem » prennent la table renvoyée par les fonctions de chargement, pas un id de nœud.
---@class ParticleUtil
ParticleUtil = {}

---@param xmlFile XMLFile|integer
---@param data table
---@param baseString string
function ParticleUtil.loadParticleSystemData(xmlFile, data, baseString) end

---@param xmlFile integer
---@param particleSystem table
---@param baseString string
---@param linkNodes array
---@param defaultEmittingState boolean
---@param defaultPsFile string?
---@param baseDir string
---@param defaultLinkNode integer?
---@return boolean
function ParticleUtil.loadParticleSystem(xmlFile, particleSystem, baseString, linkNodes, defaultEmittingState, defaultPsFile, baseDir, defaultLinkNode) end

---@param data table
---@param particleSystem table
---@param linkNodes array
---@param defaultEmittingState boolean
---@param defaultPsFile string?
---@param baseDir string?
---@param defaultLinkNode integer?
---@return boolean
function ParticleUtil.loadParticleSystemFromData(data, particleSystem, linkNodes, defaultEmittingState, defaultPsFile, baseDir, defaultLinkNode) end

---@param i3dNode integer
---@param failedReason integer
---@param args table
function ParticleUtil.particleI3DFileLoaded(i3dNode, failedReason, args) end

--- Initialise la table particleSystem à partir d'un nœud I3D déjà chargé. Usage vanilla (WorkParticles) : émission initiale désactivée et worldSpace=true, de sorte que les particules restent en coordonnées monde après leur émission.
---@param rootNode integer
---@param particleSystem table
---@param defaultEmittingState boolean?
---@param worldSpace boolean?
---@param forceFullLifespan boolean?
---@return integer
function ParticleUtil.loadParticleSystemFromNode(rootNode, particleSystem, defaultEmittingState, worldSpace, forceFullLifespan) end

--- Supprime un système de particules chargé ; appelé dans les onDelete (WorkParticles:onDelete).
---@param particleSystem table
function ParticleUtil.deleteParticleSystem(particleSystem) end

---@param particleSystems table
function ParticleUtil.deleteParticleSystems(particleSystems) end

--- Active ou coupe l'émission d'un système. WorkParticles l'appelle à chaque tick avec l'état calculé ; les paramètres resetStartTimer/resetStopTimer ne sont pas utilisés dans ce cas.
---@param particleSystem table
---@param state boolean
---@param resetStartTimer boolean?
---@param resetStopTimer boolean?
function ParticleUtil.setEmittingState(particleSystem, state, resetStartTimer, resetStopTimer) end

---@param particleSystem table
---@return number
function ParticleUtil.getParticleSystemAverageSpeed(particleSystem) end

---@param particleSystem table
---@param scale number
function ParticleUtil.setParticleSystemTimeScale(particleSystem, scale) end

---@param particleSystem table
---@param scale number
function ParticleUtil.setEmitCountScale(particleSystem, scale) end

---@param particleSystem table
---@param lifespan number
function ParticleUtil.setParticleLifespan(particleSystem, lifespan) end

---@param particleSystem table
---@param simTime number
function ParticleUtil.addParticleSystemSimulationTime(particleSystem, simTime) end

---@param particleSystem table
---@param startTime number
---@param stopTime number
function ParticleUtil.setParticleStartStopTime(particleSystem, startTime, stopTime) end

---@param particleSystem table
---@return number
function ParticleUtil.getParticleSystemSpeed(particleSystem) end

---@param particleSystem table
---@param speed number
function ParticleUtil.setParticleSystemSpeed(particleSystem, speed) end

---@param particleSystem table
---@return number
function ParticleUtil.getParticleSystemSpeedRandom(particleSystem) end

---@param particleSystem table
---@param speedRandom number
function ParticleUtil.setParticleSystemSpeedRandom(particleSystem, speedRandom) end

---@param particleSystem table
---@return number
function ParticleUtil.getParticleSystemNormalSpeed(particleSystem) end

---@param particleSystem table
---@param normalSpeed number
function ParticleUtil.setParticleSystemNormalSpeed(particleSystem, normalSpeed) end

---@param particleSystem table
---@return number
function ParticleUtil.getParticleSystemTangentSpeed(particleSystem) end

---@param particleSystem table
---@param tangentSpeed number
function ParticleUtil.setParticleSystemTangentSpeed(particleSystem, tangentSpeed) end

---@param particleSystem table
---@return number
function ParticleUtil.getParticleSystemSpriteScaleX(particleSystem) end

---@param particleSystem table
---@param spriteScaleX number
function ParticleUtil.setParticleSystemSpriteScaleX(particleSystem, spriteScaleX) end

---@param particleSystem table
---@return number
function ParticleUtil.getParticleSystemSpriteScaleY(particleSystem) end

---@param particleSystem table
---@param spriteScaleY number
function ParticleUtil.setParticleSystemSpriteScaleY(particleSystem, spriteScaleY) end

---@param particleSystem table
---@return number
function ParticleUtil.getParticleSystemSpriteScaleXGain(particleSystem) end

---@param particleSystem table
---@param spriteScaleXGain number
function ParticleUtil.setParticleSystemSpriteScaleXGain(particleSystem, spriteScaleXGain) end

---@param particleSystem table
---@return number
function ParticleUtil.getParticleSystemSpriteScaleYGain(particleSystem) end

---@param particleSystem table
---@param spriteScaleYGain number
function ParticleUtil.setParticleSystemSpriteScaleYGain(particleSystem, spriteScaleYGain) end

---@param particleSystem table
---@return number
function ParticleUtil.getParticleSystemVelocityScale(particleSystem) end

---@param particleSystem table
---@param velocityScale number
function ParticleUtil.setParticleSystemVelocityScale(particleSystem, velocityScale) end

---@param particleSystem table
function ParticleUtil.resetNumOfEmittedParticles(particleSystem) end

---@param particleSystem table
---@param emitterShape integer
function ParticleUtil.setEmitterShape(particleSystem, emitterShape) end

---@param particleSystem table
---@param scale number
function ParticleUtil.initEmitterScale(particleSystem, scale) end

---@param particleSystem table
---@param scale number
function ParticleUtil.setMaxNumOfParticlesToEmitScale(particleSystem, scale) end

--- Applique un matériau à un système. Usage vanilla : matériau de particule propre au type de remplissage (g_materialManager:getParticleMaterial).
---@param particleSystem table
---@param material integer
function ParticleUtil.setMaterial(particleSystem, material) end

--- Duplique un système de référence (venant de g_particleSystemManager) et l'attache à emitterShape, avec des surcharges lues sous la clé XML ; renvoie la table du nouveau système (usage : WorkParticles:loadGroundParticleMapping).
---@param xmlFile XMLFile
---@param key string
---@param particleSystem table
---@param emitterShape integer
---@return table
function ParticleUtil.copyParticleSystem(xmlFile, key, particleSystem, emitterShape) end

---@param schema XMLSchema
---@param basePath string
---@param name string
function ParticleUtil.registerParticleXMLPaths(schema, basePath, name) end

--- Enregistre dans un schéma XML les attributs acceptés par copyParticleSystem (appelé depuis WorkParticles.registerGroundParticleMappingXMLPaths).
---@param schema XMLSchema
---@param basePath string
function ParticleUtil.registerParticleCopyXMLPaths(schema, basePath) end

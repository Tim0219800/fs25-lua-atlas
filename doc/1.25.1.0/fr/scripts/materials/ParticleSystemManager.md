# materials/ParticleSystemManager.lua

*[English version](../../../scripts/materials/ParticleSystemManager.md)*

Source: `dataS/scripts/materials/ParticleSystemManager.lua` — FS25 1.25.1.0

✍ Gestionnaire global des systèmes de particules « partagés » (g_particleSystemManager, dérive d'AbstractManager). Il conserve une liste de types de particules (noms) et, pour chaque type, une unique table particleSystem de référence, créée par MaterialUtil.onCreateParticleSystem à partir d'un nœud I3D d'un porte-particules (particle holder, absent du dump). Les effets copient ensuite ce système de référence (ParticleUtil.copyParticleSystem, dont le corps est absent du dump) ; l'usage exact de la copie est donc NON VÉRIFIÉ ici. Fonctionne sur chaque pair : rien n'est synchronisé en réseau.

TYPES VANILLA déclarés à loadMapData (ParticleSystemManager.lua:40-82), à garder en tête pour une réutilisation : unloading ; smoke, smoke_damping, smoke_chimney, smoke_train_main, smoke_train_side ; chopper, straw, cutter_chopper ; soil, soil_smoke, soil_chunks, soil_big_chunks, soil_harvesting ; spreader, spreader_smoke ; windrower, tedder, weeder ; crusher_wood, crusher_dust ; prepare_fruit ; cleaning_soil, cleaning_dust ; washer_water ; SPRAYERCANNON_MIST ; chainsaw_wood, chainsaw_dust ; pickup, pickup_falling ; sowing ; loading ; wheel_dust, wheel_dry, wheel_wet, wheel_snow ; bees ; horse_step_slow, horse_step_fast ; spraycan_paint ; HYDRAULIC_HAMMER, HYDRAULIC_HAMMER_DEBRIS ; STONE. Les noms sont mis en majuscules et la table globale ParticleType pointe vers nameToIndex. Ce fichier ne dit pas quelle machine utilise quel type (relations à chercher dans les spécialisations, ex. WorkParticles).

LIMITE : un seul système par type (pas de variante par type de remplissage dans ce gestionnaire ; la matière est gérée par MaterialManager:getParticleMaterial). Ajouter un système pour un type existant supprime le précédent (ParticleUtil.deleteParticleSystem) : un mod qui re-déclare un type remplace donc le système vanilla pour tous les usages.

POINTS D'EXTENSION : addParticleType pour de nouveaux types (avant le chargement du porte-particules), addParticleSystem, getParticleSystem. Le moment exact du chargement des porte-particules est NON VÉRIFIÉ (hors dump).

- **ParticleSystemManager** hérite de `AbstractManager` (l.15)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ParticleSystemManager.new(customMt: any) → table` | 20 | ✍ Crée le gestionnaire. |
| `ParticleSystemManager:initDataStructures()` | 28 | ✍ Réinitialise les tables de noms, de types et de systèmes de particules. |
| `ParticleSystemManager:loadMapData() → boolean` | 37 | ✍ Déclare les types de particules vanilla (liste dans le module), publie la table globale ParticleType et renvoie vrai. |
| `ParticleSystemManager:unloadMapData()` | 91 | ✍ Supprime chaque système de particules de référence (ParticleUtil.deleteParticleSystem) puis délègue à la classe parente. |
| `ParticleSystemManager:addParticleType(name: string)` | 102 | ✍ Ajoute un type de particule (nom validé puis mis en majuscules) ; sans effet si déjà connu. |
| `ParticleSystemManager:getParticleSystemTypeByName(name: string) → string` | 122 | ✍ Renvoie le nom normalisé (majuscules) s'il est déclaré, sinon nil. |
| `ParticleSystemManager:addParticleSystem(particleType: string, particleSystem: integer)` | 140 | ✍ Associe un système de particules de référence à un type ; si un système existait déjà pour ce type, il est supprimé d'abord. À noter : le commentaire d'origine mentionne un indice de matériau et un identifiant qui n'existent pas dans la signature réelle (particleType, particleSystem). |
| `ParticleSystemManager:getParticleSystem(particleTypeName: string) → table` | 153 | ✍ Renvoie la table de référence du type demandé par nom, nil si le type est inconnu ou sans système. À noter : le commentaire d'origine évoque un type de remplissage, mais la fonction ne prend que le nom du type. |

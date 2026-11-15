-- Atlas Lua FS25 : relevé des globales réellement présentes en jeu.
-- Écrit <profil utilisateur>/atlas_releve.tsv : chemin, type, origine (C/Lua si debug dispo), source.
-- Ne modifie rien. Fonctions utilisées, vérifiées dans le code vanilla 1.25.1.0 :
--   createFile/FileAccess.WRITE/fileWrite/delete (utils/BitmapUtil.lua:69,93), getUserProfileAppPath
--   (internalMods/.../ExtendedWeedControl.lua:100), addConsoleCommand (ai/AISystem.lua:144).
--   addModEventListener + :loadMap : constatés par usage dans des mods tiers (non documentés dans le dump).

AtlasReleve = {}
local MAX_PAR_TABLE = 20000

local function origine(v)
    if type(v) ~= "function" or debug == nil or debug.getinfo == nil then return "", "" end
    local ok, info = pcall(debug.getinfo, v, "S")
    if not ok or info == nil then return "", "" end
    return info.what or "", (info.short_src or "") .. ":" .. tostring(info.linedefined or "")
end

local function ligne(out, chemin, v)
    local w, src = origine(v)
    out[#out + 1] = chemin .. "\t" .. type(v) .. "\t" .. w .. "\t" .. src
end

local function cles(t)
    local k, n = {}, 0
    for key in pairs(t) do
        if type(key) == "string" then
            n = n + 1
            k[n] = key
            if n >= MAX_PAR_TABLE then break end
        end
    end
    table.sort(k)
    return k
end

-- Descend dans une table (et la chaîne __index de sa métatable, pour les instances g_*).
local GLOBALES = nil  -- vraie table globale, fixée dans run()

local function parcourir(out, chemin, t, vus)
    local mt0 = getmetatable(t)
    if GLOBALES ~= nil and type(mt0) == "table" and rawget(mt0, "__index") == GLOBALES then
        out[#out + 1] = chemin .. "	envmod		"  -- environnement d'un autre mod : on ne descend pas
        return
    end
    if vus[t] then out[#out + 1] = chemin .. ".*\tvu\t\t" .. vus[t]; return end
    vus[t] = chemin
    for _, k in ipairs(cles(t)) do
        ligne(out, chemin .. "." .. k, rawget(t, k))
    end
    local mt = getmetatable(t)
    local idx = type(mt) == "table" and rawget(mt, "__index") or nil
    local niveau = 0
    while type(idx) == "table" and niveau < 8 do
        niveau = niveau + 1
        for _, k in ipairs(cles(idx)) do
            local v = rawget(idx, k)
            if type(v) == "function" and rawget(t, k) == nil then
                ligne(out, chemin .. ":" .. k .. "\t[mt" .. niveau .. "]", v)
            end
        end
        local m2 = getmetatable(idx)
        idx = type(m2) == "table" and rawget(m2, "__index") or nil
    end
end

local function compter(t)
    local n = 0
    for _ in pairs(t) do n = n + 1 end
    return n
end

-- Le mod tourne dans un environnement isolé : _G ne contient que ses surcharges, le reste passe par
-- la métatable (__index). On remonte la chaîne et on garde la table qui a le plus de clés.
local function racines()
    local liste, t, niveau = { { nom = "env", t = _G } }, _G, 0
    while niveau < 5 do
        niveau = niveau + 1
        local mt = getmetatable(t)
        local idx = type(mt) == "table" and rawget(mt, "__index") or nil
        liste[#liste + 1] = { nom = "mt" .. niveau, t = idx, typ = type(idx) }
        if type(idx) ~= "table" then break end
        t = idx
    end
    if getfenv ~= nil then
        local ok, e = pcall(getfenv, 0)
        if ok then liste[#liste + 1] = { nom = "getfenv0", t = e, typ = type(e) } end
    end
    return liste
end

function AtlasReleve.run()
    local out = { "# atlas_releve\tversion=" .. tostring(g_gameVersionDisplay or g_gameVersion or "?") .. "\tdebug=" .. tostring(debug ~= nil) }
    local meilleure, maxn = _G, -1
    for _, r in ipairs(racines()) do
        local n = type(r.t) == "table" and compter(r.t) or -1
        out[#out + 1] = "# racine\t" .. r.nom .. "\t" .. tostring(r.typ or "table") .. "\t" .. n
        if n > maxn then meilleure, maxn = r.t, n end
    end
    GLOBALES = meilleure
    -- surcharges propres à l'environnement des mods
    for _, k in ipairs(cles(_G)) do
        ligne(out, "@env." .. k, rawget(_G, k))
    end
    local vus = { [_G] = "_G" }
    for _, k in ipairs(cles(meilleure)) do
        local v = rawget(meilleure, k)
        ligne(out, k, v)
        if type(v) == "table" and k ~= "_G" and k ~= "package" then
            parcourir(out, k, v, vus)
        end
    end
    local chemin = getUserProfileAppPath() .. "atlas_releve.tsv"
    local f = createFile(chemin, FileAccess.WRITE)
    if f == 0 then
        print("AtlasReleve : impossible de créer " .. chemin)
        return
    end
    -- écriture par blocs : une seule chaîne géante a tronqué le fichier (relevé du 2026-11-15 20:15)
    for i = 1, #out, 2000 do
        fileWrite(f, table.concat(out, "\n", i, math.min(i + 1999, #out)) .. "\n")
    end
    delete(f)
    print(string.format("AtlasReleve : %d lignes écrites dans %s", #out, chemin))
end

function AtlasReleve:loadMap(name)
    addConsoleCommand("atlasReleve", "Atlas : réécrit atlas_releve.tsv", "consoleRun", AtlasReleve)
    AtlasReleve.run()
end

function AtlasReleve:consoleRun()
    AtlasReleve.run()
    return "atlas_releve.tsv écrit"
end

addModEventListener(AtlasReleve)

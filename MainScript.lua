-- Project Zero - Keyless Freemium Bootstrap
-- No Luarmor, no key UI, no saved keys, no HWID authentication.

local GameId = game.GameId

local FreeScripts = {
    [994732206] = "https://raw.githubusercontent.com/keneth3245/Project-Zero/refs/heads/main/Refs-Heads-Main-Games-BloxFruits.lua",
}

local function LoadFreeScript()
    local url = FreeScripts[GameId]

    if not url then
        warn("[Project Zero] No freemium version is configured for GameId: " .. tostring(GameId))
        return false
    end

    local ok, source = pcall(function()
        return game:HttpGet(url)
    end)

    if not ok or type(source) ~= "string" or source == "" then
        warn("[Project Zero] Failed to download the freemium script.")
        return false
    end

    local chunk, compileError = loadstring(source)

    if not chunk then
        warn("[Project Zero] Failed to compile the freemium script: " .. tostring(compileError))
        return false
    end

    local runOk, runtimeError = pcall(chunk)

    if not runOk then
        warn("[Project Zero] Freemium script error: " .. tostring(runtimeError))
        return false
    end

    return true
end

LoadFreeScript()

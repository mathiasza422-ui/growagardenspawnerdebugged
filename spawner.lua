local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local SpawnPetEvent = ReplicatedStorage:WaitForChild("SpawnPet")
local player = Players.LocalPlayer

local petsToSpawn = {
    "Raccoon",
    "RedFox",
    "QueenBee",
    "Dragonfly"
}

local function trySpawnPets()
    print("[DEBUG] Inicio de spawn de mascotas...")
    for _, petName in ipairs(petsToSpawn) do
        print("[DEBUG] Intentando invocar mascota:", petName)
        local success, err = pcall(function()
            SpawnPetEvent:FireServer(petName)
        end)
        if success then
            print("[SUCCESS] Solicitud enviada para mascota:", petName)
        else
            warn("[ERROR] Falló la invocación de mascota '" .. petName .. "'. Error:", err)
        end
        wait(1)
    end
    print("[DEBUG] Fin del proceso de spawn de mascotas.")
end

trySpawnPets()

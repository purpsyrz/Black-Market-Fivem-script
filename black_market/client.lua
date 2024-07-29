ESX = nil

Citizen.CreateThread(function()
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
end)

-- Create the blip on the map
Citizen.CreateThread(function()
    local blip = AddBlipForCoord(Config.Blip.coords)

    SetBlipSprite(blip, Config.Blip.sprite)
    SetBlipColour(blip, Config.Blip.color)
    SetBlipScale(blip, Config.Blip.scale)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName(Config.Blip.name)
    EndTextCommandSetBlipName(blip)
end)

-- Open Black Market UI
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local distance = #(playerCoords - Config.Blip.coords)

        if distance < 20.0 then
            DrawMarker(1, Config.Blip.coords.x, Config.Blip.coords.y, Config.Blip.coords.z - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 100, false, true, 2, false, false, false, false)
            if distance < 1.0 then
                ESX.ShowHelpNotification('Press ~INPUT_CONTEXT~ to access the Black Market')
                if IsControlJustReleased(0, 38) then -- E key
                    SetNuiFocus(true, true)
                    SendNUIMessage({ action = 'open' })
                end
            end
        end
    end
end)

-- Handle GUI callbacks
RegisterNUICallback('buyItem', function(data, cb)
    TriggerServerEvent('black_market:buyItem', data.itemName)
    cb('ok')
end)

RegisterNUICallback('close', function(data, cb)
    SetNuiFocus(false, false)
    cb('ok')
end)

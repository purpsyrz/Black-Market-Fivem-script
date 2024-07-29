ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Server-side logic for purchasing items/weapons
RegisterServerEvent('black_market:buyItem')
AddEventHandler('black_market:buyItem', function(itemName)
    local xPlayer = ESX.GetPlayerFromId(source)
    local item = nil

    for _, v in ipairs(Config.Items) do
        if v.name == itemName then
            item = v
            break
        end
    end

    if item then
        local itemCount = xPlayer.getInventoryItem(Config.CurrencyItem).count
        if itemCount >= item.price then
            xPlayer.removeInventoryItem(Config.CurrencyItem, item.price)
            
            if item.type == 'weapon' then
                xPlayer.addWeapon(item.name, 0)
            elseif item.type == 'item' then
                xPlayer.addInventoryItem(item.name, 1)
            end

            TriggerClientEvent('esx:showNotification', source, 'You bought a ' .. item.label)
        else
            TriggerClientEvent('esx:showNotification', source, 'Not enough ' .. Config.CurrencyItem)
        end
    else
        TriggerClientEvent('esx:showNotification', source, 'Invalid item')
    end
end)

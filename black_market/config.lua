Config = {}

Config.Locale = 'en'

-- Blip configuration
Config.Blip = {
    coords = vector3(-1000.0, -2000.0, 30.0),  -- Default coordinates, owner can change this
    sprite = 374,  -- Blip icon (can be changed)
    color = 1,     -- Blip color (can be changed)
    scale = 1.0,
    name = 'Black Market'
}

-- Currency item configuration
Config.CurrencyItem = 'money'  -- The item used as currency for purchasing

-- Items for sale in the black market 
Config.Items = {
    { name = 'weapon_pistol', label = 'Pistol', price = 100, type = 'weapon' },
    { name = 'weapon_smg', label = 'SMG', price = 200, type = 'weapon' },
    { name = 'bread', label = 'Bread', price = 10, type = 'item' },
    { name = 'water', label = 'Water', price = 5, type = 'item' }
}

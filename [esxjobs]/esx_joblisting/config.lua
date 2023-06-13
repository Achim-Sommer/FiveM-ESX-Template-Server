Config = {}

Config.DrawDistance = 15.0
Config.ZoneSize = {x = 2.7, y = 2.7, z = 0.5}
Config.MarkerColor = {r = 100, g = 200, b = 104}
Config.MarkerType = 1
Config.Debug = ESX.GetConfig().EnableDebug

Config.Locale = GetConvar('esx:locale', 'de')

Config.Zones = {
  vector3(-234.35, -919.65, 31.2)
}

Config.Blip = {
  Enabled = true, 
  Sprite = 408, 
  Display = 4, 
  Scale = 0.8, 
  Colour = 27, 
  ShortRange = true
}

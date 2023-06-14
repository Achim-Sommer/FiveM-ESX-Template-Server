Config = {}
Config.Locale = 'de'

Config.DrawDistance	= 25.0
Config.CoolDown = 20 -- How long in Mins before a New Robbery can be Started

Config.Zones = {
	-- 24/7
	["24/7 Innocence Boulevard | Los Santos"] = {
		Coords = vector3(28.288, -1339.537, 28.497),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,58000),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 2
	},
	["24/7 Senora Fwy 1 | Paleto Bay"] = {
		Coords = vector3(1736.32, 6419.47, 34.03),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,58000),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 2
	},
	["24/7 Senora Fwy 2 | Sandy Shores"] = {
		Coords = vector3(2673.28, 3286.25, 54.24),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,58000),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 2
	},
	["24/7 Alhambra Dr | Sandy Shores"] = {
		Coords = vector3(1961.24, 3749.46, 31.34),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,58000),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 2
	},
	["24/7 Palomino Fwy | Sandy Shores"] = {
		Coords = vector3(2549.88, 384.74, 107.62),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,58000),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 2
	},
	["24/7 Little Seoul | Los Santos"] = {
		Coords = vector3(-709.17, -904.21, 18.21),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,58000),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 2
	},
	["24/7 Clinton Ave | Los Santos"] = {
		Coords = vector3(377.97, 332.78, 102.57),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,58000),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 2
	},
	["24/7 Ineseno Road | Los Santos"] = {
		Coords = vector3(-3047.13, 585.81, 6.91),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,58000),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 2
	},
	["24/7 Barbareno Rd | Los Santos"] = {
		Coords = vector3(-3249.31, 1004.27, 11.83),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,58000),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 2
	},
	["24/7 Route 68 | Paleto Bay"] = {
		Coords = vector3(546.29, 2663.37, 41.16),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,58000),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 2
	},
	-- LTD GAS
	["LTD Gasoline Grove Street | Los Santos"] = {
		Coords = vector3(-43.057, -1748.811, 28.421),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,58000),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 2
	},
	["LTD Gasoline Mirror Park | Los Santos"] = {
		Coords = vector3(1160.67, -314.40, 68.20),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,58000),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 2
	},
	["LTD Gasoline Banham Canyon Dr | Los Santos"] = {
		Coords = vector3(-1828.06, 799.17, 137.17),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,58000),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 2
	},
	["LTD Gasoline Grapeseed Main St | Grapeseed"] = {
		Coords = vector3(1707.15, 4919.88, 41.06),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,58000),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 2
	},
	-- ROBS LIQUOR
	["Robs Liquor Great Ocean Hwy | Los Santos"] = {
		Coords = vector3(-2959.33, 388.21, 13.00),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,58000),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 2
	},
	["Robs Liquor El Rancho Blvd | Los Santos"] = {
		Coords = vector3(1126.80, -980.40, 44.41),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,58000),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 2
	},
	["Robs Liquor San Andreas Ave | Los Santos"] = {
		Coords = vector3(-1219.85, -916.27, 10.32),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,58000),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 2
	},
	["Robs Liquor Prosperity St | Los Santos"] = {
		Coords = vector3(-1479.25, -374.17, 38.16),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,58000),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 2
	},
	["Scoops Liquor Barn Route 68 | Sandy Shores"] = {
		Coords = vector3(1168.49, 2718.43, 36.16),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,58000),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 2
	},
	["Ace Liquor Algonquin Blvd | Sandy Shores"] = {
		Coords = vector3(1396.54, 3610.97, 33.98),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,58000),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 2
	},
	-- BARS
	["Yellow Jack Panorama Dr | Sandy Shores"] = {
		Coords = vector3(1990.57, 3044.95, 46.21),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,12500),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 2
	},
	["Tequi-La-La Eclipse Blvd | Los Santos"] = {
		Coords = vector3(-562.05, 287.45, 81.18),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,12500),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 2
	},
	["Vanilla Unicorn Elgin Ave | Los Santos"] = {
		Coords = vector3(94.2, -1292.61, 28.27),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,12500),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 2
	},
	["Bahama Mamas Marathon Ave | Los Santos"] = {
		Coords = vector3(-1381.79, -632.53, 29.82),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,12500),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 2
	},
	 --BANKS
	["Fleeca Bank Vespucci Boulevard | Los Santos"] = {
		Coords = vector3(146.913, -1044.836, 28.376),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(250000,750000),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 450, -- Default 450 (7.5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["Fleeca Bank Great Ocean Hwy | Los Santos"] = {
		Coords = vector3(-2957.66, 481.45, 14.69),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(250000,750000),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 450, -- Default 450 (7.5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["Fleeca Bank Route 68 | Paleto Bay"] = {
		Coords = vector3(1176.62, 2711.78, 37.1),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(250000,750000),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 450, -- Default 450 (7.5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["Fleeca Bank Blvd Del Perro | Los Santos"] = {
		Coords = vector3(-1212.11, -336.0, 36.79),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(250000,750000),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 450, -- Default 450 (7.5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["Fleeca Bank Hawick Ave 1 | Los Santos"] = {
		Coords = vector3(-354.2, -54.06, 48.05),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(250000,750000),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 450, -- Default 450 (7.5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["Fleeca Bank Hawick Ave 2 | Los Santos"] = {
		Coords = vector3(310.75, -283.07, 53.17),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(250000,750000),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 450, -- Default 450 (7.5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["Blaine County Savings Paleto Blvd | Paleto Bay"] = {
		Coords = vector3(-107.06, 6474.80, 30.62),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(250000,750000),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 450, -- Default 450 (7.5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
}

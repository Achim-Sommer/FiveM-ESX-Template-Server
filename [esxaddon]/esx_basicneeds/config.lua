Config = {}
Config.Locale = GetConvar('esx:locale', 'de')
Config.Visible = false

Config.Items = {
	["bread"] = {
		type = "food",
		prop= "prop_cs_burger_01",
		status = 200000,
		remove = true
	},
	
	["water"] = {
		type = "drink",
		prop = "prop_ld_flow_bottle",
		status = 100000,
		remove = true
	}
}

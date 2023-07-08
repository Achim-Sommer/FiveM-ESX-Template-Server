---wip types

---@class OxShop
---@field name string
---@field label? string
---@field blip? { id: number, colour: number, scale: number }
---@field inventory { name: string, price: number, count?: number, currency?: string }
---@field locations? vector3[]
---@field targets? { loc: vector3, length: number, width: number, heading: number, minZ: number, maxZ: number, distance: number, debug?: boolean, drawSprite?: boolean }[]
---@field groups? string | string[] | table<string, number> }
---@field model? number[]

return {
	Ammunation = {
		name = 'Ammunation',
		blip = {
			id = 110, colour = 69, scale = 0.8
		}, inventory = {
			{ name = 'ammo-9', price = 5, },
			{ name = 'WEAPON_KNIFE', price = 200 },
			{ name = 'WEAPON_BAT', price = 100 },
			{ name = 'WEAPON_PISTOL', price = 1000, metadata = { registered = true }, license = 'weapon' }
		}, locations = {
			vec3(-662.180, -934.961, 21.829),
			vec3(810.25, -2157.60, 29.62),
			vec3(1693.44, 3760.16, 34.71),
			vec3(-330.24, 6083.88, 31.45),
			vec3(252.63, -50.00, 69.94),
			vec3(22.56, -1109.89, 29.80),
			vec3(2567.69, 294.38, 108.73),
			vec3(-1117.58, 2698.61, 18.55),
			vec3(842.44, -1033.42, 28.19)
		}, targets = {
			{ loc = vec3(-660.92, -934.10, 21.94), length = 0.6, width = 0.5, heading = 180.0, minZ = 21.8, maxZ = 22.2, distance = 2.0 },
			{ loc = vec3(808.86, -2158.50, 29.73), length = 0.6, width = 0.5, heading = 360.0, minZ = 29.6, maxZ = 30.0, distance = 2.0 },
			{ loc = vec3(1693.57, 3761.60, 34.82), length = 0.6, width = 0.5, heading = 227.39, minZ = 34.7, maxZ = 35.1, distance = 2.0 },
			{ loc = vec3(-330.29, 6085.54, 31.57), length = 0.6, width = 0.5, heading = 225.0, minZ = 31.4, maxZ = 31.8, distance = 2.0 },
			{ loc = vec3(252.85, -51.62, 70.0), length = 0.6, width = 0.5, heading = 70.0, minZ = 69.9, maxZ = 70.3, distance = 2.0 },
			{ loc = vec3(23.68, -1106.46, 29.91), length = 0.6, width = 0.5, heading = 160.0, minZ = 29.8, maxZ = 30.2, distance = 2.0 },
			{ loc = vec3(2566.59, 293.13, 108.85), length = 0.6, width = 0.5, heading = 360.0, minZ = 108.7, maxZ = 109.1, distance = 2.0 },
			{ loc = vec3(-1117.61, 2700.26, 18.67), length = 0.6, width = 0.5, heading = 221.82, minZ = 18.5, maxZ = 18.9, distance = 2.0 },
			{ loc = vec3(841.05, -1034.76, 28.31), length = 0.6, width = 0.5, heading = 360.0, minZ = 28.2, maxZ = 28.6, distance = 2.0 }
		}
	},

	PoliceArmoury = {
		name = 'Police Armoury',
		groups = shared.police,
		blip = {
			id = 110, colour = 84, scale = 0.8
		}, inventory = {
			{ name = 'ammo-9', price = 1, },
			{ name = 'ammo-rifle', price = 5, },
			{ name = 'ammo-sniper', price = 5, },
			{ name = 'WEAPON_FLASHLIGHT', price = 200 },
			{ name = 'WEAPON_NIGHTSTICK', price = 100 },
			{ name = 'WEAPON_TEARGAS', price = 100 },
			{ name = 'WEAPON_PISTOL', price = 500, metadata = { registered = true, serial = 'POL' }, license = 'weapon' },
			{ name = 'WEAPON_CARBINERIFLE', price = 1000, metadata = { registered = true, serial = 'POL' }, license = 'weapon', grade = 3 },
			{ name = 'WEAPON_SNIPERRIFLE', price = 2000, metadata = { registered = true, serial = 'POL' }, license = 'weapon', grade = 3 },
			{ name = 'WEAPON_STUNGUN', price = 500, metadata = { registered = true, serial = 'POL'} }
		}, locations = {
			vec3(451.51, -979.44, 30.68)
		}, targets = {
			{ loc = vec3(453.21, -980.03, 30.68), length = 0.5, width = 3.0, heading = 270.0, minZ = 30.5, maxZ = 32.0, distance = 6 }
		}
	},

	Medicine = {
		name = 'Medicine Cabinet',
		groups = {
			['ambulance'] = 0
		},
		blip = {
			id = 403, colour = 69, scale = 0.8
		}, inventory = {
			{ name = 'medikit', price = 26 },
			{ name = 'bandage', price = 5 }
		}, locations = {
			vec3(306.3687, -601.5139, 43.28406)
		}, targets = {

		}
	},

	BlackMarketArms = {
		name = 'Black Market (Arms)',
		blip = {
			id = 110, colour = 69, scale = 0.8 },
		inventory = {
			{ name = 'WEAPON_DAGGER', price = 5000, metadata = { registered = false	}, currency = 'black_money' },
			{ name = 'WEAPON_CERAMICPISTOL', price = 50000, metadata = { registered = false }, currency = 'black_money' },
			{ name = 'WEAPON_SNIPERRIFLE', price = 80000, metadata = { registered = false }, currency = 'black_money' },
			{ name = 'WEAPON_SMG', price = 60000, metadata = { registered = false }, currency = 'black_money' },
			{ name = 'at_suppressor_light', price = 50000, currency = 'black_money' },
			{ name = 'ammo-rifle', price = 10, currency = 'black_money' },
			{ name = 'ammo-sniper', price = 10, currency = 'black_money' },
			{ name = 'ammo-9', price = 2, currency = 'black_money' },
			{ name = 'ammo-rifle2', price = 10, currency = 'black_money' }
		}, locations = {
			vec3(309.09, -913.75, 56.46)
		}, targets = {

		}
	},
	CriminalDealers = {
		name = 'Dealer',
		inventory = {
			{ name = 'cigarette', price = 30 },
			{ name = 'phone_burner', price = 100 },
			{ name = 'lockpick', price = 11 },
			{ name = 'WEAPON_SNSPISTOL', price = 350, metadata = { registered = false }},
			{ name = 'ammo-45', price = 9 },
			{ name = 'bodyarmor_1', price = 125 },

		}, locations = {
			vec3(-1216.225, -1473.32, 4.334),
			
		}, targets = {
			{
                ped = 'ig_clay',
                scenario = 'WORLD_HUMAN_LEANING',
                loc = vec3(-1214.391, -1474.564, 3.334),
                heading = 126.35,
            },
			{
                ped = 'ig_talmm',
                scenario = 'WORLD_HUMAN_SMOKING',
                loc = vec3(-1490.583, -658.408, 28.025),
                heading = 221.602,
            },
		}
	},
	LDOrganics = {
		name = 'LD Organics',
		inventory = {
			{ name = 'cigarette', price = 10 },
			{ name = 'cigar', price = 100 },
			{ name = 'weed_sativa', price = 250 },
			{ name = 'weed_indica', price = 250 },
			{ name = 'weed_hybrid', price = 300 },

			{ name = 'water', price = 10 },
			{ name = 'ejunk', price = 10 },
			{ name = 'ecola', price = 10 },
			

		}, locations = {
			vec3(-1217.882, -1495.124, 4.373),
			
		}, targets = {
			{
                ped = 'ig_lamardavis',
                scenario = 'WORLD_HUMAN_SMOKING_POT_CLUBHOUSE',
                loc = vec3(-1249.551, -1449.734, 3.373),
                heading = 36.982,
            },
		}
	},
	CoolBeans = {
		name = 'Cool Beans',
		inventory = {
			{ name = 'water', price = 5 },
			{ name = 'coffee_black', price = 10 },
			{ name = 'coffee_mocha', price = 10 },
			{ name = 'coffee_cpcno', price = 15 },
			{ name = 'coffee_amrcno', price = 16 },

			{ name = 'smore', price = 13 },
			{ name = 'donut_sby', price = 15 },
			{ name = 'donut_chc', price = 15 },
			{ name = 'icecream_vna', price = 10 },
			{ name = 'icecream_chc', price = 10 },
			

		}, locations = {
			vec3(-1217.882, -1495.124, 4.373),
			
		}, targets = {
			{
                ped = 'u_f_y_lauren',
                scenario = 'WORLD_HUMAN_STAND_IMPATIENT_CLUBHOUSE',
                loc = vec3(-1217.882, -1495.124, 3.373),
                heading =  35.879,
            },
		}
	},
	VendingMachineDrinks = {
		name = 'Vending Machine',
		inventory = {
			{ name = 'water', price = 4 },
			{ name = 'ecola', price = 3 },
			{ name = 'sprunk', price = 3 },
			{ name = 'orangotang', price = 3 },
			{ name = 'ejunk', price = 5 },
		},
		model = {
			'prop_vend_soda_02', 'prop_vend_water_01', 'prop_vend_soda_01', 
			'ch_chint10_vending_smallroom_01', 'sf_prop_sf_vend_drink_01a'
		}
	},

	VendingMachineSnacks = {
		name = 'Vending Machine',
		inventory = {
			{ name = 'phatc_rib', price = 3 },
			{ name = 'phatc_bch', price = 3 },
			{ name = 'ps_qs', price = 2 },
			{ name = 'apple', price = 2 },
			{ name = 'banana', price = 2 },
		},
		model = {
			'prop_vend_snak_01', 'prop_vend_snak_01_tu'
		}
	},

	VendingMachineCoffee = {
		name = 'Coffee Machine',
		inventory = {
			{ name = 'coffee_black', price = 4 },
			{ name = 'coffee_mocha', price = 3 },
			{ name = 'coffee_cpcno', price = 3 },
			{ name = 'coffee_amrcno', price = 3 }
		},
		model = {
			'prop_vend_coffe_01'
		}
	}
}

return {
	['testburger'] = {
		label = 'Test Burger',
		weight = 220,
		degrade = 60,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			export = 'ox_inventory_examples.testburger'
		},
		server = {
			export = 'ox_inventory_examples.testburger',
			test = 'what an amazingly delicious burger, amirite?'
		},
		buttons = {
			{
				label = 'Lick it',
				action = function(slot)
					print('You licked the burger')
				end
			},
			{
				label = 'Squeeze it',
				action = function(slot)
					print('You squeezed the burger :(')
				end
			},
			{
				label = 'What do you call a vegan burger?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('A misteak.')
				end
			},
			{
				label = 'What do frogs like to eat with their hamburgers?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('French flies.')
				end
			},
			{
				label = 'Why were the burger and fries running?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('Because they\'re fast food.')
				end
			}
		},
		consume = 0.3
	},

	['bandage'] = {
		label = 'Verband',
		weight = 115,
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 2500,
		}
	},

	['black_money'] = {
		label = 'Schwarzgeld',
	},

	['bread'] = {
		label = 'Burger',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'Du isst einen Burger'
		},
	},

	['cola'] = {
		label = 'Cola',
		weight = 350,
		client = {
			status = { thirst = 300000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'Du hast deinen Durst mit Cola gestillt'
		}
	},
	['parachute'] = {
		label = 'Parachute',
		weight = 8000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},

	['garbage'] = {
		label = 'Garbage',
	},

	['paperbag'] = {
		label = 'Paper Bag',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['identification'] = {
		label = 'Identification',
	},

	['panties'] = {
		label = 'Knickers',
		weight = 10,
		consume = 0,
		client = {
			status = { thirst = -100000, stress = -25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
			usetime = 2500,
		}
	},

	['lockpick'] = {
		label = 'Lockpick',
		weight = 160,
		stack = true,
	},

	['phone'] = {
		label = 'Phone',
		weight = 190,
		stack = false,
		consume = 0,
		client = {
			add = function(total)
				if total > 0 then
					pcall(function() return exports.npwd:setPhoneDisabled(false) end)
				end
			end,

			remove = function(total)
				if total < 1 then
					pcall(function() return exports.npwd:setPhoneDisabled(true) end)
				end
			end
		}
	},

	['headlights'] = {
		label = 'RGB-Steuerung',
		weight = 50,
		stack = true,
		close = true,
	},

	['money'] = {
		label = 'Geld',
	},

	['mustard'] = {
		label = 'Senf',
		weight = 500,
		client = {
			status = { hunger = 25000, thirst = 25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_food_mustard`, pos = vec3(0.01, 0.0, -0.07), rot = vec3(1.0, 1.0, -1.5) },
			usetime = 2500,
			notification = 'Du... hast Senf getrunken'
		}
	},

	['water'] = {
		label = 'Wasser',
		weight = 500,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'Du hast Wasser getrunken'
		}
	},

	['coffee'] = {
		label = 'Kaffe',
		weight = 350,
		client = {
			status = { thirst = 100000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_food_coffee`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'Du hast einen Kaffee getrunken'
		}
	},

	['radio'] = {
		label = 'Funkgerät',
		weight = 1000,
		stack = false,
		allowArmed = true
	},

	['armour'] = {
		label = 'Bulletproof Vest',
		weight = 3000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 3500
		}
	},

	['clothing'] = {
		label = 'Clothing',
		consume = 0,
	},

	['mastercard'] = {
		label = 'Mastercard',
		stack = false,
		weight = 10,
	},

	['scrapmetal'] = {
		label = 'Scrap Metal',
		weight = 80,
	},

	["alive_chicken"] = {
		label = "lebendes Huhn",
		weight = 1,
		stack = true,
		close = true,
	},

	["ammunition_smg_large"] = {
		label = "SMG Ammo Large",
		weight = 10,
		stack = true,
		close = true,
	},

	["ammunition_snp"] = {
		label = "Sniper Ammo",
		weight = 10,
		stack = true,
		close = true,
	},

	["arm_bandage"] = {
		label = "Arm Bandage",
		weight = 1,
		stack = true,
		close = true,
	},

	["automatic_tranny"] = {
		label = "Automatic Tranny",
		weight = 1,
		stack = true,
		close = true,
	},

	["beer"] = {
		label = "Bier",
		weight = 1,
		stack = true,
		close = true,
	},

	["binoculars"] = {
		label = "Fernglas",
		weight = 1,
		stack = true,
		close = true,
	},

	["blowpipe"] = {
		label = "Schneidbrenner",
		weight = 2,
		stack = true,
		close = true,
	},

	["body_bandage"] = {
		label = "Body Bandage",
		weight = 1,
		stack = true,
		close = true,
	},

	["bolcacahuetes"] = {
		label = "Erdnussschale",
		weight = 5,
		stack = true,
		close = true,
	},

	["bolchips"] = {
		label = "Chips",
		weight = 5,
		stack = true,
		close = true,
	},

	["bolnoixcajou"] = {
		label = "Cashewnuss-Schale",
		weight = 5,
		stack = true,
		close = true,
	},

	["bolpistache"] = {
		label = "Pistazienschale",
		weight = 5,
		stack = true,
		close = true,
	},

	["bulletproof"] = {
		label = "Kugelsichere Weste",
		weight = 1,
		stack = true,
		close = true,
	},

	["cannabis"] = {
		label = "Cannabis",
		weight = 1,
		stack = true,
		close = true,
	},

	["carokit"] = {
		label = "Body Kit",
		weight = 3,
		stack = true,
		close = true,
	},

	["carotool"] = {
		label = "Tools",
		weight = 2,
		stack = true,
		close = true,
	},

	["chemicals"] = {
		label = "Chemikalien",
		weight = 1,
		stack = true,
		close = true,
	},

	["chemicalslisence"] = {
		label = "Chemikalien Lizenz",
		weight = 0,
		stack = true,
		close = true,
	},

	["clothe"] = {
		label = "Kleidung",
		weight = 1,
		stack = true,
		close = true,
	},

	["coca_leaf"] = {
		label = "Koksblatt",
		weight = 3,
		stack = true,
		close = true,
	},

	["coke"] = {
		label = "Koks",
		weight = 3,
		stack = true,
		close = true,
	},

	["colis"] = {
		label = "Paket",
		weight = -1,
		stack = true,
		close = true,
	},

	["contract"] = {
		label = "Kaufvertrag",
		weight = 1,
		stack = true,
		close = true,
	},

	["coolant"] = {
		label = "Coolant",
		weight = 1,
		stack = true,
		close = true,
	},

	["copper"] = {
		label = "Kupfer",
		weight = 225,
		stack = true,
		close = true,
	},

	["croquettes"] = {
		label = "Tierfutter",
		weight = 10,
		stack = true,
		close = true,
	},

	["cutted_wood"] = {
		label = "Holzstämme",
		weight = 1,
		stack = true,
		close = true,
	},

	["darknet"] = {
		label = "Dark Net",
		weight = 1,
		stack = true,
		close = true,
	},

	["diamond"] = {
		label = "Diamant",
		weight = 140,
		stack = true,
		close = true,
	},

	["dia_box"] = {
		label = "Diamond Box",
		weight = 2,
		stack = true,
		close = true,
	},

	["drag_tirekit"] = {
		label = "Drag Tires Kit",
		weight = 1,
		stack = true,
		close = true,
	},

	["drill"] = {
		label = "Bohrer",
		weight = 1,
		stack = true,
		close = true,
	},

	["drpepper"] = {
		label = "Dr. Pepper",
		weight = 5,
		stack = true,
		close = true,
	},

	["energy"] = {
		label = "Energy Drink",
		weight = 5,
		stack = true,
		close = true,
	},

	["engineoil"] = {
		label = "Engine Oil",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_adder"] = {
		label = "Adder Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_airbus"] = {
		label = "Airbus Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_airtug"] = {
		label = "Airtug Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_akula"] = {
		label = "Akula Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_akuma"] = {
		label = "Akuma Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_alkonost"] = {
		label = "Alkonost Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_alpha"] = {
		label = "Alpha Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_alphaz1"] = {
		label = "Alphaz1 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_ambulance"] = {
		label = "Ambulance Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_annihilator"] = {
		label = "Annihilator Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_annihilator2"] = {
		label = "Annihilator2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_apc"] = {
		label = "Apc Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_ardent"] = {
		label = "Ardent Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_armytanker"] = {
		label = "Armytanker Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_armytrailer"] = {
		label = "Armytrailer Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_armytrailer2"] = {
		label = "Armytrailer2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_asbo"] = {
		label = "Asbo Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_asea"] = {
		label = "Asea Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_asea2"] = {
		label = "Asea2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_asterope"] = {
		label = "Asterope Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_autarch"] = {
		label = "Autarch Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_avarus"] = {
		label = "Avarus Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_avenger"] = {
		label = "Avenger Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_avenger2"] = {
		label = "Avenger2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_avisa"] = {
		label = "Avisa Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_b16b"] = {
		label = "B16b Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_bagger"] = {
		label = "Bagger Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_baletrailer"] = {
		label = "Baletrailer Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_baller"] = {
		label = "Baller Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_baller2"] = {
		label = "Baller2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_baller3"] = {
		label = "Baller3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_baller4"] = {
		label = "Baller4 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_baller5"] = {
		label = "Baller5 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_baller6"] = {
		label = "Baller6 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_banshee"] = {
		label = "Banshee Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_banshee2"] = {
		label = "Banshee2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_barracks"] = {
		label = "Barracks Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_barracks2"] = {
		label = "Barracks2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_barracks3"] = {
		label = "Barracks3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_barrage"] = {
		label = "Barrage Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_bati"] = {
		label = "Bati Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_bati2"] = {
		label = "Bati2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_benson"] = {
		label = "Benson Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_besra"] = {
		label = "Besra Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_bestiagts"] = {
		label = "Bestiagts Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_bf400"] = {
		label = "Bf400 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_bfinjection"] = {
		label = "Bfinjection Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_biff"] = {
		label = "Biff Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_bifta"] = {
		label = "Bifta Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_bison"] = {
		label = "Bison Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_bison2"] = {
		label = "Bison2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_bison3"] = {
		label = "Bison3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_bjxl"] = {
		label = "Bjxl Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_blade"] = {
		label = "Blade Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_blazer"] = {
		label = "Blazer Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_blazer2"] = {
		label = "Blazer2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_blazer3"] = {
		label = "Blazer3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_blazer4"] = {
		label = "Blazer4 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_blazer5"] = {
		label = "Blazer5 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_blimp"] = {
		label = "Blimp Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_blimp2"] = {
		label = "Blimp2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_blimp3"] = {
		label = "Blimp3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_blista"] = {
		label = "Blista Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_blista2"] = {
		label = "Blista2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_blista3"] = {
		label = "Blista3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_bmx"] = {
		label = "Bmx Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_boattrailer"] = {
		label = "Boattrailer Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_bobcatxl"] = {
		label = "Bobcatxl Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_bodhi2"] = {
		label = "Bodhi2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_bombushka"] = {
		label = "Bombushka Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_boxville"] = {
		label = "Boxville Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_boxville2"] = {
		label = "Boxville2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_boxville3"] = {
		label = "Boxville3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_boxville4"] = {
		label = "Boxville4 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_boxville5"] = {
		label = "Boxville5 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_brawler"] = {
		label = "Brawler Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_brickade"] = {
		label = "Brickade Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_brioso"] = {
		label = "Brioso Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_brioso2"] = {
		label = "Brioso2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_bruiser"] = {
		label = "Bruiser Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_bruiser2"] = {
		label = "Bruiser2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_bruiser3"] = {
		label = "Bruiser3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_brutus"] = {
		label = "Brutus Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_brutus2"] = {
		label = "Brutus2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_brutus3"] = {
		label = "Brutus3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_btype"] = {
		label = "Btype Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_btype2"] = {
		label = "Btype2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_btype3"] = {
		label = "Btype3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_buccaneer"] = {
		label = "Buccaneer Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_buccaneer2"] = {
		label = "Buccaneer2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_buffalo"] = {
		label = "Buffalo Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_buffalo2"] = {
		label = "Buffalo2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_buffalo3"] = {
		label = "Buffalo3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_bulldozer"] = {
		label = "Bulldozer Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_bullet"] = {
		label = "Bullet Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_burrito"] = {
		label = "Burrito Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_burrito2"] = {
		label = "Burrito2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_burrito3"] = {
		label = "Burrito3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_burrito4"] = {
		label = "Burrito4 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_burrito5"] = {
		label = "Burrito5 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_bus"] = {
		label = "Bus Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_buzzard"] = {
		label = "Buzzard Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_buzzard2"] = {
		label = "Buzzard2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_cablecar"] = {
		label = "Cablecar Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_caddy"] = {
		label = "Caddy Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_caddy2"] = {
		label = "Caddy2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_caddy3"] = {
		label = "Caddy3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_calico"] = {
		label = "Calico Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_camper"] = {
		label = "Camper Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_caracara"] = {
		label = "Caracara Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_caracara2"] = {
		label = "Caracara2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_carbonizzare"] = {
		label = "Carbonizzare Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_carbonrs"] = {
		label = "Carbonrs Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_cargobob"] = {
		label = "Cargobob Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_cargobob2"] = {
		label = "Cargobob2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_cargobob3"] = {
		label = "Cargobob3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_cargobob4"] = {
		label = "Cargobob4 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_cargoplane"] = {
		label = "Cargoplane Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_casco"] = {
		label = "Casco Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_cavalcade"] = {
		label = "Cavalcade Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_cavalcade2"] = {
		label = "Cavalcade2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_cerberus"] = {
		label = "Cerberus Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_cerberus2"] = {
		label = "Cerberus2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_cerberus3"] = {
		label = "Cerberus3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_cheburek"] = {
		label = "Cheburek Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_cheetah"] = {
		label = "Cheetah Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_cheetah2"] = {
		label = "Cheetah2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_chernobog"] = {
		label = "Chernobog Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_chimera"] = {
		label = "Chimera Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_chino"] = {
		label = "Chino Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_chino2"] = {
		label = "Chino2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_cliffhanger"] = {
		label = "Cliffhanger Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_clique"] = {
		label = "Clique Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_club"] = {
		label = "Club Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_coach"] = {
		label = "Coach Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_cog55"] = {
		label = "Cog55 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_cog552"] = {
		label = "Cog552 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_cogcabrio"] = {
		label = "Cogcabrio Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_cognoscenti"] = {
		label = "Cognoscenti Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_cognoscenti2"] = {
		label = "Cognoscenti2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_comet2"] = {
		label = "Comet2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_comet3"] = {
		label = "Comet3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_comet4"] = {
		label = "Comet4 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_comet5"] = {
		label = "Comet5 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_comet6"] = {
		label = "Comet6 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_contender"] = {
		label = "Contender Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_coquette"] = {
		label = "Coquette Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_coquette2"] = {
		label = "Coquette2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_coquette3"] = {
		label = "Coquette3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_coquette4"] = {
		label = "Coquette4 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_cruiser"] = {
		label = "Cruiser Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_crusader"] = {
		label = "Crusader Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_cuban800"] = {
		label = "Cuban800 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_cutter"] = {
		label = "Cutter Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_cyclone"] = {
		label = "Cyclone Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_cypher"] = {
		label = "Cypher Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_daemon"] = {
		label = "Daemon Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_daemon2"] = {
		label = "Daemon2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_deathbike"] = {
		label = "Deathbike Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_deathbike2"] = {
		label = "Deathbike2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_deathbike3"] = {
		label = "Deathbike3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_defiler"] = {
		label = "Defiler Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_deluxo"] = {
		label = "Deluxo Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_deveste"] = {
		label = "Deveste Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_deviant"] = {
		label = "Deviant Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_diablous"] = {
		label = "Diablous Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_diablous2"] = {
		label = "Diablous2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_dilettante"] = {
		label = "Dilettante Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_dilettante2"] = {
		label = "Dilettante2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_dinghy"] = {
		label = "Dinghy Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_dinghy2"] = {
		label = "Dinghy2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_dinghy3"] = {
		label = "Dinghy3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_dinghy4"] = {
		label = "Dinghy4 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_dinghy5"] = {
		label = "Dinghy5 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_dloader"] = {
		label = "Dloader Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_docktrailer"] = {
		label = "Docktrailer Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_docktug"] = {
		label = "Docktug Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_dodo"] = {
		label = "Dodo Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_dominator"] = {
		label = "Dominator Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_dominator2"] = {
		label = "Dominator2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_dominator3"] = {
		label = "Dominator3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_dominator4"] = {
		label = "Dominator4 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_dominator5"] = {
		label = "Dominator5 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_dominator6"] = {
		label = "Dominator6 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_dominator7"] = {
		label = "Dominator7 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_dominator8"] = {
		label = "Dominator8 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_double"] = {
		label = "Double Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_drafter"] = {
		label = "Drafter Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_dubsta"] = {
		label = "Dubsta Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_dubsta2"] = {
		label = "Dubsta2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_dubsta3"] = {
		label = "Dubsta3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_dukes"] = {
		label = "Dukes Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_dukes2"] = {
		label = "Dukes2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_dukes3"] = {
		label = "Dukes3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_dump"] = {
		label = "Dump Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_dune"] = {
		label = "Dune Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_dune2"] = {
		label = "Dune2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_dune3"] = {
		label = "Dune3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_dune4"] = {
		label = "Dune4 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_dune5"] = {
		label = "Dune5 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_duster"] = {
		label = "Duster Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_dynasty"] = {
		label = "Dynasty Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_elegy"] = {
		label = "Elegy Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_elegy2"] = {
		label = "Elegy2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_ellie"] = {
		label = "Ellie Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_emerus"] = {
		label = "Emerus Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_emperor"] = {
		label = "Emperor Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_emperor2"] = {
		label = "Emperor2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_emperor3"] = {
		label = "Emperor3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_enduro"] = {
		label = "Enduro Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_entity2"] = {
		label = "Entity2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_entityxf"] = {
		label = "Entityxf Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_esskey"] = {
		label = "Esskey Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_euros"] = {
		label = "Euros Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_everon"] = {
		label = "Everon Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_exemplar"] = {
		label = "Exemplar Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_f620"] = {
		label = "F620 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_faction"] = {
		label = "Faction Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_faction2"] = {
		label = "Faction2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_faction3"] = {
		label = "Faction3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_fagaloa"] = {
		label = "Fagaloa Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_faggio"] = {
		label = "Faggio Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_faggio2"] = {
		label = "Faggio2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_faggio3"] = {
		label = "Faggio3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_fbi"] = {
		label = "Fbi Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_fbi2"] = {
		label = "Fbi2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_fcr"] = {
		label = "Fcr Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_fcr2"] = {
		label = "Fcr2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_felon"] = {
		label = "Felon Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_felon2"] = {
		label = "Felon2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_feltzer2"] = {
		label = "Feltzer2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_feltzer3"] = {
		label = "Feltzer3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_firetruk"] = {
		label = "Firetruk Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_fixter"] = {
		label = "Fixter Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_flashgt"] = {
		label = "Flashgt Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_flatbed"] = {
		label = "Flatbed Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_fmj"] = {
		label = "Fmj Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_forklift"] = {
		label = "Forklift Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_formula"] = {
		label = "Formula Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_formula2"] = {
		label = "Formula2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_fq2"] = {
		label = "Fq2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_freecrawler"] = {
		label = "Freecrawler Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_freight"] = {
		label = "Freight Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_freightcar"] = {
		label = "Freightcar Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_freightcar2"] = {
		label = "Freightcar2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_freightcont1"] = {
		label = "Freightcont1 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_freightcont2"] = {
		label = "Freightcont2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_freightgrain"] = {
		label = "Freightgrain Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_freighttrailer"] = {
		label = "Freighttrailer Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_frogger"] = {
		label = "Frogger Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_frogger2"] = {
		label = "Frogger2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_fugitive"] = {
		label = "Fugitive Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_furia"] = {
		label = "Furia Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_furoregt"] = {
		label = "Furoregt Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_fusilade"] = {
		label = "Fusilade Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_futo"] = {
		label = "Futo Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_futo2"] = {
		label = "Futo2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_gargoyle"] = {
		label = "Gargoyle Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_gauntlet"] = {
		label = "Gauntlet Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_gauntlet2"] = {
		label = "Gauntlet2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_gauntlet3"] = {
		label = "Gauntlet3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_gauntlet4"] = {
		label = "Gauntlet4 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_gauntlet5"] = {
		label = "Gauntlet5 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_gb200"] = {
		label = "Gb200 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_gburrito"] = {
		label = "Gburrito Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_gburrito2"] = {
		label = "Gburrito2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_glendale"] = {
		label = "Glendale Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_glendale2"] = {
		label = "Glendale2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_gp1"] = {
		label = "Gp1 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_graintrailer"] = {
		label = "Graintrailer Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_granger"] = {
		label = "Granger Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_gresley"] = {
		label = "Gresley Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_growler"] = {
		label = "Growler Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_gt500"] = {
		label = "Gt500 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_guardian"] = {
		label = "Guardian Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_habanero"] = {
		label = "Habanero Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_hakuchou"] = {
		label = "Hakuchou Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_hakuchou2"] = {
		label = "Hakuchou2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_halftrack"] = {
		label = "Halftrack Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_handler"] = {
		label = "Handler Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_hauler"] = {
		label = "Hauler Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_hauler2"] = {
		label = "Hauler2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_havok"] = {
		label = "Havok Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_hellion"] = {
		label = "Hellion Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_hermes"] = {
		label = "Hermes Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_hexer"] = {
		label = "Hexer Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_hotknife"] = {
		label = "Hotknife Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_hotring"] = {
		label = "Hotring Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_howard"] = {
		label = "Howard Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_hunter"] = {
		label = "Hunter Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_huntley"] = {
		label = "Huntley Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_hustler"] = {
		label = "Hustler Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_hydra"] = {
		label = "Hydra Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_imorgon"] = {
		label = "Imorgon Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_impaler"] = {
		label = "Impaler Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_impaler2"] = {
		label = "Impaler2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_impaler3"] = {
		label = "Impaler3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_impaler4"] = {
		label = "Impaler4 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_imperator"] = {
		label = "Imperator Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_imperator2"] = {
		label = "Imperator2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_imperator3"] = {
		label = "Imperator3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_infernus"] = {
		label = "Infernus Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_infernus2"] = {
		label = "Infernus2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_ingot"] = {
		label = "Ingot Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_innovation"] = {
		label = "Innovation Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_insurgent"] = {
		label = "Insurgent Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_insurgent2"] = {
		label = "Insurgent2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_insurgent3"] = {
		label = "Insurgent3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_intruder"] = {
		label = "Intruder Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_issi2"] = {
		label = "Issi2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_issi3"] = {
		label = "Issi3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_issi4"] = {
		label = "Issi4 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_issi5"] = {
		label = "Issi5 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_issi6"] = {
		label = "Issi6 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_issi7"] = {
		label = "Issi7 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_italigtb"] = {
		label = "Italigtb Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_italigtb2"] = {
		label = "Italigtb2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_italigto"] = {
		label = "Italigto Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_italirsx"] = {
		label = "Italirsx Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_jackal"] = {
		label = "Jackal Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_jb700"] = {
		label = "Jb700 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_jb7002"] = {
		label = "Jb7002 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_jester"] = {
		label = "Jester Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_jester2"] = {
		label = "Jester2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_jester3"] = {
		label = "Jester3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_jester4"] = {
		label = "Jester4 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_jet"] = {
		label = "Jet Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_jetmax"] = {
		label = "Jetmax Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_journey"] = {
		label = "Journey Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_jugular"] = {
		label = "Jugular Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_kalahari"] = {
		label = "Kalahari Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_kamacho"] = {
		label = "Kamacho Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_kanjo"] = {
		label = "Kanjo Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_khamelion"] = {
		label = "Khamelion Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_khanjali"] = {
		label = "Khanjali Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_komoda"] = {
		label = "Komoda Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_kosatka"] = {
		label = "Kosatka Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_krieger"] = {
		label = "Krieger Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_kuruma"] = {
		label = "Kuruma Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_kuruma2"] = {
		label = "Kuruma2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_landstalker"] = {
		label = "Landstalker Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_landstalker2"] = {
		label = "Landstalker2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_lazer"] = {
		label = "Lazer Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_le7b"] = {
		label = "Le7b Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_lectro"] = {
		label = "Lectro Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_lguard"] = {
		label = "Lguard Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_limo2"] = {
		label = "Limo2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_locust"] = {
		label = "Locust Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_longfin"] = {
		label = "Longfin Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_lurcher"] = {
		label = "Lurcher Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_luxor"] = {
		label = "Luxor Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_luxor2"] = {
		label = "Luxor2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_lynx"] = {
		label = "Lynx Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_mamba"] = {
		label = "Mamba Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_mammatus"] = {
		label = "Mammatus Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_manana"] = {
		label = "Manana Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_manana2"] = {
		label = "Manana2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_manchez"] = {
		label = "Manchez Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_manchez2"] = {
		label = "Manchez2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_marquis"] = {
		label = "Marquis Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_marshall"] = {
		label = "Marshall Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_massacro"] = {
		label = "Massacro Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_massacro2"] = {
		label = "Massacro2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_maverick"] = {
		label = "Maverick Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_menacer"] = {
		label = "Menacer Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_mesa"] = {
		label = "Mesa Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_mesa2"] = {
		label = "Mesa2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_mesa3"] = {
		label = "Mesa3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_metrotrain"] = {
		label = "Metrotrain Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_michelli"] = {
		label = "Michelli Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_microlight"] = {
		label = "Microlight Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_miljet"] = {
		label = "Miljet Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_minitank"] = {
		label = "Minitank Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_minivan"] = {
		label = "Minivan Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_minivan2"] = {
		label = "Minivan2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_mixer"] = {
		label = "Mixer Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_mixer2"] = {
		label = "Mixer2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_mogul"] = {
		label = "Mogul Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_molotok"] = {
		label = "Molotok Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_monroe"] = {
		label = "Monroe Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_monster"] = {
		label = "Monster Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_monster3"] = {
		label = "Monster3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_monster4"] = {
		label = "Monster4 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_monster5"] = {
		label = "Monster5 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_moonbeam"] = {
		label = "Moonbeam Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_moonbeam2"] = {
		label = "Moonbeam2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_mower"] = {
		label = "Mower Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_mule"] = {
		label = "Mule Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_mule2"] = {
		label = "Mule2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_mule3"] = {
		label = "Mule3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_mule4"] = {
		label = "Mule4 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_nebula"] = {
		label = "Nebula Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_nemesis"] = {
		label = "Nemesis Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_neo"] = {
		label = "Neo Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_neon"] = {
		label = "Neon Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_nero"] = {
		label = "Nero Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_nero2"] = {
		label = "Nero2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_nexus"] = {
		label = "Nexus Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_nightblade"] = {
		label = "Nightblade Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_nightshade"] = {
		label = "Nightshade Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_nightshark"] = {
		label = "Nightshark Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_nimbus"] = {
		label = "Nimbus Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_ninef"] = {
		label = "Ninef Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_ninef2"] = {
		label = "Ninef2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_nokota"] = {
		label = "Nokota Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_novak"] = {
		label = "Novak Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_omnis"] = {
		label = "Omnis Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_openwheel1"] = {
		label = "Openwheel1 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_openwheel2"] = {
		label = "Openwheel2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_oppressor"] = {
		label = "Oppressor Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_oppressor2"] = {
		label = "Oppressor2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_oracle"] = {
		label = "Oracle Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_oracle2"] = {
		label = "Oracle2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_osiris"] = {
		label = "Osiris Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_outlaw"] = {
		label = "Outlaw Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_packer"] = {
		label = "Packer Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_panto"] = {
		label = "Panto Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_paradise"] = {
		label = "Paradise Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_paragon"] = {
		label = "Paragon Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_paragon2"] = {
		label = "Paragon2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_pariah"] = {
		label = "Pariah Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_patriot"] = {
		label = "Patriot Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_patriot2"] = {
		label = "Patriot2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_patrolboat"] = {
		label = "Patrolboat Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_pbus"] = {
		label = "Pbus Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_pbus2"] = {
		label = "Pbus2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_pcj"] = {
		label = "Pcj Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_penetrator"] = {
		label = "Penetrator Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_penumbra"] = {
		label = "Penumbra Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_penumbra2"] = {
		label = "Penumbra2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_peyote"] = {
		label = "Peyote Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_peyote2"] = {
		label = "Peyote2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_peyote3"] = {
		label = "Peyote3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_pfister811"] = {
		label = "Pfister811 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_phantom"] = {
		label = "Phantom Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_phantom2"] = {
		label = "Phantom2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_phantom3"] = {
		label = "Phantom3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_phoenix"] = {
		label = "Phoenix Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_picador"] = {
		label = "Picador Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_pigalle"] = {
		label = "Pigalle Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_police"] = {
		label = "Police Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_police2"] = {
		label = "Police2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_police3"] = {
		label = "Police3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_police4"] = {
		label = "Police4 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_policeb"] = {
		label = "Policeb Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_policeold1"] = {
		label = "Policeold1 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_policeold2"] = {
		label = "Policeold2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_policet"] = {
		label = "Policet Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_polmav"] = {
		label = "Polmav Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_pony"] = {
		label = "Pony Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_pony2"] = {
		label = "Pony2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_pounder"] = {
		label = "Pounder Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_pounder2"] = {
		label = "Pounder2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_prairie"] = {
		label = "Prairie Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_pranger"] = {
		label = "Pranger Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_predator"] = {
		label = "Predator Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_premier"] = {
		label = "Premier Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_previon"] = {
		label = "Previon Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_primo"] = {
		label = "Primo Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_primo2"] = {
		label = "Primo2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_proptrailer"] = {
		label = "Proptrailer Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_prototipo"] = {
		label = "Prototipo Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_pyro"] = {
		label = "Pyro Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_radi"] = {
		label = "Radi Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_raiden"] = {
		label = "Raiden Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_raketrailer"] = {
		label = "Raketrailer Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_rallytruck"] = {
		label = "Rallytruck Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_rancherxl"] = {
		label = "Rancherxl Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_rancherxl2"] = {
		label = "Rancherxl2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_rapidgt"] = {
		label = "Rapidgt Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_rapidgt2"] = {
		label = "Rapidgt2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_rapidgt3"] = {
		label = "Rapidgt3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_raptor"] = {
		label = "Raptor Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_ratbike"] = {
		label = "Ratbike Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_ratloader"] = {
		label = "Ratloader Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_ratloader2"] = {
		label = "Ratloader2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_rb26dett"] = {
		label = "Rb26dett Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_rcbandito"] = {
		label = "Rcbandito Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_reaper"] = {
		label = "Reaper Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_rebel"] = {
		label = "Rebel Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_rebel2"] = {
		label = "Rebel2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_rebla"] = {
		label = "Rebla Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_regina"] = {
		label = "Regina Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_remus"] = {
		label = "Remus Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_rentalbus"] = {
		label = "Rentalbus Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_retinue"] = {
		label = "Retinue Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_retinue2"] = {
		label = "Retinue2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_revolter"] = {
		label = "Revolter Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_rhapsody"] = {
		label = "Rhapsody Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_rhino"] = {
		label = "Rhino Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_riata"] = {
		label = "Riata Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_riot"] = {
		label = "Riot Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_riot2"] = {
		label = "Riot2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_ripley"] = {
		label = "Ripley Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_rocoto"] = {
		label = "Rocoto Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_rogue"] = {
		label = "Rogue Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_romero"] = {
		label = "Romero Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_rrocket"] = {
		label = "Rrocket Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_rt3000"] = {
		label = "Rt3000 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_rubble"] = {
		label = "Rubble Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_ruffian"] = {
		label = "Ruffian Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_ruiner"] = {
		label = "Ruiner Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_ruiner2"] = {
		label = "Ruiner2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_ruiner3"] = {
		label = "Ruiner3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_rumpo"] = {
		label = "Rumpo Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_rumpo2"] = {
		label = "Rumpo2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_rumpo3"] = {
		label = "Rumpo3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_ruston"] = {
		label = "Ruston Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_rx713b"] = {
		label = "Rx713b Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_s80"] = {
		label = "S80 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_sabregt"] = {
		label = "Sabregt Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_sabregt2"] = {
		label = "Sabregt2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_sadler"] = {
		label = "Sadler Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_sadler2"] = {
		label = "Sadler2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_sanchez"] = {
		label = "Sanchez Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_sanchez2"] = {
		label = "Sanchez2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_sanctus"] = {
		label = "Sanctus Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_sandking"] = {
		label = "Sandking Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_sandking2"] = {
		label = "Sandking2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_savage"] = {
		label = "Savage Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_savestra"] = {
		label = "Savestra Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_sc1"] = {
		label = "Sc1 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_scarab"] = {
		label = "Scarab Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_scarab2"] = {
		label = "Scarab2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_scarab3"] = {
		label = "Scarab3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_schafter2"] = {
		label = "Schafter2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_schafter3"] = {
		label = "Schafter3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_schafter4"] = {
		label = "Schafter4 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_schafter5"] = {
		label = "Schafter5 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_schafter6"] = {
		label = "Schafter6 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_schlagen"] = {
		label = "Schlagen Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_schwarzer"] = {
		label = "Schwarzer Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_scorcher"] = {
		label = "Scorcher Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_scramjet"] = {
		label = "Scramjet Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_scrap"] = {
		label = "Scrap Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_seabreeze"] = {
		label = "Seabreeze Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_seashark"] = {
		label = "Seashark Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_seashark2"] = {
		label = "Seashark2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_seashark3"] = {
		label = "Seashark3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_seasparrow"] = {
		label = "Seasparrow Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_seasparrow2"] = {
		label = "Seasparrow2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_seasparrow3"] = {
		label = "Seasparrow3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_seminole"] = {
		label = "Seminole Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_seminole2"] = {
		label = "Seminole2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_sentinel"] = {
		label = "Sentinel Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_sentinel2"] = {
		label = "Sentinel2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_sentinel3"] = {
		label = "Sentinel3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_serrano"] = {
		label = "Serrano Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_seven70"] = {
		label = "Seven70 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_shamal"] = {
		label = "Shamal Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_sheava"] = {
		label = "Sheava Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_sheriff"] = {
		label = "Sheriff Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_sheriff2"] = {
		label = "Sheriff2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_shotaro"] = {
		label = "Shotaro Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_skylift"] = {
		label = "Skylift Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_slamtruck"] = {
		label = "Slamtruck Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_slamvan"] = {
		label = "Slamvan Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_slamvan2"] = {
		label = "Slamvan2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_slamvan3"] = {
		label = "Slamvan3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_slamvan4"] = {
		label = "Slamvan4 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_slamvan5"] = {
		label = "Slamvan5 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_slamvan6"] = {
		label = "Slamvan6 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_sovereign"] = {
		label = "Sovereign Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_specter"] = {
		label = "Specter Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_specter2"] = {
		label = "Specter2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_speeder"] = {
		label = "Speeder Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_speeder2"] = {
		label = "Speeder2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_speedo"] = {
		label = "Speedo Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_speedo2"] = {
		label = "Speedo2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_speedo4"] = {
		label = "Speedo4 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_squaddie"] = {
		label = "Squaddie Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_squalo"] = {
		label = "Squalo Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_stafford"] = {
		label = "Stafford Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_stalion"] = {
		label = "Stalion Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_stalion2"] = {
		label = "Stalion2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_stanier"] = {
		label = "Stanier Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_starling"] = {
		label = "Starling Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_stinger"] = {
		label = "Stinger Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_stingergt"] = {
		label = "Stingergt Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_stockade"] = {
		label = "Stockade Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_stockade3"] = {
		label = "Stockade3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_stratum"] = {
		label = "Stratum Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_streiter"] = {
		label = "Streiter Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_stretch"] = {
		label = "Stretch Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_strikeforce"] = {
		label = "Strikeforce Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_stromberg"] = {
		label = "Stromberg Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_stryder"] = {
		label = "Stryder Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_stunt"] = {
		label = "Stunt Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_submersible"] = {
		label = "Submersible Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_submersible2"] = {
		label = "Submersible2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_sugoi"] = {
		label = "Sugoi Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_sultan"] = {
		label = "Sultan Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_sultan2"] = {
		label = "Sultan2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_sultan3"] = {
		label = "Sultan3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_sultanrs"] = {
		label = "Sultanrs Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_suntrap"] = {
		label = "Suntrap Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_superd"] = {
		label = "Superd Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_supervolito"] = {
		label = "Supervolito Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_supervolito2"] = {
		label = "Supervolito2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_supra2jzgtett"] = {
		label = "Supra2jzgtett Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_surano"] = {
		label = "Surano Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_surfer"] = {
		label = "Surfer Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_surfer2"] = {
		label = "Surfer2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_surge"] = {
		label = "Surge Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_swift"] = {
		label = "Swift Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_swift2"] = {
		label = "Swift2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_swinger"] = {
		label = "Swinger Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_t20"] = {
		label = "T20 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_taco"] = {
		label = "Taco Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_tailgater"] = {
		label = "Tailgater Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_tailgater2"] = {
		label = "Tailgater2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_taipan"] = {
		label = "Taipan Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_tampa"] = {
		label = "Tampa Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_tampa2"] = {
		label = "Tampa2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_tampa3"] = {
		label = "Tampa3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_tanker"] = {
		label = "Tanker Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_tanker2"] = {
		label = "Tanker2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_tankercar"] = {
		label = "Tankercar Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_taxi"] = {
		label = "Taxi Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_technical"] = {
		label = "Technical Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_technical2"] = {
		label = "Technical2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_technical3"] = {
		label = "Technical3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_tempesta"] = {
		label = "Tempesta Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_terbyte"] = {
		label = "Terbyte Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_tezeract"] = {
		label = "Tezeract Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_thrax"] = {
		label = "Thrax Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_thrust"] = {
		label = "Thrust Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_thruster"] = {
		label = "Thruster Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_tigon"] = {
		label = "Tigon Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_tiptruck"] = {
		label = "Tiptruck Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_tiptruck2"] = {
		label = "Tiptruck2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_titan"] = {
		label = "Titan Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_toreador"] = {
		label = "Toreador Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_torero"] = {
		label = "Torero Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_tornado"] = {
		label = "Tornado Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_tornado2"] = {
		label = "Tornado2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_tornado3"] = {
		label = "Tornado3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_tornado4"] = {
		label = "Tornado4 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_tornado5"] = {
		label = "Tornado5 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_tornado6"] = {
		label = "Tornado6 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_toro"] = {
		label = "Toro Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_toro2"] = {
		label = "Toro2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_toros"] = {
		label = "Toros Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_tourbus"] = {
		label = "Tourbus Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_towtruck"] = {
		label = "Towtruck Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_towtruck2"] = {
		label = "Towtruck2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_tr2"] = {
		label = "Tr2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_tr3"] = {
		label = "Tr3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_tr4"] = {
		label = "Tr4 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_tractor"] = {
		label = "Tractor Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_tractor2"] = {
		label = "Tractor2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_tractor3"] = {
		label = "Tractor3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_trailerlarge"] = {
		label = "Trailerlarge Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_trailerlogs"] = {
		label = "Trailerlogs Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_trailers"] = {
		label = "Trailers Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_trailers2"] = {
		label = "Trailers2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_trailers3"] = {
		label = "Trailers3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_trailers4"] = {
		label = "Trailers4 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_trailersmall"] = {
		label = "Trailersmall Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_trailersmall2"] = {
		label = "Trailersmall2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_trash"] = {
		label = "Trash Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_trash2"] = {
		label = "Trash2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_trflat"] = {
		label = "Trflat Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_tribike"] = {
		label = "Tribike Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_tribike2"] = {
		label = "Tribike2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_tribike3"] = {
		label = "Tribike3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_trophytruck"] = {
		label = "Trophytruck Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_trophytruck2"] = {
		label = "Trophytruck2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_tropic"] = {
		label = "Tropic Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_tropic2"] = {
		label = "Tropic2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_tropos"] = {
		label = "Tropos Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_tug"] = {
		label = "Tug Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_tula"] = {
		label = "Tula Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_tulip"] = {
		label = "Tulip Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_turismo2"] = {
		label = "Turismo2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_turismor"] = {
		label = "Turismor Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_tvtrailer"] = {
		label = "Tvtrailer Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_tyrant"] = {
		label = "Tyrant Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_tyrus"] = {
		label = "Tyrus Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_utillitruck"] = {
		label = "Utillitruck Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_utillitruck2"] = {
		label = "Utillitruck2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_utillitruck3"] = {
		label = "Utillitruck3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_vacca"] = {
		label = "Vacca Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_vader"] = {
		label = "Vader Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_vagner"] = {
		label = "Vagner Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_vagrant"] = {
		label = "Vagrant Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_valkyrie"] = {
		label = "Valkyrie Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_valkyrie2"] = {
		label = "Valkyrie2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_vamos"] = {
		label = "Vamos Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_vectre"] = {
		label = "Vectre Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_velum"] = {
		label = "Velum Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_velum2"] = {
		label = "Velum2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_verlierer2"] = {
		label = "Verlierer2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_verus"] = {
		label = "Verus Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_vestra"] = {
		label = "Vestra Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_vetir"] = {
		label = "Vetir Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_veto"] = {
		label = "Veto Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_veto2"] = {
		label = "Veto2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_vigero"] = {
		label = "Vigero Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_vigilante"] = {
		label = "Vigilante Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_vindicator"] = {
		label = "Vindicator Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_virgo"] = {
		label = "Virgo Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_virgo2"] = {
		label = "Virgo2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_virgo3"] = {
		label = "Virgo3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_viseris"] = {
		label = "Viseris Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_visione"] = {
		label = "Visione Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_volatol"] = {
		label = "Volatol Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_volatus"] = {
		label = "Volatus Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_voltic"] = {
		label = "Voltic Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_voltic2"] = {
		label = "Voltic2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_voodoo"] = {
		label = "Voodoo Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_voodoo2"] = {
		label = "Voodoo2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_vortex"] = {
		label = "Vortex Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_vstr"] = {
		label = "Vstr Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_warrener"] = {
		label = "Warrener Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_washington"] = {
		label = "Washington Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_wastelander"] = {
		label = "Wastelander Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_weevil"] = {
		label = "Weevil Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_windsor"] = {
		label = "Windsor Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_windsor2"] = {
		label = "Windsor2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_winky"] = {
		label = "Winky Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_wolfsbane"] = {
		label = "Wolfsbane Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_xa21"] = {
		label = "Xa21 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_xls"] = {
		label = "Xls Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_xls2"] = {
		label = "Xls2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_yosemite"] = {
		label = "Yosemite Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_yosemite2"] = {
		label = "Yosemite2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_yosemite3"] = {
		label = "Yosemite3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_youga"] = {
		label = "Youga Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_youga2"] = {
		label = "Youga2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_youga3"] = {
		label = "Youga3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_z190"] = {
		label = "Z190 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_zentorno"] = {
		label = "Zentorno Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_zhaba"] = {
		label = "Zhaba Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_zion"] = {
		label = "Zion Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_zion2"] = {
		label = "Zion2 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_zion3"] = {
		label = "Zion3 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_zombiea"] = {
		label = "Zombiea Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_zombieb"] = {
		label = "Zombieb Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_zorrusso"] = {
		label = "Zorrusso Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_zr350"] = {
		label = "Zr350 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_zr380"] = {
		label = "Zr380 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_zr3802"] = {
		label = "Zr3802 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_zr3803"] = {
		label = "Zr3803 Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["engine_ztype"] = {
		label = "Ztype Engine",
		weight = 1,
		stack = true,
		close = true,
	},

	["essence"] = {
		label = "Benzin",
		weight = 1,
		stack = true,
		close = true,
	},

	["fabric"] = {
		label = "Tuch",
		weight = 1,
		stack = true,
		close = true,
	},

	["firstaidkit"] = {
		label = "Erste-Hilfe-Kasten",
		weight = 1,
		stack = true,
		close = true,
	},

	["fish"] = {
		label = "Fisch",
		weight = 1,
		stack = true,
		close = true,
	},

	["fixkit"] = {
		label = "Repair Kit",
		weight = 3,
		stack = true,
		close = true,
	},

	["fixtool"] = {
		label = "Werkzeugkasten",
		weight = 5,
		stack = true,
		close = true,
	},

	["flashlight"] = {
		label = "Flashlight",
		weight = 2,
		stack = true,
		close = true,
	},

	["GADGET_PARACHUTE"] = {
		label = "Fallschrim",
		weight = 2,
		stack = true,
		close = true,
	},

	["gazbottle"] = {
		label = "Gasflasche",
		weight = 2,
		stack = true,
		close = true,
	},

	["gold"] = {
		label = "Gold",
		weight = 155,
		stack = true,
		close = true,
	},

	["gold_bar"] = {
		label = "Goldbarren",
		weight = 2,
		stack = true,
		close = true,
	},

	["golem"] = {
		label = "Golem",
		weight = 5,
		stack = true,
		close = true,
	},

	["grapperaisin"] = {
		label = "Weintrauben",
		weight = 5,
		stack = true,
		close = true,
	},

	["grip"] = {
		label = "Grip",
		weight = 2,
		stack = true,
		close = true,
	},

	["head_brace"] = {
		label = "Head Brace",
		weight = 1,
		stack = true,
		close = true,
	},

	["heroin"] = {
		label = "Heroin",
		weight = 1,
		stack = true,
		close = true,
	},

	["hydrochloric_acid"] = {
		label = "HydroChlorsäure",
		weight = 1,
		stack = true,
		close = true,
	},

	["ice"] = {
		label = "Eis",
		weight = 5,
		stack = true,
		close = true,
	},

	["icetea"] = {
		label = "Ice Tea",
		weight = 5,
		stack = true,
		close = true,
	},

	["id_card"] = {
		label = "ID Card",
		weight = 1,
		stack = true,
		close = true,
	},

	["id_card_f"] = {
		label = "Malicious Access Card",
		weight = 1,
		stack = true,
		close = true,
	},

	["ied"] = {
		label = "Autobombe",
		weight = 0,
		stack = true,
		close = true,
	},

	["jager"] = {
		label = "Jägermeister",
		weight = 5,
		stack = true,
		close = true,
	},

	["jagerbomb"] = {
		label = "Jägerbomb",
		weight = 5,
		stack = true,
		close = true,
	},

	["jagercerbere"] = {
		label = "Jäger Cerbère",
		weight = 3,
		stack = true,
		close = true,
	},

	["jewels"] = {
		label = "Juwelen",
		weight = 1,
		stack = true,
		close = true,
	},

	["jusfruit"] = {
		label = "Fruchtsaft",
		weight = 5,
		stack = true,
		close = true,
	},

	["keycard"] = {
		label = "Keycard",
		weight = 1,
		stack = true,
		close = true,
	},

	["laptop_h"] = {
		label = "Hacker Laptop",
		weight = 1,
		stack = true,
		close = true,
	},

	["leg_bandage"] = {
		label = "Leg Bandage",
		weight = 1,
		stack = true,
		close = true,
	},

	["letter"] = {
		label = "Brief",
		weight = -1,
		stack = true,
		close = true,
	},

	["limonade"] = {
		label = "Fanta",
		weight = 5,
		stack = true,
		close = true,
	},

	["lsa"] = {
		label = "LSA",
		weight = 1,
		stack = true,
		close = true,
	},

	["lsd"] = {
		label = "LSD",
		weight = 1,
		stack = true,
		close = true,
	},

	["manual_tranny"] = {
		label = "Manual Trannsmition",
		weight = 1,
		stack = true,
		close = true,
	},

	["marijuana"] = {
		label = "Marijuana",
		weight = 1,
		stack = true,
		close = true,
	},

	["martini"] = {
		label = "Weisser Martini",
		weight = 5,
		stack = true,
		close = true,
	},

	["medikit"] = {
		label = "Verbandskasten",
		weight = 2,
		stack = true,
		close = true,
	},

	["menthe"] = {
		label = "Minzblatt",
		weight = 10,
		stack = true,
		close = true,
	},

	["meth"] = {
		label = "Meth",
		weight = 1,
		stack = true,
		close = true,
	},

	["metreshooter"] = {
		label = "Mètre de shooter",
		weight = 3,
		stack = true,
		close = true,
	},

	["mini_c4"] = {
		label = "Mini C4 Charge",
		weight = 1,
		stack = true,
		close = true,
	},

	["mixapero"] = {
		label = "Apéro-Mix",
		weight = 3,
		stack = true,
		close = true,
	},

	["mojito"] = {
		label = "Mojito",
		weight = 5,
		stack = true,
		close = true,
	},

	["moneywash"] = {
		label = "Geldwasch Lizenz",
		weight = 0,
		stack = true,
		close = true,
	},

	["nitro"] = {
		label = "Nitro",
		weight = 1,
		stack = true,
		close = true,
	},

	["normal_c4"] = {
		label = "C4 Ladung",
		weight = 1,
		stack = true,
		close = true,
	},

	["oxygenmask"] = {
		label = "Tauchflasche",
		weight = 1,
		stack = true,
		close = true,
	},

	["packaged_chicken"] = {
		label = "Hähnchenfilet",
		weight = 1,
		stack = true,
		close = true,
	},

	["packaged_plank"] = {
		label = "Bretterpaket",
		weight = 1,
		stack = true,
		close = true,
	},

	["pdbadge"] = {
		label = "Police Badge",
		weight = 1,
		stack = true,
		close = true,
	},

	["peach"] = {
		label = "Pfirsich",
		weight = 1,
		stack = true,
		close = true,
	},

	["peach_juice"] = {
		label = "Pfirsichsaft",
		weight = 1,
		stack = true,
		close = true,
	},

	["petrol"] = {
		label = "Öl",
		weight = 1,
		stack = true,
		close = true,
	},

	["petrol_raffin"] = {
		label = "bearbeitetes Öl",
		weight = 1,
		stack = true,
		close = true,
	},

	['pickaxe'] = {
		label = 'Spitzhacke',
		weight = 325,
		stack = true,
		degrade = 30 -- This is the time in minutes until a pickaxe degrades and is removed from inventory
	},

	["poppyresin"] = {
		label = "Mohnharz",
		weight = 1,
		stack = true,
		close = true,
	},

	["racing_tirekit"] = {
		label = "Racing Tires Kit",
		weight = 1,
		stack = true,
		close = true,
	},

	["repairkit"] = {
		label = "Reparatur-Kit",
		weight = 1,
		stack = true,
		close = true,
	},

	["rhum"] = {
		label = "Rum",
		weight = 5,
		stack = true,
		close = true,
	},

	["rhumcoca"] = {
		label = "Rum-Cola",
		weight = 5,
		stack = true,
		close = true,
	},

	["rhumfruit"] = {
		label = "Rum-Fruchtsaft",
		weight = 5,
		stack = true,
		close = true,
	},

	["saucisson"] = {
		label = "Bratwurst",
		weight = 5,
		stack = true,
		close = true,
	},

	["scope"] = {
		label = "Scope",
		weight = 2,
		stack = true,
		close = true,
	},

	["scratch_ticket"] = {
		label = "Rubbellos",
		weight = 1,
		stack = true,
		close = true,
		client = {
		
			event = 'dr-scratching:isActiveCooldown'
	
		}
	},

	["secure_card"] = {
		label = "Secure ID Card",
		weight = 1,
		stack = true,
		close = true,
	},

	["shark"] = {
		label = "Haifisch",
		weight = 0,
		stack = true,
		close = true,
	},

	["skin"] = {
		label = "Skin",
		weight = 2,
		stack = true,
		close = true,
	},

	["slaughtered_chicken"] = {
		label = "geschlachtetes Huhn",
		weight = 1,
		stack = true,
		close = true,
	},

	["soda"] = {
		label = "Wasser",
		weight = 5,
		stack = true,
		close = true,
	},

	["sodium_hydroxide"] = {
		label = "Natriumhydroxid",
		weight = 1,
		stack = true,
		close = true,
	},

	["spikestrip"] = {
		label = "Nagelband",
		weight = 1,
		stack = true,
		close = true,
	},

	["sports_tirekit"] = {
		label = "Sports Tire Kit",
		weight = 1,
		stack = true,
		close = true,
	},

	["street_tirekit"] = {
		label = "Street Tire Kit",
		weight = 1,
		stack = true,
		close = true,
	},

	["sulfuric_acid"] = {
		label = "Schwefelsäure",
		weight = 1,
		stack = true,
		close = true,
	},

	["supressor"] = {
		label = "Suppressor",
		weight = 2,
		stack = true,
		close = true,
	},

	["teqpaf"] = {
		label = "Teq'paf",
		weight = 5,
		stack = true,
		close = true,
	},

	["tequila"] = {
		label = "Tequila",
		weight = 5,
		stack = true,
		close = true,
	},

	["thermal_charge"] = {
		label = "thermische Ladung",
		weight = 1,
		stack = true,
		close = true,
	},

	["thionyl_chloride"] = {
		label = "Thionylchlorid",
		weight = 1,
		stack = true,
		close = true,
	},

	["tirekit"] = {
		label = "Reifen-Kit",
		weight = 1,
		stack = true,
		close = true,
	},

	["tunerchip"] = {
		label = "Tunerchip",
		weight = 1,
		stack = true,
		close = true,
	},

	["turbo_racing"] = {
		label = "Racing Turbine",
		weight = 1,
		stack = true,
		close = true,
	},

	["turbo_sports"] = {
		label = "Sports Turbine",
		weight = 1,
		stack = true,
		close = true,
	},

	["turbo_street"] = {
		label = "Street Turbine",
		weight = 1,
		stack = true,
		close = true,
	},

	["turtle"] = {
		label = "Meeresschildkröte",
		weight = 3,
		stack = true,
		close = true,
	},

	["turtlebait"] = {
		label = "Schildkrötenköder",
		weight = 10,
		stack = true,
		close = true,
	},

	["vehgps"] = {
		label = "Fahrzeug-GPS",
		weight = 1,
		stack = true,
		close = true,
	},

	["vodka"] = {
		label = "Wodka",
		weight = 5,
		stack = true,
		close = true,
	},

	["vodkaenergy"] = {
		label = "Wodka-Energy",
		weight = 5,
		stack = true,
		close = true,
	},

	["vodkafruit"] = {
		label = "Wodka-Fuchtsaft",
		weight = 5,
		stack = true,
		close = true,
	},

	["washed_stone"] = {
		label = "gewaschener Felsbrocken",
		weight = 1,
		stack = true,
		close = true,
	},

	["weabox"] = {
		label = "Munitionskiste",
		weight = 1,
		stack = true,
		close = true,
	},

	["weaclip"] = {
		label = "Waffenmagazin",
		weight = 1,
		stack = true,
		close = true,
	},

	["whisky"] = {
		label = "Whisky",
		weight = 5,
		stack = true,
		close = true,
	},

	["whiskycoca"] = {
		label = "Whisky-Cola",
		weight = 5,
		stack = true,
		close = true,
	},

	["wood"] = {
		label = "Holz",
		weight = 1,
		stack = true,
		close = true,
	},

	["wool"] = {
		label = "Wolle",
		weight = 1,
		stack = true,
		close = true,
	},

	["zetony"] = {
		label = "Spielchips",
		weight = 0,
		stack = true,
		close = true,
	},
	
	['metal'] = {
		label = 'Metal',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},
	
	['rope'] = {
		label = 'Seil',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},
	
	['shovel'] = {
		label = 'Schaufel',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},
	-- here we go the 1000 items
-- ox_inventory format

['repairparts'] = {
	label = 'Repair Engine Parts',
	weight = 250,
	stack = false,
	close = true,
},

['street_tires'] = {
	label = 'Street Tires',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},
['sports_tires'] = {
	label = 'Sports Tires',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},
['racing_tires'] = {
	label = 'Racing Tires',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},
['drag_tires'] = {
	label = 'Drag Tires',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['transmition_clutch'] = {
	label = 'OEM Transmission Clutch',
	weight = 100,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['engine_flywheel'] = {
	label = 'OEM Flywheel',
	weight = 100,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['engine_oil'] = {
	label = 'OEM Engine Oil',
	weight = 100,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['engine_sparkplug'] = {
	label = 'Sparkplugs Kit',
	weight = 50,
	stack = true,
	client = {
		--status = { hunger = -10000, thirst = -10000, stress = -100000 },
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['engine_gasket'] = {
	label = 'OEM Head Gasket Kit',
	weight = 50,
	stack = true,
	client = {
		--status = { hunger = -10000, thirst = -10000, stress = -100000 },
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['engine_airfilter'] = {
	label = 'OEM Intake Air Filter',
	weight = 50,
	stack = true,
	client = {
		--status = { hunger = -20000, thirst = -30000, stress = -100000 },
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['engine_fuelinjector'] = {
	label = 'OEM Fuel Injectors',
	weight = 150,
	stack = true,
	client = {
		--status = { hunger = -20000, thirst = -30000, stress = -100000 },
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},
['engine_pistons'] = {
	label = 'OEM Pistons Kit',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['engine_connectingrods'] = {
	label = 'OEM Connecting Rods Kit',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['engine_valves'] = {
	label = 'OEM Head Valves Kit',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['engine_block'] = {
	label = 'OEM Block',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['engine_crankshaft'] = {
	label = 'OEM CrankShaft',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['engine_camshaft'] = {
	label = 'OEM Camshaft',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},



 

['ecu'] = {
	label = 'ecu',
	weight = 20,
	stack = true,
	close = true,
	description = nil,
},

['drift_tires'] = {
	label = 'Drift Tires',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},


['lsdf'] = {
	label = 'Limited Slip Differential (Front)',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['lsdr'] = {
	label = 'Limited Slip Differential (Rear)',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['tcs'] = {
	label = 'Traction Control System (TCS)',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['esc'] = {
	label = 'Stability Control System (ESC)',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['closerationgears'] = {
	label = 'Close Ratio Gears',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['cvttranny'] = {
	label = 'CVT Transmission',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['abs'] = {
	label = 'Anti-lock braking System',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['axletorsionfront'] = {
	label = 'Axle Torsion (Front)',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['axletorsionrear'] = {
	label = 'Axle Torsion (Rear)',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['axlesolidfront'] = {
	label = 'Axle Solid (Front)',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['axlesolidrear'] = {
	label = 'Axle Solid (Rear)',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['kers'] = {
	label = 'Kinetic Energy Recovery System (KERS)',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['offroadtune1'] = {
	label = 'Offroad Tune 1',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['offroadtune2'] = {
	label = 'Offroad Tune 2',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['stanced'] = {
	label = 'Stanced Tune',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['frontwheeldrive'] = {
	label = 'Front Wheel Drivetrain',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['allwheeldrive'] = {
	label = 'All Wheel Drivetrain',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['rearwheeldrive'] = {
	label = 'Rear Wheel Drivetrain',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['oem_brakes'] = {
	label = 'OEM Brakes',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['oem_suspension'] = {
	label = 'OEM Suspension',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['oem_gearbox'] = {
	label = 'OEM Gear Box',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},


['elite_brakes'] = {
	label = 'Elite Brakes',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['elite_suspension'] = {
	label = 'Elite Suspension',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['elite_gearbox'] = {
	label = 'Elite Gear Box',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['elite_clutch'] = {
	label = 'Elite Transmission Clutch',
	weight = 100,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['elite_flywheel'] = {
	label = 'Elite Flywheel',
	weight = 100,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['elite_oil'] = {
	label = 'Elite Oil',
	weight = 100,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['elite_sparkplug'] = {
	label = 'Elite Sparkplugs Kit',
	weight = 50,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['elite_gasket'] = {
	label = 'Elite Head Gasket Kit',
	weight = 50,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['elite_airfilter'] = {
	label = 'Elite Intake Air Filter',
	weight = 50,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['elite_fuelinjector'] = {
	label = 'Elite Fuel Injectors',
	weight = 150,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},
['elite_pistons'] = {
	label = 'Elite Pistons Kit',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['elite_connectingrods'] = {
	label = 'Elite Connecting Rods Kit',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['elite_valves'] = {
	label = 'Elite Head Valves Kit',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['elite_block'] = {
	label = 'Elite Block',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['elite_crankshaft'] = {
	label = 'Elite CrankShaft',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['elite_camshaft'] = {
	label = 'Elite Camshaft',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['pro_brakes'] = {
	label = 'Pro Brakes',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['pro_suspension'] = {
	label = 'Pro Suspension',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['pro_gearbox'] = {
	label = 'Pro Gear Box',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['pro_clutch'] = {
	label = 'Pro Transmission Clutch',
	weight = 100,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['pro_flywheel'] = {
	label = 'Pro Flywheel',
	weight = 100,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['pro_oil'] = {
	label = 'Pro Oil',
	weight = 100,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['pro_sparkplug'] = {
	label = 'Pro Sparkplugs Kit',
	weight = 50,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['pro_gasket'] = {
	label = 'Pro Head Gasket Kit',
	weight = 50,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['pro_airfilter'] = {
	label = 'Pro Intake Air Filter',
	weight = 50,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['pro_fuelinjector'] = {
	label = 'Pro Fuel Injectors',
	weight = 150,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},
['pro_pistons'] = {
	label = 'Pro Pistons Kit',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['pro_connectingrods'] = {
	label = 'Pro Connecting Rods Kit',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['pro_valves'] = {
	label = 'Pro Head Valves Kit',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['pro_block'] = {
	label = 'Pro Block',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['pro_crankshaft'] = {
	label = 'Pro CrankShaft',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['pro_camshaft'] = {
	label = 'Pro Camshaft',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},


['racing_brakes'] = {
	label = 'Racing Brakes',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['racing_suspension'] = {
	label = 'Racing Suspension',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['racing_gearbox'] = {
	label = 'Racing Gear Box',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['racing_clutch'] = {
	label = 'Racing Transmission Clutch',
	weight = 100,
	stack = true,
	client = {
		--status = { hunger = -150000, thirst = -50000, stress = -100000 },
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['racing_flywheel'] = {
	label = 'Racing Flywheel',
	weight = 100,
	stack = true,
	client = {
		--status = { hunger = -150000, thirst = -50000, stress = -100000 },
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['racing_oil'] = {
	label = 'Racing Oil',
	weight = 100,
	stack = true,
	client = {
		--status = { hunger = -150000, thirst = -50000, stress = -100000 },
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['racing_sparkplug'] = {
	label = 'Racing Sparkplugs Kit',
	weight = 50,
	stack = true,
	client = {
		--status = { hunger = -10000, thirst = -10000, stress = -100000 },
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['racing_gasket'] = {
	label = 'Racing Head Gasket Kit',
	weight = 50,
	stack = true,
	client = {
		--status = { hunger = -10000, thirst = -10000, stress = -100000 },
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['racing_airfilter'] = {
	label = 'Racing Intake Air Filter',
	weight = 50,
	stack = true,
	client = {
		--status = { hunger = -20000, thirst = -30000, stress = -100000 },
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['racing_fuelinjector'] = {
	label = 'Racing Fuel Injectors',
	weight = 150,
	stack = true,
	client = {
		--status = { hunger = -20000, thirst = -30000, stress = -100000 },
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},
['racing_pistons'] = {
	label = 'Racing Pistons Kit',
	weight = 350,
	stack = true,
	client = {
		--status = { hunger = -110000, thirst = -1130000, stress = -200000 },
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['racing_connectingrods'] = {
	label = 'Racing Connecting Rods Kit',
	weight = 350,
	stack = true,
	client = {
		--status = { hunger = -110000, thirst = -1130000, stress = -200000 },
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['racing_valves'] = {
	label = 'Racing Head Valves Kit',
	weight = 350,
	stack = true,
	client = {
		--status = { hunger = -110000, thirst = -1130000, stress = -200000 },
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['racing_block'] = {
	label = 'Racing Block',
	weight = 350,
	stack = true,
	client = {
		--status = { hunger = -110000, thirst = -1130000, stress = -200000 },
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['racing_crankshaft'] = {
	label = 'Racing CrankShaft',
	weight = 350,
	stack = true,
	client = {
		--status = { hunger = -110000, thirst = -1130000, stress = -200000 },
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['racing_camshaft'] = {
	label = 'Racing Camshaft',
	weight = 350,
	stack = true,
	client = {
		--status = { hunger = -110000, thirst = -1130000, stress = -200000 },
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},


['ultimate_brakes'] = {
	label = 'Ultimate Brakes',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['ultimate_suspension'] = {
	label = 'Ultimate Suspension',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['ultimate_gearbox'] = {
	label = 'Ultimate Gear Box',
	weight = 250,
	stack = true,
	close = true,
	client = {
		anim = { dict = 'mini@repair', clip = 'fixing_a_player' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['ultimate_clutch'] = {
	label = 'Ultimate Transmission Clutch',
	weight = 100,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['ultimate_flywheel'] = {
	label = 'Ultimate Flywheel',
	weight = 100,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['ultimate_oil'] = {
	label = 'Ultimate Oil',
	weight = 100,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['ultimate_sparkplug'] = {
	label = 'Ultimate Sparkplugs Kit',
	weight = 50,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['ultimate_gasket'] = {
	label = 'Ultimate Head Gasket Kit',
	weight = 50,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['ultimate_airfilter'] = {
	label = 'Ultimate Intake Air Filter',
	weight = 50,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['ultimate_fuelinjector'] = {
	label = 'Ultimate Fuel Injectors',
	weight = 150,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},
['ultimate_pistons'] = {
	label = 'Ultimate Pistons Kit',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['ultimate_connectingrods'] = {
	label = 'Ultimatives Pleuelstangen-Kit',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['ultimate_valves'] = {
	label = 'Ultimatives Kopfventil-Kit',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['ultimate_block'] = {
	label = 'Ultimativer Block',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'

	}
},

['ultimate_crankshaft'] = {
	label = 'Ultimative KurbelWelle',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['ultimate_camshaft'] = {
	label = 'Ultimative Nockenwelle',
	weight = 350,
	stack = true,
	client = {
		
		anim = { dict = 'mini@repair', clip = 'fixing_a_ped' },
		usetime = 5500,
		export = 'renzu_tuners.useItem'
	}
},

['rubber'] = {
	label = 'Gummi',
	weight = 20,
	stack = true,
	close = true,
	description = nil,
},
['sulfur'] = {
	label = 'Schwefel',
	weight = 20,
	stack = true,
	close = true,
	description = nil,
},
['steel'] = {
	label = 'Stahl',
	weight = 190,
	stack = true,
	close = true,
	description = nil,
},
['polyester'] = {
	label = 'Polyester',
	weight = 20,
	stack = true,
	close = true,
	description = nil,
},
['bottle'] = {
	label = 'Flasche',
	weight = 20,
	stack = true,
	close = true,
	description = nil,
},
['methane'] = {
	label = 'Methan',
	weight = 20,
	stack = true,
	close = true,
	description = nil,
},
['chip'] = {
	label = 'Chip',
	weight = 20,
	stack = true,
	close = true,
	description = nil,
},
['board'] = {
	label = 'Board',
	weight = 20,
	stack = true,
	close = true,
	description = nil,
},

['aluminum'] = {
	label = 'Aluminium',
	weight = 20,
	stack = true,
},
['cheetos'] = {
	label = 'Cheetos',
	weight = 220,
	client = {
		status = { hunger = 200000 },
		anim = 'eating',
		prop = 'burger',
		usetime = 2500,
		notification = 'Du hast leckere Cheetos gegessen'
	},
},

['dcaramel'] = {
	label = 'Dcaramel',
	weight = 220,
	client = {
		status = { hunger = 200000 },
		anim = 'eating',
		prop = 'burger',
		usetime = 2500,
	},
},

['diam_bar'] = {
	label = 'Diambar',
	weight = 220,
	client = {
		status = { hunger = 200000 },
		anim = 'eating',
		prop = 'burger',
		usetime = 2500,
		notification = 'You ate a delicious diambar'
	},
},

['doritos'] = {
	label = 'Doritos',
	weight = 220,
	client = {
		status = { hunger = 200000 },
		anim = 'eating',
		prop = 'burger',
		usetime = 2500,
		notification = 'You ate a delicious doritos'
	},
},

['mccoys'] = {
	label = 'Mccoys',
	weight = 220,
	client = {
		status = { hunger = 200000 },
		anim = 'eating',
		prop = 'burger',
		usetime = 2500,
		notification = 'You ate a delicious mccoys'
	},
},

['milkybar'] = {
	label = 'Milkybar',
	weight = 220,
	client = {
		status = { hunger = 200000 },
		anim = 'eating',
		prop = 'burger',
		usetime = 2500,
		notification = 'You ate a delicious milkybar'
	},
},

['milkybuttons'] = {
	label = 'Milkybuttons',
	weight = 220,
	client = {
		status = { hunger = 200000 },
		anim = 'eating',
		prop = 'burger',
		usetime = 2500,
		notification = 'You ate a delicious milkybuttons'
	},
},

['milkyway'] = {
	label = 'Milkyway',
	weight = 220,
	client = {
		status = { hunger = 200000 },
		anim = 'eating',
		prop = 'burger',
		usetime = 2500,
		notification = 'You ate a delicious milkyway'
	},
},

['minieggs'] = {
	label = 'Minieggs',
	weight = 220,
	client = {
		status = { hunger = 200000 },
		anim = 'eating',
		prop = 'burger',
		usetime = 2500,
		notification = 'You ate a delicious minieggs'
	},
},

['quarter_pounder'] = {
	label = 'Quarterpounder',
	weight = 220,
	client = {
		status = { hunger = 200000 },
		anim = 'eating',
		prop = 'burger',
		usetime = 2500,
		notification = 'You ate a delicious quarterpounder'
	},
},

['quavers'] = {
	label = 'Quavers',
	weight = 220,
	client = {
		status = { hunger = 200000 },
		anim = 'eating',
		prop = 'burger',
		usetime = 2500,
		notification = 'You ate a delicious quavers'
	},
},

['ripple'] = {
	label = 'Ripple',
	weight = 220,
	client = {
		status = { hunger = 200000 },
		anim = 'eating',
		prop = 'burger',
		usetime = 2500,
		notification = 'You ate a delicious ripple'
	},
},

['sensations'] = {
	label = 'Sensations',
	weight = 220,
	client = {
		status = { hunger = 200000 },
		anim = 'eating',
		prop = 'burger',
		usetime = 2500,
		notification = 'You ate a delicious sensations'
	},
},

['squares'] = {
	label = 'Squares',
	weight = 220,
	client = {
		status = { hunger = 200000 },
		anim = 'eating',
		prop = 'burger',
		usetime = 2500,
		notification = 'You ate a delicious squares'
	},
},

['twix'] = {
	label = 'Twix',
	weight = 220,
	client = {
		status = { hunger = 200000 },
		anim = 'eating',
		prop = 'burger',
		usetime = 2500,
		notification = 'You ate a delicious twix'
	},
},

['twirl'] = {
	label = 'Twirl',
	weight = 220,
	client = {
		status = { hunger = 200000 },
		anim = 'eating',
		prop = 'burger',
		usetime = 2500,
		notification = 'You ate a delicious twirl'
	},
},

['yorkie'] = {
	label = 'Yorkie',
	weight = 220,
	client = {
		status = { hunger = 200000 },
		anim = 'eating',
		prop = 'burger',
		usetime = 2500,
		notification = 'You ate a delicious yorkie'
	},
},

["hose"] = {
	label = "Schlauch",
	weight = 1,
	stack = true,
	close = true,
},
['tuna'] = {
	label = 'Thunfisch',
	weight = 650,
	stack = true,
	close = false,
},

['salmon'] = {
	label = 'Lachs',
	weight = 350,
	stack = true,
	close = false,
},

['trout'] = {
	label = 'Forelle',
	weight = 250,
	stack = true,
	close = false,
},

['anchovy'] = {
	label = 'Sardellenfisch',
	weight = 50,
	stack = true,
	close = false,
},

['fishbait'] = {
	label = 'Fischköder',
	weight = 50,
	stack = true,
	close = false,
},

['fishingrod'] = {
	label = 'Angelrute',
	weight = 800,
	stack = true,
	close = true,
},

['scrap_metal'] = {
    label = 'Eisenschrott',
    weight = 280,
    stack = true,
},

['stone'] = {
    label = 'Stein',
    weight = 265,
    stack = true,
},

['raw_copper'] = {
    label = 'Kupfererz',
    weight = 245,
    stack = true,
},

['raw_iron'] = {
    label = 'Eisenerz',
    weight = 225,
    stack = true,
},

['raw_steel'] = {
    label = 'RStahlerz',
    weight = 210,
    stack = true,
},

['raw_silver'] = {
    label = 'Silbererz',
    weight = 190,
    stack = true,
},

['raw_gold'] = {
    label = 'Golderz',
    weight = 190,
    stack = true,
},

['raw_diamond'] = {
    label = 'Rohdiamant',
    weight = 165,
    stack = true,
},

['raw_emerald'] = {
    label = 'Rohsmaragd',
    weight = 140,
    stack = true,
},

['iron'] = {
    label = 'Eisen',
    weight = 200,
    stack = true,
},

['silver'] = {
    label = 'Silber',
    weight = 175,
    stack = true,
},

['emerald'] = {
    label = 'Smaragd',
    weight = 125,
    stack = true,
},

['petfood'] = {
    label = 'Tierfutter',
    weight = 225,
    stack = true,
	client = {
		status = { hunger = 30000},
		anim = 'eating',
		prop = 'burger',
		usetime = 2500,
		notification = 'Du hast deinem Tier das Futter weggegessen :('
	}
},
    ['sandwich'] = { -- A simple sandwich for a simple day
        label = 'Sandwich',
        weight = 350,
        stack = true,
        close = true,
        description = "Ein einfaches Sandwich für einen einfachen Tag",
        client = {
            status = { hunger = 200000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'prop_sandwich_01', 
            pos = vec3(0.05, -0.02, -0.03), rot = vec3(150.0, 340.0, 170.0) },
            usetime = 7500,
        },
    },

    ['burger'] = { -- A test hamburger that you can eat
        label = 'Hamburger',
        weight = 350,
        stack = true,
        close = true,
        description = "Lecker Lecker",
        client = {
            status = { hunger = 230000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'prop_cs_burger_01', 
            pos = vec3(0.05, -0.02, -0.03), rot = vec3(150.0, 340.0, 170.0) },
            usetime = 7500,
        },
    },

    ['burger_chs'] = { -- A test hamburger that you can eat
        label = 'Cheese Burger',
        weight = 350,
        stack = true,
        close = true,
        description = "Ein Hamburger, den man essen kann, mit Käse",
        client = {
            status = { hunger = 230000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'prop_cs_burger_01', 
            pos = vec3(0.05, -0.02, -0.03), rot = vec3(150.0, 340.0, 170.0) },
            usetime = 7500,
        },
    },

    ['burger_chsbcn'] = { -- A test hamburger that you can eat
        label = 'Cheese Bacon Burger',
        weight = 350,
        stack = true,
        close = true,
        description = "Ein Hamburger, den man essen kann, mit Käse und Speck",
        client = {
            status = { hunger = 230000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'prop_cs_burger_01', 
            pos = vec3(0.05, -0.02, -0.03), rot = vec3(150.0, 340.0, 170.0) },
            usetime = 7500,
        },
    },

    ['hotdog'] = { -- A test hamburger that you can eat
        label = 'Hotdog',
        weight = 350,
        stack = true,
        close = true,
        description = "Nicht mit echtem Hundefleisch",
        client = {
            status = { hunger = 230000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'prop_cs_hotdog_01', 
            pos = vec3(0.06, -0.01, -0.03), rot = vec3(60.0, -90.0, 0.0) },
            usetime = 7500,
        },
    },

    ['noodles'] = { -- Fuck those baked shits are good af
        label = 'Thailändische Nudeln',
        weight = 350,
        stack = true,
        close = true,
        description = "Die besten Nudel",
        client = {
            status = { hunger = 160000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'v_ret_fh_noodle', 
            pos = vec3(-0.03, 0.01, 0.05), 
            rot = vec3(0.0, 0.0, -40.0) },
            usetime = 7500,
        },
    },

    ['fr_fries'] = { -- A test hamburger that you can eat
        label = 'Pommes Frites',
        weight = 350,
        stack = true,
        close = true,
        description = "Lecker Pommes",
        client = {
            status = { hunger = 120000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_food_chips', 
            pos = vec3(-0.01, 0.0, -0.02), rot = vec3(0.0, 0.0, -45.0) },
            usetime = 5000,
        },
    },


    ----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------- 
    -- FOOD: Pizzas


    ['pizza_pep'] = { -- A simple sandwich for a simple day
        label = 'Peperoni Pizza',
        weight = 350,
        stack = true,
        close = true,
        description = "Wer hat Käse auf meine Peperoni getan?",
        client = {
            status = { hunger = 200000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'knjgh_pizzaslice5', 
            pos = vec3(0.0500, -0.0300, -0.0700), 
            rot = vec3(300.0, -10.0, 160.0),
            bone = 60309 },
            usetime = 7500,
        },
    },

    ['pizza_chs'] = { -- A simple sandwich for a simple day
        label = 'Cheese Pizza',
        weight = 350,
        stack = true,
        close = true,
        description = "Ist es genug Käse? Nein",
        client = {
            status = { hunger = 200000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'knjgh_pizzaslice4', 
            pos = vec3(0.0500, -0.0300, -0.0700), 
            rot = vec3(300.0, -10.0, 160.0),
            bone = 60309 },
            usetime = 7500,
        },
    },

    ['pizza_msh'] = { -- A simple sandwich for a simple day
        label = 'Fungi Pizza',
        weight = 350,
        stack = true,
        close = true,
        description = "Pilze auf meiner Pizza? Wer hat sich das ausgedacht?",
        client = {
            status = { hunger = 200000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'knjgh_pizzaslice3', 
            pos = vec3(0.0500, -0.0300, -0.0700), 
            rot = vec3(300.0, -10.0, 160.0),
            bone = 60309 },
            usetime = 7500,
        },
    },

    ['pizza_mgt'] = { -- A simple sandwich for a simple day
        label = 'Margherita Pizza',
        weight = 350,
        stack = true,
        close = true,
        description = "Ganz simple Pizza",
        client = {
            status = { hunger = 200000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'knjgh_pizzaslice2', 
            pos = vec3(0.0500, -0.0300, -0.0700), 
            rot = vec3(300.0, -10.0, 160.0),
            bone = 60309 },
            usetime = 7500,
        },
    },

    ['pizza_dmt'] = { -- A simple sandwich for a simple day
        label = 'Dopplet Salami Pizza',
        weight = 350,
        stack = true,
        close = true,
        description = "Wenn ein mal Fleisch nicht genug ist und 3 seltsam sind",
        client = {
            status = { hunger = 200000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'knjgh_pizzaslice1', 
            pos = vec3(0.0500, -0.0300, -0.0700), 
            rot = vec3(300.0, -10.0, 160.0),
            bone = 60309 },
            usetime = 7500,
        },
    },


    ----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------- 
    -- FOOD: Snacks


    ['phatc_rib'] = { -- A skeletons favorite snack
        label = 'Phat Chips: Ribs',
        weight = 350,
        stack = true,
        close = true,
        description = "Rib flavored chips, made with real wood chips",
        client = {
            status = { hunger = 120000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'ng_proc_food_chips01b', 
            pos = vec3(0.0, 0.08, 0.05), rot = vec3(90.0, 0.0, -45.0) },
            usetime = 5000,
        },
    },

    ['phatc_bch'] = { -- Biggie Cheese
        label = 'Phat Chips: Big Cheese',
        weight = 350,
        stack = true,
        close = true,
        description = "Lecker Käse",
        client = {
            status = { hunger = 120000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'ng_proc_food_chips01a', 
            pos = vec3(0.0, 0.08, 0.05), rot = vec3(90.0, 0.0, -45.0) },
            usetime = 5000,
        },
    },

    ['ps_qs'] = { -- is that candy
        label = 'P\'s & Q\'s',
        weight = 350,
        stack = true,
        close = true,
        description = "Süßigkeiten machen die Zunge brrrr",
        client = {
            status = { hunger = 650000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_candy_pqs', 
            pos = vec3(0.0, 0.02, 0.05), rot = vec3(90.0, 0.0, -45.0) },
            usetime = 5000,
        },
    },

    ['apple'] = { -- Apple good
        label = 'Apfel',
        weight = 350,
        stack = true,
        close = true,
        description = "Ja, von den Bäumen kommen die Äpfel",
        client = {
            status = { hunger = 90000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'sf_prop_sf_apple_01a', 
            pos = vec3(0.03, -0.02, -0.03), rot = vec3(300.0, 340.0, 170.0) },
            usetime = 3000,
        },
    },

    ['banana'] = { -- banana good
        label = 'Banana',
        weight = 350,
        stack = true,
        close = true,
        description = "b a n a n a n a n a n a",
        client = {
            status = { hunger = 90000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'v_res_tre_banana', 
            pos = vec3(0.05, -0.02, 0.01), rot = vec3(270.0, 90.0, 0.0) },
            usetime = 3000,
        },
    },
    

    ----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------- 
    -- FOOD: Deserts

    ['donut_chc'] = { -- Fuck those baked shits are good af
        label = 'Schoko Donut',
        weight = 350,
        stack = true,
        close = true,
        description = "Mmmmm, refrence",
        client = {
            status = { hunger = 150000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_foodpack_donut002', 
            bone = 18905,
            pos = vec3(0.13, 0.050, 0.020), 
            rot = vec3(-50.0, 100.0, 270.0) },
            usetime = 7500,
        },
    },

    ['donut_sby'] = { -- Fuck those baked shits are good af
        label = 'Erdbeer Donut',
        weight = 350,
        stack = true,
        close = true,
        description = "Mmmmm, refrence",
        client = {
            status = { hunger = 150000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_foodpack_donut001', 
            bone = 18905,
            pos = vec3(0.13, 0.050, 0.020), 
            rot = vec3(-50.0, 100.0, 270.0) },
            usetime = 7500,
        },
    },

    ['smore'] = { -- Fuck those baked shits are good af
        label = 'Smore',
        weight = 350,
        stack = true,
        close = true,
        description = "Mmmmm, refrence",
        client = {
            status = { hunger = 90000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_food_dessert_a', 
            bone = 18905,
            pos = vec3(0.15, 0.03, 0.03), 
            rot = vec3(-42.0, -36.0, 0.0) },
            usetime = 7500,
        },
    },
-- ICE 
    ['icecream_chr'] = { -- brain cold go brrrrr
        label = 'Kirsche Eiscreme',
        weight = 350,
        stack = true,
        close = true,
        description = "Why yes, your brain is freezing",
        client = {
            status = { hunger = 50000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_icecream_cherry', 
            bone = 18905,
            pos = vec3(0.14, 0.03, 0.01), 
            rot = vec3(85.0, 70.0, -203.0) },
            usetime = 7500,
        },
    },

    ['icecream_chc'] = { -- brain cold go brrrrr
        label = 'Schokoladeneis',
        weight = 350,
        stack = true,
        close = true,
        description = "Why yes, your brain is freezing",
        client = {
            status = { hunger = 50000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_icecream_chocolate', 
            bone = 18905,
            pos = vec3(0.14, 0.03, 0.01), 
            rot = vec3(85.0, 70.0, -203.0) },
            usetime = 7500,
        },
    },

    ['icecream_lmn'] = { -- brain cold go brrrrr
        label = 'Zitroneneis',
        weight = 350,
        stack = true,
        close = true,
        description = "Why yes, your brain is freezing",
        client = {
            status = { hunger = 50000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_icecream_lemon', 
            bone = 18905,
            pos = vec3(0.14, 0.03, 0.01), 
            rot = vec3(85.0, 70.0, -203.0) },
            usetime = 7500,
        },
    },

    ['icecream_pso'] = { -- brain cold go brrrrr
        label = 'Pistazieneis',
        weight = 350,
        stack = true,
        close = true,
        description = "Why yes, your brain is freezing",
        client = {
            status = { hunger = 50000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_icecream_pistachio', 
            bone = 18905,
            pos = vec3(0.14, 0.03, 0.01), 
            rot = vec3(85.0, 70.0, -203.0) },
            usetime = 7500,
        },
    },

    ['icecream_rpy'] = { -- brain cold go brrrrr
        label = 'Himbeereis',
        weight = 350,
        stack = true,
        close = true,
        description = "Why yes, your brain is freezing",
        client = {
            status = { hunger = 50000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_icecream_raspberry', 
            bone = 18905,
            pos = vec3(0.14, 0.03, 0.01), 
            rot = vec3(85.0, 70.0, -203.0) },
            usetime = 7500,
        },
    },

    ['icecream_ckd'] = { -- brain cold go brrrrr
        label = 'Cookie Dough Eis',
        weight = 350,
        stack = true,
        close = true,
        description = "Why yes, your brain is freezing",
        client = {
            status = { hunger = 50000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_icecream_stracciatella', 
            bone = 18905,
            pos = vec3(0.14, 0.03, 0.01), 
            rot = vec3(85.0, 70.0, -203.0) },
            usetime = 7500,
        },
    },

    ['icecream_sby'] = { -- brain cold go brrrrr
        label = 'Erdbeereis',
        weight = 350,
        stack = true,
        close = true,
        description = "Why yes, your brain is freezing",
        client = {
            status = { hunger = 50000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_icecream_strawberry', 
            bone = 18905,
            pos = vec3(0.14, 0.03, 0.01), 
            rot = vec3(85.0, 70.0, -203.0) },
            usetime = 7500,
        },
    },

    ['icecream_vna'] = { -- brain cold go brrrrr
        label = 'Vanilleeis',
        weight = 350,
        stack = true,
        close = true,
        description = "Why yes, your brain is freezing",
        client = {
            status = { hunger = 50000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_icecream_walnut', 
            bone = 18905,
            pos = vec3(0.14, 0.03, 0.01), 
            rot = vec3(85.0, 70.0, -203.0) },
            usetime = 7500,
        },
    },
	    ['milk'] = { -- milky milky milky
        label = 'Milch',
        weight = 350,
        stack = true,
        close = true,
        description = "You need strong bones for crimes",
        client = {
            status = { thirst = 300000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'v_res_tt_milk', 
            bone = 18905,
            pos = vec3(0.10, 0.008, 0.070), 
            rot = vec3(240.0, -60.0, 0.0) },
            usetime = 7500,
        },
    },


    -- COFFEES


    ['coffee_black'] = { -- Carbonized syrup is good for the soul
        label = 'Schwarzer Kaffee',
        weight = 350,
        stack = true,
        close = true,
        description = "As black as the color wheel lets it be",
        client = {
            status = { thirst = 220000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'ng_proc_coffee_01a', 
            pos = vec3(0.008, 0.0, -0.05), rot = vec3(0.0, 0.0, -40.0) },
            usetime = 7500,
        },
    },

    ['coffee_mocha'] = { -- Carbonized syrup is good for the soul
        label = 'Mocha',
        weight = 350,
        stack = true,
        close = true,
        description = "What even is a mocha",
        client = {
            status = { thirst = 220000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'ng_proc_coffee_01a', 
            pos = vec3(0.008, 0.0, -0.05), rot = vec3(0.0, 0.0, -40.0) },
            usetime = 7500,
        },
    },

    ['coffee_cpcno'] = { -- Carbonized syrup is good for the soul
        label = 'Cappuccino',
        weight = 350,
        stack = true,
        close = true,
        description = "That might wake you up a smidge",
        client = {
            status = { thirst = 220000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'ng_proc_coffee_01a', 
            pos = vec3(0.008, 0.0, -0.05), rot = vec3(0.0, 0.0, -40.0) },
            usetime = 7500,
        },
    },

    ['coffee_amrcno'] = { -- Carbonized syrup is good for the soul
        label = 'Americano',
        weight = 350,
        stack = true,
        close = true,
        description = "American coffee, with an o",
        client = {
            status = { thirst = 220000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'ng_proc_coffee_01a', 
            pos = vec3(0.008, 0.0, -0.05), rot = vec3(0.0, 0.0, -40.0) },
            usetime = 7500,
        },
    },


    -- SODAS


    ['ecola'] = { -- Carbonized syrup is good for the soul
        label = 'eCola',
        weight = 350,
        stack = true,
        close = true,
        description = "Hey, there is soda in my cocaine",
        client = {
            status = { thirst = 160000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_ecola_can', 
            pos = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 130.0) },
            usetime = 5000,
        },
    },

    ['sprunk'] = { -- Carbonized syrup is good for the soul
        label = 'Sprunk',
        weight = 350,
        stack = true,
        close = true,
        description = "It tastes like water punched you in the throat",
        client = {
            status = { thirst = 160000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'ng_proc_sodacan_01b', 
            pos = vec3(0.005, -0.001, 0.08), rot = vec3(0.0, 0.0, 160.0) },
            usetime = 5000,
        },
    },

    ['orangotang'] = { -- Carbonized syrup is good for the soul
        label = 'Fanta',
        weight = 350,
        stack = true,
        close = true,
        description = "I didn't even know people wanted this",
        client = {
            status = { thirst = 160000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_orang_can_01', 
            pos = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 130.0) },
            usetime = 5000,
        },
    },

    ['ejunk'] = { -- Drinking too much of this wont kill you. I think.
        label = 'Junk Energy',
        weight = 350,
        stack = true,
        close = true,
        description = "Drinking too much of this wont kill you. I think.",
        client = {
            status = { thirst = 160000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'sf_prop_sf_can_01a', 
            pos = vec3(0.025, 0.010, 0.05), rot = vec3(5.0, 5.0, -180.5) },
            usetime = 5000,
        },
    },
	 -- ALCOHOL: Beers
	 ['rancho_beer'] = { -- Good ol imported beer from mexico
	 label = 'Cerbesa Barracho',
	 weight = 290,
	 stack = true,
	 close = true,
	 description = "Good ol imported beer from mexico",
	 client = {
		 status = { drunk = 90000 },
		 anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		 prop = { model = 'prop_beer_bottle', 
		 pos = vec3(0.02, -0.01, -0.14), rot = vec3(1.0, 5.0, -182.5) },
		 usetime = 7500,
	 },
 },

 ['dusche_beer'] = { -- Good ol imported beer from germany
	 label = 'Dusche Beer',
	 weight = 290,
	 stack = true,
	 close = true,
	 description = "Good ol imported beer from germany",
	 client = {
		 status = { drunk = 90000 },
		 anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		 prop = { model = 'prop_beerdusche', 
		 pos = vec3(0.01, -0.01, -0.12), rot = vec3(5.0, 5.0, -180.5) },
		 usetime = 7500,
	 },
 },

 ['stronzo_beer'] = { -- Good ol imported beer from italy
	 label = 'Stronzo Beer',
	 weight = 290,
	 stack = true,
	 close = true,
	 description = "Good ol imported beer from italy",
	 client = {
		 status = { drunk = 90000 },
		 anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		 prop = { model = 'prop_beer_stz', 
		 pos = vec3(0.01, -0.02, -0.15), rot = vec3(5.0, 5.0, -180.5) },
		 usetime = 7500,
	 },
 },

 ['patriot_beer'] = { -- Good ol homemade beer from the brewery
	 label = 'Patriot Beer',
	 weight = 290,
	 stack = true,
	 close = true,
	 description = "Good ol homemade beer from the brewery",
	 client = {
		 status = { drunk = 90000 },
		 anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		 prop = { model = 'prop_beer_patriot', 
		 pos = vec3(0.01, -0.02, -0.15), rot = vec3(5.0, 5.0, -180.5) },
		 usetime = 7500,
	 },
 },

 -- ALCOHOL: Bottles
 ['bb_bourgeoix'] = { -- Good ol imported beer from mexico
	 label = 'Bottle of Bourgeoix Cognac',
	 weight = 290,
	 stack = true,
	 close = true,
	 description = "Like whiskey, but more ouch",
	 client = {
		 status = { drunk = 180000 },
		 anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		 prop = { model = 'prop_bottle_cognac', 
		 pos = vec3(0.02, -0.01, -0.14), rot = vec3(1.0, 5.0, -182.5) },
		 usetime = 7500,
	 },
 },

 ['bb_cariaque'] = { -- Good ol imported beer from mexico
	 label = 'Bottle of Cariaque Bourbon',
	 weight = 290,
	 stack = true,
	 close = true,
	 description = "Like whiskey, but more ouch",
	 client = {
		 status = { drunk = 180000 },
		 anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		 prop = { model = 'prop_bottle_brandy', 
		 pos = vec3(0.02, -0.01, -0.14), rot = vec3(1.0, 5.0, -182.5) },
		 usetime = 7500,
	 },
 },

 ['cb_bleuterd'] = { -- Good ol imported beer from mexico
	 label = 'Bottle of Bleuter\'d Champagne',
	 weight = 290,
	 stack = true,
	 close = true,
	 description = "For those fancy events",
	 client = {
		 status = { drunk = 180000 },
		 anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		 prop = { model = 'prop_champ_01b', 
		 pos = vec3(0.02, -0.01, -0.14), rot = vec3(1.0, 5.0, -182.5) },
		 usetime = 7500,
	 },
 },

 ['rb_ragga'] = { -- Good ol imported beer from mexico
	 label = 'Bottle of Ragga Rum',
	 weight = 290,
	 stack = true,
	 close = true,
	 description = "A pirates drink for me",
	 client = {
		 status = { drunk = 180000 },
		 anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		 prop = { model = 'prop_rum_bottle', 
		 pos = vec3(0.02, -0.01, -0.14), rot = vec3(1.0, 5.0, -182.5) },
		 usetime = 7500,
	 },
 },

 ['tb_tequilya'] = { -- Good ol imported beer from mexico
	 label = 'Bottle of Tequilya Tequila',
	 weight = 290,
	 stack = true,
	 close = true,
	 description = "For extra kick, add snake venom",
	 client = {
		 status = { drunk = 180000 },
		 anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		 prop = { model = 'prop_tequila_bottle', 
		 pos = vec3(0.02, -0.01, -0.14), rot = vec3(1.0, 5.0, -182.5) },
		 usetime = 7500,
	 },
 },

 ['vb_nogo'] = { -- Good ol imported beer from mexico
	 label = 'Bottle of Nogo Vodka',
	 weight = 290,
	 stack = true,
	 close = true,
	 description = "Chilled like the mountains of Siberia",
	 client = {
		 status = { drunk = 180000 },
		 anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		 prop = { model = 'prop_vodka_bottle', 
		 pos = vec3(0.02, -0.01, -0.14), rot = vec3(1.0, 5.0, -182.5) },
		 usetime = 7500,
	 },
 },

 ['wb_mount'] = { -- Good ol imported beer from mexico
	 label = 'Bottle of Mount Whiskey',
	 weight = 290,
	 stack = true,
	 close = true,
	 description = "The cowboy's choice for getting plastered",
	 client = {
		 status = { drunk = 180000 },
		 anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		 prop = { model = 'prop_cs_whiskey_bottle', 
		 pos = vec3(0.02, -0.01, -0.14), rot = vec3(1.0, 5.0, -182.5) },
		 usetime = 7500,
	 },
 },

 ['wb_richards'] = { -- Good ol imported beer from mexico
	 label = 'Bottle of Richard\'s Whiskey',
	 weight = 290,
	 stack = true,
	 close = true,
	 description = "For the refined taste buds you so clearly have",
	 client = {
		 status = { drunk = 180000 },
		 anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		 prop = { model = 'prop_bottle_richard', 
		 pos = vec3(0.02, -0.01, -0.14), rot = vec3(1.0, 5.0, -182.5) },
		 usetime = 7500,
	 },
 },

 -- ALCOHOL: Glasses
 ['bg_bourgeiox'] = { -- Good ol imported beer from mexico
	 label = 'Glass of Bourgeoix Cognac',
	 weight = 290,
	 stack = true,
	 close = true,
	 description = "Like whiskey, but more ouch",
	 client = {
		 status = { drunk = 10000 },
		 anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' },
		 prop = { model = 'prop_drink_whisky', 
		 pos = vec3(0.16, -0.02, -0.06), 
		 rot = vec3(270.00, 0.00, 0.00),
		 bone = 57005},
		 usetime = 12000,
	 },
 },

 ['bg_cariaque'] = { -- Good ol imported beer from mexico
	 label = 'Glass of Cariaque Bourbon',
	 weight = 290,
	 stack = true,
	 close = true,
	 description = "Like whiskey, but more ouch",
	 client = {
		 status = { drunk = 10000 },
		 anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' },
		 prop = { model = 'prop_drink_whisky', 
		 pos = vec3(0.16, -0.02, -0.06), 
		 rot = vec3(270.00, 0.00, 0.00),
		 bone = 57005},
		 usetime = 12000,
	 },
 },

 ['bs_bourgeiox'] = { -- Good ol imported beer from mexico
	 label = 'Shot of Bourgeoix Cognac',
	 weight = 290,
	 stack = true,
	 close = true,
	 description = "Like whiskey, but more ouch",
	 client = {
		 status = { drunk = 10000 },
		 anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		 prop = { model = 'p_cs_shot_glass_2_s', 
		 pos = vec3(0.02, -0.01, 0.08), 
		 rot = vec3(1.0, 5.0, -182.5) },
		 usetime = 2000,
	 },
 },

 ['bs_cariaque'] = { -- Good ol imported beer from mexico
	 label = 'Shot of Cariaque Bourbon',
	 weight = 290,
	 stack = true,
	 close = true,
	 description = "Like whiskey, but more ouch",
	 client = {
		 status = { drunk = 10000 },
		 anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		 prop = { model = 'p_cs_shot_glass_2_s', 
		 pos = vec3(0.02, -0.01, 0.08), 
		 rot = vec3(1.0, 5.0, -182.5) },
		 usetime = 2000,
	 },
 },

 ['cg_bleuterd'] = { -- Good ol imported beer from mexico
	 label = 'Glass of Bleuter\'d Champagne',
	 weight = 290,
	 stack = true,
	 close = true,
	 description = "Like whiskey, but more ouch",
	 client = {
		 status = { drunk = 10000 },
		 anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' },
		 prop = { model = 'prop_drink_champ', 
		 pos = vec3(0.16, -0.19, -0.06), 
		 rot = vec3(270.00, 0.00, 0.00),
		 bone = 57005},
		 usetime = 12000,
	 },
 },

 ['tg_martini'] = { -- Good ol imported beer from mexico
	 label = 'Martini',
	 weight = 290,
	 stack = true,
	 close = true,
	 description = "Like whiskey, but more ouch",
	 client = {
		 status = { drunk = 10000 },
		 anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' },
		 prop = { model = 'prop_tequila', 
		 pos = vec3(0.16, -0.12, -0.06), 
		 rot = vec3(280.00, 90.00, 0.00),
		 bone = 57005},
		 usetime = 12000,
	 },
 },

 ['tg_sunrise'] = { -- Good ol imported beer from mexico
	 label = 'Tequilya Sunrise',
	 weight = 290,
	 stack = true,
	 close = true,
	 description = "Like whiskey, but more ouch",
	 client = {
		 status = { drunk = 10000 },
		 anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' },
		 prop = { model = 'prop_tequsunrise', 
		 pos = vec3(0.16, -0.1, -0.05), 
		 rot = vec3(270.00, 0.00, 0.00),
		 bone = 57005},
		 usetime = 12000,
	 },
 },

 ['tg_tequilya'] = { -- Good ol imported beer from mexico
	 label = 'Glass of Tequilya',
	 weight = 290,
	 stack = true,
	 close = true,
	 description = "Like whiskey, but more ouch",
	 client = {
		 status = { drunk = 10000 },
		 anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' },
		 prop = { model = 'prop_drink_whisky', 
		 pos = vec3(0.16, -0.02, -0.06), 
		 rot = vec3(270.00, 0.00, 0.00),
		 bone = 57005},
		 usetime = 12000,
	 },
 },

 ['ts_tequilya'] = { -- Good ol imported beer from mexico
	 label = 'Shot of Tequilya',
	 weight = 290,
	 stack = true,
	 close = true,
	 description = "Like whiskey, but more ouch",
	 client = {
		 status = { drunk = 10000 },
		 anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		 prop = { model = 'p_cs_shot_glass_2_s', 
		 pos = vec3(0.02, -0.01, 0.08), 
		 rot = vec3(1.0, 5.0, -182.5) },
		 usetime = 2000,
	 },
 },

 ['vg_nogo'] = { -- Good ol imported beer from mexico
	 label = 'Glass of Nogo Vodka',
	 weight = 290,
	 stack = true,
	 close = true,
	 description = "Like whiskey, but more ouch",
	 client = {
		 status = { drunk = 10000 },
		 anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' },
		 prop = { model = 'prop_drink_whisky', 
		 pos = vec3(0.16, -0.02, -0.06), 
		 rot = vec3(270.00, 0.00, 0.00),
		 bone = 57005},
		 usetime = 12000,
	 },
 },

 ['vs_nogo'] = { -- Good ol imported beer from mexico
	 label = 'Shot of Nogo Vodka',
	 weight = 290,
	 stack = true,
	 close = true,
	 description = "Like whiskey, but more ouch",
	 client = {
		 status = { drunk = 10000 },
		 anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		 prop = { model = 'p_cs_shot_glass_2_s', 
		 pos = vec3(0.02, -0.01, 0.08), 
		 rot = vec3(1.0, 5.0, -182.5) },
		 usetime = 2000,
	 },
 },

 ['wg_mount'] = { -- Good ol imported beer from mexico
	 label = 'Glass of Mount Whiskey',
	 weight = 290,
	 stack = true,
	 close = true,
	 description = "Like whiskey, but more ouch",
	 client = {
		 status = { drunk = 10000 },
		 anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' },
		 prop = { model = 'prop_drink_whisky', 
		 pos = vec3(0.16, -0.02, -0.06), 
		 rot = vec3(270.00, 0.00, 0.00),
		 bone = 57005},
		 usetime = 12000,
	 },
 },

 ['wg_richards'] = { -- Good ol imported beer from mexico
	 label = 'Glass of Richard\'s Whiskey',
	 weight = 290,
	 stack = true,
	 close = true,
	 description = "Like whiskey, but more ouch",
	 client = {
		 status = { drunk = 10000 },
		 anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' },
		 prop = { model = 'prop_drink_whisky', 
		 pos = vec3(0.16, -0.02, -0.06), 
		 rot = vec3(270.00, 0.00, 0.00),
		 bone = 57005},
		 usetime = 12000,
	 },
 },

 ['ws_mount'] = { -- Good ol imported beer from mexico
	 label = 'Shot of Mount Whiskey',
	 weight = 290,
	 stack = true,
	 close = true,
	 description = "Like whiskey, but more ouch",
	 client = {
		 status = { drunk = 10000 },
		 anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		 prop = { model = 'p_cs_shot_glass_2_s', 
		 pos = vec3(0.02, -0.01, 0.08), 
		 rot = vec3(1.0, 5.0, -182.5) },
		 usetime = 2000,
	 },
 },

 ['ws_richards'] = { -- Good ol imported beer from mexico
	 label = 'Shot of Richard\'s Whiskey',
	 weight = 290,
	 stack = true,
	 close = true,
	 description = "Like whiskey, but more ouch",
	 client = {
		 status = { drunk = 10000 },
		 anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
		 prop = { model = 'p_cs_shot_glass_2_s', 
		 pos = vec3(0.02, -0.01, 0.08), 
		 rot = vec3(1.0, 5.0, -182.5) },
		 usetime = 2000,
	 },
 },
 







 ----------------------------------------------------------------------------------------------------
 ----------------------------------------------------------------------------------------------------
 ---------------------------------------------------------------------------------------------------- 
 -- USABLES: Beer crates
 ['box_rancho_beer'] = { -- idea: Player uses item to show badge prop
	 label = 'Case of Rancho Beer',
	 weight = 3500,
	 --consume = 0,
	 description = "Oh boy I love beer",
	 client = {
		 anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 
		 clip = 'machinic_loop_mechandplayer', flag = 3 },
		 prop = { model = 'v_ind_cfbox2', -- need badge props repo
		 pos = vec3(-0.05, 0.8, -0.25), 
		 rot = vec3(0.00, 0.00, 0.00), 
		 bone = 56604 },
		 disable = { move = false, car = false, combat = false },
		 usetime = 5000,
	 }
 },

 ['box_dusche_beer'] = { -- idea: Player uses item to show badge prop
	 label = 'Case of Dusche Beer',
	 weight = 3500,
	 --consume = 0,
	 description = "Oh boy I love beer",
	 client = {
		 anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 
		 clip = 'machinic_loop_mechandplayer', flag = 3 },
		 prop = { model = 'v_ind_cfbox2', -- need badge props repo
		 pos = vec3(-0.05, 0.8, -0.25), 
		 rot = vec3(0.00, 0.00, 0.00), 
		 bone = 56604 },
		 disable = { move = false, car = false, combat = false },
		 usetime = 5000,
	 }
 },

 ['box_stronzo_beer'] = { -- idea: Player uses item to show badge prop
	 label = 'Case of Stronzo Beer',
	 weight = 3500,
	 --consume = 0,
	 description = "Oh boy I love beer",
	 client = {
		 anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 
		 clip = 'machinic_loop_mechandplayer', flag = 3 },
		 prop = { model = 'v_ind_cfbox2', -- need badge props repo
		 pos = vec3(-0.05, 0.8, -0.25), 
		 rot = vec3(0.00, 0.00, 0.00), 
		 bone = 56604 },
		 disable = { move = false, car = false, combat = false },
		 usetime = 5000,
	 }
 },

 ['box_patriot_beer'] = { -- idea: Player uses item to show badge prop
	 label = 'Case of Patriot Beer',
	 weight = 3500,
	 --consume = 0,
	 description = "Oh boy I love beer",
	 client = {
		 anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 
		 clip = 'machinic_loop_mechandplayer', flag = 3 },
		 prop = { model = 'v_ind_cfbox2', -- need badge props repo
		 pos = vec3(-0.05, 0.8, -0.25), 
		 rot = vec3(0.00, 0.00, 0.00), 
		 bone = 56604 },
		 disable = { move = false, car = false, combat = false },
		 usetime = 5000,
	 }
 },

 ----------------------------------------------------------------------------------------------------
 ----------------------------------------------------------------------------------------------------
 ---------------------------------------------------------------------------------------------------- 
 -- USABLES: Pizza boxes
 ['box_pizza_chs'] = { -- idea: Player uses item to show badge prop
	 label = 'Box of Cheese Pizza',
	 weight = 3500,
	 --consume = 0,
	 description = "A box of cheesy goodness, my guy",
	 client = {
		 anim = { dict = 'anim@heists@box_carry@', clip = 'idle', flag = 49 },
		 prop = { model = 'bzzz_pizzahut_box_a', -- need badge props repo
		 pos = vec3(0.010, -0.100, -0.159), 
		 rot = vec3(20.000, 0.000, 0.000), 
		 bone = 28422 },
		 disable = { move = false, car = false, combat = false },
		 usetime = 5000,
	 }
 },

 ['box_pizza_pep'] = { -- idea: Player uses item to show badge prop
	 label = 'Box of Pepperoni Pizza',
	 weight = 3500,
	 --consume = 0,
	 description = "A box of cheesy goodness, my guy",
	 client = {
		 anim = { dict = 'anim@heists@box_carry@', clip = 'idle', flag = 49 },
		 prop = { model = 'bzzz_pizzahut_box_a', -- need badge props repo
		 pos = vec3(0.010, -0.100, -0.159), 
		 rot = vec3(20.000, 0.000, 0.000), 
		 bone = 28422 },
		 disable = { move = false, car = false, combat = false },
		 usetime = 5000,
	 }
 },

 ['box_pizza_msh'] = { -- idea: Player uses item to show badge prop
	 label = 'Box of Mushroom Pizza',
	 weight = 3500,
	 --consume = 0,
	 description = "A box of cheesy goodness, my guy",
	 client = {
		 anim = { dict = 'anim@heists@box_carry@', clip = 'idle', flag = 49 },
		 prop = { model = 'bzzz_pizzahut_box_a', -- need badge props repo
		 pos = vec3(0.010, -0.100, -0.159), 
		 rot = vec3(20.000, 0.000, 0.000), 
		 bone = 28422 },
		 disable = { move = false, car = false, combat = false },
		 usetime = 5000,
	 }
 },

 ['box_pizza_mgt'] = { -- idea: Player uses item to show badge prop
	 label = 'Box of Margherita Pizza',
	 weight = 3500,
	 --consume = 0,
	 description = "A box of cheesy goodness, my guy",
	 client = {
		 anim = { dict = 'anim@heists@box_carry@', clip = 'idle', flag = 49 },
		 prop = { model = 'bzzz_pizzahut_box_a', -- need badge props repo
		 pos = vec3(0.010, -0.100, -0.159), 
		 rot = vec3(20.000, 0.000, 0.000), 
		 bone = 28422 },
		 disable = { move = false, car = false, combat = false },
		 usetime = 5000,
	 }
 },

 ['box_pizza_dmt'] = { -- idea: Player uses item to show badge prop
	 label = 'Box of Double Meat Pizza',
	 weight = 3500,
	 --consume = 0,
	 description = "A box of cheesy goodness, my guy",
	 client = {
		 anim = { dict = 'anim@heists@box_carry@', clip = 'idle', flag = 49 },
		 prop = { model = 'bzzz_pizzahut_box_a', -- need badge props repo
		 pos = vec3(0.010, -0.100, -0.159), 
		 rot = vec3(20.000, 0.000, 0.000), 
		 bone = 28422 },
		 disable = { move = false, car = false, combat = false },
		 usetime = 5000,
	 }
 },


 ----------------------------------------------------------------------------------------------------
 ----------------------------------------------------------------------------------------------------
 ---------------------------------------------------------------------------------------------------- 
 -- USABLES: Ammo cases
 ['box_ammo_rifle1'] = { -- idea: Player uses item to show badge prop
	 label = 'Ammo Case: 5.56x45 (x120)',
	 weight = 5,
	 --consume = 0,
	 description = "A case of stuff to make problems go away",
	 client = {
		 anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 
		 clip = 'machinic_loop_mechandplayer', flag = 3 },
		 prop = { model = 'prop_box_ammo02a', -- need badge props repo
		 pos = vec3(0.0, 0.7, -0.40), 
		 rot = vec3(0.00, 0.00, 90.00), 
		 bone = 56604  },
		 disable = { move = false, car = false, combat = false },
		 usetime = 5000,
	 }
 },

 ['box_ammo_rifle2'] = { -- idea: Player uses item to show badge prop
	 label = 'Ammo Case: 7.62x39 (x120)',
	 weight = 5,
	 --consume = 0,
	 description = "A case of stuff to make problems go away",
	 client = {
		 anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 
		 clip = 'machinic_loop_mechandplayer', flag = 3 },
		 prop = { model = 'prop_box_ammo02a', -- need badge props repo
		 pos = vec3(0.0, 0.7, -0.40), 
		 rot = vec3(0.00, 0.00, 90.00), 
		 bone = 56604  },
		 disable = { move = false, car = false, combat = false },
		 usetime = 5000,
	 }
 },

 ['box_ammo_shotgun'] = { -- idea: Player uses item to show badge prop
	 label = 'Ammo Case: 12 Gauge (x60)',
	 weight = 5,
	 --consume = 0,
	 description = "A case of stuff to make problems go away",
	 client = {
		 anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 
		 clip = 'machinic_loop_mechandplayer', flag = 3 },
		 prop = { model = 'prop_box_ammo02a', -- need badge props repo
		 pos = vec3(0.0, 0.7, -0.40), 
		 rot = vec3(0.00, 0.00, 90.00), 
		 bone = 56604  },
		 disable = { move = false, car = false, combat = false },
		 usetime = 5000,
	 }
 },

 ['box_ammo_sniper'] = { -- idea: Player uses item to show badge prop
	 label = 'Ammo Case: 7.62x51 (x30)',
	 weight = 5,
	 --consume = 0,
	 description = "A case of stuff to make problems go away",
	 client = {
		 anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 
		 clip = 'machinic_loop_mechandplayer', flag = 3 },
		 prop = { model = 'prop_box_ammo02a', -- need badge props repo
		 pos = vec3(0.0, 0.7, -0.40), 
		 rot = vec3(0.00, 0.00, 90.00), 
		 bone = 56604  },
		 disable = { move = false, car = false, combat = false },
		 usetime = 5000,
	 }
 },









 ----------------------------------------------------------------------------------------------------
 ----------------------------------------------------------------------------------------------------
 ---------------------------------------------------------------------------------------------------- 
 -- USABLE: Items
 ['dingus'] = { -- idea: Player uses item to show badge prop
	 label = 'Dingus',
	 weight = 6969,
	 consume = 0,
	 description = "Oh man, what a dingus, just Look at em",
	 client = {
		 anim = { dict = 'paper_1_rcm_alt1-8', clip = 'player_one_dual-8', flag = 49 },
		 prop = { model = 'dingus', -- need badge props repo
		 pos = vec3(0.13, 0.023, -0.04), rot = vec3(-90.0, -180.0, 300.0), bone = 28422 },
		 disable = { move = false, car = false, combat = false },
		 usetime = 5000,
	 }
 },
 ['phone_burner'] = { -- If you aren't using NPWD, remove the client section of this item
 label = 'Burner Phone',
 weight = 190,
 stack = false,
 consume = 0.17
 
},

['clothing_bag'] = { -- If you aren't using NPWD, remove the client section of this item
 label = 'Clothing Bag',
 weight = 3250,
 description = "For changing your outfit on the fly",
 stack = false,
 consume = 1,
 client = {
	 --anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
	 --prop = { model = 'prop_rolled_sock_02', 
	 --pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
	 disable = { move = true, car = true, combat = true },
	 --usetime = 2500,
 }
},

['wallet'] = { -- Use to hold licenses
 label = 'Wallet',
 weight = 115,
 description = "If you lose this, you're gonna be sorry",
 client = {
	 anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
	 prop = { model = 'prop_rolled_sock_02', 
	 pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
	 disable = { move = true, car = true, combat = true },
	 usetime = 2500,
 }
},
   ['cigarette'] = { -- social item that causes slight damage to health
        label = 'Cigarettes',
        weight = 115,
        description = "These probably aren't good for you, but fuck it",
        client = {
            anim = { dict = 'amb@world_human_aa_smoke@male@idle_a', clip = 'idle_c', flag = 49 },
            prop = { model = 'bzzz_cigarpack_cig002', 
            pos = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 0.0), bone = 28422 },
            disable = { move = false, car = false, combat = true },
            usetime = 16000,
        }
    },

    -- TESTING Cigarettes script
    ['redwoods'] = {
        label = 'Redwoods',
        weight = 0,
        stack = false,
        close = true,
        description = 'Pack of Original Red Wood Killer Cigarettes',
        consume = 0,
        client = {
            status = { stress = -100000 },
            anim = { dict = 'amb@world_human_aa_smoke@male@idle_a', clip = 'idle_c', flag = 49 },
            prop = { model = 'bzzz_cigarpack_cig002', 
            pos = { x = 0.00, y = 0.0, z = -0.00}, 
            rot = { x = 0.0, y = 0.0, z = 0.0}, 
            bone = 28422 },
            usetime = 15000,
        },
        buttons = {
            {
                label = 'Remove Cigarette',
                action = function(slot)
                    TriggerServerEvent('gr8_stuff:item:removeCig', slot, {indent=true})
                end
            },
        }
    },

    ['cigar'] = { -- social item that causes slight damage to health
        label = 'Cigar',
        weight = 115,
        description = "These REALLY aren't good for you, but fuck it",
        client = {
            anim = { dict = 'amb@world_human_aa_smoke@male@idle_a', clip = 'idle_c', flag = 49 },
            prop = { model = 'bzzz_cigarpack_cig001', 
            pos = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 180.0, 0.0), bone = 28422 },
            disable = { move = false, car = false, combat = true },
            usetime = 15000,
        }
    },

    -- If you are below the mpchristmas3 update, change the prop to 'ba_prop_battle_vape_01'
    ['vape'] = { -- social item that causes slight damage to health
        label = 'Vape',
        weight = 115,
        description = "Vape-nash bruh, tastes like dissapointment",
        consume = 0,
        degrade = 60,
        client = {
            anim = { dict = 'amb@world_human_smoking@male@male_b@base', clip = 'base', flag = 49 },
            prop = { model = 'xm3_prop_xm3_vape_01a',
            pos = vec3(-0.02, -0.02, 0.02), rot = vec3(70.0, 110.0, 10.0), bone = 28422 },

            disable = { move = false, car = false, combat = false },
            usetime = 7000,
        }
    },

    ['bodyarmor_1'] = { --  Use to set body armor to 30%
        label = 'Light Ballistic Vest',
        weight = 3000,
        stack = false,
        description = "Bullts hurt a bit less with this",
        client = {
            anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
            usetime = 6500
        }
    },

    ['bodyarmor_2'] = { --  Use to set body armor to 60%
        label = 'Medium Ballistic Vest',
        weight = 4500,
        stack = false,
        description = "Bullets hurt a lot less with this",
        client = {
            anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
            usetime = 6500
        }
    },

    ['bodyarmor_3'] = { --  Use to set body armor to 100%
        label = 'Heavy Ballistic Vest',
        weight = 4500,
        stack = false,
        description = "Keep the extra bullets for personal vest flair",
        client = {
            anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
            usetime = 6500
        }
    },

    ['parachute'] = { -- Use to equip parachute tool
        label = 'Parachute',
        weight = 8000,
        stack = false,
        description = "For your sake, I hope it opens at the last second",
        client = {
            anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
            usetime = 1500
        }
    },
	 ['weed_sativa'] = { -- idea: use for player to hype up
        label = '3oz Amnesia Haze',
        consume = 0.267,
        weight = 15,
        description = "Oh man, what a dingus, just Look at em",
        client = {
            anim = { dict = 'amb@world_human_aa_smoke@male@idle_a', clip = 'idle_c', flag = 49 },
            prop = { model = 'bzzz_cigarpack_cig003', 
            pos = vec3(-0.01, 0.0, 0.0), rot = vec3(0.0, 180.0, 0.0), bone = 28422 },
            disable = { move = false, car = false, combat = true },
            usetime = 16000,
        }
    },

    ['weed_indica'] = { -- idea: use for player to relax
        label = '3oz Afghan Kush',
        consume = 0.267,
        weight = 15,
        description = "Oh man, what a dingus, just Look at em",
        client = {
            anim = { dict = 'amb@world_human_aa_smoke@male@idle_a', clip = 'idle_c', flag = 49 },
            prop = { model = 'bzzz_cigarpack_cig003', 
            pos = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 0.0), bone = 28422 },
            disable = { move = false, car = false, combat = true },
            usetime = 16000,
        }
    },

    ['weed_hybrid'] = { -- idea: higher end weed
        label = '3oz White Widow',
        consume = 0.267,
        weight = 15,
        description = "Oh man, what a dingus, just Look at em",
        client = {
            anim = { dict = 'amb@world_human_aa_smoke@male@idle_a', clip = 'idle_c', flag = 49 },
            prop = { model = 'bzzz_cigarpack_cig003', 
            pos = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 0.0), bone = 28422 },
            disable = { move = false, car = false, combat = true },
            usetime = 16000,
        }
    },










    ----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------- 
    -- BADGES: Police
    ['badge_fib'] = { -- idea: Player uses item to show badge prop
        label = 'FIB Badge',
        weight = 444,
        consume = 0,
        description = "For official use by FIB Agents only",
        client = {
            anim = { dict = 'paper_1_rcm_alt1-8', clip = 'player_one_dual-8', flag = 49 },
            prop = { model = 'prop_fibb_badge', -- need badge props repo
            pos = vec3(0.13, 0.023, -0.04), rot = vec3(-90.0, -180.0, 300.0), bone = 28422 },
            disable = { move = false, car = false, combat = false },
            usetime = 5000,
        }
    },

    ['badge_bcso'] = { -- idea: Player uses item to show badge prop
        label = 'BCSO Badge',
        weight = 444,
        consume = 0,
        description = "For official use by FIB Agents only",
        client = {
            anim = { dict = 'paper_1_rcm_alt1-8', clip = 'player_one_dual-8', flag = 49 },
            prop = { model = 'prop_bcso_badge', -- need badge props repo
            pos = vec3(0.13, 0.023, -0.04), rot = vec3(-90.0, -180.0, 300.0), bone = 28422 },
            disable = { move = false, car = false, combat = false },
            usetime = 5000,
        }
    },

    ['badge_lssd'] = { -- idea: Player uses item to show badge prop
        label = 'LSSD Badge',
        weight = 444,
        consume = 0,
        description = "For official use by FIB Agents only",
        client = {
            anim = { dict = 'paper_1_rcm_alt1-8', clip = 'player_one_dual-8', flag = 49 },
            prop = { model = 'prop_lssd_badge', -- need badge props repo
            pos = vec3(0.13, 0.023, -0.04), rot = vec3(-90.0, -180.0, 300.0), bone = 28422 },
            disable = { move = false, car = false, combat = false },
            usetime = 5000,
        }
    },

    ['badge_lspd'] = { -- idea: Player uses item to show badge prop
        label = 'LSPD Badge',
        weight = 444,
        consume = 0,
        description = "For official use by FIB Agents only",
        client = {
            anim = { dict = 'paper_1_rcm_alt1-8', clip = 'player_one_dual-8', flag = 49 },
            prop = { model = 'prop_lspd_badge', -- need badge props repo
            pos = vec3(0.13, 0.023, -0.04), rot = vec3(-90.0, -180.0, 300.0), bone = 28422 },
            disable = { move = false, car = false, combat = false },
            usetime = 5000,
        }
    },









    ----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------- 
    -- MRE: Meal Ready to Eat
    ['mre_1'] = { 
        label = 'MRE-001',
        weight = 3500,
        stack = false,
        close = false,
        description = "Contains: Meal, Side, Bread, Dessert",
    },

    ['mre_2'] = { 
        label = 'MRE-002',
        weight = 3500,
        stack = false,
        close = false,
        description = "Contains: Meal, Side, Bread, Dessert",
    },

    ['mre_3'] = { 
        label = 'MRE-003',
        weight = 3500,
        stack = false,
        close = false,
        description = "Contains: Meal, Side, Bread, Dessert",
    },

    ['mre_4'] = { 
        label = 'MRE-004',
        weight = 3500,
        stack = false,
        close = false,
        description = "Contains: Meal, Side, Bread, Dessert",
    },

    ['mre_5'] = { 
        label = 'MRE-005',
        weight = 3500,
        stack = false,
        close = false,
        description = "Contains: Meal, Side, Bread, Dessert",
    },

    -- Main meals
    ['mre_chilimac'] = { 
        label = 'MRE - Chili Mac',
        weight = 1250,
        stack = true,
        close = true,
        description = "Meal-ready-to-eat",
        client = {
            status = { hunger = 250000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'v_res_fa_tincorn', 
            pos = vec3(-0.01, -0.01, 0.01), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['mre_beefstew'] = { 
        label = 'MRE - Beef Stew',
        weight = 1250,
        stack = true,
        close = true,
        description = "Meal-ready-to-eat",
        client = {
            status = { hunger = 250000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'v_res_fa_tincorn', 
            pos = vec3(-0.01, -0.01, 0.01), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['mre_chkenchilada'] = { 
        label = 'MRE - Chkn Enchiladas',
        weight = 1250,
        stack = true,
        close = true,
        description = "Meal-ready-to-eat",
        client = {
            status = { hunger = 250000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'v_res_fa_tincorn', 
            pos = vec3(-0.01, -0.01, 0.01), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['mre_veggieomelet'] = { 
        label = 'MRE - Veggie Omelet',
        weight = 1250,
        stack = true,
        close = true,
        description = "Meal-ready-to-eat",
        client = {
            status = { hunger = 250000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'v_res_fa_tincorn', 
            pos = vec3(-0.01, -0.01, 0.01), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['mre_chknking'] = { 
        label = 'MRE - Chicken-a-la-king',
        weight = 1250,
        stack = true,
        close = true,
        description = "Meal-ready-to-eat",
        client = {
            status = { hunger = 250000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'v_res_fa_tincorn', 
            pos = vec3(-0.01, -0.01, 0.01), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    -- Supp. food
    ['mre_tmsoup'] = { 
        label = 'MRE Tom. soup',
        weight = 1250,
        stack = true,
        close = true,
        description = "Standard military side soup",
        client = {
            status = { hunger = 250000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'v_res_fa_tintomsoup', 
            pos = vec3(-0.01, -0.01, 0.01), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['mre_corn'] = { 
        label = 'MRE Canned Corn',
        weight = 1250,
        stack = true,
        close = true,
        description = "Standard military side dish",
        client = {
            status = { hunger = 250000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'v_res_fa_tincorn', 
            pos = vec3(-0.01, -0.01, 0.01), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['mre_bread'] = { 
        label = 'MRE Bread',
        weight = 1250,
        stack = true,
        close = true,
        description = "Standard military bread",
        client = {
            status = { hunger = 250000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'v_res_fa_bread03', 
            bone = 18905,
            pos = vec3(0.14, 0.03, 0.01), 
            rot = vec3(85.0, 70.0, -203.0) },
            usetime = 7500,
        },
    },
    








    ----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------- 
    -- TICKETS: mba events
    ['mbaticket_lux'] = { 
        label = 'MBA Ticket: Luxury',
        weight = 500,
        stack = false,
        degrade = 2,
        consume = 1,
        description = "VIP lounge with a kitchen and bar",
    },

    ['mbaticket_dlx'] = { 
        label = 'MBA Ticket: Delux',
        weight = 500,
        stack = false,
        degrade = 2,
        consume = 1,
        description = "Sit in the upper area for a better view",
    },

    ['mbaticket_std'] = { 
        label = 'MBA Ticket: Standard',
        weight = 500,
        stack = false,
        degrade = 2,
        consume = 1,
        description = "Standard seating close to the arena",
        
    },

    







    ----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------- 
    -- TICKETS: fleeca heist update
    ['bag_blackmoney'] = { 
        label = 'MBA Ticket: Luxury',
        weight = 500,
        stack = false,
        degrade = 2,
        consume = 1,
        description = "VIP lounge with a kitchen and bar",
    },

    ['drill_thermal'] = { 
        label = 'MBA Ticket: Delux',
        weight = 500,
        stack = false,
        degrade = 2,
        consume = 1,
        description = "Sit in the upper area for a better view",
    },

    ['hack_tablet'] = { 
        label = 'MBA Ticket: Standard',
        weight = 500,
        stack = false,
        degrade = 2,
        consume = 1,
        description = "Standard seating close to the arena", 
    },

    ['scard_fleeca'] = { 
        label = 'MBA Ticket: Luxury',
        weight = 500,
        stack = false,
        degrade = 2,
        consume = 1,
        description = "VIP lounge with a kitchen and bar",
    },

    ['cig_69brand'] = { 
        label = 'MBA Ticket: Delux',
        weight = 500,
        stack = false,
        degrade = 2,
        consume = 1,
        description = "Sit in the upper area for a better view",
    },

    ['cig_redwood'] = { 
        label = 'MBA Ticket: Standard',
        weight = 500,
        stack = false,
        degrade = 2,
        consume = 1,
        description = "Standard seating close to the arena", 
    },

    ['cig_debonaire'] = { 
        label = 'MBA Ticket: Standard',
        weight = 500,
        stack = false,
        degrade = 2,
        consume = 1,
        description = "Standard seating close to the arena", 
    },

}

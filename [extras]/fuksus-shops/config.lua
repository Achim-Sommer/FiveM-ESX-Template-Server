Config = {}

Config.locale = 'de'

Config.marker = {
    type = 0,
    scale = {
        x = 1.0,
        y = 1.0,
        z = 1.0
    },
    color = {
        r = 100,
        g = 200,
        b = 50,
        a = 200
    },
    face = true
}

Config.shops = {
    General = {
        name = '24/7',
        description = 'Shop',
        blip = {
			id = 59, colour = 69, scale = 0.8
		},
        items = {
            { type = 'food', name = 'burger', description = 'Wow, hier gibt es einen Burger', price = 10 },
            { type = 'food', name = 'burger_chs', description = 'Mit Käse ist es besser!', price = 12 },
            { type = 'food', name = 'burger_chsbcn', description = 'Mit Käse und Bacon ist es noch noch besser!', price = 15 },
            { type = 'food', name = 'hotdog', description = 'Kein echter Hund, oder doch?', price = 10 },
            { type = 'food', name = 'noodles', description = 'Lecker Nudeln?', price = 10 },
            { type = 'food', name = 'fr_fries', description = 'Pommes lecker?', price = 10 },
            { type = 'food', name = 'sandwich', description = 'Ein Einfaches Sandwich', price = 10 },
            { type = 'food', name = 'pizza_pep', description = 'Pizza mit Peperoni', price = 20 },
            { type = 'food', name = 'pizza_chs', description = 'Pizza mit Käse', price = 20 },
            { type = 'food', name = 'pizza_msh', description = 'Pizza mit Pilzen', price = 20 },
            { type = 'food', name = 'pizza_mgt', description = 'Der Klassiker', price = 20 },
            { type = 'food', name = 'pizza_dmt', description = 'Pizza mit doppelt Salami', price = 25 },
            { type = 'food', name = 'apple', description = 'Ein Apfel', price = 5 },
            { type = 'food', name = 'banana', description = 'Eine Banane', price = 5 },
            { type = 'snaks', name = 'twix', description = 'Bock auf was Süßes?', price = 10 },
            { type = 'snaks', name = 'doritos', description = 'Bock auf was Süßes?', price = 10 },
            { type = 'snaks', name = 'donut_chc', description = 'So gut!', price = 10 },
            { type = 'snaks', name = 'donut_sby', description = 'So gut!', price = 10 },
            { type = 'ice', name = 'icecream_chr', description = 'Bock auf ein Eis?', price = 8 },
            { type = 'ice', name = 'icecream_chc', description = 'Bock auf ein Eis?', price = 8 },
            { type = 'ice', name = 'icecream_lmn', description = 'Bock auf ein Eis?', price = 8 },
            { type = 'ice', name = 'icecream_pso', description = 'Bock auf ein Eis?', price = 8 },
            { type = 'ice', name = 'icecream_rpy', description = 'Bock auf ein Eis?', price = 8 },
            { type = 'ice', name = 'icecream_ckd', description = 'Bock auf ein Eis?', price = 8 },
            { type = 'ice', name = 'icecream_sby', description = 'Bock auf ein Eis?', price = 8 },
            { type = 'ice', name = 'icecream_vna', description = 'Bock auf ein Eis?', price = 8 },
            { type = 'drink', name = 'water', description = 'Brauchst du etwas zu trinken?', price = 10 },
            { type = 'drink', name = 'milk', description = 'Für stärkere Knochen!', price = 10 },
            { type = 'drink', name = 'ejunk', description = 'Du brauchst es!', price = 10 },
            { type = 'drink', name = 'coffee', description = 'Müde?', price = 10 },
            { type = 'drink', name = 'cola', description = 'Eiskalt!', price = 20 },
            { type = 'drink', name = 'mustard', description = 'Stillt Hunger und Durst', price = 20 },
            { type = 'animale', name = 'petfood', description = 'Hat dein Tier Hunger?', price = 25 },
            { type = 'items', name = 'scratch_ticket', description = 'Versuch dein Glück', price = 250 },
            { type = 'items', name = 'medikit', description = 'Etwas Heilung?', price = 1000 },
            { type = 'items', name = 'cigarette', description = 'Wieder zuviel Stress?', price = 10 },
            { type = 'items', name = 'cigar', description = 'Heute mal etwaws mehr?', price = 100 },
            { type = 'tech', name = 'phone', description = 'Wer kann ohne?', price = 3000 },
            { type = 'tech', name = 'headlights', description = 'Wie wäre es mit etwas Farbe bei deinem Licht am Auto?', price = 550 },
            { type = 'tech', name = 'radio', description = 'Kann nützlich sein', price = 5000 },
            { type = 'tech', name = 'vape', description = 'Willst du weg von den Kippen?', price = 500 },
            { type = 'alc', name = 'beer', description = 'Einfaches Bier!', price = 45 },
            { type = 'alc', name = 'rancho_beer', description = 'Gutes Bier!', price = 50 },
            { type = 'alc', name = 'dusche_beer', description = 'Gutes Bier!', price = 50 },
            { type = 'alc', name = 'stronzo_beer', description = 'Gutes Bier!', price = 50 },
            { type = 'alc', name = 'patriot_beer', description = 'Gutes Bier!', price = 50 },
        },
        filters = {
            food = 'Essen',
            drink = 'Trinken',
            ice = 'Eis',
            snaks = 'Snaks',
            alc = 'Alkohol',
            animale = 'Tierbedarf',
            tech = 'Technik',
            items = 'Items'
        },
        locations = {
            vec3(25.7, -1347.3, 29.49),
			vec3(-3038.71, 585.9, 7.9),
			vec3(-3241.47, 1001.14, 12.83),
			vec3(1728.66, 6414.16, 35.03),
			vec3(1697.99, 4924.4, 42.06),
			vec3(1961.48, 3739.96, 32.34),
			vec3(547.79, 2671.79, 42.15),
			vec3(2679.25, 3280.12, 55.24),
			vec3(2557.94, 382.05, 108.62),
			vec3(373.55, 325.56, 103.56),
        }
    },
    Liquor = {
		name = "Rob's Liquor",
        description = 'Brauchst du Schnaps? ?',
		blip = {
			id = 93, colour = 69, scale = 0.8
		},
        items = {
            { type = 'food', name = 'burger', description = 'Wow, hier gibt es einen Burger', price = 10 },
            { type = 'food', name = 'burger_chs', description = 'Mit Käse ist es besser!', price = 12 },
            { type = 'food', name = 'burger_chsbcn', description = 'Mit Käse und Bacon ist es noch noch besser!', price = 15 },
            { type = 'food', name = 'hotdog', description = 'Kein echter Hund, oder doch?', price = 10 },
            { type = 'drink', name = 'water', description = 'Brauchst du etwas zu trinken?', price = 10 },
            { type = 'drink', name = 'cola', description = 'Eiskalt!', price = 20 },
            { type = 'drink', name = 'mustard', description = 'Stillt Hunger und Durst', price = 20 },
            { type = 'snaks', name = 'twix', description = 'Bock auf was Süßes?', price = 10 },
            { type = 'snaks', name = 'doritos', description = 'Bock auf was Süßes?', price = 10 },
            { type = 'snaks', name = 'donut_chc', description = 'So gut!', price = 10 },
            { type = 'snaks', name = 'donut_sby', description = 'So gut!', price = 10 },
            { type = 'items', name = 'scratch_ticket', description = 'Versuch dein Glück', price = 250 },
            { type = 'items', name = 'medikit', description = 'Etwas Heilung?', price = 1000 },
            { type = 'alc', name = 'beer', description = 'Naaaa?', price = 45 },
            { type = 'alc', name = 'rancho_beer', description = 'Gutes Bier!', price = 50 },
            { type = 'alc', name = 'dusche_beer', description = 'Gutes Bier!', price = 50 },
            { type = 'alc', name = 'stronzo_beer', description = 'Gutes Bier!', price = 50 },
            { type = 'alc', name = 'patriot_beer', description = 'Gutes Bier!', price = 50 },
        },
        filters = {
            food = 'Essen',
            drink = 'Trinken',
            snaks = 'Snaks',
            alc = 'Alkohol',
            items = 'Items'
        },
        locations = {
			vec3(1135.808, -982.281, 46.415),
			vec3(-1222.915, -906.983, 12.326),
			vec3(-1487.553, -379.107, 40.163),
			vec3(-2968.243, 390.910, 15.043),
			vec3(1166.024, 2708.930, 38.157),
			vec3(1392.562, 3604.684, 34.980),
			vec3(-1393.409, -606.624, 30.319)
		}
	},
    YouTool = {
		name = 'YouTool',
        description = 'Alle deine Werkzeuge und Gadgets an einem Ort',
		blip = {
			id = 402, colour = 69, scale = 0.8
		}, 
        items = {
            { type = 'tool', name = 'lockpick', description = 'Das solltest du besser geheim halten', price = 10 },
            { type = 'tool', name = 'hose', description = 'Kann man immer gebrauchen', price = 10 },
            { type = 'tool', name = 'WEAPON_WRENCH', description = 'Kann nützlich werden', price = 200 },
            { type = 'tool', name = 'WEAPON_PETROLCAN', description = 'Falls der Tank leer geht', price = 150 },
            { type = 'tool', name = 'pickaxe', description = 'Wie wäre es mit etwas mining?', price = 250 },
            { type = 'tech', name = 'headlights', description = 'Wie wäre es mit etwas Farbe bei deinem Licht am Auto?', price = 550 },
            { type = 'tech', name = 'phone', description = 'Wer kann ohne?', price = 3000 },
            { type = 'tech', name = 'radio', description = 'Kann nützlich sein', price = 5000 },
            { type = 'items', name = 'medikit', description = 'Etwas Heilung?', price = 1000 },
            { type = 'items', name = 'scratch_ticket', description = 'Versuch dein Glück', price = 250 },
            { type = 'tech', name = 'vape', description = 'Willst du weg von den Kippen?', price = 500 },
            { type = 'angel', name = 'fishingrod', description = 'Wie wäre es mit Angeln?', price = 250 },
            { type = 'angel', name = 'fishbait', description = 'Ohne Köder wird es schwer einen Fisch zu fangen!', price = 50 },
            { type = 'animale', name = 'petfood', description = 'Hat dein Tier Hunger?', price = 25 },
            { type = 'animale', name = 'WEAPON_BALL', description = 'Lust zu Spielen?', price = 35 },
        },
        filters = {
            tool = 'Tools',
            tech = 'Technik',
            animale = 'Tierbedarf',
            items = 'Items',
            angel = 'Angelausrüstung'
        },
        locations = {
			vec3(2748.0, 3473.0, 55.67),
			vec3(342.99, -1298.26, 32.51)
		}
	},
}
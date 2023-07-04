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
            { type = 'food', name = 'bread', description = 'Wow, hier gibt es einen Burger', price = 10 },
            { type = 'drink', name = 'water', description = 'Brauchst du etwas zu trinken?', price = 10 },
            { type = 'drink', name = 'coffee', description = 'Müde?', price = 10 },
            { type = 'drink', name = 'cola', description = 'Eiskalt!', price = 20 },
            { type = 'drink', name = 'mustard', description = 'Stillt Hunger und Durst', price = 20 },
            { type = 'food', name = 'twix', description = 'Bock auf was Süßes?', price = 10 },
            { type = 'food', name = 'doritos', description = 'Bock auf was Süßes?', price = 10 },
            { type = 'animale', name = 'petfood', description = 'Hat dein Tier Hunger?', price = 25 },
            { type = 'items', name = 'scratch_ticket', description = 'Versuch dein Glück', price = 250 },
            { type = 'items', name = 'medikit', description = 'Etwas Heilung?', price = 1000 },
            { type = 'tech', name = 'phone', description = 'Wer kann ohne?', price = 3000 },
            { type = 'tech', name = 'headlights', description = 'Wie wäre es mit etwas Farbe bei deinem Licht am Auto?', price = 550 },
            { type = 'tech', name = 'radio', description = 'Kann nützlich sein', price = 5000 },
            { type = 'alc', name = 'beer', description = 'Naaaa?', price = 45 },
        },
        filters = {
            food = 'Essen',
            drink = 'Trinken',
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
            { type = 'food', name = 'bread', description = 'Wow, hier gibt es einen Burger', price = 10 },
            { type = 'drink', name = 'water', description = 'Brauchst du etwas zu trinken?', price = 10 },
            { type = 'drink', name = 'cola', description = 'Eiskalt!', price = 20 },
            { type = 'drink', name = 'mustard', description = 'Stillt Hunger und Durst', price = 20 },
            { type = 'food', name = 'twix', description = 'Bock auf was Süßes?', price = 10 },
            { type = 'food', name = 'doritos', description = 'Bock auf was Süßes?', price = 10 },
            { type = 'items', name = 'scratch_ticket', description = 'Versuch dein Glück', price = 250 },
            { type = 'items', name = 'medikit', description = 'Etwas Heilung?', price = 1000 },
            { type = 'items', name = 'phone', description = 'Wer kann ohne?', price = 3000 },
            { type = 'alc', name = 'beer', description = 'Naaaa?', price = 45 },
        },
        filters = {
            food = 'Essen',
            drink = 'Trinken',
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
Config = {}

Config.categories = {
    {
        category='Allgemein',
        keys={
            {description='Hauptmenü', key='F1'},
            {description='Inventar', key='F2'},
		{description='Handy', key='F3'},
		{description='PersonalMenü', key='F5'},
		{description='Jobmenü', key='F6'},
		{description='AnimationsMenü', key='F7'},
		{description='Hud Einstellungen', key='F9'},
		{description='Scoreboard', key='F10'},
		{description='ReportMenü', key='F11'},
		{description='Extra HUD Infos', key='Einfg'},
		{description='Haustier Menü', key='Entf'},
        },
		commands={
            {description='Deine Spielzeit', command='/mytime', arguments=''},
            {description='Top List nach Spielzeit', command='/timelist', arguments=''},
        },
    },
    {
        category='Fahrzeug',
        keys={
            {description='Motor Einschalten/Ausschalten', key='M'},
			{description='Anschnallen/Abschnallen', key='B'},
			{description='Licht An/Aus', key='H'},
			{description='Tempomat', key='ALT Gr'},
			{description='Warnblinkanlage', key='BACKSPACE'},
			{description='Menster runter', key='Pfeiltaste nach unten'},
			{description='Menster hoch', key='Pfeiltaste nach oben'},
			{description='Waffe wählen', key='Ü'},
			
			{description='MKennzeichensuche (Polizei)', key='X'},
        },
        commands={
            {description='Anschnallen/Abschnallen', command='/seatbelt', arguments=''},
        },
    },
    {
        category='Hilfe',
        commands={
            {description='Öffnet dieses Menü', command='/keybinds', arguments=''},
            {description='Öffnet dieses Menü', command='/commands', arguments=''},
        },
    },
    -- {
    --     category='',
    --     keys={
    --         {description='', key=''},
    --     },
    --     commands={
    --         {description='', command='', arguments=''},
    --     },
    -- },
}
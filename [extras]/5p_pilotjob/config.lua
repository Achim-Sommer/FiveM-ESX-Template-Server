Config = {
    UsingOldESX = false, -- Set this to false if you use ESX Legacy

    StartJob = vec3(-941.0008, -2954.2141, 13.9451), -- The location where you start the job

    SpawnLocation = vec4(-969.9725, -3000.9375, 13.9451, 59.4218), -- The location where the plane will spawn when the job starts

    Destination = {
        vec3(1737.0720, 3288.6008, 41.1414),
        --vec3(1737.0720, 3288.6008, 41.1414),
        --vec3(1737.0720, 3288.6008, 41.1414),
    }, -- The destination of the routes, add more if you want (they are randomized)

    PlateLabel = 'PLANE', -- The plate label of the plane

    DefaultKey = 38, -- The default key to open the UI

    PlaneModel = { -- The model of the plane
        passengers = 'nimbus',
        products = 'dodo',
    },

    JobBlips = { -- Edit or change the indication blips settings
        sprite = 1,
        color = 5,
        scale = 0.8,
    },

    MainBlip = { -- Edit or change the main blip settings
        sprite = 307,
        color = 0,
        scale = 0.8,
        label = 'Pilot Job',
    },

    Money = {
        passengers = math.random(1000, 4000), -- The money you get for passengers flight
        products = math.random(2000, 6000), -- The money you get for products flight
    },
    
    UseJob = false, -- Decide if using a job or not (if disabled all players will be able to work as a pilot)
    
    JobName = 'pilot' -- Only affected if UseJob is set to true
}

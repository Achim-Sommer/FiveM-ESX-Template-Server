-------------------------------------------------------------------- CREATE PEDS -------------------------------------------------------------------
--PEDS--
--http://ragepluginhook.net/PedModels.aspx--

-- Some Shop & Interior NPCs
Citizen.CreateThread(function()
    RequestModel(GetHashKey("a_m_y_business_03"))
	
    while not HasModelLoaded(GetHashKey("a_m_y_business_03")) do
        Wait(1)
    end
	
	if Config.EnableShops then
		for _, item in pairs(Config.Locations1) do
			local npc = CreatePed(4, 0xA1435105, item.x, item.y, item.z, item.heading, false, true)
			
			SetEntityHeading(npc, item.heading)
			FreezeEntityPosition(npc, true)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
		end
	end
end)

-----------------------------------------------------------------NIGHTCLUB---------------------------------------------------------------------------
-- Nightclub Girls1
Citizen.CreateThread(function()
    RequestModel(GetHashKey("a_f_y_juggalo_01"))
	
    while not HasModelLoaded(GetHashKey("a_f_y_juggalo_01")) do
        Wait(1)
    end
	
	if Config.EnableNightclubs then
		for _, item in pairs(Config.Locations2) do
			local npc = CreatePed(4, 0xdb134533, item.x, item.y, item.z, item.heading, false, true)
			
			FreezeEntityPosition(npc, true)	
			SetEntityHeading(npc, item.heading)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			RequestAnimDict("mini@strip_club@idles@stripper")
			while not HasAnimDictLoaded("mini@strip_club@idles@stripper") do
			Citizen.Wait(1000)
			end
				
	        Citizen.Wait(200)	
			TaskPlayAnim(npc,"mini@strip_club@idles@stripper","stripper_idle_01",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
			--TaskPlayAnim(ped, animDictionary, animationName, speed, speedMultiplier, duration, flag, playbackRate, lockX, lockY, lockZ)--
		end
	end
end)

-- Nightclub Girls Cheering
Citizen.CreateThread(function()
    RequestModel(GetHashKey("a_f_y_beach_01"))
	
    while not HasModelLoaded(GetHashKey("a_f_y_beach_01")) do
        Wait(1)
    end
	
	if Config.EnableNightclubs then
		for _, item in pairs(Config.Locations3) do
			local npc = CreatePed(4, 0xc79f6928, item.x, item.y, item.z, item.heading, false, true)
			
			FreezeEntityPosition(npc, true)	
			SetEntityHeading(npc, item.heading)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			RequestAnimDict("anim@amb@nightclub@peds@")
			while not HasAnimDictLoaded("anim@amb@nightclub@peds@") do
			Citizen.Wait(1000)
			end
				
	        Citizen.Wait(200)
			TaskPlayAnim(npc,"anim@amb@nightclub@peds@","amb_world_human_cheering_female_c",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
		end
	end
end)

-- Nightclub Girls Partying
Citizen.CreateThread(function()
    RequestModel(GetHashKey("a_f_y_bevhills_04"))
	
    while not HasModelLoaded(GetHashKey("a_f_y_bevhills_04")) do
        Wait(1)
    end
	
	if Config.EnableNightclubs then
		for _, item in pairs(Config.Locations4) do
			local npc = CreatePed(4, 0x36df2d5d, item.x, item.y, item.z, item.heading, false, true)
			
			FreezeEntityPosition(npc, true)	
			SetEntityHeading(npc, item.heading)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			RequestAnimDict("anim@amb@nightclub@peds@")
			while (not HasAnimDictLoaded("anim@amb@nightclub@peds@")) do			
			Citizen.Wait(1000)
			end
				
	        Citizen.Wait(200)
            TaskPlayAnim(npc,"anim@amb@nightclub@peds@","amb_world_human_partying_female_partying_beer_base",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)	
		end
	end
end)

-- Nightclub Girls Slow
Citizen.CreateThread(function()
    RequestModel(GetHashKey("a_f_y_genhot_01"))
	
    while not HasModelLoaded(GetHashKey("a_f_y_genhot_01")) do
        Wait(1)
    end
	
	if Config.EnableNightclubs then
		for _, item in pairs(Config.Locations5) do
			local npc = CreatePed(4, 0x2f4aec3e, item.x, item.y, item.z, item.heading, false, true)
			
			FreezeEntityPosition(npc, true)	
			SetEntityHeading(npc, item.heading)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			RequestAnimDict("anim@amb@nightclub@peds@")
			while not HasAnimDictLoaded("anim@amb@nightclub@peds@") do
			Citizen.Wait(1000)
			end
				
	        Citizen.Wait(200)
			TaskPlayAnim(npc,"anim@amb@nightclub@peds@","mini_strip_club_private_dance_idle_priv_dance_idle",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
		end
	end
end)

-- Nightclub Girls Tops
Citizen.CreateThread(function()
    RequestModel(GetHashKey("a_f_m_beach_01"))
	
    while not HasModelLoaded(GetHashKey("a_f_m_beach_01")) do
        Wait(1)
    end
	
	if Config.EnableNightclubs then
		for _, item in pairs(Config.Locations6) do
			local npc = CreatePed(4, 0x303638a7, item.x, item.y, item.z, item.heading, false, true)
			
			FreezeEntityPosition(npc, true)	
			SetEntityHeading(npc, item.heading)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			RequestAnimDict("anim@amb@nightclub@peds@")
			while not HasAnimDictLoaded("anim@amb@nightclub@peds@") do
			Citizen.Wait(1000)
			end
				
	        Citizen.Wait(200)
			TaskPlayAnim(npc,"anim@amb@nightclub@peds@","mini_strip_club_lap_dance_ld_girl_a_song_a_p1",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
		end
	end
end)

-- Nightclub Mens1
Citizen.CreateThread(function()
    RequestModel(GetHashKey("ig_claypain"))
	
    while not HasModelLoaded(GetHashKey("ig_claypain")) do
        Wait(1)
    end
	
	if Config.EnableNightclubs then
		for _, item in pairs(Config.Locations7) do
			local npc = CreatePed(4, 0x9d0087a8, item.x, item.y, item.z, item.heading, false, true)
			
			FreezeEntityPosition(npc, true)	
			SetEntityHeading(npc, item.heading)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			RequestAnimDict("anim@amb@nightclub@peds@")
			while not HasAnimDictLoaded("anim@amb@nightclub@peds@") do
			Citizen.Wait(1000)
			end
				
	        Citizen.Wait(200)	
			TaskPlayAnim(npc,"anim@amb@nightclub@peds@","amb_world_human_partying_male_partying_beer_base",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
		end
	end
end)

-- Nightclub Mens2
Citizen.CreateThread(function()
    RequestModel(GetHashKey("ig_ramp_mex"))
	
    while not HasModelLoaded(GetHashKey("ig_ramp_mex")) do
        Wait(1)
    end
	
	if Config.EnableNightclubs then
		for _, item in pairs(Config.Locations8) do
			local npc = CreatePed(4, 0xe6ac74a4, item.x, item.y, item.z, item.heading, false, true)
			
			FreezeEntityPosition(npc, true)	
			SetEntityHeading(npc, item.heading)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			RequestAnimDict("anim@amb@nightclub@peds@")
			while not HasAnimDictLoaded("anim@amb@nightclub@peds@") do
			Citizen.Wait(1000)
			end
				
	        Citizen.Wait(200)	
			TaskPlayAnim(npc,"anim@amb@nightclub@peds@","amb_world_human_drinking_beer_male_base",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
		end
	end
end)

-- Nightclub Mens3
Citizen.CreateThread(function()
    RequestModel(GetHashKey("u_m_y_babyd"))
	
    while not HasModelLoaded(GetHashKey("u_m_y_babyd")) do
        Wait(1)
    end
	
	if Config.EnableNightclubs then
		for _, item in pairs(Config.Locations9) do
			local npc = CreatePed(4, 0xda116e7e, item.x, item.y, item.z, item.heading, false, true)
			
			FreezeEntityPosition(npc, true)	
			SetEntityHeading(npc, item.heading)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			RequestAnimDict("anim@amb@nightclub@peds@")
			while not HasAnimDictLoaded("anim@amb@nightclub@peds@") do
			Citizen.Wait(1000)
			end
				
	        Citizen.Wait(200)
			TaskPlayAnim(npc,"anim@amb@nightclub@peds@","amb_world_human_hang_out_street_male_c_base",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
		end
	end
end)

-- Nightclub Bartender
Citizen.CreateThread(function()
    RequestModel(GetHashKey("s_f_y_bartender_01"))
	
    while not HasModelLoaded(GetHashKey("s_f_y_bartender_01")) do
        Wait(1)
    end
	
	if Config.EnableNightclubs then
		for _, item in pairs(Config.Locations10) do
			local npc = CreatePed(4, 0x780c01bd, item.x, item.y, item.z, item.heading, false, true)
			
			FreezeEntityPosition(npc, true)	
			SetEntityHeading(npc, item.heading)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			SetPedCanPlayAmbientAnims(npc, true)
		end
	end
end)

-- Nightclub Guards
Citizen.CreateThread(function()
    RequestModel(GetHashKey("s_m_m_chemsec_01"))
	
    while not HasModelLoaded(GetHashKey("s_m_m_chemsec_01")) do
        Wait(1)
    end
	
	if Config.EnableNightclubs then
		for _, item in pairs(Config.Locations11) do
			local npc = CreatePed(4, 0x2EFEAFD5, item.x, item.y, item.z, item.heading, false, true)
			
			FreezeEntityPosition(npc, true)	
			SetEntityHeading(npc, item.heading)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			RequestAnimDict("anim@amb@nightclub@peds@")
			while not HasAnimDictLoaded("anim@amb@nightclub@peds@") do
			Citizen.Wait(1000)
			end
				
	        Citizen.Wait(200)
			TaskPlayAnim(npc,"anim@amb@nightclub@peds@","amb_world_human_stand_guard_male_base",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
		end
	end
end)

-- Nightclub Solomun
Citizen.CreateThread(function()
    RequestModel(GetHashKey("CSB_Sol"))
	
    while not HasModelLoaded(GetHashKey("CSB_Sol")) do
        Wait(1)
    end
	
	if Config.EnableSolomun then
		for _, item in pairs(Config.Locations12) do
			local npc = CreatePed(4, 0x4EF92B55, item.x, item.y, item.z, item.heading, false, true)
			
			FreezeEntityPosition(npc, true)	
			SetEntityHeading(npc, item.heading)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			RequestAnimDict("anim@amb@nightclub@djs@solomun@")
			while not HasAnimDictLoaded("anim@amb@nightclub@djs@solomun@") do
			Citizen.Wait(1000)
			end
				
	        Citizen.Wait(200)
			TaskPlayAnim(npc,"anim@amb@nightclub@djs@solomun@","sol_dance_a_sol",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
		end
	end
end)

-- Nightclub Dixon
Citizen.CreateThread(function()
    RequestModel(GetHashKey("CSB_Dix"))
	
    while not HasModelLoaded(GetHashKey("CSB_Dix")) do
        Wait(1)
    end
	
	if Config.EnableDixon then
		for _, item in pairs(Config.Locations13) do
			local npc = CreatePed(4, 0xEBE02D05, item.x, item.y, item.z, item.heading, false, true)
			
			FreezeEntityPosition(npc, true)	
			SetEntityHeading(npc, item.heading)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			RequestAnimDict("anim@amb@nightclub@djs@solomun@")
			while not HasAnimDictLoaded("anim@amb@nightclub@djs@solomun@") do
			Citizen.Wait(1000)
			end
				
	        Citizen.Wait(200)	
			TaskPlayAnim(npc,"anim@amb@nightclub@djs@solomun@","sol_dance_a_sol",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
		end
	end
end)

-----------------------------------------------------------------NIGHTCLUBEND------------------------------------------------------------------------

-- Biker Guards2 (Druglabors & Points, Biker DLC)
Citizen.CreateThread(function()
    RequestModel(GetHashKey("s_m_m_chemsec_01"))
	
    while not HasModelLoaded(GetHashKey("s_m_m_chemsec_01")) do
        Wait(1)
    end
	
	if Config.EnableDrugs then
		for _, item in pairs(Config.Locations14) do
			local npc = CreatePed(4, 0x2EFEAFD5, item.x, item.y, item.z, item.heading, false, true)
			
			FreezeEntityPosition(npc, true)	
			SetEntityHeading(npc, item.heading)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			RequestAnimDict("anim@amb@nightclub@peds@")
			while not HasAnimDictLoaded("anim@amb@nightclub@peds@") do
			Citizen.Wait(1000)
			end
				
	        Citizen.Wait(200)	
			TaskPlayAnim(npc,"anim@amb@nightclub@peds@","amb_world_human_stand_guard_male_base",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
		end
	end
end)

-- Biker NPC1 MethCook
Citizen.CreateThread(function()
    RequestModel(GetHashKey("g_m_m_chemwork_01"))
	
    while not HasModelLoaded(GetHashKey("g_m_m_chemwork_01")) do
        Wait(1)
    end
	
	if Config.EnableDrugs then
		for _, item in pairs(Config.Locations15) do
			local npc = CreatePed(4, 0xf6157d8f, item.x, item.y, item.z, item.heading, false, true)
			
			FreezeEntityPosition(npc, true)	
			SetEntityHeading(npc, item.heading)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			RequestAnimDict("anim@amb@business@meth@meth_monitoring_cooking@cooking@")
			while not HasAnimDictLoaded("anim@amb@business@meth@meth_monitoring_cooking@cooking@") do
			Citizen.Wait(1000)
			end
				
	        Citizen.Wait(200)
			TaskPlayAnim(npc,"anim@amb@business@meth@meth_monitoring_cooking@cooking@","look_around_v8_cooker",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
		end
	end
end)

-- Biker NPC2 Meth Worker
Citizen.CreateThread(function()
    RequestModel(GetHashKey("g_m_m_chemwork_01"))
	
    while not HasModelLoaded(GetHashKey("g_m_m_chemwork_01")) do
        Wait(1)
    end
	
	if Config.EnableDrugs then
		for _, item in pairs(Config.Locations16) do
			local npc = CreatePed(4, 0xf6157d8f, item.x, item.y, item.z, item.heading, false, true)
			
			FreezeEntityPosition(npc, true)	
			SetEntityHeading(npc, item.heading)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			RequestAnimDict("anim@amb@business@meth@meth_monitoring_cooking@monitoring@")
			while not HasAnimDictLoaded("anim@amb@business@meth@meth_monitoring_cooking@monitoring@") do
			Citizen.Wait(1000)
			end
				
	        Citizen.Wait(200)
			TaskPlayAnim(npc,"anim@amb@business@meth@meth_monitoring_cooking@monitoring@","check_guages_monitor",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
		end
	end
end)

-- Biker NPC3 Coca & Opium Worker
Citizen.CreateThread(function()
    RequestModel(GetHashKey("g_m_m_chemwork_01"))
	
    while not HasModelLoaded(GetHashKey("g_m_m_chemwork_01")) do
        Wait(1)
    end
	
	if Config.EnableDrugs then
		for _, item in pairs(Config.Locations17) do
			local npc = CreatePed(4, 0xf6157d8f, item.x, item.y, item.z, item.heading, false, true)
			
			FreezeEntityPosition(npc, true)	
			SetEntityHeading(npc, item.heading)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			RequestAnimDict("anim@amb@business@meth@meth_monitoring_cooking@monitoring@")
			while not HasAnimDictLoaded("anim@amb@business@meth@meth_monitoring_cooking@monitoring@") do
			Citizen.Wait(1000)
			end
				
	        Citizen.Wait(200)	
			TaskPlayAnim(npc,"anim@amb@business@meth@meth_monitoring_cooking@monitoring@","check_guages_v1_monitor",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
		end
	end
end)

-- Biker NPC4 Weed Worker
Citizen.CreateThread(function()
    RequestModel(GetHashKey("a_m_m_farmer_01"))
	
    while not HasModelLoaded(GetHashKey("a_m_m_farmer_01")) do
        Wait(1)
    end
	
	if Config.EnableDrugs then
		for _, item in pairs(Config.Locations18) do
			local npc = CreatePed(4, 0x94562dd7, item.x, item.y, item.z, item.heading, false, true)
			
			FreezeEntityPosition(npc, true)	
			SetEntityHeading(npc, item.heading)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			RequestAnimDict("anim@amb@business@weed@weed_inspecting_lo_med_hi@")
			while not HasAnimDictLoaded("anim@amb@business@weed@weed_inspecting_lo_med_hi@") do
			Citizen.Wait(1000)
			end
				
	        Citizen.Wait(200)
			TaskPlayAnim(npc,"anim@amb@business@weed@weed_inspecting_lo_med_hi@","weed_stand_checkingleaves_kneeling_01_inspector",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
		end
	end
end)

-- Cops Men LSPD1
Citizen.CreateThread(function()
    RequestModel(GetHashKey("s_m_y_cop_01"))
	
    while not HasModelLoaded(GetHashKey("s_m_y_cop_01")) do
        Wait(1)
    end
	
	if Config.EnableCops then
		for _, item in pairs(Config.Locations19) do
			local npc = CreatePed(4, 0x5e3da4a4, item.x, item.y, item.z, item.heading, false, true)
			
			FreezeEntityPosition(npc, true)	
			SetEntityHeading(npc, item.heading)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			RequestAnimDict("anim@heists@prison_heiststation@cop_reactions")
			while not HasAnimDictLoaded("anim@heists@prison_heiststation@cop_reactions") do
			Citizen.Wait(1000)
			end
				
	        Citizen.Wait(200)	
			TaskPlayAnim(npc,"anim@heists@prison_heiststation@cop_reactions","cop_a_idle",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
		end
	end
end)

-- Cops Men LSPD2
Citizen.CreateThread(function()
    RequestModel(GetHashKey("s_m_y_cop_01"))
	
    while not HasModelLoaded(GetHashKey("s_m_y_cop_01")) do
        Wait(1)
    end
	
	if Config.EnableCops then
		for _, item in pairs(Config.Locations20) do
			local npc = CreatePed(4, 0x5e3da4a4, item.x, item.y, item.z, item.heading, false, true)
			
			FreezeEntityPosition(npc, true)	
			SetEntityHeading(npc, item.heading)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			RequestAnimDict("anim@heists@prison_heiststation@cop_reactions")
			while not HasAnimDictLoaded("anim@heists@prison_heiststation@cop_reactions") do
			Citizen.Wait(1000)
			end
				
	        Citizen.Wait(200)	
			TaskPlayAnim(npc,"anim@heists@prison_heiststation@cop_reactions","cop_b_reaction",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
		end
	end
end)

-- Cops Girl LSPD3
Citizen.CreateThread(function()
    RequestModel(GetHashKey("s_f_y_cop_01"))
	
    while not HasModelLoaded(GetHashKey("s_f_y_cop_01")) do
        Wait(1)
    end
	
	if Config.EnableCops then
		for _, item in pairs(Config.Locations21) do
			local npc = CreatePed(4, 0x15f8700d, item.x, item.y, item.z, item.heading, false, true)
			
			FreezeEntityPosition(npc, true)	
			SetEntityHeading(npc, item.heading)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			RequestAnimDict("amb@world_human_cop_idles@female@idle_b")
			while not HasAnimDictLoaded("amb@world_human_cop_idles@female@idle_b") do
			Citizen.Wait(1000)
			end
				
	        Citizen.Wait(200)
			TaskPlayAnim(npc,"amb@world_human_cop_idles@female@idle_b","idle_d",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)	
		end
	end
end)
 
-- Cops Guard LSPD3 Weapons
Citizen.CreateThread(function()
    RequestModel(GetHashKey("u_m_m_jewelsec_01"))
	
    while not HasModelLoaded(GetHashKey("u_m_m_jewelsec_01")) do
        Wait(1)
    end
	
	if Config.EnableCops or Config.EnableWeapons then
		for _, item in pairs(Config.Locations22) do
			local npc = CreatePed(4, 0xacccbdb6, item.x, item.y, item.z, false, false)
			
			FreezeEntityPosition(npc, true)	
			SetEntityHeading(npc, item.heading)
			SetEntityInvincible(npc, false) --NPC can die (set "true" to change)
			SetBlockingOfNonTemporaryEvents(npc, false)
			RequestAnimDict("anim@amb@nightclub@peds@")
			while not HasAnimDictLoaded("anim@amb@nightclub@peds@") do
			Citizen.Wait(1000)
			end
				
	        Citizen.Wait(200)	
			TaskPlayAnim(npc,"anim@amb@nightclub@peds@","amb_world_human_stand_guard_male_base",1.0, 1.0, -1, 1, 1.0, 0, 0, 0)
			GiveWeaponToPed(npc, GetHashKey("WEAPON_BOTTLE"), 1, false, true)
            GiveWeaponToPed(npc, GetHashKey("WEAPON_PISTOL"), math.random(20, 100), true, false)
            SetPedAmmo(npc, GetHashKey("WEAPON_PISTOL"), math.random(20, 100))
            SetCurrentPedWeapon(npc, GetHashKey("WEAPON_PISTOL"), true)
		end
	end
end)

local inCasino              = false
local videoWallRenderTarget = nil
local showBigWin            = false
--
-- Threads
--



function startCasinoThreads()
    RequestStreamedTextureDict('Prop_Screen_Vinewood')

    while not HasStreamedTextureDictLoaded('Prop_Screen_Vinewood') do
        Citizen.Wait(100)
    end

    RegisterNamedRendertarget('casinoscreen_01')

    LinkNamedRendertarget(`vw_vwint01_video_overlay`)

    videoWallRenderTarget = GetNamedRendertargetRenderId('casinoscreen_01')

    Citizen.CreateThread(function()
        local lastUpdatedTvChannel = 0

        while true do
            Citizen.Wait(0)

            if not inCasino then
                ReleaseNamedRendertarget('casinoscreen_01')

                videoWallRenderTarget = nil
                showBigWin            = false

                break
            end

            if videoWallRenderTarget then
                local currentTime = GetGameTimer()

                if showBigWin then
                    setVideoWallTvChannelWin()

                    lastUpdatedTvChannel = GetGameTimer() - 33666
                    showBigWin           = false
                else
                    if (currentTime - lastUpdatedTvChannel) >= 42666 then
                        setVideoWallTvChannel()

                        lastUpdatedTvChannel = currentTime
                    end
                end

                SetTextRenderId(videoWallRenderTarget)
                SetScriptGfxDrawOrder(4)
                SetScriptGfxDrawBehindPausemenu(true)
                DrawInteractiveSprite('Prop_Screen_Vinewood', 'BG_Wall_Colour_4x4', 0.25, 0.5, 0.5, 1.0, 0.0, 255, 255, 255, 255)
                DrawTvChannel(0.5, 0.5, 1.0, 1.0, 0.0, 255, 255, 255, 255)
                SetTextRenderId(GetDefaultScriptRendertargetRenderId())
            end
        end
    end)
end

--
-- Functions
--

function setVideoWallTvChannel()
    SetTvChannelPlaylist(0, Config.VideoType, true)
    SetTvAudioFrontend(true)
    SetTvVolume(-100.0)
    SetTvChannel(0)
end

function setVideoWallTvChannelWin()
    SetTvChannelPlaylist(0, 'CASINO_WIN_PL', true)
    SetTvAudioFrontend(true)
    SetTvVolume(-100.0)
    SetTvChannel(-1)
    SetTvChannel(0)
end

--
-- Events
--

AddEventHandler(Config.EnterEvent, function()
    inCasino = true

    startCasinoThreads()
end)

AddEventHandler(Config.ExitEvent, function()
    inCasino = false
end)

AddEventHandler(Config.BigWinEvent, function()
    if not inCasino then
        return
    end

    showBigWin = true
end)

--RegisterCommand('ontest', function()
--    TriggerEvent(Config.EnterEvent)
--end)

--RegisterCommand('offtest', function()
--    TriggerEvent(Config.ExitEvent)
--end)

RegisterCommand('wintest', function()
    TriggerEvent(Config.BigWinEvent)
end)

CreateThread(function()
    local casinoCoords = vector3(945.85, 41.58, 75.82)
    while true do
        local pCoords = GetEntityCoords(PlayerPedId())
        if #(pCoords - casinoCoords) < 100.0 then
            if not inCasino then
                TriggerEvent(Config.EnterEvent)
                print("Entered Casino area")
                InCasino = true
            end
        else
            if inCasino then
                TriggerEvent(Config.ExitEvent)
                print("Exited Casino area")
                InCasino = false
                Wait(5000)
                startCasinoThreads()
            end
        end
        Wait(1000)
    end
end)
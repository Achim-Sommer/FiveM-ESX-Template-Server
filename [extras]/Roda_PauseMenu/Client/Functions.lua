function CreationCamHead()
	cam = CreateCam('DEFAULT_SCRIPTED_CAMERA')
	local coordsCam = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.0, 0.65)
	local coordsPly = GetEntityCoords(PlayerPedId())
	SetCamCoord(cam, coordsCam)
	PointCamAtCoord(cam, coordsPly['x'], coordsPly['y'], coordsPly['z']+0.65)
	SetCamActive(cam, true)
	RenderScriptCams(true, true, 500, true, true)
end

function DestroyCamera()
    RenderScriptCams(false, false, 0, 1, 0)
    DestroyCam(cam, false)
end
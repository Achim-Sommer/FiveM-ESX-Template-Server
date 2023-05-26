ESX.RegisterServerCallback("Roda_PauseMenu:Getserverdata", function(src, cb)
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end
    local MaxPlayers = GetConvarInt('sv_maxclients', 32)
    local TotalPlayers = GetNumPlayerIndices()
    cb(xPlayer.job,xPlayer.getMoney(), xPlayer.getAccount('black_money').money, xPlayer.getAccount('bank').money, MaxPlayers, TotalPlayers)
end)

ESX.RegisterServerCallback("Roda_PauseMenu:GetOnlineJobs", function(src, cb)
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end
    local jobs = {}
    for k,v in pairs(Config.JobsToShow) do
        table.insert(jobs, {
            count = #ESX.GetExtendedPlayers('job', v.job),
            label = v.icon
        })
    end
    table.sort(jobs, function(a, b)    return a.count > b.count end)
    cb(jobs)
end)
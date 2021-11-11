ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.TriggerServerCallback('esx_pedcommand:getData', function(data)
    
        --print(data.ped)
        Citizen.Wait(5700)
        local modelHash = tostring(data.ped)
        print(modelHash)

                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
                    ESX.Streaming.RequestModel(modelHash, function()
                    SetPlayerModel(PlayerId(), modelHash)
                    SetModelAsNoLongerNeeded(modelHash)
                    TriggerEvent('esx:restoreLoadout')
                    end)
                end)
    end, GetPlayerServerId(PlayerId()))
end)

RegisterNetEvent( 'npcvaihto' )
AddEventHandler( 'npcvaihto', function(args, user)
    local modelHash = tostring(args[1])
    print('alku')
	ESX.TriggerServerCallback('esx_pedcommand:getData', function(data)
        print(tostring(group))
        print(tostring(PlayerData.permission_leve))
        if tostring(data.ped) == modelHash or user.permission_level == 10 then
                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
                    ESX.Streaming.RequestModel(modelHash, function()
                    SetPlayerModel(PlayerId(), modelHash)
                    SetModelAsNoLongerNeeded(modelHash)
                    TriggerEvent('esx:restoreLoadout')
                    end)
                end)
                print(tostring(PlayerId()))
    end
    end, GetPlayerServerId(PlayerId()))
end)
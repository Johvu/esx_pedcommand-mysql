Command that lets you change you ped in Fivem

Ped lists:

https://docs.fivem.net/docs/game-references/ped-models/#gang-male

https://wiki.rage.mp/index.php?title=Peds

broken peds:

https://forum.cfx.re/t/info-invisible-or-glitched-peds-list/40748


if you want to disable auto load just remove code under 

	

	RegisterNetEvent('esx:playerLoaded')
	AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.TriggerServerCallback('esx_pedcommand:getData', function(data)
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




ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('es:addCommand', 'chanceped', function(source, args, user)

	TriggerClientEvent('npcvaihto', source, args, user, {})

end, {help = "/chanceped ped"})

ESX.RegisterServerCallback('esx_pedcommand:getData', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
    local result = MySQL.Sync.fetchAll('SELECT ped FROM peds WHERE identifier = @identifier', {
        ['@identifier'] = xPlayer.identifier
    })


    local ped = result[1].ped

    local data = {
        ped = ped
    }

    cb(data)
end)
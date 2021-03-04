ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('ali-npcdoctor:money')
AddEventHandler('ali-npcdoctor:money', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.removeMoney(Config.doctorPrice)
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = '$'.. Config.doctorPrice ..' karşılığında yerli doktora tedavi oldun'})

end)
RegisterServerEvent('ali-plasticsurgery:skin')
AddEventHandler('ali-plasticsurgery:skin', function()
    
    TriggerClientEvent('esx_skin:openSaveableMenu', source)
end)
ESX.RegisterServerCallback('ali-npcdoctor:parakontrol', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	cb(xPlayer.getMoney() >= Config.doctorPrice)
end)


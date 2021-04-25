ESX               = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent("hell_cherryfarmer:sell")
AddEventHandler("hell_cherryfarmer:sell", function()
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local money = 1000
                xPlayer.addMoney(money)
                TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'success', text = 'You got 1000$', length = 2500, style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
        end)
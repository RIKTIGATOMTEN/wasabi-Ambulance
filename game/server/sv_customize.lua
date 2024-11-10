-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
if not wsb then return print((Strings.no_wsb):format(GetCurrentResourceName())) end
ESX, QBCore = nil, nil
if wsb.framework == 'esx' then ESX = exports['es_extended']:getSharedObject() end -- Custom ESX Export?
if wsb.framework == 'qb' then QBCore = exports['qb-core']:GetCoreObject() end     -- Custom QBCore Export?



function MuteDeadPlayer(src, isDead)
    local bool = false
    if isDead then bool = true end
    MumbleSetPlayerMuted(src, bool)
end

-- Function to calculate the cost including insurance discount and charge the player
function ChargePlayer(src, account, cost, PayHospital)
    local newCost = cost
    if Config.mInsurance and Config.mInsurance.enabled then
        local column = wsb.framework == 'qb' and 'citizenid' or 'char_id'
        local hasInsurance = MySQL.single.await(
            'SELECT `' .. column .. '` FROM `m_insurance_health` WHERE `' .. column .. '` = ? LIMIT 1',
            { wsb.getIdentifier(src) }
        )
        if hasInsurance then
            newCost = newCost - Config.mInsurance.checkInDiscount
        end
    end

    local funds = wsb.getPlayerAccountFunds(src, account)
    if Config.ChargeForRevive and Config.ChargeForRevive.enabled and Config.ChargeForRevive.allowNegativeBalance and wsb.framework == 'qb' then
        wsb.removeMoney(src, account, newCost)
        if PayHospital then
            local management = Config.OldQBManagement and 'qb-management' or 'qb-banking'
            exports[management]:AddMoney(PayHospital, newCost)
        end
        return true --Force revive_patient
    elseif funds < newCost then
        TriggerClientEvent('wasabi_bridge:notify', src, Strings.not_enough_funds, Strings.not_enough_funds_desc, 'error')
        return false -- insufficient funds
    else
        wsb.removeMoney(src, account, newCost)
        if PayHospital then
            if wsb.framework == 'qb' then
                local management = Config.OldQBManagement and 'qb-management' or 'qb-banking'
                exports[management]:AddMoney(PayHospital, newCost)
            else --wsb.framework == 'esx'
                TriggerEvent('esx_addonaccount:getSharedAccount', PayHospital, function(account)
                    account.addMoney(newCost)
                end)
            end
        end
        return true
    end
end

RegisterNetEvent('wasabi_ambulance:qbBill', function(target, amount, job)
    local src = source
    if not wsb.hasGroup(src, Config.ambulanceJobs or Config.ambulanceJob) then return end
    wsb.removeMoney(target, 'bank', amount)
    TriggerClientEvent('wasabi_bridge:notify', src, Strings.fine_sent, (Strings.fine_sent_desc):format(addCommas(amount)),
        'success')
    TriggerClientEvent('wasabi_bridge:notify', target, Strings.fine_received,
        (Strings.fine_received_desc):format(addCommas(amount)), 'error')
    local qbManagement = Config.OldQBManagement and 'qb-management' or 'qb-banking'
    exports[qbManagement]:AddMoney(job, amount)
end)

if wsb.framework == 'esx' then
    if not Config.ambulanceJob and type(Config.ambulanceJobs) == 'table' then
        for i = 1, #Config.ambulanceJobs do
            local ambulanceJob = Config.ambulanceJobs[i]
            TriggerEvent('esx_society:registerSociety', ambulanceJob, ambulanceJob, 'society_' .. ambulanceJob,
                'society_' .. ambulanceJob, 'society_' .. ambulanceJob, { type = 'public' })
        end
        goto continue
    end
    TriggerEvent('esx_society:registerSociety', Config.ambulanceJob, Config.ambulanceJob, 'society_' ..
        Config.ambulanceJob, 'society_' .. Config.ambulanceJob, 'society_' .. Config.ambulanceJob, { type = 'public' })
    ::continue::
    ESX.RegisterServerCallback('esx_ambulancejob:getDeathStatus', function(source, cb)
        if deadPlayers[source] then
            cb(true)
        else
            cb(false)
        end
    end)
    ESX.RegisterServerCallback('wasabi_ambulance:tryRevive', function(source, cb, cost, max, account)
        local players = GetPlayers()
        local ems = 0
        for i = 1, #players, 1 do
            local player = tonumber(players[i])
            if wsb.hasGroup(player, Config.ambulanceJobs or Config.ambulanceJob) then
                ems = ems + 1
            end
        end
        if max then
            if ems > max then
                cb('max')
            end
        end
        if cost then
            local funds = wsb.getPlayerAccountFunds(source, account)
            if funds < cost then
                cb(false)
            else
                wsb.removeMoney(source, account, cost)
                TriggerClientEvent('wasabi_ambulance:revive', source)
                cb('success')
            end
        else
            TriggerClientEvent('wasabi_ambulance:revive', source)
            cb('success')
        end
    end)
end


RegisterNetEvent('wasabi_ambulance:removeItemsOnDeath', function()
    local identifier = wsb.getIdentifier(source)
    if not player then return end
    if not wsb.inventorySystem then
        if GetResourceState('mf-inventory') == 'started' then
            exports['mf-inventory']:clearInventory(identifier)
            exports['mf-inventory']:clearLoadout(identifier)        
        else
            print('NO INVENTORY FOUND CONFIG YOUR INV IN SV_CUSTOMIZE.LUA')      
        end
    else 
        wsb.inventory.clearInventory(source, identifier, Config.keepItemsOnDeath.enabled and Config.keepItemsOnDeath.items or {})
    end
end)

RegisterNetEvent('wasabi_ambulance:resetThirstHunger', function()
    local src = source
    if wsb.framework ~= 'qb' then return end
    local player = wsb.getPlayer(src)

    player.Functions.SetMetaData('hunger', 100)
    player.Functions.SetMetaData('thirst', 100)

    TriggerClientEvent('hud:client:UpdateNeeds', src, 100, 100)
end)

RegisterNetEvent('wasabi_ambulance:punishPlayer', function(reason)
    local src = source
    wsb.kickPlayer(src,
        string.format(
            'You got kicked!\n\nAuthor: %s\nReason: %s\n\nYou think this punishment was not fair?\nContact our support at discord.gg/',
            GetCurrentResourceName(), reason))

    --[[
        EASYADMIN EXAMPLE
        TriggerEvent('EasyAdmin:addBan', source, reason, 31556926, GetCurrentResourceName())
    --]]
end)


if Config.CompleteDeath.enabled and wsb.framework == 'esx' then
    resetDeathCount = function(xPlayer)
        MySQL.query('UPDATE characters SET deaths = @deaths, disabled = @disabled WHERE identifier = @identifier', {
            ['@identifier'] = xPlayer.characterId,
            ['@deaths'] = 0,
            ['@disabled'] = 0
        }, function(result)
        end)
    end

    viewDeathCount = function(xPlayer)
        MySQL.query('SELECT deaths FROM characters WHERE identifier = @identifier', {
            ['@identifier'] = xPlayer.characterId
        }, function(result)
            local deathCount = result[1].deaths

            TriggerClientEvent('wasabi_bridge:notify', xPlayer.source, 'DEATHCOUNT',
                string.format('Your current deathcount: %s', deathCount), 'inform', 'ban')
        end)
    end

    RegisterNetEvent('wasabi_ambulance:deathCount', function(prot)
        local src = source
        local xPlayer = wsb.getPlayer(src)

        if prot then
            TriggerEvent('wasabi_ambulance:punishPlayer', xPlayer.source, 'wasabi_ambulance:deathCount triggered')
            return
        end

        MySQL.query('SELECT deaths FROM characters WHERE identifier = @identifier', {
            ['@identifier'] = xPlayer.characterId
        }, function(result)
            local deathCount = result[1].deaths + 1
            local disable = 0 -- 0 = false / 1 = true

            if deathCount >= Config.CompleteDeath.maxDeaths then
                disable = 1
            end

            MySQL.query('UPDATE characters SET deaths = @deaths, disabled = @disabled WHERE identifier = @identifier', {
                ['@identifier'] = xPlayer.characterId,
                ['@deaths'] = deathCount,
                ['@disabled'] = disable
            }, function(result)
                if disable == 1 then
                    xPlayer.kick(string.format(
                        'You got kicked!\n\nAuthor: %s\nReason: You reached the max deathcount\nDeathcount: %s/%s\n\nYour character is now disabled.',
                        GetCurrentResourceName(), deathCount, Config.CompleteDeath.maxDeaths))
                end
            end)
        end)
    end)

    ESX.RegisterCommand('viewdeathcount', 'user', function(xPlayer, args, showError)
        viewDeathCount(xPlayer)
    end, false, { help = Strings.viewdeathcount_command_help })

    ESX.RegisterCommand('resetdeathcount', 'admin', function(xPlayer, args, showError)
        resetDeathCount(args.playerId)
    end, true, {
        help = Strings.resetdeathcount_command_help,
        validate = true,
        arguments = {
            { name = 'playerId', help = Strings.resetdeathcount_command_arg, type = 'player' }
        }
    })
end

if wsb.framework == 'esx' then

    TriggerEvent('es:addGroupCommand', 'revive', 'admin', function(source, args, user)
        local targetPlayerId = tonumber(args[2])

        local function isPlayerOnline(playerId)
            for _, player in ipairs(GetPlayers()) do
                if tonumber(player) == playerId then
                    return true
                end
            end
            return false
        end

        if targetPlayerId and isPlayerOnline(targetPlayerId) then
            TriggerClientEvent('wasabi_ambulance:revive', targetPlayerId)
            TriggerEvent('wasabi_ambulance:logRevive', source, args[1])
            TriggerClientEvent('chatMessage', targetPlayerId, "Altrive", {102, 51, 153}, GetPlayerName(source) .. " använde /revive på dig")
            TriggerClientEvent('chatMessage', source, "Altrive", {102, 51, 153}, "Du använde /revive på " .. GetPlayerName(targetPlayerId))
        else
            TriggerClientEvent('wasabi_ambulance:revive', source)
            TriggerEvent('wasabi_ambulance:logRevive', source, args[1])
            TriggerClientEvent('chatMessage', source, "Altrive", {102, 51, 153}, "Du använde /revive på dig")
        end
    end, function(source, args, user)
    end, {help = 'Använd för att återuppleva spelaren', params = {{name = 'id'}}})

elseif wsb.framework == 'qb' then
    QBCore.Commands.Add('revive', 'Revive a player', { { name = 'id', help = 'Player ID' } }, false,
        function(source, args)
            local src = source
            if args[1] then
                local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
                if Player then
                    TriggerClientEvent('wasabi_ambulance:revive', Player.PlayerData.source)
                    if source and source ~= 0 and Config.ReviveLogs then
                        TriggerEvent('wasabi_ambulance:logRevive', source, Player.PlayerData.source)
                    end
                end
            else
                TriggerClientEvent('wasabi_ambulance:revive', src)
            end
        end, 'admin')

    QBCore.Commands.Add('kill', 'Kill a player', { { name = 'id', help = 'Player ID' } }, false, function(source, args)
        local src = source
        if args[1] then
            local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
            if Player then
                TriggerClientEvent('wasabi_ambulance:killPlayer', Player.PlayerData.source)
            end
        else
            TriggerClientEvent('wasabi_ambulance:killPlayer', src)
        end
    end, 'admin')

    RegisterNetEvent('hospital:server:resetHungerThirst', function()
        local src = source
        local player = wsb.getPlayer(src)
        if not player then return end
        player.Functions.SetMetaData('hunger', 100)
        player.Functions.SetMetaData('thirst', 100)
        TriggerClientEvent('hud:client:UpdateNeeds', src, 100, 100)
    end)
end


RevivePlayer = function(target)
    local src = source
    TriggerClientEvent('wasabi_ambulance:revive', target)
    if src and src ~= 0 and Config.ReviveLogs then
        TriggerEvent('wasabi_ambulance:logRevive', src, target)
    end
end

exports('RevivePlayer', RevivePlayer)

AddEventHandler('txAdmin:events:healedPlayer', function(eventData)
    if GetInvokingResource() ~= 'monitor' or type(eventData) ~= 'table' or type(eventData.id) ~= 'number' then
        return
    end

    if eventData.id == -1 then
        for _, ids in ipairs(GetPlayers()) do
            local playerId = tonumber(ids)
            if playerId then
                if Player(playerId).state.laststand or Player(playerId).state.dead then
                    TriggerClientEvent('wasabi_ambulance:revive', playerId)
                else
                    TriggerClientEvent('wasabi_ambulance:heal', playerId, true, true)
                end
            end
        end
    else
        if Player(eventData.id).state.laststand or Player(eventData.id).state.dead then
            TriggerClientEvent('wasabi_ambulance:revive', eventData.id)
        else
            TriggerClientEvent('wasabi_ambulance:heal', eventData.id, true, true)
        end
    end
end)

ESX.RegisterUsableItem('medkit', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('medkit', 1)
    TriggerClientEvent('esx_ambulancejob:heal', source, 'big')
    TriggerClientEvent('esx:showNotification', source, _U('used_medikit'))
  end)
  
  ESX.RegisterUsableItem('alvedon', function(source)
    local xPlayer  = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('alvedon', 1)
    TriggerClientEvent('shakeCam', source, false)
    TriggerClientEvent('esx:showNotification', source, ('Du tog en Alvedon, du börjar känna dig bättre'))
    TriggerEvent('esx_ambulancejob:heal', source, 'small')
  end)
  
  ESX.RegisterUsableItem('ipren', function(source)
    local xPlayer  = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('ipren', 1)
    TriggerClientEvent('shakeCam', source, false)
    TriggerClientEvent('esx:showNotification', source, ('Du tog en Ipren, Du börjar känna dig bättre'))
    TriggerEvent('esx_ambulancejob:heal', source, 'small3')
  end)
  
  ESX.RegisterUsableItem('panodil', function(source)
    local xPlayer  = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('panodil', 1)
    TriggerClientEvent('shakeCam', source, false)
    TriggerClientEvent('esx:showNotification', source, ('Du tog en Panodil, Du börjar känna dig bättre'))
    TriggerEvent('esx_ambulancejob:heal', source, 'small3')
  end)
  
  ESX.RegisterUsableItem('aqua', function(source)
    local xPlayer  = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('aqua', 1)
    TriggerClientEvent('shakeCam', source, false)
    TriggerClientEvent('esx:showNotification', source,('Du satte på ett Aqua Plåster'))
    TriggerEvent('esx_ambulancejob:heal', source, 'small2')
  end)
  
  ESX.RegisterUsableItem('apoteket', function(source)
    local xPlayer  = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('apoteket', 1)
    TriggerClientEvent('shakeCam', source, false)
    TriggerClientEvent('esx:showNotification', source,('Du satte på ett Apoteket Plåster'))
    TriggerEvent('esx_ambulancejob:heal', source, 'small2')
  end)
  
  ESX.RegisterUsableItem('voltaren', function(source)
    local xPlayer  = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('voltaren', 1)
    TriggerClientEvent('shakeCam', source, false)
    TriggerClientEvent('esx:showNotification', source, ('Du tog Voltaren Salva, Du börjar känna dig bättre'))
    TriggerEvent('esx_ambulancejob:heal', source, 'small2')
  end)
  
  ESX.RegisterUsableItem('idomin', function(source)
    local xPlayer  = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('idomin', 1)
    TriggerClientEvent('shakeCam', source, false)
    TriggerClientEvent('esx:showNotification', source, ('Du tog Idomin Salva, Du börjar känna dig bättre'))
    TriggerEvent('esx_ambulancejob:heal', source, 'small2')
  end)
  
  ESX.RegisterUsableItem('tiger', function(source)
    local xPlayer  = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('tiger', 1)
    TriggerClientEvent('shakeCam', source, false)
    TriggerClientEvent('esx:showNotification', source, ('Du tog Tiger Balsam, Du börjar känna dig bättre'))
    TriggerEvent('esx_ambulancejob:heal', source, 'small')
  end)
  
  ESX.RegisterUsableItem('tramadol', function(source)
    local xPlayer  = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('tramadol', 1)
    TriggerClientEvent('shakeCam', source, true)
    TriggerClientEvent('esx:showNotification', source, ('Du tog Tramadol, Du börjar känna dig bättre'))
    TriggerEvent('esx_ambulancejob:heal', source, 'medium')
  end)

  RegisterServerEvent('esx_ambulancejob:heal')
AddEventHandler('esx_ambulancejob:heal', function(target, type)
  TriggerClientEvent('esx_ambulancejob:heal', target, type)
end)


  
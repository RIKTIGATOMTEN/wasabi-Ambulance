-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
if not wsb then return print((Strings.no_wsb):format(GetCurrentResourceName())) end

plyRequests, deadPlayers, DeathInjury, Outfits, PlayerInjury, HospitalBeds, DisconnectedPlayers = {}, {}, {}, {}, {}, {},
    {}


CreateThread(function()
    for k, v in pairs(Config.Locations) do
        if v.CheckIn.Enabled then
            for i = 1, #v.CheckIn.HospitalBeds do
                local bed = v.CheckIn.HospitalBeds[i]
                if not HospitalBeds[k] then HospitalBeds[k] = {} end
                HospitalBeds[k][#HospitalBeds[k] + 1] = {
                    coords = bed.coords,
                    heading = bed.heading,
                    inUse = false
                }
            end
        end
    end
    if Config.EnableStandaloneCheckIns then
        for k, v in pairs(Config.StandaloneCheckIns) do
            if v.HospitalBeds then
                if #v.HospitalBeds > 0 then
                    for i = 1, #v.HospitalBeds do
                        local bed = v.HospitalBeds[i]
                        local hospID = 'standaloneCheckIn_' .. k
                        if not HospitalBeds[hospID] then HospitalBeds[hospID] = {} end
                        HospitalBeds[hospID][#HospitalBeds[hospID] + 1] = {
                            coords = bed.coords,
                            heading = bed.heading,
                            inUse = false
                        }
                    end
                end
            end
        end
    end
    if next(HospitalBeds) then
        GlobalState.HospitalBeds = HospitalBeds
    end
end)

lib.callback.register('wasabi_ambulance:requestBed', function(source, hospital)
    local src = source
    if not HospitalBeds[hospital] then return false end
    for _, bedData in pairs(HospitalBeds[hospital]) do
        if not bedData.inUse then
            bedData.inUse = src
            return bedData
        end
    end
    return false
end)

lib.callback.register('wasabi_ambulance:checkPreviousVitals', function(source)
    local src = source
    local identifier = wsb.getIdentifier(src)
    if not identifier then return false end
    return DisconnectedPlayers[identifier] or false
end)

RegisterNetEvent('wasabi_ambulance:setBedInUse', function(hospital)
    local src = source
    if not HospitalBeds[hospital] then return end
    for _, bedData in pairs(HospitalBeds[hospital]) do
        if bedData.inUse == src then
            bedData.inUse = false
            return true
        end
    end
    return false
end)


function ClearPlayerBeds(id)
    if not HospitalBeds or not next(HospitalBeds) then return end
    for _, beds in pairs(HospitalBeds) do
        for _, bedData in pairs(beds) do
            if bedData.inUse and bedData.inUse == id then
                bedData.inUse = false
            end
        end
    end
end

AddEventHandler('playerDropped', function()
    local src = source
    local identifier = wsb.getIdentifier(src)
    local health = GetEntityHealth(GetPlayerPed(src))
    if identifier then
        DisconnectedPlayers[identifier] = {}
        if health and health < 200 then
            DisconnectedPlayers[identifier].health = health
        end
        if PlayerInjury[src] then
            DisconnectedPlayers[identifier].injuries = PlayerInjury[src]
        end
        if not DisconnectedPlayers[identifier].health and not DisconnectedPlayers[identifier].injuries then
            DisconnectedPlayers[identifier] = nil
        end
    end
    if deadPlayers[src] then deadPlayers[src] = nil end
    if DeathInjury[src] then DeathInjury[src] = nil end
    if PlayerInjury[src] then PlayerInjury[src] = nil end
    if plyRequests[src] then
        plyRequests[src] = nil
        TriggerClientEvent('wasabi_ambulance:syncRequests', -1, plyRequests, true)
    end
    ClearPlayerBeds(src)
end)

addCommas = function(n)
    return tostring(math.floor(n)):reverse():gsub("(%d%d%d)", "%1,")
        :gsub(",(%-?)$", "%1"):reverse()
end

local sqlSetDeathStatus = function(id, isDead)
    if wsb.framework == 'qb' then return end
    local xPlayer = wsb.getPlayer(id)
    if isDead then
        isDead = 1
    else
        isDead = 0
    end
    MySQL.Async.execute('UPDATE users SET is_dead = @is_dead WHERE identifier = @identifier', {
        ['@is_dead'] = isDead,
        ['@identifier'] = xPlayer.identifier
    })
end

RegisterNetEvent('wasabi_ambulance:setDeathStatus', function(isDead, sql, characterSwitch)
    local src = source
    deadPlayers[src] = isDead
    Player(src).state:set('dead', isDead, true)
    Player(src).state:set('isDead', isDead, true) -- ESX Compatibility
    if not isDead then
        DeathInjury[src] = nil
    end
    PlayerInjury[src] = nil
    if not isDead and plyRequests[src] then
        plyRequests[src] = nil
        TriggerClientEvent('wasabi_ambulance:syncRequests', -1, plyRequests, true)
    end

    local bool = false
    if isDead then bool = true end

    if Config.AntiCombatLog.enabled and wsb.framework == 'esx' then
        if sql then sqlSetDeathStatus(src, bool) end
    end

    if wsb.framework == 'qb' and not characterSwitch then
        local Player = wsb.getPlayer(src)
        Player.Functions.SetMetaData('isdead', bool)
        Player.Functions.SetMetaData('inlaststand', bool)
    end

    if Config.MuteDeadPlayers then
        MuteDeadPlayer(src, isDead)
    end
end)

RegisterNetEvent('wasabi_ambulance:injurySync', function(injury)
    local src = source
    if not injury then
        PlayerInjury[src] = nil
        DeathInjury[src] = nil
        return
    end
    if type(injury) == 'table' then
        PlayerInjury[src] = injury
        return
    end
    if PlayerInjury[src] then PlayerInjury[src] = nil end
    DeathInjury[src] = injury
end)

RegisterNetEvent('wasabi_ambulance:onPlayerDistress', function()
    local src = source
    local name = wsb.getName(src)
    plyRequests[src] = name
    TriggerClientEvent('wasabi_ambulance:syncRequests', -1, plyRequests, false)
end)

RegisterNetEvent('wasabi_ambulance:requestSync', function()
    local src = source
    TriggerClientEvent('wasabi_ambulance:syncRequests', src, plyRequests, true)
    TriggerClientEvent('wasabi_ambulance:syncStretchers', src, ActiveStretchers)
end)

RegisterNetEvent('wasabi_ambulance:revivePlayer', function(targetId)
    local src = source
    if wsb.hasItem(src, Config.EMSItems.revive.item) > 0 then
        if Config.EMSItems.revive.remove then
            wsb.removeItem(src, Config.EMSItems.revive.item, 1)
        end
        if Config.ReviveRewards.enabled then
            local reward = 0
            if not DeathInjury[targetId] then
                reward = Config.ReviveRewards.no_injury
            else
                reward = Config.ReviveRewards[DeathInjury[targetId]]
            end
            if reward > 0 then
                wsb.addMoney(src, Config.ReviveRewards.paymentAccount, reward)
                TriggerClientEvent('wasabi_bridge:notify', src, Strings.player_successful_revive,
                    (Strings.player_successful_revive_reward_desc):format(reward), 'success')
            else
                TriggerClientEvent('wasabi_bridge:notify', src, Strings.player_successful_revive,
                    Strings.player_successful_revive_desc, 'success')
            end
        else
            TriggerClientEvent('wasabi_bridge:notify', src, Strings.player_successful_revive,
                Strings.player_successful_revive_desc, 'success')
        end
        TriggerClientEvent('wasabi_ambulance:revivePlayer', targetId, DeathInjury[targetId])
    end
end)

RegisterNetEvent('wasabi_ambulance:healPlayer', function(targetId)
    local src = source
    local authorized = false
    if Config?.policeCanTreat?.enabled and wsb.hasGroup(src, Config.policeCanTreat.jobs) then
        authorized = true
    end
    if targetId == src then
        if wsb.hasItem(src, Config.EMSItems.heal.item) > 0 then
            wsb.removeItem(src, Config.EMSItems.heal.item, 1)
            local trainedProfessional = wsb.hasGroup(src, Config.ambulanceJob) or authorized or false
            TriggerClientEvent('wasabi_ambulance:heal', src, trainedProfessional, true)
            TriggerClientEvent('wasabi_bridge:notify', src, Strings.used_meditkit, Strings.used_medikit_desc, 'success')
        end
    elseif wsb.hasGroup(src, Config.ambulanceJobs or Config.ambulanceJob) or authorized then
        if wsb.hasItem(src, Config.EMSItems.heal.item) > 0 then
            if Config.EMSItems.heal.remove then
                wsb.removeItem(src, Config.EMSItems.heal.item, 1)
            end
            TriggerClientEvent('wasabi_bridge:notify', src, Strings.player_successful_heal,
                Strings.player_successful_heal_desc, 'success')
            TriggerClientEvent('wasabi_ambulance:heal', targetId, true, false)
        end
    end
end)

RegisterNetEvent('wasabi_ambulance:treatPlayer', function(target, injury)
    local src = source
    if target > 0 then
        local authorized = false
        if Config?.policeCanTreat?.enabled and wsb.hasGroup(src, Config.policeCanTreat.jobs) then
            authorized = true
        end
        if wsb.hasGroup(src, Config.ambulanceJobs or Config.ambulanceJob) or authorized then
            if wsb.hasItem(src, Config.TreatmentItems[injury]) > 0 then
                wsb.removeItem(src, Config.TreatmentItems[injury], 1)
                if DeathInjury[target] then DeathInjury[target] = nil end
                if PlayerInjury[target] then
                    local plyInjury = {}
                    for k, v in pairs(PlayerInjury[target]) do
                        if v.type ~= injury then
                            plyInjury[k] = v
                        end
                    end
                    PlayerInjury[target] = plyInjury
                    TriggerClientEvent('wasabi_ambulance:syncInjury', target, plyInjury, true)
                end
                TriggerClientEvent('wasabi_bridge:notify', src, Strings.player_treated, Strings.player_treated_desc,
                    'success')
            end
        end
    end
end)

RegisterNetEvent('wasabi_ambulance:sedatePlayer', function(target)
    local src = source
    if target > 0 then
        local authorized = false
        if Config?.policeCanTreat?.enabled then
            if wsb.hasGroup(src, Config.policeCanTreat.jobs) then
                authorized = true
            end
        end
        if wsb.hasGroup(src, Config.ambulanceJobs or Config.ambulanceJob) or authorized then
            if wsb.hasItem(src, Config.EMSItems.sedate.item) > 0 then
                if Config.EMSItems.sedate.remove then
                    wsb.removeItem(src, Config.EMSItems.sedate.item, 1)
                end
                TriggerClientEvent('wasabi_bridge:notify', target, Strings.target_sedated, Strings.target_sedated_desc,
                    'inform')
                TriggerClientEvent('wasabi_bridge:notify', src, Strings.target_sedated,
                    Strings.player_successful_sedate_desc, 'success')
                TriggerClientEvent('wasabi_ambulance:sedate', target)
            end
        end
    end
end)

RegisterNetEvent('wasabi_ambulance:removeObj', function(netObj)
    TriggerClientEvent('wasabi_ambulance:syncObj', -1, netObj)
end)

RegisterNetEvent('wasabi_ambulance:putInVehicle', function(target, bypass)
    local src = source
    if not target or target < 1 then return end
    if bypass then
        TriggerClientEvent('wasabi_ambulance:intoVehicle', target)
        return
    end
    local authorized = false
    if Config?.policeCanTreat?.enabled then
        if wsb.hasGroup(src, Config.policeCanTreat.jobs) then
            authorized = true
        end
    end
    if wsb.hasGroup(src, Config.ambulanceJobs or Config.ambulanceJob) or authorized then
        TriggerClientEvent('wasabi_ambulance:intoVehicle', target)
    end
end)

RegisterNetEvent('wasabi_ambulance:restock', function(data)
    local src = source
    if wsb.hasGroup(src, Config.ambulanceJobs or Config.ambulanceJob) then
        if not data.price then
            wsb.addItem(src, data.item, 1)
        else
            if wsb.getPlayerAccountFunds(src, 'money') < data.price then
                TriggerClientEvent('wasabi_bridge:notify', src, Strings.not_enough_funds, Strings.not_enough_funds_desc,
                    'error')
            else
                wsb.removeMoney(src, 'money', data.price)
                wsb.addItem(src, data.item, 1)
            end
        end
    end
end)

RegisterNetEvent('wasabi_ambulance:setBagState', function(netId)
    Entity(NetworkGetEntityFromNetworkId(netId)).state:set('useable', true, true)
end)


lib.callback.register('wasabi_ambulance:getIdentifier', function(source)
    local src = source
    local identifier = wsb.getIdentifier(src)
    if not identifier then return false end
    return identifier
end)
lib.callback.register('wasabi_ambulance:checkDeath', function(source)
    local src = source
    local player = wsb.getPlayer(src)
    if wsb.framework == 'qb' then
        if not player then return end
        return player.PlayerData.metadata['isdead']
    else
        local isDead
        local response = MySQL.query.await('SELECT `is_dead` FROM `users` WHERE `identifier` = ?', {
            player.identifier
        })
        if response and response[1] then
            isDead = response[1].is_dead or false
        end
        while isDead == '' do Wait(0) end
        return isDead
    end
end)


RegisterNetEvent('wasabi_ambulance:tryStandaloneRevive', function(locationID)
    local src = source
    local locationData = Config.StandaloneCheckIns[locationID]
    if not locationData then return end
    local cost, account = locationData.Cost, locationData.PayAccount
    if cost then
        local funds = wsb.getPlayerAccountFunds(src, account)
        if funds < cost then
            TriggerClientEvent('wasabi_bridge:notify', src, Strings.not_enough_funds, Strings.not_enough_funds_desc,
                'error')
        else
            wsb.removeMoney(src, account, cost)
            TriggerClientEvent('wasabi_ambulance:standaloneCheckIn', src, locationID)
        end
    else
        TriggerClientEvent('wasabi_ambulance:standaloneCheckIn', src, locationID)
    end
end)


RegisterServerEvent('wasabi_ambulance:tryRevive', function(hospital)
    local src = source
    local hospitalData = Config.Locations[hospital].CheckIn
    if not hospitalData then return end
    local max, cost, account = hospitalData.MaxOnDuty, hospitalData.Cost, hospitalData.PayAccount
    local players = GetPlayers()
    local ems = 0
    for i = 1, #players, 1 do
        local player = tonumber(players[i])
        if wsb.hasGroup(player, Config.ambulanceJobs or Config.ambulanceJob) then
            if wsb.framework == 'qb' then
                local qbPlayer = wsb.getPlayer(player)
                if qbPlayer and qbPlayer.PlayerData.job.onduty then ems = ems + 1 end
            else
                ems = ems + 1
            end
        end
    end
    if max then
        if ems > max then
            TriggerClientEvent('wasabi_bridge:notify', src, Strings.max_ems, Strings.max_ems_desc, 'error')
            return
        end
    end
    if cost then
        local funds = wsb.getPlayerAccountFunds(src, account)
        if funds < cost then
            TriggerClientEvent('wasabi_bridge:notify', src, Strings.not_enough_funds, Strings.not_enough_funds_desc,
                'error')
        else
            wsb.removeMoney(src, account, cost)
            TriggerClientEvent('wasabi_ambulance:hospitalCheckIn', src, hospital)
        end
    else
        TriggerClientEvent('wasabi_ambulance:hospitalCheckIn', src, hospital)
    end
end)

lib.callback.register('wasabi_ambulance:getDeathPos', function(_source, targetId)
    local coords = GetEntityCoords(GetPlayerPed(targetId))
    return vector3(coords.x, coords.y, coords.z)
end)


lib.callback.register('wasabi_ambulance:isPlayerDead', function(_source, target)
    if deadPlayers[target] or Player(target).state.laststand then
        return true
    else
        return false
    end
end)

lib.callback.register('wasabi_ambulance:diagnosePatient', function(_source, target)
    if deadPlayers[target] and DeathInjury[target] then
        return DeathInjury[target]
    end
    if PlayerInjury[target] then return PlayerInjury[target] end
    return false
end)

lib.callback.register('wasabi_ambulance:itemCheck', function(source, item)
    local src = source
    return wsb.hasItem(src, item)
end)

lib.callback.register('wasabi_ambulance:removeItem', function(source, item)
    local src = source
    if wsb.hasItem(src, item) then
        wsb.removeItem(src, item, 1)
        return true
    else
        return false
    end
end)

lib.callback.register('wasabi_ambulance:gItem', function(source, item)
    local src = source
    local authorized = false
    if Config?.policeCanTreat?.enabled then
        if wsb.hasGroup(src, Config.policeCanTreat.jobs) then
            authorized = true
        end
    end
    if wsb.hasGroup(src, Config.ambulanceJobs or Config.ambulanceJob) or authorized then
        wsb.addItem(src, item, 1)
        return true
    else
        return false
    end
end)

local ACTIVEGPS = {}
lib.callback.register('wasabi_ambulance:getPlayerNames', function(source)
    local src = source
    if not wsb.hasGroup(src, Config.ambulanceJobs or Config.ambulanceJob) then return end
    local players = GetPlayers()
    local data = {}

    for k, playerId in pairs(players) do
        playerId = tonumber(playerId)
        if playerId == src then goto continue end
        if not wsb.hasGroup(playerId, Config.ambulanceJobs or Config.ambulanceJob) then goto continue end

        data[playerId] = wsb.getName(playerId)

        ::continue::
        Wait(50) -- prevent possible hitch
    end

    return data
end)

lib.callback.register('wasabi_ambulance:getPlayerCoords', function(source)
    if not Config.GPSBlips.enabled then return end
    if not wsb.hasGroup(source, Config.ambulanceJobs or Config.ambulanceJob) then return end
    local players = GetPlayers()
    local data = {}
    local allowed, coords = true, nil

    for k, playerId in pairs(players) do
        playerId = tonumber(playerId)
        if playerId == source then goto continue end
        if not wsb.hasGroup(playerId, Config.ambulanceJobs or Config.ambulanceJob) then goto continue end

        if Config.GPSBlips.item then
            allowed = ACTIVEGPS[playerId]
        end

        if allowed then
            coords = GetEntityCoords(GetPlayerPed(playerId))
            data[#data + 1] = {
                player = playerId,
                coords = vector3(coords.x, coords.y, coords.z),
                name = wsb.getName(playerId)
            }
        end

        ::continue::
        Wait(50) -- prevent possible hitch
    end

    return data
end)

RegisterNetEvent('wasabi_ambulance:billPlayer', function(target, amount)
    local src = source
    local player = wsb.getPlayer(target)
    local hasJob, _grade = wsb.hasGroup(src, Config.ambulanceJobs or Config.ambulanceJob)
    if player then
        local identifier = wsb.getIdentifier(player)
        exports.pefcl:createInvoice(src,
            {
                to = player.getName(),
                toIdentifier = identifier,
                from = 'Hospital',
                fromIdentifier = nil,
                amount = amount,
                message =
                'Medical Bills',
                receiverAccountIdentifier = hasJob,
                expiresAt = nil
            })
    end
end)

RegisterNetEvent('wasabi_ambulance:svToggleDuty', function(job, grade)
    local src = source
    local onDuty = wsb.toggleDuty(src, job, grade)
    if not onDuty then return end
    if onDuty == 'on' then
        TriggerClientEvent('wasabi_bridge:notify', src, Strings.on_duty, Strings.on_duty_desc, 'success')
    else
        TriggerClientEvent('wasabi_bridge:notify', src, Strings.off_duty, Strings.off_duty_desc, 'error')
    end
end)

RegisterNetEvent('wasabi_ambulance:setEntityState', function(netId, state, value)
    Entity(NetworkGetEntityFromNetworkId(netId)).state:set(state, value, true)
end)

if Config.GPSBlips.enabled and Config.GPSBlips.item and Config.GPSBlips.item ~= '' then
    wsb.registerUsableItem(Config.GPSBlips.item, function(source)
        ACTIVEGPS[source] = not ACTIVEGPS[source]
        local players = GetPlayers()

        for k, playerId in pairs(players) do
            playerId = tonumber(playerId)
            if playerId == source then goto continue end
            if not wsb.hasGroup(playerId, Config.ambulanceJobs or Config.ambulanceJob) then goto continue end

            TriggerClientEvent('wasabi_ambulance:useGPS', playerId, source, ACTIVEGPS[source])
            if ACTIVEGPS[source] then
                TriggerClientEvent('wasabi_bridge:notify', playerId, Strings.gps_active,
                    (Strings.gps_active_desc):format(wsb.getName(source)), 'info')
            else
                TriggerClientEvent('wasabi_bridge:notify', playerId, Strings.gps_deactive,
                    (Strings.gps_deactive_desc):format(wsb.getName(source)), 'info')
            end

            ::continue::
        end
    end)
end

RegisterNetEvent('wasabi_ambulance:saveOutfit', function(outfit)
    local src = source
    local identifier = wsb.getIdentifier(src)
    if not identifier then return end
    if Outfits[identifier] then return end
    Outfits[identifier] = outfit
end)

RegisterNetEvent('wasabi_ambulance:hospitalBedSync', function(beds)
    HospitalBeds = beds
    GlobalState.HospitalBeds = beds
end)

wsb.registerCallback('wasabi_ambulance:requestCivilianOutfit', function(source, cb)
    local src = source
    local identifier = wsb.getIdentifier(src)
    if not identifier then return end
    if not Outfits[identifier] then return cb(false) end
    local outfit = Outfits[identifier]
    Outfits[identifier] = nil
    cb(outfit)
end)

wsb.registerUsableItem(Config.EMSItems.medbag, function(source)
    local src = source
    wsb.removeItem(src, Config.EMSItems.medbag, 1)
    TriggerClientEvent('wasabi_ambulance:useMedbag', src)
end)

wsb.registerUsableItem(Config.EMSItems.revive.item, function(source)
    local src = source
    TriggerClientEvent('wasabi_ambulance:reviveTarget', src)
end)

wsb.registerUsableItem(Config.EMSItems.heal.item, function(source)
    local src = source
    TriggerClientEvent('wasabi_ambulance:healTarget', src)
end)

wsb.registerUsableItem(Config.EMSItems.sedate.item, function(source)
    local src = source
    TriggerClientEvent('wasabi_ambulance:useSedative', src)
end)

if Config.Bandages.enabled then
    wsb.registerUsableItem(Config.Bandages.item, function(source)
        local src = source
        TriggerClientEvent('wasabi_ambulance:useBandage', src)
    end)

    RegisterNetEvent('wasabi_ambulance:useBandage', function(target)
        wsb.removeItem(target, Config.Bandages.item, 1)
    end)
end

CreateThread(function()
    for k, v in pairs(Config.TreatmentItems) do
        wsb.registerUsableItem(v, function(source)
            local src = source
            TriggerClientEvent('wasabi_ambulance:treatPatient', src, k)
        end)
    end
end)

if Config.EnablePainPills then
    CreateThread(function()
        for k, v in pairs(Config.PainPills) do
            wsb.registerUsableItem(k, function(source)
                local src = source
                TriggerClientEvent('wasabi_ambulance:intakePills', src, k, v)
            end)
        end
    end)
end

exports('clearPlayerInjury', function(target)
    if not target then return end
    TriggerClientEvent('wasabi_ambulance:clearPlayerInjury', target)
end)

exports('diagnosePatient', function(target)
    if not target then return false end
    if DeathInjury[target] then return DeathInjury[target] end
    if PlayerInjury[target] then return PlayerInjury[target] end
    return false
end)

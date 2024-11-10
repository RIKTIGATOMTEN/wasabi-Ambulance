-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
if not Config.EnableStretcher then return end

if not wsb then return print((Strings.no_wsb):format(GetCurrentResourceName())) end

CurrentStretcherID = 0

ActiveStretchers = {}

RegisterNetEvent('playerDropped', function()
    local src = source
    local oldStretchers = ActiveStretchers
    if not oldStretchers or not next(oldStretchers) then return end
    for i = 1, #oldStretchers do
        if oldStretchers[i].occupied == src then
            oldStretchers[i].occupied = false
        end
        if oldStretchers[i].moving == src then
            oldStretchers[i].moving = false
        end
        if oldStretchers[i].inMenu == src then
            oldStretchers[i].inMenu = false
        end
    end
    ActiveStretchers = oldStretchers
    TriggerClientEvent('wasabi_ambulance:syncStretchers', -1, ActiveStretchers)
end)

wsb.registerCallback('wasabi_ambulance:addStretcher',
    function(source, cb, coords, heading, distance, netID, originalVehicleID)
        local src = source
        local id = CurrentStretcherID + 1
        CurrentStretcherID = id
        local stretcher = {
            id = id,
            coords = coords,
            heading = heading,
            distance = distance,
            netID = netID,
            originalVehicleID = originalVehicleID,
            moving = src,
            occupied = false,
            inMenu = false,
            inVehicle = false,
        }
        ActiveStretchers[#ActiveStretchers + 1] = stretcher
        TriggerClientEvent('wasabi_ambulance:syncStretchers', -1, ActiveStretchers)
        cb(id)
    end)

local function getStretcherData(id)
    if not id then return false end
    if not ActiveStretchers or not next(ActiveStretchers) then return false end
    for i = 1, #ActiveStretchers do
        if ActiveStretchers[i].id == id then
            return ActiveStretchers[i]
        end
    end
    return false
end

RegisterNetEvent('wasabi_ambulance:resyncStretchers', function()
    ActiveStretchers = {}
    local src = source
    TriggerClientEvent('wasabi_ambulance:syncStretchers', src, {})
end)

RegisterNetEvent('wasabi_ambulance:removeStretcher', function(id)
    local oldStretchers = ActiveStretchers
    if not oldStretchers and not next(oldStretchers) then return end
    for i = 1, #oldStretchers do
        if oldStretchers[i].id == id then
            table.remove(oldStretchers, i)
            break
        end
    end
    ActiveStretchers = oldStretchers
    TriggerClientEvent('wasabi_ambulance:removeStretcher', -1, ActiveStretchers)
end)

RegisterNetEvent('wasabi_ambulance:setStretcherStatus', function(id, status, value, success)
    local src = source
    local oldStretchers = ActiveStretchers
    if not oldStretchers or not next(oldStretchers) then if success then success(false) end return end
    for i = 1, #oldStretchers do
        if oldStretchers[i].id == id then
            oldStretchers[i][status] = (value and src) or false
            if status == 'occupied' and value then
                TriggerClientEvent('wasabi_ambulance:setLocalStretcherStatus', src, false, oldStretchers[i].netID)
            elseif status == 'moving' and value then
                TriggerClientEvent('wasabi_ambulance:setLocalStretcherStatus', src, oldStretchers[i].netID, false)
            end
        end
    end
    ActiveStretchers = oldStretchers

    TriggerClientEvent('wasabi_ambulance:syncStretchers', -1, ActiveStretchers)
    if success then success(true) end
end)

RegisterNetEvent('wasabi_ambulance:updateStretcherStatuses', function(id, tbl)
    local src = source
    if not id or not tbl or not next(tbl) then return end
    local oldStretchers = ActiveStretchers
    if not oldStretchers or not next(oldStretchers) then return end
    for i = 1, #oldStretchers do
        if oldStretchers[i].id == id then
            for status, value in pairs(tbl) do
                oldStretchers[i][status] = value
                if status == 'occupied' and value then
                    TriggerClientEvent('wasabi_ambulance:setLocalStretcherStatus', src, false, oldStretchers[i].netID)
                elseif status == 'occupied' and not value and ActiveStretchers[i].occupied then
                    TriggerClientEvent('wasabi_ambulance:setLocalStretcherStatus', ActiveStretchers[i].occupied,
                        oldStretchers[i].netID, false)
                elseif status == 'moving' and value then
                    TriggerClientEvent('wasabi_ambulance:setLocalStretcherStatus', src, oldStretchers[i].netID, false)
                elseif status == 'moving' and not value and ActiveStretchers[i].moving then
                    TriggerClientEvent('wasabi_ambulance:setLocalStretcherStatus', ActiveStretchers[i].moving, false,
                        oldStretchers[i].netID)
                end
            end
        end
    end
    ActiveStretchers = oldStretchers
    TriggerClientEvent('wasabi_ambulance:syncStretchers', -1, ActiveStretchers)
end)

RegisterNetEvent('wasabi_ambulance:placePlayerOnStretcher', function(id, targetID)
    local oldStretchers = ActiveStretchers
    if not oldStretchers or not next(oldStretchers) then return end
    for i = 1, #oldStretchers do
        if oldStretchers[i].id == id then
            oldStretchers[i].occupied = targetID
            TriggerClientEvent('wasabi_ambulance:setLocalStretcherStatus', targetID, false, oldStretchers[i].netID)
        end
    end
    ActiveStretchers = oldStretchers
    TriggerClientEvent('wasabi_ambulance:syncStretchers', -1, ActiveStretchers)
end)

RegisterNetEvent('wasabi_ambulance:removePlayerFromStretcher', function(id, targetID)
    local oldStretchers = ActiveStretchers
    if not oldStretchers or not next(oldStretchers) then return end
    for i = 1, #oldStretchers do
        if oldStretchers[i].id == id then
            oldStretchers[i].occupied = false
            TriggerClientEvent('wasabi_ambulance:setLocalStretcherStatus', targetID, false, false)
        end
    end
    ActiveStretchers = oldStretchers
    TriggerClientEvent('wasabi_ambulance:syncStretchers', -1, ActiveStretchers)
end)


RegisterNetEvent('wasabi_ambulance:placeStretcherInVehicle', function(id, vehicleNetID)
    local src = source
    local stretcherData = getStretcherData(id)
    if not stretcherData or not stretcherData.occupied then return end
    TriggerClientEvent('wasabi_ambulance:placeStretcherInVehicle', stretcherData.occupied, id, vehicleNetID)
end)

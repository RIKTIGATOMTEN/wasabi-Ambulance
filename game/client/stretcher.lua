-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
if not Config.EnableStretcher then return end

if not wsb then return print((Strings.no_wsb):format(GetCurrentResourceName())) end

ActiveStretchers, MovingStretcher, OccupyingStretcher = {}, nil, nil

local textUI, dropStretcher, lastStretcherDrop, placingStretcher = nil, false, GetGameTimer(), false

local function busyWithStretcherToggle()
    if placingStretcher then
        placingStretcher = false
        return
    end
    placingStretcher = true
    CreateThread(function()
        while placingStretcher do
            Wait(0)
            DisableAllControlActions(0)
        end
    end)
end

function ForceEntityOwnership(cb, entity)
    local player = PlayerId()
    if not DoesEntityExist(entity) then
        cb(false)
        return
    end
    local netID = NetworkGetNetworkIdFromEntity(entity)
    SetNetworkIdCanMigrate(netID, true)
    SetNetworkIdExistsOnAllMachines(netID, true)
    NetworkSetNetworkIdDynamic(netID, true)
    SetNetworkIdSyncToPlayer(netID, player, true)
    if NetworkGetEntityOwner(entity) ~= player then
        while NetworkGetEntityOwner(entity) ~= player do
            NetworkRequestControlOfEntity(entity)
            Wait(30)
        end
    end
    cb(true)
end

local function isStretcherPlacementBlocked(distance, stretcherEntity)
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local playerForward = GetEntityForwardVector(ped)
    local targetCoords = coords + playerForward * distance

    local rayHandle = StartShapeTestRay(coords.x, coords.y, coords.z, targetCoords.x, targetCoords.y,
        targetCoords.z, -1, ped, 0)
    local _, hit, _, _, entityHit = GetShapeTestResult(rayHandle)                -- raycast to check if stretcher placement is blocked

    if hit and entityHit ~= stretcherEntity and not IsEntityAPed(entityHit) then -- make sure entity hit is not the stretcher or a ped
        return true, entityHit
    end
    return false, nil
end

local function isStretcherOccupied(id)
    if not ActiveStretchers or not next(ActiveStretchers) then return false end
    for _, stretcherData in pairs(ActiveStretchers) do
        if stretcherData.id == id then
            return stretcherData.occupied or false
        end
    end
end

local function getActiveStretcherData(id)
    if not ActiveStretchers or not next(ActiveStretchers) then return end
    for _, stretcherData in pairs(ActiveStretchers) do
        if stretcherData.id == id then
            return stretcherData
        end
    end
end

function GetActiveStretcherIDFromEntity(entity)
    if not ActiveStretchers or not next(ActiveStretchers) then
        return false
    end
    local netId = ObjToNet(entity)
    if not netId then
        return false
    end
    for _, stretcherData in pairs(ActiveStretchers) do
        if stretcherData.netID == netId then
            return stretcherData.id
        end
    end
    return false
end

local function isStretcherEntityInVehicle(entity)
    if not ActiveStretchers or not next(ActiveStretchers) then return false end
    local netId = ObjToNet(entity)
    if not netId then return false end
    for _, stretcherData in pairs(ActiveStretchers) do
        if stretcherData.netID == netId then
            return stretcherData.inVehicle or false
        end
    end
    return false
end

function GetEquippedStretcherData()
    if not MovingStretcher then return false end
    local stretcherID = GetActiveStretcherIDFromEntity(MovingStretcher)
    local stretcherData = getActiveStretcherData(stretcherID)
    if not stretcherData then return false end
    return stretcherData
end

local function isPlayerOccupyingStretcher(ped, stretcher)
    if not DoesEntityExist(ped) or not DoesEntityExist(stretcher) then return false end
    local playerID = NetworkGetPlayerIndexFromPed(ped)
    local playerServerID = GetPlayerServerId(playerID)
    local stretcherID = GetActiveStretcherIDFromEntity(stretcher)
    if not stretcherID then return false end
    local stretcherData = getActiveStretcherData(stretcherID)
    if not stretcherData then return false end
    return stretcherData.occupied == playerServerID
end

function IsVehicleAmbulance(vehicle)
    if not vehicle then return false end
    local model = GetEntityModel(vehicle)
    for ambulanceModel, _ in pairs(Config.AmbulanceOffsets) do
        if model == GetHashKey(ambulanceModel) then
            return true
        end
    end
    return false
end

function GetStretcherInVehicle(vehicle)
    if not vehicle then return false end
    local vehicleNetID = NetworkGetNetworkIdFromEntity(vehicle)
    if not ActiveStretchers or not next(ActiveStretchers) then return false end
    for _, stretcherData in pairs(ActiveStretchers) do
        if stretcherData.inVehicle and stretcherData.inVehicle == vehicleNetID then
            return stretcherData
        end
    end
    return false
end

function DeleteStretcherFromVehicle(vehicle)
    if not vehicle or not DoesEntityExist(vehicle) then return end
    local stretcherData = GetStretcherInVehicle(vehicle)
    if not stretcherData then return end
    local stretcherObj = NetToObj(stretcherData.netID)
    TriggerServerEvent('wasabi_ambulance:removeStretcher', stretcherData.id)
    if not DoesEntityExist(stretcherObj) then return end
    ForceEntityOwnership(function(success)
        if success then
            DeleteEntity(stretcherObj)
        end
    end, stretcherObj)
end

function DeleteAllStretchers()
    if not ActiveStretchers or not next(ActiveStretchers) then return end
    for _, stretcherData in pairs(ActiveStretchers) do
        local stretcherObj = NetToObj(stretcherData.netID)
        if DoesEntityExist(stretcherObj) then
            ForceEntityOwnership(function(success)
                if success then
                    DeleteEntity(stretcherObj)
                end
            end, stretcherObj)
        end
    end
    TriggerServerEvent('wasabi_ambulance:resyncStretchers')
end

local function getAmbulanceOffsetData(vehicle)
    if not vehicle then return end
    local model = GetEntityModel(vehicle)
    for ambulanceModel, offsetData in pairs(Config.AmbulanceOffsets) do
        if model == GetHashKey(ambulanceModel) then
            return offsetData
        end
    end
    return false
end

local function getOffStretcherCoords(stretcher)
    if not stretcher then return end
    local stretcherPos = GetEntityCoords(stretcher)
    local stretcherHeading = GetEntityHeading(stretcher) - 90.0

    local headingRadians = stretcherHeading * (math.pi / 180)

    local d = 1.0
    local offsetX = d * math.cos(headingRadians + math.pi / 2)
    local offsetY = d * math.sin(headingRadians + math.pi / 2)
    return vector3(stretcherPos.x + offsetX, stretcherPos.y + offsetY, stretcherPos.z)
end

function IsNearTrunk(entity, distance)
    if not DoesEntityExist(entity) then return false end
    local ambulanceData = getAmbulanceOffsetData(entity)
    if not ambulanceData then return false end
    local bone = 'boot'
    local bone2 = nil
    if not ambulanceData.trunkAsBackDoor then
        bone = 'door_dside_r'
        bone2 = 'door_pside_r'
    end
    local boneIndex = GetEntityBoneIndexByName(entity, bone)
    local bonePos = GetWorldPositionOfEntityBone(entity, boneIndex)
    local ped = PlayerPedId()
    local pedCoords = GetEntityCoords(ped)
    local distance1 = #(pedCoords - bonePos)
    local distCheck = distance or 3.0
    if distance1 < distCheck then
        return true
    elseif bone2 then
        local boneIndex2 = GetEntityBoneIndexByName(entity, bone2)
        local bonePos2 = GetWorldPositionOfEntityBone(entity, boneIndex2)
        local distance2 = #(pedCoords - bonePos2)
        local distCheck2 = distance or 3.0
        if bone2 == 'door_pside_r' and IsVehicleDoorDamaged(entity, 3) then distCheck2 = 5.0 end
        if distance2 < distCheck2 then
            return true
        end
    end
    return false
end

function GetClosestStretcher(maxDistance)
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local closestDistance, closestStretcher = nil, nil
    if not ActiveStretchers or not next(ActiveStretchers) then return end
    if not maxDistance then maxDistance = 1000.0 end
    for _, stretcherData in pairs(ActiveStretchers) do
        if stretcherData.inMenu or stretcherData.moving or not stretcherData.coords then goto continue end
        local distance = #(coords - stretcherData.coords)
        if distance > maxDistance then goto continue end
        if not closestDistance or distance < closestDistance then
            closestDistance = distance
            closestStretcher = stretcherData
        end
        ::continue::
    end
    return closestStretcher
end

CreateThread(function()
    local moveAnimLoaded, oldOccupiedStretcher, occupyAnimLoaded, stretcherText, getOffText, stretcherOwnerSet, unfreeze =
        false, nil,
        false, false, false, false,
        false
    while true do
        local sleep = 500
        local ped = PlayerPedId()


        -- IF ACTIVELY MOVING STRETCHER
        if MovingStretcher then
            -- Ensure client has ownership of stretcher
            if not stretcherOwnerSet then
                ForceEntityOwnership(function(success)
                    if success then
                        stretcherOwnerSet = true
                    end
                end, MovingStretcher)
            else
                if not unfreeze then
                    FreezeEntityPosition(MovingStretcher, false)
                    unfreeze = true
                end
                -- Ensure client has anim dictonary loaded (But only once), play animation, and attach to ped
                if not moveAnimLoaded then
                    lib.requestAnimDict('anim@heists@box_carry@', 3000)
                    moveAnimLoaded = true
                    ClearPedTasks(ped)
                    TaskPlayAnim(ped, 'anim@heists@box_carry@', 'idle', 8.0, 1.0, -1, 50, 0, false, false, false)
                    Wait(200)
                    AttachEntityToEntity(MovingStretcher, ped, GetPedBoneIndex(ped, 28422), -0.032, -0.716, -1.269,
                        16.489, 1.863,
                        -1.3292, false, false, false, true, 1, true)
                end
                -- Show text UI if not already shown
                if not stretcherText then
                    wsb.showTextUI(Strings.drop_stretch_ui)
                    stretcherText = true
                end
                -- If not playing anim, play anim
                if not IsEntityPlayingAnim(ped, 'anim@heists@box_carry@', 'idle', 3) then
                    ClearPedTasks(ped)
                    TaskPlayAnim(ped, 'anim@heists@box_carry@', 'idle', 8.0, 1.0, -1, 50, 0, false, false, false)
                end
                -- If not attached to ped, attach to ped
                if not IsEntityAttachedToEntity(ped, MovingStretcher) then
                    AttachEntityToEntity(MovingStretcher, ped, GetPedBoneIndex(ped, 28422), -0.032, -0.716, -1.269,
                        16.489, 1.863, -1.3292, false, false,
                        false, true, 1, true)
                end


                sleep = 0
                DisableControlAction(0, 75, true)
                -- If player releases key, or presses X, detach/place stretcher
                if IsControlJustReleased(0, Config.StretcherKey)
                    or IsDisabledControlJustReleased(0, Config.StretcherKey)
                    or IsDisabledControlJustReleased(0, 305)
                    or IsControlJustReleased(0, 305)
                    or IsDisabledControlJustReleased(0, 120)
                    or IsControlJustReleased(0, 120)
                    or dropStretcher then
                    if not dropStretcher and isStretcherPlacementBlocked(2.5, MovingStretcher) then
                        TriggerEvent('wasabi_bridge:notify', Strings.stretcher_placement_blocked,
                            Strings.stretcher_placement_blocked_desc, 'error')
                    else
                        busyWithStretcherToggle()
                        local stretcherObj = MovingStretcher
                        MovingStretcher = false
                        stretcherOwnerSet = false
                        ClearPedTasks(ped)
                        if dropStretcher then SetEntityCollision(stretcherObj, false, false) end
                        dropStretcher = false
                        DetachEntity(stretcherObj, true, false)
                        if not dropStretcher then
                            SetEntityCollision(stretcherObj, true, true)
                            PlaceObjectOnGroundProperly(stretcherObj)
                            FreezeEntityPosition(stretcherObj, true)
                        end
                        busyWithStretcherToggle()
                        unfreeze = false
                        local stretcherID = GetActiveStretcherIDFromEntity(stretcherObj)
                        if stretcherID then
                            lastStretcherDrop = GetGameTimer()
                            TriggerServerEvent('wasabi_ambulance:updateStretcherStatuses', stretcherID, {
                                coords = GetEntityCoords(stretcherObj),
                                heading = GetEntityHeading(stretcherObj),
                                moving = false,
                            })
                        end
                    end
                end
            end
        end

        -- IF ACTIVELY OCCUPYING STRETCHER
        if OccupyingStretcher then
            -- Ensure client has ownership of stretcher
            if not stretcherOwnerSet then
                ForceEntityOwnership(function(success)
                    if success then
                        stretcherOwnerSet = true
                    end
                end, OccupyingStretcher)
            end

            -- Ensure client has anim dictonary loaded (But only once), play animation, and attach to ped
            if not occupyAnimLoaded then
                oldOccupiedStretcher = OccupyingStretcher
                lib.requestAnimDict('anim@gangops@morgue@table@', 3000)
                occupyAnimLoaded = true
                ClearPedTasks(ped)
                AttachEntityToEntity(ped, OccupyingStretcher, 0, 0, 0.0, 1.90, 0.0, 0.0, 180.0, false, false, false,
                    true, 1, true)
                TaskPlayAnim(ped, 'anim@gangops@morgue@table@', 'body_search', 8.0, 8.0, -1, 33, 0, false, false, false)
            end

            -- If player is removed from stretcher, revert loop to idle
            if not isPlayerOccupyingStretcher(ped, OccupyingStretcher) then
                OccupyingStretcher = false
                stretcherOwnerSet = false
            end

            -- If player not dead, option to get off stretcher
            if not isPlayerDead() and not isStretcherEntityInVehicle(OccupyingStretcher) then
                if not getOffText then
                    wsb.showTextUI(Strings.get_off_stretcher_ui)
                    getOffText = true
                end
                if IsControlJustReleased(0, Config.StretcherKey) or IsDisabledControlJustReleased(0, Config.StretcherKey)
                    or IsDisabledControlJustReleased(0, 305) or IsControlJustReleased(0, 305)
                    or IsDisabledControlJustReleased(0, 120) or IsControlJustReleased(0, 120) then
                    lib.hideTextUI()
                    local stretcherID = GetActiveStretcherIDFromEntity(OccupyingStretcher)
                    if stretcherID then
                        TriggerServerEvent('wasabi_ambulance:updateStretcherStatuses', stretcherID, {
                            occupied = false,
                            moving = false,
                        })
                    end
                    OccupyingStretcher = false
                    stretcherOwnerSet = false
                    getOffText = false
                end
            else
                if getOffText then
                    wsb.hideTextUI()
                    getOffText = false
                end
            end

            -- If not playing anim, play anim
            ped = PlayerPedId()
            if not IsEntityPlayingAnim(ped, 'anim@gangops@morgue@table@', 'body_search', 3) then
                ClearPedTasks(ped)
                TaskPlayAnim(ped, 'anim@gangops@morgue@table@', 'body_search', 8.0, 8.0, -1, 33, 0, false, false,
                    false)
            end

            -- If not attached to ped, attach to ped
            ped = PlayerPedId()
            if OccupyingStretcher and not IsEntityAttachedToEntity(OccupyingStretcher, ped) then
                AttachEntityToEntity(OccupyingStretcher, ped, 0, 0, 0.0, 1.0, 195.0, 0.0, 180.0, false, false, false,
                    true, 1, true)
            end
        end

        if isPlayerDead() and getOffText then
            wsb.hideTextUI()
            getOffText = false
        end

        if OccupyingStretcher or MovingStretcher then
            sleep = 0
            DisableControlAction(0, 22, true)
            DisableControlAction(0, 23, true)
            DisableControlAction(0, 25, true)
            DisableControlAction(0, 140, true)
            DisableControlAction(0, 141, true)
            DisableControlAction(0, 142, true)
            DisablePlayerFiring(PlayerId(), true)
        end

        -- If not moving or occupying stretcher, and anims are loaded, clear anims, memory, and reset vars
        if not OccupyingStretcher and occupyAnimLoaded then
            RemoveAnimDict('anim@gangops@morgue@table@')
            if IsEntityAttachedToAnyObject(ped) then DetachEntity(ped, true, false) end
            local offsetCoords = getOffStretcherCoords(oldOccupiedStretcher)
            ClearPedTasks(ped)
            if offsetCoords then
                SetEntityCoords(ped, offsetCoords.x, offsetCoords.y, offsetCoords.z, false, false, false, false)
                TaskGoStraightToCoord(ped, offsetCoords.x, offsetCoords.y, offsetCoords.z, 1.0, 200, 0.0, 0.0)
            end
            --getOffStretcherAnimation()
            stretcherOwnerSet = false
            OccupyingStretcher = false
            occupyAnimLoaded = false
        end
        if not OccupyingStretcher and getOffText then
            wsb.hideTextUI()
            getOffText = false
        end
        if not MovingStretcher and moveAnimLoaded then
            RemoveAnimDict('anim@heists@box_carry@')
            ClearPedTasks(ped)
            stretcherOwnerSet = false
            moveAnimLoaded = false
            unfreeze = false
        end
        if not MovingStretcher and unfreeze then unfreeze = false end
        if not MovingStretcher and stretcherText then
            wsb.hideTextUI()
            stretcherText = false
        end

        Wait(sleep)
    end
end)

local function openStretcherMenu(id)
    TriggerServerEvent('wasabi_ambulance:setStretcherStatus', id, 'inMenu', true)
    local stretcherData = getActiveStretcherData(id)
    if not stretcherData then return end
    local options = {
        {
            title = Strings.move,
            description = Strings.move_desc,
            icon = 'fas fa-ambulance',
            arrow = false,
            event = 'wasabi_ambulance:moveStretcher',
            disabled = isPlayerDead() == true,
            args = id
        },
        {
            title = Strings.put_in_vehicle,
            description = Strings.put_in_vehicle_desc,
            icon = 'fas fa-ambulance',
            arrow = false,
            event = 'wasabi_ambulance:stretcherInVehicle',
            disabled = (not wsb.getClosestVehicle(stretcherData.coords, 7.5)) or (isPlayerDead() == true),
            args = id
        },
        {
            title = Strings.place_on_stretcher,
            description = Strings.place_on_stretcher_desc,
            icon = 'fas fa-ambulance',
            arrow = false,
            event = 'wasabi_ambulance:placePlayerOnStretcher',
            disabled = (isStretcherOccupied(id) == true) or
                (not wsb.getClosestPlayerPed(GetEntityCoords(cache.ped), 3.0)) or
                (isPlayerDead() == true),
            args = id
        },
        {
            title = Strings.remove_from_stretcher,
            description = Strings.remove_from_stretcher_desc,
            icon = 'fas fa-ambulance',
            arrow = false,
            event = 'wasabi_ambulance:removePlayerFromStretcher',
            disabled = (not isStretcherOccupied(id)) or (isPlayerDead() == true),
            args = id
        },
    }

    local onClose = function()
        local netID = stretcherData.netID
        local stretcherObj = NetToObj(netID)
        if not DoesEntityExist(stretcherObj) then return end
        TriggerServerEvent('wasabi_ambulance:updateStretcherStatuses', id, {
            coords = GetEntityCoords(stretcherObj),
            heading = GetEntityHeading(stretcherObj),
            inMenu = false,
        })
    end

    if Config.MobileMenu.enabled then
        OpenMobileMenu('ems_stretcher_interact', Strings.stretcher_menu_title, options, onClose)
    else
        lib.registerContext({
            id = 'ems_stretcher_interact',
            title = Strings.stretcher_menu_title,
            options = options,
            onExit = onClose()
        })
        lib.showContext('ems_stretcher_interact')
    end
end

local function defineStretcherPointFunctions(point)
    function point:nearby()
        if not self.isClosest or (self.currentDistance and self.currentDistance > self.distance) or not wsb.hasGroup(Config.ambulanceJob) then return end

        if not textUI then
            Wait(1000)
            wsb.showTextUI(Strings.interact_stretcher_ui)
            textUI = true
        end

        if IsControlJustReleased(0, 38) then
            if ((GetGameTimer() - lastStretcherDrop) < 1000) then return end
            wsb.hideTextUI()
            openStretcherMenu(self.index)
        end
    end

    function point:onExit()
        if not self.isClosest or not textUI then return end
        wsb.hideTextUI()
        textUI = nil
    end
end

local function createStretcherPoint(id, coords, distance)
    local point = lib.points.new({
        coords = coords,
        distance = distance,
        index = id
    })

    local point = defineStretcherPointFunctions(point)

    return point
end

local function createStretcherTarget(id, coords, heading, distance)
    -- Create target zone
    local identifier = wsb.target.addBoxZone(coords, heading, vector3(2.0, 2.0, 2.0), distance, {
        {
            event = 'wasabi_ambulance:moveStretcher',
            icon = 'fas fa-ambulance',
            label = Strings.move,
            groups = Config.ambulanceJob,
            canInteract = function()
                return not isPlayerDead() or not MovingStretcher or not OccupyingStretcher
            end,
            args = id
        },
        {
            event = 'wasabi_ambulance:placePlayerOnStretcher',
            icon = 'fas fa-ambulance',
            label = Strings.place_on_stretcher,
            groups = Config.ambulanceJob,
            canInteract = function(entity)
                local stretcherCoords = GetEntityCoords(PlayerPedId())
                local cantInteract = isStretcherOccupied(id) or not wsb.getClosestPlayerPed(stretcherCoords, 3.0) or
                    (isPlayerDead() and true)
                return not cantInteract
            end,
            args = id
        },
        {
            event = 'wasabi_ambulance:removePlayerFromStretcher',
            icon = 'fas fa-ambulance',
            label = Strings.remove_from_stretcher,
            groups = Config.ambulanceJob,
            canInteract = function()
                return (isStretcherOccupied(id) and true) or (isPlayerDead() == true)
            end,
            disabled = (not isStretcherOccupied(id)) or (isPlayerDead() == true),
            args = id
        },
    })
    return identifier
end

local function destroyStretcherZone(stretcherData)
    if Config.targetSystem then
        wsb.target.removeZone(stretcherData.target)
        return
    end
    if not stretcherData.point then return end
    stretcherData.point:remove()
end

function HasAmbulanceSpawnedStretcher(vehicleNetID)
    if not ActiveStretchers or not next(ActiveStretchers) then return false end
    for _, stretcherData in pairs(ActiveStretchers) do
        if (stretcherData.originalVehicleID == vehicleNetID and not stretcherData.inVehicle) or (stretcherData.originalVehicleID == vehicleNetID and stretcherData.inVehicle and stretcherData.inVehicle ~= vehicleNetID) then
            return true
        end
    end
    return false
end

local function moveStretcher(id)
    local stretcherData = getActiveStretcherData(id)
    if not stretcherData then return end
    local stretcherObj = NetToObj(stretcherData.netID)
    if not DoesEntityExist(stretcherObj) then return end
    TriggerServerEvent('wasabi_ambulance:setStretcherStatus', id, 'moving', true)
end

local function spawnStretcherLoop(vehicle)
    lib.requestModel(Config.StretcherProp, 1000)
    local offsetCoords = GetEntityForwardVector(cache.ped)
    if not offsetCoords then return end
    local x, y, z = table.unpack(offsetCoords)
    local obj = CreateObjectNoOffset(Config.StretcherProp, x, y, z, true, true, true)

    while not DoesEntityExist(obj) do Wait(0) end
    local objNetID = NetworkGetNetworkIdFromEntity(obj)
    local heading = GetEntityHeading(obj)
    local vehicleNetID = NetworkGetNetworkIdFromEntity(vehicle)
    local ambulanceData = getAmbulanceOffsetData(vehicle)
    if not ambulanceData then return end
    wsb.serverCallback('wasabi_ambulance:addStretcher', function(id)
        if not id then return end
        busyWithStretcherToggle()
        local vehicleCoords = GetEntityCoords(vehicle)
        TaskTurnPedToFaceCoord(cache.ped, vehicleCoords.x, vehicleCoords.y, vehicleCoords.z, 1000)
        Wait(1000)
        if ambulanceData.trunkAsBackDoor then
            SetVehicleDoorOpen(vehicle, 5, false, false)
            TriggerServerEvent('wasabi_ambulance:setStretcherStatus', id, 'moving', true)
            Wait(1500)
            SetVehicleDoorShut(vehicle, 5, false)
        else
            SetVehicleDoorOpen(vehicle, 2, false, false)
            SetVehicleDoorOpen(vehicle, 3, false, false)
            TriggerServerEvent('wasabi_ambulance:setStretcherStatus', id, 'moving', true)

            Wait(1500)
            SetVehicleDoorShut(vehicle, 2, false)
            SetVehicleDoorShut(vehicle, 3, false)
        end
        busyWithStretcherToggle()
    end, offsetCoords, heading, 5.5, objNetID, vehicleNetID)
    FreezeEntityPosition(obj, false)
end

local function createStretcherFromVehicle(vehicle)
    if not DoesEntityExist(vehicle) then return end
    local vehicleNetID = NetworkGetNetworkIdFromEntity(vehicle)
    local alreadyDeployed = HasAmbulanceSpawnedStretcher(vehicleNetID)
    if alreadyDeployed then
        TriggerEvent('wasabi_bridge:notify', Strings.stretcher_already_deployed, Strings.stretcher_already_deployed_desc,
            'error')
        return
    end
    local ambulanceData = getAmbulanceOffsetData(vehicle)
    if not ambulanceData then return end
    TaskTurnPedToFaceEntity(PlayerPedId(), vehicle, 1000)
    Wait(1000)
    spawnStretcherLoop(vehicle)
end

local function removeStretcherFromVehicle(stretcherID, vehicle)
    if not stretcherID then return end
    if not DoesEntityExist(vehicle) then return end
    local stretcherData = getActiveStretcherData(stretcherID)
    if not stretcherData then return end
    local obj = NetToObj(stretcherData.netID)
    ForceEntityOwnership(function(success)
        if success then
            ForceEntityOwnership(function(ownedVehicle)
                if ownedVehicle then
                    CreateThread(function()
                        local ambulanceData = getAmbulanceOffsetData(vehicle)
                        busyWithStretcherToggle()
                        local vehicleCoords = GetEntityCoords(vehicle)
                        TaskTurnPedToFaceCoord(cache.ped, vehicleCoords.x, vehicleCoords.y, vehicleCoords.z, 1500)
                        Wait(1000)
                        if ambulanceData and ambulanceData.trunkAsBackDoor then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                            TriggerServerEvent('wasabi_ambulance:updateStretcherStatuses', stretcherID, {
                                inVehicle = false,
                                moving = true
                            })
                            Wait(1500)
                            SetVehicleDoorShut(vehicle, 5, false)
                        elseif ambulanceData then
                            SetVehicleDoorOpen(vehicle, 2, false, false)
                            SetVehicleDoorOpen(vehicle, 3, false, false)
                            TriggerServerEvent('wasabi_ambulance:updateStretcherStatuses', stretcherID, {
                                inVehicle = false,
                                moving = true
                            })
                            Wait(1500)
                            SetVehicleDoorShut(vehicle, 2, false)
                            SetVehicleDoorShut(vehicle, 3, false)
                        end
                        busyWithStretcherToggle()
                    end)
                    SetEntityCollision(obj, false, false)
                    DetachEntity(vehicle, true, false)
                end
            end, vehicle)
        end
    end, obj)
end

local function attachStretcherToAmbulance(data)
    local vehicle, stretcherObj, stretcherID = data.vehicle, data.stretcherObj, data.stretcherID
    if not DoesEntityExist(vehicle) then return end
    if not DoesEntityExist(stretcherObj) then return end
    local stretcherData = getActiveStretcherData(stretcherID)
    if not stretcherData then return end
    local ambulanceCoords = getAmbulanceOffsetData(vehicle)
    if not ambulanceCoords then return end
    ForceEntityOwnership(function(success)
        if success then
            MovingStretcher = false
            TriggerServerEvent('wasabi_ambulance:updateStretcherStatuses', stretcherID, {
                inVehicle = VehToNet(vehicle),
                moving = false
            })
            ForceEntityOwnership(function(stretcherOwned)
                if stretcherOwned then
                    SetEntityCollision(stretcherObj, false, false)
                    if MovingStretcher then
                        DetachEntity(MovingStretcher, true, false)
                    end
                    if IsEntityPositionFrozen(stretcherObj) then FreezeEntityPosition(stretcherObj, false) end
                    CreateThread(function()

                    end)
                    AttachEntityToEntity(stretcherObj, vehicle, 0, ambulanceCoords.pos.x, ambulanceCoords.pos.y,
                        ambulanceCoords.pos.z, ambulanceCoords.rot.x, ambulanceCoords.rot.y, ambulanceCoords.rot.z,
                        false, false, false, false, 1, true)
                end
            end, stretcherObj)

            AttachEntityToEntity(stretcherObj, vehicle, 0, ambulanceCoords.pos.x, ambulanceCoords.pos.y,
                ambulanceCoords.pos.z, ambulanceCoords.rot.x, ambulanceCoords.rot.y, ambulanceCoords.rot.z, false,
                false, false, false, 1, true)
        end
    end, vehicle)
end

function PlaceStretcherInVehicle(id)
    local stretcherData = getActiveStretcherData(id)
    if not stretcherData then
        return
    end
    local stretcherObj = NetToObj(stretcherData.netID)
    if not DoesEntityExist(stretcherObj) then return end
    local stretcherCoords = GetEntityCoords(stretcherObj)
    local vehicle = wsb.getClosestVehicle(stretcherCoords, 7.5)
    if not vehicle then
        TriggerEvent('wasabi_bridge:notify', Strings.not_found, Strings.no_vehicle_nearby_desc, 'error')
        return
    end
    local isAmbulance = IsVehicleAmbulance(vehicle)
    if not isAmbulance then
        TriggerEvent('wasabi_bridge:notify', Strings.not_found, Strings.no_ambulance_nearby_desc, 'error')
        return
    end
    local stretcherInsideVehicle = GetStretcherInVehicle(vehicle)
    if stretcherInsideVehicle then
        TriggerEvent('wasabi_bridge:notify', Strings.already_occupied_ambulance,
            Strings.already_occupied_ambulance_desc, 'error')
        return
    end
    if not IsVehicleSeatFree(vehicle, -1) then
        TriggerEvent('wasabi_bridge:notify', Strings.vehicle_occupied, Strings.vehicle_occupied_desc, 'error')
        return
    end
    local ambulanceOffsetCoords = getAmbulanceOffsetData(vehicle)
    if not ambulanceOffsetCoords then
        return
    end
    local ambulanceData = getAmbulanceOffsetData(vehicle)
    busyWithStretcherToggle()
    local vehicleCoords = GetEntityCoords(vehicle)
    TaskTurnPedToFaceCoord(cache.ped, vehicleCoords.x, vehicleCoords.y, vehicleCoords.z, 1000)
    Wait(1000)
    if ambulanceData and ambulanceData.trunkAsBackDoor then
        SetVehicleDoorOpen(vehicle, 5, false, false)
        Wait(1500)
        attachStretcherToAmbulance({
            vehicle = vehicle,
            stretcherObj = stretcherObj,
            stretcherID = id
        })
        SetVehicleDoorShut(vehicle, 5, false)
    elseif ambulanceData then
        SetVehicleDoorOpen(vehicle, 2, false, false)
        SetVehicleDoorOpen(vehicle, 3, false, false)
        Wait(1500)
        attachStretcherToAmbulance({
            vehicle = vehicle,
            stretcherObj = stretcherObj,
            stretcherID = id
        })
        SetVehicleDoorShut(vehicle, 2, false)
        SetVehicleDoorShut(vehicle, 3, false)
    end
    busyWithStretcherToggle()
end

RegisterNetEvent('wasabi_ambulance:placeStretcherInVehicle', function(stretcherID, vehicleNetID)
    local stretcherData = getActiveStretcherData(stretcherID)
    if not stretcherData then return end
    local stretcherObj = NetToObj(stretcherData.netID)
    if not DoesEntityExist(stretcherObj) then return end

    TriggerServerEvent('wasabi_ambulance:setStretcherStatus', stretcherID, 'inVehicle', vehicleNetID)

    local vehicle = NetToVeh(vehicleNetID)
    attachStretcherToAmbulance({
        vehicle = vehicle,
        stretcherObj = stretcherObj,
        stretcherID = stretcherID
    })
end)

local function placePlayerOnStretcher(id)
    local stretcherData = getActiveStretcherData(id)
    if not stretcherData then return end
    if stretcherData.occupied then
        TriggerEvent('wasabi_bridge:notify', Strings.already_occupied_stretcher,
            Strings.already_occupied_stretcher_desc, 'error')
        return
    end
    local ped = PlayerPedId()
    local stretcherObj = NetToObj(stretcherData.netID)
    if not DoesEntityExist(stretcherObj) then return end
    local targetPlayerPed = wsb.getClosestPlayerPed(stretcherData.coords, 3.0)
    if not targetPlayerPed then
        TriggerEvent('wasabi_bridge:notify', Strings.no_nearby, Strings.no_nearby_desc, 'error')
        return
    end
    local targetPlayerID = NetworkGetPlayerIndexFromPed(targetPlayerPed)
    local targetPlayerServerID = GetPlayerServerId(targetPlayerID)
    TriggerServerEvent('wasabi_ambulance:placePlayerOnStretcher', id, targetPlayerServerID)
end

local function removePlayerFromStretcher(id)
    local stretcherData = getActiveStretcherData(id)
    if not stretcherData then return end
    if not stretcherData.occupied then
        TriggerEvent('wasabi_bridge:notify', Strings.not_occupied_stretcher, Strings.not_occupied_stretcher_desc,
            'error')
        return
    end
    local stretcherObj = NetToObj(stretcherData.netID)
    if not DoesEntityExist(stretcherObj) then return end
    TriggerServerEvent('wasabi_ambulance:removePlayerFromStretcher', id, stretcherData.occupied)
end

function ToggleStretcher()
    local ped     = PlayerPedId()
    local coords  = GetEntityCoords(ped)
    local vehicle = wsb.getClosestVehicle(coords, 7.5)
    if not vehicle then
        TriggerEvent('wasabi_bridge:notify', Strings.not_found, Strings.no_vehicle_nearby_desc, 'error')
        return
    end
    local isAmbulance = IsVehicleAmbulance(vehicle)
    if not isAmbulance then
        TriggerEvent('wasabi_bridge:notify', Strings.not_found, Strings.no_ambulance_nearby_desc, 'error')
        return
    end
    local stretcherInsideVehicle = GetStretcherInVehicle(vehicle)
    if not stretcherInsideVehicle then
        createStretcherFromVehicle(vehicle)
        return
    end
    removeStretcherFromVehicle(stretcherInsideVehicle.id, vehicle)
end

RegisterNetEvent('wasabi_ambulance:setLocalStretcherStatus', function(moving, occupying)
    if moving then moving = NetToObj(moving) end
    if occupying then occupying = NetToObj(occupying) end
    MovingStretcher = moving or nil
    OccupyingStretcher = occupying or nil
end)

RegisterNetEvent('wasabi_ambulance:syncStretchers', function(stretchers)
    -- Remove all old stretcher data if applicable
    if ActiveStretchers and next(ActiveStretchers) then
        for _, stretcherData in pairs(ActiveStretchers) do
            destroyStretcherZone(stretcherData)
        end
    end

    -- No stretchers, empty table and return
    if not stretchers or #stretchers < 1 then
        ActiveStretchers = {}
        return
    end

    -- Loop through stretchers and create points/targets where applicable
    for _, stretcherData in pairs(stretchers) do
        if not stretcherData.moving and not stretcherData.inMenu and not stretcherData.inVehicle then -- make sure they are not moving or in active menu
            if Config.targetSystem then
                stretcherData.target = createStretcherTarget(stretcherData.id, stretcherData.coords,
                    stretcherData.heading + 0.0, stretcherData.distance + 0.0)
            else
                stretcherData.point = createStretcherPoint(stretcherData.id, stretcherData.coords,
                    stretcherData.distance + 0.0)
            end
        end
    end

    ActiveStretchers = stretchers
end)

RegisterNetEvent('wasabi_ambulance:placeLocalPlayerOnStretcher', function(id, vehicleNetID)
    local stretcherData = getActiveStretcherData(id)
    if not stretcherData then return end
    local stretcherObj = NetToObj(stretcherData.netID)
    if not DoesEntityExist(stretcherObj) then return end
    local vehicle = NetToVeh(vehicleNetID)
    if not DoesEntityExist(vehicle) then return end
    attachStretcherToAmbulance({
        vehicle = vehicle,
        stretcherObj = stretcherObj,
        stretcherID = id
    })
end)

AddEventHandler('wasabi_ambulance:moveStretcher', function(id)
    if type(id) == 'table' then id = id.args end
    moveStretcher(id)
end)

AddEventHandler('wasabi_ambulance:stretcherInVehicle', function(id)
    if type(id) == 'table' then id = id.args end
    if not id then
        local stretcherData = GetEquippedStretcherData() or GetClosestStretcher(5.0)
        if stretcherData then
            id = stretcherData.id
        end
    end
    PlaceStretcherInVehicle(id)
end)

AddEventHandler('wasabi_ambulance:placePlayerOnStretcher', function(id)
    if type(id) == 'table' then id = id.args end
    placePlayerOnStretcher(id)
end)

AddEventHandler('wasabi_ambulance:removePlayerFromStretcher', function(id)
    if type(id) == 'table' then id = id.args end
    removePlayerFromStretcher(id)
end)

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    DeleteAllStretchers()
end)

AddEventHandler('wasabi_ambulance:toggleStretcher', ToggleStretcher)
exports('toggleStretcher', ToggleStretcher)
exports('deleteStretcherFromVehicle', DeleteStretcherFromVehicle)
exports('deleteAllStretchers', DeleteAllStretchers)

-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

local seconds, minutes = 1000, 60000
Config = {}

-------------------------------------------------------------------
-- TO MODIFY NOTIFICATIONS TO YOUR OWN CUSTOM NOTIFICATIONS:-------
------ Navigate to wasabi_bridge/customize/cl_customize.lua -------
-------------------------------------------------------------------
Config.CheckForUpdates = false -- Check for updates? Who would not want to know updates!?

-- Language Options arez
-- 'en' (English)
-- 'fr' (French)
-- 'cn' (Chinese Simplified)
-- 'tw' (Chinese Traditional)
-- 'de' (German)
-- 'it' (Italian)
-- 'jp' (Japanese)
-- 'ko' (Korean)
-- 'pl' (Polish)
-- 'pt' (Portuguese)
-- 'es' (Spanish)
-- 'hi' (Hindi)
-- 'nl' (Dutch)
-- 'da' (Danish)
-- 'cs' (Czech)
-- If you would like us to add a language, join our discord and create a ticket!
-- Lua strings can be found in /game/configuration/locales/
Config.Language = 'en'
Config.UIColor = 'purple'           -- Can be 'red', 'blue', or a hex '#FF0000'
Config.DeathScreenEffects = true -- Enable screen effects while dead (for applicable death screens)

-- Which style do you want to use for death UI?(Current options: 1, 2, 3, 4, 5)
-- Check docs for examples of all types! https://docs.wasabiscripts.com
Config.DeathScreenType = 1
-- If you want to use the previous death screen(Draw text, not recommended) see docs

Config.ambulanceJobs = { -- Jobs that are considered ambulance jobs (If unsure, likely leave the way it is)
    'ambulance',         -- You must have a job with this name registered
    'fire'            -- They will be treated just like EMS (Job menu, loctions access, etc)
    --'doctor',
    --'fire',
}

Config.MuteDeadPlayers = true -- If a player is dead, should he be muted?

-- Logs
Config.DeathLogs = false  -- Enable death logs via Discord webhook?(Set up in configuration/deathlogs.lua)
Config.ReviveLogs = false -- Enable admin revive logs via Discord webhook? (Linked specifically to admin revives / will not log ALL revives)
Config.LogIPs = false     -- If Config.DeathLogs/Config.ReviveLogs enabled, do you want to logs IP addresses as well?

-- Stretcher Settings
Config.EnableStretcher = true -- Enable stretcher system?
Config.StretcherProp = 'wasabi_stretcher'
Config.StretcherKey = 38      -- Key to place the stretcher on the ground


Config.BagProp = `xm_prop_x17_bag_med_01a`
Config.UseRadialMenu = false             -- Enable use of radial menu built in to ox_lib? (REQUIRES OX_LIB 3.0 OR HIGHER - Editable in client/radial.lua)
Config.EnableAnimReset = false           -- If your death animation does not run correctly, then enable this
Config.MobileMenu = {                    -- Enabling this will use ox_lib menu rather than ox_lib context menu!
    enabled = false,                     -- Use a mobile menu from ox_lib rather than context? (Use arrow keys to navigate menu rather than mouse)
    position =
    'bottom-right'                       -- Choose where menu is positioned. Options : 'top-left' or 'top-right' or 'bottom-left' or 'bottom-right'
}
Config.ProgressCircle = false             -- Set to false to use a progress bar, set to true for progress circle(For checking in, diagnosing, etc)
Config.ProgressCircleLocation = 'bottom' -- Where you want the progress circle located (if enabled)
-- Choices: 'bottom' and 'middle'

Config.policeCanTreat = {
    enabled = false, -- Police can treat patients?
    jobs = {        -- Police / other jobs
        'police',
        'fire',
        'kriminalvarden'
    }
}

-- Enabled keys while dead and while on stretcher
-- https://docs.fivem.net/docs/game-references/controls/
Config.EnabledKeys = {
    dead = { -- while dead
        1,   -- Camera Pan(Mouse)
        2,   -- Camera Tilt(Mouse)
        38,  -- E Key
        46,  -- E Key
        47,  -- G Key
        245, -- T Key
        56,
        --249 -- N Key (default key to speak while dead)
    },

    stretcher = { -- while alive on stretcher
        1,        -- Camera Pan(Mouse)
        2,        -- Camera Tilt(Mouse)
        245,      -- T Key
        249       -- N Key (default key to speak while dead)
    }
}

-- Ambulances and their offsets for placing stretcher within vehicle
Config.AmbulanceOffsets = {
    ['ambulance'] = {            -- Vehicle model name
        trunkAsBackDoor = false, -- If the back doors are the trunk, if they are doors then set as false
        --    pos = { x = -0.26, y = -1.3, z = 0.3 }, -- Offset position
        --    rot = { x = -1.3, y = 0.0, z = 360.0 } -- Rotation
        pos = { x = 0.15, y = -3.0, z = 0.00 },
        rot = { x = -1.3, y = 0.0, z = 90.0 }
    },
    ['ambulance2'] = {            -- Vehicle model name
    trunkAsBackDoor = false, -- If the back doors are the trunk, if they are doors then set as false
    --    pos = { x = -0.26, y = -1.3, z = 0.3 }, -- Offset position
    --    rot = { x = -1.3, y = 0.0, z = 360.0 } -- Rotation
    pos = { x = 0.15, y = -3.0, z = 0.00 },
    rot = { x = -1.3, y = 0.0, z = 90.0 }
},
['ambulance3'] = {            -- Vehicle model name
trunkAsBackDoor = false, -- If the back doors are the trunk, if they are doors then set as false
--    pos = { x = -0.26, y = -1.3, z = 0.3 }, -- Offset position
--    rot = { x = -1.3, y = 0.0, z = 360.0 } -- Rotation
pos = { x = 0.15, y = -3.0, z = 0.00 },
rot = { x = -1.3, y = 0.0, z = 90.0 }
},

    ['20ramambo'] = {           -- Rednecks generic 2020 ambulance
        trunkAsBackDoor = true, -- If the back doors are the trunk, if they are doors then set as false
        pos = { x = 0.0, y = -3.0, z = 1.0 },
        rot = { x = -1.3, y = 0.0, z = 360.0 }
    },

    ['ec135'] = {
        trunkAsBackDoor = false, -- If the back doors are the trunk, if they are doors then set as false
        pos = { x = -0.26, y = -0.6, z = -0.1 },
        rot = { x = -1.3, y = 0.0, z = 360.0 }
    }
}

Config.GPSBlips = {  -- Warning: May experience high usage when at high player count. Possibly turn up refreshrate as remedy!
    enabled = false, -- Enabled?
    refreshrate = 5, -- In Seconds Note: it could impact the server performance
    item = false,    -- Item required? Note: You have to use it then
    blip = {
        sprite = 1,
        color = 1,
        scale = 1.0,
        short = false,
    }
}

-- Position for the draw Text while you are dead
--[[Config.MessagePosition = {
    respawn = { x = 0.5, y = 0.8 },
    bleedout = { x = 0.5, y = 0.8 },
    distress = { x = 0.5, y = 0.86 },
}]]
-- This is obsolete now, if you wish to use 3D text while dead still, see https://docs.wasabiscripts.com

-- Dead animation
Config.DeathAnimation = {
    anim = 'mini@cpr@char_b@cpr_def',
    lib = 'cpr_pumpchest_idle'
}

-- Knockout Feature (If you want players to be knocked out)
Config.KnockoutFeature = {
    enabled = true,           -- Enable knockout features? (player's can knock eachother out using fist fighting)
    healthForKnockout = 150,   -- At what HP will player knockout from fist fighting
    fistDamageModifier = 0.25, -- How much damage will fist cause? (1.0 is default, 0.5 is half as strong, etc)
    duration = 7 * seconds     -- Time to be knocked out when occurs?
}

-- Last Stand (2 Stage death)
Config.LastStand = true                -- Enable a 2 stage death. Where initially you can crawl around(Similiar to qb-ambulancejob)
Config.DisableLastStandCrawl = false   -- Disable crawling within last stand
Config.LastStandTickTime = 5 * seconds -- Everytime this time passes while in last stand, a random amount(8-15) amount of
-- health will be deducted to similuate bleeding out

-- Live injury
Config.EnableLiveInjury = true                             -- Enable live injury system?

Config.DamageDetectThreshold = { armour = 5, health = 10 } -- Damage threshold to detect injury (Default: {armour = 5, health = 10})

Config.BleedMultiplier = {
    shot = 2,    -- How much blood rate to loose when shot
    stabbed = 2, -- How much blood rate to loose when stabbed
    beat = 0,    -- How much blood rate to loose when beat
    burned = 0,  -- How much blood rate to loose when burned
}

Config.BypassInjuryWeapons = { -- Hashes placed in this table will bypass injury reasons
    `WEAPON_UNARMED`,
    `WEAPON_STUNGUN`,
    `WEAPON_DROWNING`,
    `WEAPON_DROWNING_IN_VEHICLE`,
    --  `WEAPON_FALL`,
}


Config.InjuryNotification = true                 -- Enable injury notification?
Config.InjuryNotificationFrequency = 1 * minutes -- How often to notify player of injury

Config.DisableNoJumpInjury = false               -- Disable when being injured that you cant job on occasion
Config.EnablePainPills = true                    -- Enable pain pills? Used to aliviate injurys temporarily

Config.PainPills = {                             -- Add more as you please. The level field simulates the severity of the narcodic; exceed 10 and it could be deadly
    --  ['ITEM_NAME'] = { label = 'ITEM_LABEL', duration = SECONDS }
    ['morphine30'] = { label = 'Morphine 30MG', duration = 120, level = 9 },
    ['morphine15'] = { label = 'Morphine 15MG', duration = 50, level = 5 },
    ['perc30'] = { label = 'Percocet 30MG', duration = 60, level = 6 },
    ['perc10'] = { label = 'Percocet 10MG', duration = 45, level = 4 },
    ['perc5'] = { label = 'Percocet 5MG', duration = 30, level = 2 },
    ['vic10'] = { label = 'Vicodin 10MG', duration = 40, level = 3 },
    ['vic5'] = { label = 'Vicodin 5MG', duration = 20, level = 2 },

}

-- 3rd party scripts
Config.wasabi_crutch = { -- If you use wasabi_crutch:
    ------------------------------------------------------
    --             If you use wasabi_crutch             --
    -- https://store.wasabiscripts.com/category/2080869 --
    ------------------------------------------------------

    -- Crutch Settings
    crutchInMedbag = { -- Enabled? Item name? REQUIRES WASABI_CRUTCH
        enabled = true,
        item = 'crutch'
    },
    crutchInJobMenu = true, -- Crutch menu accessible from job menu if true. REQUIRES WASABI_CRUTCH
    crutchOnCheckIn = {      -- Place crutch for certain amount of time if they visit the hospital or bleedout REQUIRES WASABI_CRUTCH
        enabled = true,     -- Requires wasabi_crutch
        duration = 5         -- How long stuck with crutch after check-in(In minutes)
    },
    -- Chair settings
    chairInMedbag = { -- Enabled? Item name? REQUIRES WASABI_CRUTCH
        enabled = true,
        item = 'wheelchair'
    },
    chairInJobMenu = true -- Chair menu accessible from job menu if true. REQUIRES WASABI_CRUTCH
}

Config.EnviPrescriptions = {
    ---------------------------------------------------
    --       If you use Envi Prescriptions:          --
    -- https://envi-scripts.tebex.io/package/5604452 --
    ---------------------------------------------------
    enabled = false, -- Enable to add option for prescriptions to job menu
    minRank = 1      -- Minimum job level/grade to have this option available
}

Config.phoneDistress = 'qs'        -- Options: 'gks' (GKS Phone - ESX ONLY) / 'qs' (qs-smartphone) / 'd-p' (d-phone) / 'lb' (lb-phone) WILL REPLACE BUILT IN DISPATCH WITH PHONE DISPATCH / Add additonal dispatch in client/cl_customize.lua
Config.customCarlock = false        -- If you use wasabi_carlock OR qb-carlock(Or want to add your own key system to wasabi_bridge/customize/cl_customize.lua)
Config.MythicHospital = false       -- If you use that old injury script by mythic. (Added per request to reset injuries on respawn)
Config.AdvancedParking = false      -- If you use AdvancedParking (Deletes vehicles with their exports)
Config.FuelSystem = false           -- 'legacy' (LegacyFuel) / 'ox' (ox_fuel) / 'default'

Config.jobMenu = 'F6'               -- Default job menu key
Config.billingSystem = false        -- Current options: 'esx' (For esx_billing) / 'qb' (For qbcore users) 'okok' (For okokBilling) / 'pefcl' (For NPWD billing system) (Easy to add more in editable client - SET TO false IF UNDESIRED) or of course false to disable
Config.targetSystem = false          -- Target system for targetting players, medbags, and stretcher(If disabled with replace with menus/3D text) (Compatible out of the box with qTarget, qb-target, and ox_target)

Config.RespawnTimer = 5 * minutes   -- Time before optional respawn
Config.BleedoutTimer = 40 * minutes -- Time before it forces respawn

Config.removeItemsOnDeath = true   -- Must have Config.Inventory set properly
Config.Inventory =
'qs'                                --Options include: 'ox' - (ox_inventory) / 'qb' - (QBCore qb-inventory) 'mf' - (mf-inventory) / 'qs' (qs-inventory) / 'esx' (default esx) / 'other' (whatever else can customize in client/cl_customize.lua)

Config.AntiCombatLog = {            --  When enabled will kill player who logged out while dead
    enabled = true,                 --  enabled?
    notification = {
        enabled = true,             -- enabled notify of wrong-doings??
        title = 'Loggade ut död',
        desc = 'Du lämnade senast död och har nu återvänt död'
    }
}

Config.CompleteDeath = { --DOES NOT APPLY TO QBCORE --  When enabled players can no longer use their character after x deaths
    --DOES NOT APPLY TO QBCORE --  ONLY SUPPORTS esx_multicharacter / You can edit it in server/sv_customize.lua
    enabled = false,     -- enabled?
    maxDeaths = 100,     -- Max 255
}

Config.Bandages = {
    enabled = true,       -- Useable bandages? (Leave false if ox_inventory because they're built in)
    item = 'bandage',      -- YOU MUST ADD THIS ITEM TO YOUR ITEMS, IT DOES NOT COME IN INSTALLATION(COMES WITH QBCORE BY DEFAULT AS ITEM)
    hpRegen = 30,          -- Percentage of health it replenishes (30% by default)
    healBleed = false,     -- Heal bleed that is inflicted by injury system? (Requires injury system enabled)
    duration = 7 * seconds -- Time to use
}

Config.EMSItems = {
    revive = {
        item = 'defib', -- Item used for reviving
        remove = false  -- Remove item when using?
    },
    heal = {
        item = 'medikit',       -- Item used for healing
        duration = 5 * seconds, -- Time to use
        healBleed = true,       -- Heal bleed?
        remove = true           -- Remove item when using?
    },
    sedate = {
        item = 'sedative',      -- Item used to sedate players temporarily
        duration = 8 * seconds, -- Time sedative effects last
        remove = true           -- Remove item when using?
    },
    medbag = 'medbag',          -- Medbag item name used for getting supplies to treat patient
}

Config.ReviveRewards = {
    enabled = true,           -- Enable cash rewards for reviving
    paymentAccount = 'cash', -- If you have old ESX 1.1 you may need to switch to 'cash'
    no_injury = 4000,         -- If above enabled, how much reward for fully treated patient with no injury in diagnosis
    burned = 3000,            -- How much if player is burned and revived without being treated
    beat = 2500,              -- So on, so forth
    stabbed = 2000,
    bleedout = 2000,          -- NEW
    shot = 1500,
}

Config.ReviveHealth = { -- How much health to deduct for those revived without proper treatment
    shot = 60,          -- Ex. If player is shot and revived without having the gunshots treated; they will respond with 60 health removed
    stabbed = 50,
    beat = 40,
    burned = 20
}

Config.TreatmentTime = 9 * seconds -- Time to perform treatment
Config.DiagnoseTime = 7 * seconds  -- Time to diagnose patient

Config.TreatmentItems = {
    shot = 'tweezers',
    stabbed = 'suturekit',
    beat = 'icepack',
    burned = 'burncream'
}

Config.lowHealthAlert = {
    enabled = true,
    health = 140, -- Notify when at HP (200 full health / 100 is death)
    notification = {
        title = 'UPPMÄRKSAMHET',
        description = 'Du Måste ta dig till ett Sjukhus omedelbart! Eller kontakta Ambulansen'
    }
}

Config.EnableStandaloneCheckIns = true -- Enable stand-alone check-in locations? For grandmas, prisons, whatever
Config.StandaloneCheckIns = {

    Prison = {                                        -- Example, QB Prison check-in
        Ped = 's_m_m_scientist_01',                   -- Check in ped
        Coords = vec3(1729.03, 2563.33, 45.56 - 0.9), -- Coords of ped
        Distance = 4.85,                              -- Distance to show textUI (If target is not enabled below)
        Heading = 181.42,                             -- Heading of ped
        Cost = 5,                                     -- Cost of using hospital check-in. Set to false for free
        Duration = 150 * seconds,                      -- Time it takes to spend in hospital bed
        PayAccount = 'bank',                          -- Account dead player pays from to check-in
        Label = '[E] - Checka in',                     -- label of text UI if target is not enabled below
        HotKey = 38,                                  -- Default: 38 (E) (If target below is not enabled)
        Target = {
            enabled = false,                           -- Enable Target? (Can be customized in wasabi_bridge/customize/cl_customize.lua the target system)
            label = 'Checka In',
            coords = vec3(1729.03, 2563.33, 45.56),
            heading = 63.26,
            distance = 5.0,
            width = 2.0,
            length = 1.0,
            minZ = 43.28 - 0.9,
            maxZ = 43.28 + 0.9
        },
        DisableHospitalBeds = true,                                                          -- Disable hospital beds for check-in at this location?(Player will spend Duration checking in before respawning in RespawnNoBedLocation coords when set to true)
        RespawnNoBedLocation = { coords = vec3(1729.03, 2563.33, 45.56), heading = 339.02 }, -- Coords and heading of where to spawn player if DisableHospitalBeds is set to true or beds full
        HospitalBeds = {
            --              { coords = vec3(332.62, -587.17, 42.84+0.3), heading = 160.0 },
            { coords = vec3(317.67, -585.37, 42.84 + 0.3), heading = 160.0 },
        }
    },

    Kriminell = {                                        -- Example, QB Prison check-in
    Ped = 'mp_f_cocaine_01',                  -- Check in ped
    Coords = vector3(1126.9754638672, -1238.9832763672, 21.433271408081-0.9), -- Coords of ped
    Distance = 4.85,                             -- Distance to show textUI (If target is not enabled below)
    Heading = 217.02,                             -- Heading of ped
    Cost = 30000,                                 -- Cost of using hospital check-in. Set to false for free
    Duration = 120 * seconds,                     -- Time it takes to spend in hospital bed
    PayAccount = 'bank',                         -- Account dead player pays from to check-in
    Label = '[E] - Checka In',                    -- label of text UI if target is not enabled below
    HotKey = 38,                                 -- Default: 38 (E) (If target below is not enabled)
    Target = {
        enabled = false,                          -- Enable Target? (Can be customized in wasabi_bridge/customize/cl_customize.lua the target system)
        label = 'Checka In',
        coords = vector3(1126.9754638672, -1238.9832763672, 21.433271408081),
        heading = 63.26,
        distance = 5.0,
        width = 2.0,
        length = 1.0,
        minZ = 43.28 - 0.9,
        maxZ = 43.28 + 0.9
    },
    DisableHospitalBeds = true,                                                       -- Disable hospital beds for check-in at this location?(Player will spend Duration checking in before respawning in RespawnNoBedLocation when set to true)
    RespawnNoBedLocation = { coords = vector3(1126.4063720703, -1243.0695800781, 21.367427825928), heading = 153.79}, -- Coords and heading of where to spawn player if DisableHospitalBeds is set to true or beds are full
    HospitalBeds = {
    }
},

}

Config.Locations = {
    Sjukhuset = {
        RespawnPoint = { -- When player dies and bleeds out; they will revive at nearest hospital; Define the coords of this hospital here.
        coords = vec3(-483.27838134766, -1034.4128417969, 33.68928527832),
            heading = 332.22,
            -- Even if you have useCheckInInstead to true, you must still define these coords for finding closest hospital
            -- If you want to use check-in instead of respawning at this location(Otherwise will just spawn at the coords above)
            useCheckInInstead = true
        },
        Blip = {
            Enabled = true,
            Coords = vector3(-455.02294921875, -1024.5690917969, 34.604675292969),
            Sprite = 61,
            Color = 0,
            Scale = 0.8,
            String = 'Sjukhuset'
        },

        clockInAndOut = {
            enabled = false,                       -- Enable clocking in and out at a set location? (If using ESX you must have a off duty job for Config.ambulanceJob with same grades - example in main _install_first directory)
            coords = vec3(334.75, -580.24, 43.28), -- Location of where to go on and off duty(If not using target)
            label = '[E] - Go On/Off Duty',        -- Text to display(If not using target)
            distance = 3.0,                        -- Distance to display text UI(If not using target)
            target = {
                enabled = false,                   -- If enabled, the location and distance above will be obsolete
                label = 'Go On/Off Duty',
                coords = vec3(334.75, -580.24, 43.28),
                heading = 337.07,
                width = 2.0,
                length = 1.0,
                minZ = 43.28 - 0.9,
                maxZ = 43.28 + 0.9
            }
        },

        PersonalLocker = {
            enabled = false,                        -- Enable personal locker(stash) - THIS IS CURRENTLY ONLY AVALIABLE IN QB-INVENTORY
            coords = vec3(298.6, -598.45, 43.28),   -- Location of where to access personal locker (If target is disabled)
            label = '[E] - Access Personal Locker', -- Text to display(If not using target)
            distance = 1.5,                         -- Distance to display text UI(If not using target)
            target = {
                enabled = false,                    -- If enabled, the location and distance above will be obsolete
                label = 'Access Locker',
                coords = vec3(298.6, -598.45, 43.28),
                heading = 70.18,
                width = 2.0,
                length = 1.0,
                minZ = 43.28 - 0.9,
                maxZ = 43.28 + 0.9
            }
        },


        BossMenu = {
            Enabled = false,                        -- Enabled boss menu?
            Coords = vec3(-486.06558227539,-1002.8812866211,33.68928527832), -- Location of boss menu (If not using target)
            Label = '[E] - Få tillgång till chefsmenyn', -- Text UI label string (If not using target)
            Distance = 2.5,                        -- Distance to allow access/prompt with text UI (If not using target)
            Target = {
                enabled = false,                   -- Enable Target? (Can be customized in wasabi_bridge/customize/cl_customize.lua the target system)
                label = 'Access Boss Menu',
                coords = vec3(335.59, -594.33, 43.21),
                heading = 269.85,
                width = 2.0,
                length = 1.0,
                minZ = 43.21 - 0.9,
                maxZ = 43.21 + 0.9
            }
        },

        CheckIn = {                                      -- Hospital check-in
            Enabled = true,                              -- Enable ped and check-in area?
            Ped = 's_m_m_scientist_01',                  -- Check in ped
            Coords = vector3(-498.23596191406, -984.27850341797, 24.289203643799-0.9), -- Coords of ped
            Distance = 4.85,                             -- Distance to show textUI (If target is not enabled below)
            Heading = 170,                             -- Heading of ped
            Cost = 3000,                                 -- Cost of using hospital check-in. Set to false for free
            Duration = 15 * seconds,                     -- Time it takes to spend in hospital bed
            MaxOnDuty = 6,                               -- If this amount or less you can use, otherwise it will tell you that EMS is avaliable(Set to false to always enable check-in)
            PayAccount = 'bank',                         -- Account dead player pays from to check-in
            Label = '[E] - Checka In',                    -- label of text UI if target is not enabled below
            HotKey = 38,                                 -- Default: 38 (E) (If target below is not enabled)
            Target = {
                enabled = false,                          -- Enable Target? (Can be customized in wasabi_bridge/customize/cl_customize.lua the target system)
                label = 'Checka In',
                coords = vector3(-498.23596191406, -984.27850341797, 24.289203643799),
                heading = 63.26,
                distance = 5.0,
                width = 2.0,
                length = 1.0,
                minZ = 43.28 - 0.9,
                maxZ = 43.28 + 0.9
            },
            DisableHospitalBeds = false,                                                       -- Disable hospital beds for check-in at this location?(Player will spend Duration checking in before respawning in RespawnNoBedLocation when set to true)
            RespawnNoBedLocation = { coords = vector3(-498.23596191406, -984.27850341797, 24.289203643799), heading = 199.23}, -- Coords and heading of where to spawn player if DisableHospitalBeds is set to true or beds are full
            HospitalBeds = {
                --              { coords = vec3(332.62, -587.17, 42.84+0.3), heading = 160.0 },
                { coords = vector3(-458.62719726562, -1024.3952636719, 34.604621887207-0.3), heading = 0.0 },
                { coords = vector3(-454.85140991211, -1024.2431640625, 34.604621887207-0.3), heading = 0.0 },
                { coords = vector3(-450.98419189453, -1024.1080322266, 33.840312957764-0.3),  heading = 0.0 },
                { coords = vector3(-447.25830078125, -1024.3907470703, 34.604640960693-0.3), heading = 0.0 },
                { coords = vector3(-447.25503540039, -1029.9970703125, 34.604713439941-0.3), heading = 180.0 },
                { coords = vector3(-451.19546508789, -1030.1932373047, 34.60470199585-0.3), heading = 180.0 },
                { coords = vector3(-454.94235229492, -1029.9313964844, 34.604721069336-0.3), heading = 180.0 },
                { coords = vector3(-458.75561523438, -1030.1389160156, 34.604644775391)-0.3,  heading = 180.0 },
                -- Stock qb-ambulance hospital bed coords:
                --                { coords = vec3(353.1, -584.6, 43.11), heading = 152.08 },
                --                { coords = vec3(356.79, -585.86, 43.11), heading = 152.08 },
                --                { coords = vec3(354.12, -593.12, 43.1), heading = 336.32 },
                --                { coords = vec3(350.79, -591.8, 43.1), heading = 336.32 },
                --                { coords = vec3(346.99, -590.48, 43.1), heading = 336.32 },
                --                { coords = vec3(360.32, -587.19, 43.02), heading = 152.08 },
                --                { coords = vec3(349.82, -583.33, 43.02), heading = 152.08 },
                --                { coords = vec3(326.98, -576.17, 43.02), heading = 152.08 }
            }

        },

        Cloakroom = {
            Enabled = true,
            Coords = vector3(-483.21890258789, -1018.5471801758, 33.68928527832), -- Coords of cloakroom
            Label = '[E] - Byta kläder',     -- String of text ui of cloakroom
            HotKey = 38,                        -- Default: 38 (E)
            Range = 1.5,                        -- Range away from coords you can use.
            Uniforms = { -- Uniform choices
                [1] = { -- Order it will display
                    label = 'Jobbkläder Sommar', -- Name of outfit that will display in menu
                    male = { -- Male variation
                        ['tshirt_1'] = 141,  ['tshirt_2'] = 0,
                        ['torso_1'] = 340,   ['torso_2'] = 0,
                        ['arms'] = 35,
                        ['mask_1'] = 27,   ['mask_2'] = 0,                        
                        ['pants_1'] = 66,   ['pants_2'] = 0,
                        ['shoes_1'] = 63,   ['shoes_2'] = 0,
                        ['helmet_1'] = 136,  ['helmet_2'] = 0,
                        ['decals_1'] = 57,  ['decals_2'] = 0,
                        ['chains_1'] = 157,  ['chains_2'] = 0,                                                
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 4,   ['torso_2'] = 14,
                        ['arms'] = 4,
                        ['pants_1'] = 25,   ['pants_2'] = 1,
                        ['shoes_1'] = 16,   ['shoes_2'] = 4,
                    }
                },

                [2] = { -- Order it will display
                    label = 'Jobbkläder Vinter', -- Name of outfit that will display in menu
                    male = { -- Male variation
                        ['tshirt_1'] = 141,  ['tshirt_2'] = 0,
                        ['torso_1'] = 341,   ['torso_2'] = 0,
                        ['arms'] = 44,
                        ['mask_1'] = 27,   ['mask_2'] = 0,                        
                        ['pants_1'] = 66,   ['pants_2'] = 0,
                        ['shoes_1'] = 63,   ['shoes_2'] = 0,
                        ['helmet_1'] = 136,  ['helmet_2'] = 0,
                        ['decals_1'] = 57,  ['decals_2'] = 0,
                        ['chains_1'] = 157,  ['chains_2'] = 0,                                                
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 4,   ['torso_2'] = 14,
                        ['arms'] = 4,
                        ['pants_1'] = 25,   ['pants_2'] = 1,
                        ['shoes_1'] = 16,   ['shoes_2'] = 4,
                    }
                },

                [2] = { -- Order it will display
                    label = 'Möteskläder', -- Name of outfit that will display in menu
                    male = { -- Male variation
                        ['tshirt_1'] = 163,  ['tshirt_2'] = 0,
                        ['torso_1'] = 404,   ['torso_2'] = 0,
                        ['arms'] = 4,                     
                        ['pants_1'] = 10,   ['pants_2'] = 0,
                        ['shoes_1'] = 10,   ['shoes_2'] = 0,
                        ['helmet_1'] = 136,  ['helmet_2'] = 0,
                        ['chains_1'] = 158,  ['chains_2'] = 0,                                                
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 4,   ['torso_2'] = 14,
                        ['arms'] = 4,
                        ['pants_1'] = 25,   ['pants_2'] = 1,
                        ['shoes_1'] = 16,   ['shoes_2'] = 4,
                    }
                },

                [3] = { -- Order it will display
                    label = 'Utbildnings Kläder', -- Name of outfit that will display in menu
                    male = { -- Male variation
                        ['tshirt_1'] = 141,  ['tshirt_2'] = 0,
                        ['torso_1'] = 360,   ['torso_2'] = 0,
                        ['arms'] = 35,
                        ['mask_1'] = 27,   ['mask_2'] = 0,                                             
                        ['pants_1'] = 66,   ['pants_2'] = 0,
                        ['shoes_1'] = 63,   ['shoes_2'] = 0,
                        ['helmet_1'] = 136,  ['helmet_2'] = 0,
                        ['decals_1'] = 57,  ['decals_2'] = 0,                        
                        ['chains_1'] = 157,  ['chains_2'] = 0,
                        ['bulletproof_1'] = 3,  ['bulletproof_2'] = 3,                                                                                                
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 4,   ['torso_2'] = 14,
                        ['arms'] = 4,
                        ['pants_1'] = 25,   ['pants_2'] = 1,
                        ['shoes_1'] = 16,   ['shoes_2'] = 4,
                    }
                },

                [4] = { -- Order it will display
                    label = 'Kirurg Kläder Nivå 1', -- Name of outfit that will display in menu
                    male = { -- Male variation
                        ['tshirt_1'] = 77,  ['tshirt_2'] = 0,
                        ['torso_1'] = 176,   ['torso_2'] = 0,
                        ['arms'] = 80,
                        ['mask_1'] = 185,   ['mask_2'] = 2,                                             
                        ['pants_1'] = 74,   ['pants_2'] = 0,
                        ['shoes_1'] = 63,   ['shoes_2'] = 0,
                        ['helmet_1'] = 26,  ['helmet_2'] = 0,                       
                        ['chains_1'] = 61,  ['chains_2'] = 0,                                                                                               
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 4,   ['torso_2'] = 14,
                        ['arms'] = 4,
                        ['pants_1'] = 25,   ['pants_2'] = 1,
                        ['shoes_1'] = 16,   ['shoes_2'] = 4,
                    }
                },

                [5] = { -- Order it will display
                    label = 'Kirurg Kläder Nivå 2', -- Name of outfit that will display in menu
                    male = { -- Male variation
                        ['tshirt_1'] = 77,  ['tshirt_2'] = 2,
                        ['torso_1'] = 176,   ['torso_2'] = 2,
                        ['arms'] = 76,
                        ['mask_1'] = 185,   ['mask_2'] = 2,                                             
                        ['pants_1'] = 74,   ['pants_2'] = 2,
                        ['shoes_1'] = 63,   ['shoes_2'] = 0,
                        ['helmet_1'] = 26,  ['helmet_2'] = 0,                       
                        ['chains_1'] = 61,  ['chains_2'] = 0,                                                                                               
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 4,   ['torso_2'] = 14,
                        ['arms'] = 4,
                        ['pants_1'] = 25,   ['pants_2'] = 1,
                        ['shoes_1'] = 16,   ['shoes_2'] = 4,
                    }
                },

                [6] = { -- Order it will display
                    label = 'Kirurg Kläder Nivå 3', -- Name of outfit that will display in menu
                    male = { -- Male variation
                        ['tshirt_1'] = 77,  ['tshirt_2'] = 3,
                        ['torso_1'] = 176,   ['torso_2'] = 3,
                        ['arms'] = 91,
                        ['mask_1'] = 185,   ['mask_2'] = 0,                                             
                        ['pants_1'] = 74,   ['pants_2'] = 3,
                        ['shoes_1'] = 63,   ['shoes_2'] = 0,
                        ['helmet_1'] = 26,  ['helmet_2'] = 0,                       
                        ['chains_1'] = 61,  ['chains_2'] = 0,                                                                                               
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 4,   ['torso_2'] = 14,
                        ['arms'] = 4,
                        ['pants_1'] = 25,   ['pants_2'] = 1,
                        ['shoes_1'] = 16,   ['shoes_2'] = 4,
                    }
                },

                [7] = { -- Order it will display
                    label = 'Kirurg Kläder Nivå 4', -- Name of outfit that will display in menu
                    male = { -- Male variation
                        ['tshirt_1'] = 77,  ['tshirt_2'] = 1,
                        ['torso_1'] = 176,   ['torso_2'] = 1,
                        ['arms'] = 87,
                        ['mask_1'] = 185,   ['mask_2'] = 0,                                             
                        ['pants_1'] = 74,   ['pants_2'] = 1,
                        ['shoes_1'] = 63,   ['shoes_2'] = 0,
                        ['helmet_1'] = 26,  ['helmet_2'] = 0,                       
                        ['chains_1'] = 61,  ['chains_2'] = 0,                                                                                               
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 4,   ['torso_2'] = 14,
                        ['arms'] = 4,
                        ['pants_1'] = 25,   ['pants_2'] = 1,
                        ['shoes_1'] = 16,   ['shoes_2'] = 4,
                    }
                },

                [8] = { -- Order it will display
                    label = 'Kirurg Kläder Nivå 6', -- Name of outfit that will display in menu
                    male = { -- Male variation
                        ['tshirt_1'] = 77,  ['tshirt_2'] = 1,
                        ['torso_1'] = 176,   ['torso_2'] = 1,
                        ['arms'] = 51,
                        ['mask_1'] = 185,   ['mask_2'] = 0,                                             
                        ['pants_1'] = 70,   ['pants_2'] = 1,
                        ['shoes_1'] = 63,   ['shoes_2'] = 0,
                        ['helmet_1'] = 26,  ['helmet_2'] = 0,                       
                        ['chains_1'] = 61,  ['chains_2'] = 0,                                                                                               
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 4,   ['torso_2'] = 14,
                        ['arms'] = 4,
                        ['pants_1'] = 25,   ['pants_2'] = 1,
                        ['shoes_1'] = 16,   ['shoes_2'] = 4,
                    }
                },

                [9] = { -- Order it will display
                    label = 'Mc Kläder', -- Name of outfit that will display in menu
                    male = { -- Male variation
                        ['tshirt_1'] = 87,  ['tshirt_2'] = 3,
                        ['torso_1'] = 250,   ['torso_2'] = 1,
                        ['arms'] = 177,
                        ['mask_1'] = 68,   ['mask_2'] = 0,                                             
                        ['pants_1'] = 80,   ['pants_2'] = 0,
                        ['shoes_1'] = 63,   ['shoes_2'] = 0,
                        ['helmet_1'] = 76,  ['helmet_2'] = 8,
                        ['decals_1'] = 56,  ['decals_2'] = 0,                                               
                        ['chains_1'] = 61,  ['chains_2'] = 0,
                        ['glasses_1'] = 15,  ['glasses_2'] = 0,                        
                        ['bulletproof_1'] = 41,  ['bulletproof_2'] = 0,                        
                                                                                                                       
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 4,   ['torso_2'] = 14,
                        ['arms'] = 4,
                        ['pants_1'] = 25,   ['pants_2'] = 1,
                        ['shoes_1'] = 16,   ['shoes_2'] = 4,
                    }
                },

                [10] = { -- Order it will display
                    label = 'Atv Kläder', -- Name of outfit that will display in menu
                    male = { -- Male variation
                        ['tshirt_1'] = 87,  ['tshirt_2'] = 3,
                        ['torso_1'] = 250,   ['torso_2'] = 1,
                        ['arms'] = 177,
                        ['mask_1'] = 68,   ['mask_2'] = 0,                                             
                        ['pants_1'] = 80,   ['pants_2'] = 0,
                        ['shoes_1'] = 63,   ['shoes_2'] = 0,
                        ['helmet_1'] = 76,  ['helmet_2'] = 8,
                        ['decals_1'] = 56,  ['decals_2'] = 0,                                               
                        ['chains_1'] = 61,  ['chains_2'] = 0,
                        ['glasses_1'] = 15,  ['glasses_2'] = 0,                        
                        ['bulletproof_1'] = 41,  ['bulletproof_2'] = 0,                        
                                                                                                                       
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 4,   ['torso_2'] = 14,
                        ['arms'] = 4,
                        ['pants_1'] = 25,   ['pants_2'] = 1,
                        ['shoes_1'] = 16,   ['shoes_2'] = 4,
                    }
                },

                [11] = { -- Order it will display
                    label = 'Båtkläder', -- Name of outfit that will display in menu
                    male = { -- Male variation
                        ['tshirt_1'] = 141,  ['tshirt_2'] = 0,
                        ['torso_1'] = 341,   ['torso_2'] = 0,
                        ['arms'] = 43,
                        ['mask_1'] = 185,   ['mask_2'] = 0,                                             
                        ['pants_1'] = 66,   ['pants_2'] = 1,
                        ['shoes_1'] = 63,   ['shoes_2'] = 0,
                        ['helmet_1'] = 117,  ['helmet_2'] = 8,
                        ['decals_1'] = 57,  ['decals_2'] = 0,                                               
                        ['chains_1'] = 157,  ['chains_2'] = 0,
                        ['glasses_1'] = 1,  ['glasses_2'] = 1,                        
                        ['bulletproof_1'] = 6,  ['bulletproof_2'] = 3,                        
                                                                                                                       
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 4,   ['torso_2'] = 14,
                        ['arms'] = 4,
                        ['pants_1'] = 25,   ['pants_2'] = 1,
                        ['shoes_1'] = 16,   ['shoes_2'] = 4,
                    }
                },

                [12] = { -- Order it will display
                    label = 'Jetskikläder', -- Name of outfit that will display in menu
                    male = { -- Male variation
                        ['tshirt_1'] = 141,  ['tshirt_2'] = 0,
                        ['torso_1'] = 340,   ['torso_2'] = 0,
                        ['arms'] = 42,
                        ['mask_1'] = 158,   ['mask_2'] = 0,                                             
                        ['pants_1'] = 66,   ['pants_2'] = 1,
                        ['shoes_1'] = 63,   ['shoes_2'] = 0,
                        ['helmet_1'] = 103,  ['helmet_2'] = 2,
                        ['decals_1'] = 57,  ['decals_2'] = 0,                                               
                        ['chains_1'] = 157,  ['chains_2'] = 0,
                        ['glasses_1'] = 30,  ['glasses_2'] = 1,                        
                        ['bulletproof_1'] = 6,  ['bulletproof_2'] = 3,                        
                                                                                                                       
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 4,   ['torso_2'] = 14,
                        ['arms'] = 4,
                        ['pants_1'] = 25,   ['pants_2'] = 1,
                        ['shoes_1'] = 16,   ['shoes_2'] = 4,
                    }
                },

                [12] = { -- Order it will display
                    label = 'Dykarkläder', -- Name of outfit that will display in menu
                    male = { -- Male variation
                        ['tshirt_1'] = 123,  ['tshirt_2'] = 0,
                        ['torso_1'] = 176,   ['torso_2'] = 1,
                        ['arms'] = 101,
                        ['mask_1'] = 138,   ['mask_2'] = 0,                                             
                        ['pants_1'] = 128,   ['pants_2'] = 5,
                        ['shoes_1'] = 19,   ['shoes_2'] = 0,
                        ['helmet_1'] = 26,  ['helmet_2'] = 0,
                        ['decals_1'] = 56,  ['decals_2'] = 0,                                               
                        ['glasses_1'] = 27,  ['glasses_2'] = 0,                        
                        ['bulletproof_1'] = 6,  ['bulletproof_2'] = 3,                        
                                                                                                                       
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 4,   ['torso_2'] = 14,
                        ['arms'] = 4,
                        ['pants_1'] = 25,   ['pants_2'] = 1,
                        ['shoes_1'] = 16,   ['shoes_2'] = 4,
                    }
                },

                [13] = { -- Order it will display
                    label = 'Helikopter Kläder', -- Name of outfit that will display in menu
                    male = { -- Male variation
                        ['tshirt_1'] = 141,  ['tshirt_2'] = 0,
                        ['torso_1'] = 353,   ['torso_2'] = 0,
                        ['arms'] = 43,
                        ['mask_1'] = 169,   ['mask_2'] = 0,                                             
                        ['pants_1'] = 66,   ['pants_2'] = 0,
                        ['shoes_1'] = 63,   ['shoes_2'] = 0,
                        ['helmet_1'] = 19,  ['helmet_2'] = 0,
                        ['decals_1'] = 57,  ['decals_2'] = 0,                                               
                        ['glasses_1'] = 27,  ['glasses_2'] = 0,                        
                        ['bulletproof_1'] = 6,  ['bulletproof_2'] = 1,                        
                                                                                                                       
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 4,   ['torso_2'] = 14,
                        ['arms'] = 4,
                        ['pants_1'] = 25,   ['pants_2'] = 1,
                        ['shoes_1'] = 16,   ['shoes_2'] = 4,
                    }
                },

                [14] = { -- Order it will display
                    label = 'Jourläkar Kläder', -- Name of outfit that will display in menu
                    male = { -- Male variation
                        ['tshirt_1'] = 70,  ['tshirt_2'] = 0,
                        ['torso_1'] = 162,   ['torso_2'] = 0,
                        ['arms'] = 41,
                        ['mask_1'] = 27,   ['mask_2'] = 0,                                             
                        ['pants_1'] = 87,   ['pants_2'] = 0,
                        ['shoes_1'] = 63,   ['shoes_2'] = 0,
                        ['helmet_1'] = 136,  ['helmet_2'] = 0,
                        ['decals_1'] = 57,  ['decals_2'] = 0,
                        ['chains_1'] = 61,  ['chains_2'] = 0,                                                                       
                        ['glasses_1'] = 27,  ['glasses_2'] = 0,                        
                        ['bulletproof_1'] = 6,  ['bulletproof_2'] = 2,                        
                                                                                                                       
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 4,   ['torso_2'] = 14,
                        ['arms'] = 4,
                        ['pants_1'] = 25,   ['pants_2'] = 1,
                        ['shoes_1'] = 16,   ['shoes_2'] = 4,
                    }
                },                                                                                                                                                                                                                
            }
        },

        MedicalSupplies = {                                                     -- EMS Shop for supplies
            Enabled = true,                                                     -- If set to false, rest of this table do not matter
            Ped = 's_m_m_doctor_01',                                            -- Ped to target
            Coords = vector3(-482.91033935547, -1006.5134887695, 24.289461135864),                       -- Coords of ped/target
            Heading =  169.30407714844,                                                   -- Heading of ped
            Supplies = {     
                { item = 'morphine30', label = 'Morphine 30MG', price = 100 },    
                { item = 'morphine15', label = 'Morphine 15MG', price = 100 },         
                { item = 'perc30', label = 'Percocet 30MG', price = 100 },         
                { item = 'perc10', label = 'Percocet 10MG', price = 100 },             
                { item = 'perc5', label = 'Percocet 5MG', price = 100 },    
                { item = 'vic10', label = 'Vicodin 10MG', price = 100 },              
                { item = 'vic5', label = 'Vicodin 5MG', price = 100 },                           -- Supplies
            { item = 'defib', label = 'Defibrillator', price = 100 }, -- Pretty self explanatory, price may be set to 'false' to make free
            { item = 'radio', label = 'Radio', price = 100 },
                { item = 'medbag', label = 'Medicineväska', price = 100 }, -- Pretty self explanatory, price may be set to 'false' to make free
                { item = 'medikit', label = 'Förbandsväska', price = 150 },
                { item = 'alvedon', label = 'Alvedon 500 mg', price = 150 },
                { item = 'ipren', label = 'Ipren 400 mg', price = 175 },
                { item = 'panodil', label = 'Panodil 500 mg', price = 150 },
                { item = 'aqua', label = 'Salvequick Aqua', price = 150 },
                { item = 'apoteket', label = 'Apoteket Sterilt Snabbförband', price = 160 },
                { item = 'tiger', label = 'Tiger Balsam 25 g', price = 125 },
                { item = 'idomin', label = 'Idomin Salva 100 g', price = 180 },
                { item = 'voltaren', label = 'Voltaren 23,2 mg', price = 110 },
            }
        },
     Helicopters = {                                   -- Vehicle Garage
        Enabled = true,                            -- Enable? False if you have you're own way for medics to obtain vehicles.
        Zone = {
            coords = vector3(-462.56741333008, -1026.3413085938, 38.29997253418), -- Area to prompt vehicle garage
            range = 5.5,                           -- Range it will prompt from coords above
            label = '[E] - Öppna Garage',
            return_label = '[E] - Lämna TIllbaka Bil'
        },
        Spawn = {
            -- land = {
            --     coords = vector3(340.15710449219, -584.11102294922, 74.161682128906),
            --     heading = 253.55
            -- },
            air = {
                coords = vector3(-454.03567504883, -1029.7774658203, 38.396789550781),
                heading = 179.95
            }
        },
        Options = {
            [0] = {   
        --     ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        --     label = 'Helikopter - AugustaWestland AW139',
        --     category = 'air', -- Options are 'land' and 'air'
        -- },
        -- ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        --     label = 'Helikopter - Swedish Air Ambulance',
        --     category = 'air', -- Options are 'land' and 'air'
        -- },
        -- ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        --     label = 'Helikopter - Röda Svenska Ambulansen',
        --     category = 'air', -- Options are 'land' and 'air'
        -- },
    },
    [1] = {   
    --     ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
    --     label = 'Helikopter - AugustaWestland AW139',
    --     category = 'air', -- Options are 'land' and 'air'
    -- },
    -- ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
    --     label = 'Helikopter - Swedish Air Ambulance',
    --     category = 'air', -- Options are 'land' and 'air'
    -- },
    -- ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
    --     label = 'Helikopter - Röda Svenska Ambulansen',
    --     category = 'air', -- Options are 'land' and 'air'
    -- },
},
    [2] = {   
        ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - AugustaWestland AW139',
        category = 'air', -- Options are 'land' and 'air'
    },
    ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - Swedish Air Ambulance',
        category = 'air', -- Options are 'land' and 'air'
    },
    ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - Röda Svenska Ambulansen',
        category = 'air', -- Options are 'land' and 'air'
    },
},
    [3] = {   
        ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - AugustaWestland AW139',
        category = 'air', -- Options are 'land' and 'air'
    },
    ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - Swedish Air Ambulance',
        category = 'air', -- Options are 'land' and 'air'
    },
    ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - Röda Svenska Ambulansen',
        category = 'air', -- Options are 'land' and 'air'
    },
},
    [4] = {   
        ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - AugustaWestland AW139',
        category = 'air', -- Options are 'land' and 'air'
    },
    ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - Swedish Air Ambulance',
        category = 'air', -- Options are 'land' and 'air'
    },
    ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - Röda Svenska Ambulansen',
        category = 'air', -- Options are 'land' and 'air'
    },
},
    [5] = {   
        ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - AugustaWestland AW139',
        category = 'air', -- Options are 'land' and 'air'
    },
    ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - Swedish Air Ambulance',
        category = 'air', -- Options are 'land' and 'air'
    },
    ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - Röda Svenska Ambulansen',
        category = 'air', -- Options are 'land' and 'air'
    },
},
    [6] = {   
        ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - AugustaWestland AW139',
        category = 'air', -- Options are 'land' and 'air'
    },
    ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - Swedish Air Ambulance',
        category = 'air', -- Options are 'land' and 'air'
    },
    ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - Röda Svenska Ambulansen',
        category = 'air', -- Options are 'land' and 'air'
    },
},
    [7] = {   
        ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - AugustaWestland AW139',
        category = 'air', -- Options are 'land' and 'air'
    },
    ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - Swedish Air Ambulance',
        category = 'air', -- Options are 'land' and 'air'
    },
    ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - Röda Svenska Ambulansen',
        category = 'air', -- Options are 'land' and 'air'
    },
},
    [8] = {   
        ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - AugustaWestland AW139',
        category = 'air', -- Options are 'land' and 'air'
    },
    ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - Swedish Air Ambulance',
        category = 'air', -- Options are 'land' and 'air'
    },
    ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - Röda Svenska Ambulansen',
        category = 'air', -- Options are 'land' and 'air'
    },
    },
    [9] = {   
        ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - AugustaWestland AW139',
        category = 'air', -- Options are 'land' and 'air'
    },
    ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - Swedish Air Ambulance',
        category = 'air', -- Options are 'land' and 'air'
    },
    ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - Röda Svenska Ambulansen',
        category = 'air', -- Options are 'land' and 'air'
    },
},
    [10] = {   
        ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - AugustaWestland AW139',
        category = 'air', -- Options are 'land' and 'air'
    },
    ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - Swedish Air Ambulance',
        category = 'air', -- Options are 'land' and 'air'
    },
    ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - Röda Svenska Ambulansen',
        category = 'air', -- Options are 'land' and 'air'
    },
},
},
    [11] = {   
        ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - AugustaWestland AW139',
        category = 'air', -- Options are 'land' and 'air'
    },
    ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - Swedish Air Ambulance',
        category = 'air', -- Options are 'land' and 'air'
    },
    ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - Röda Svenska Ambulansen',
        category = 'air', -- Options are 'land' and 'air'
    },


    },
},
        Vehicles = {                                   -- Vehicle Garage
            Enabled = true,                            -- Enable? False if you have you're own way for medics to obtain vehicles.
            Zone = {
                coords = vector3(-459.40267944336, -1020.6466064453, 24.288749694824), -- Area to prompt vehicle garage
                range = 5.5,                           -- Range it will prompt from coords above
                label = '[E] - Öppna Garage',
                return_label = '[E] - Lämna TIllbaka Bil'
            },
            Spawn = {
                land = {
                    coords = vector3(-459.75677490234, -1016.8081665039, 24.288749694824),
                    heading = 5.92
                },
                -- air = {
                --     coords = vector3(-453.83905029297, -1030.1228027344, 38.396816253662),
                --     heading = 0.0
                -- }
            },
            Options = {
                [0] = {                    -- Job grade as table name
                -- ['ambulance11'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                --     label = 'Volvo XC70 - Transportbil',
                --     category = 'land', -- Options are 'land' and 'air'
                -- },
                -- ['ambulance'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                --     label = 'Insats Lastbil',
                --     category = 'land', -- Options are 'land' and 'air'
                -- },                
                -- ['ambulance18'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                --     label = 'Mercedes E-Class',
                --     category = 'land', -- Options are 'land' and 'air'
                -- },
                -- ['ambulance4'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                --     label = 'Mercedes Vito',
                --     category = 'land', -- Options are 'land' and 'air'
                -- },
                -- ['ambulance3'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                --     label = 'Volvo XC90 - Transportbil',
                --     category = 'land', -- Options are 'land' and 'air'
                -- },
                -- ['ambulance1'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                --     label = 'Volkswagen Amarok',
                --     category = 'land', -- Options are 'land' and 'air'
                -- },
                -- ['ambulance10'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                --     label = 'Mercedes Sprinter',
                --     category = 'land', -- Options are 'land' and 'air'
                -- },
                -- ['ambulance19'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                --     label = 'Mercedes Otaris',
                --     category = 'land', -- Options are 'land' and 'air'
                -- },
                -- ['ambulance20'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                --     label = 'VW Crafter',
                --     category = 'land', -- Options are 'land' and 'air'
                -- },
                -- ['ambulance5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                --     label = 'Chevrolet Silverado',
                --     category = 'land', -- Options are 'land' and 'air'
                -- },
                -- ['ambulance17'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                -- label = 'Volvo V90 Cross Country',
                -- category = 'land', -- Options are 'land' and 'air'
                -- },
                -- ['ambulance7'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                -- label = 'Volvo XC70 - Akutläkare',
                -- category = 'land', -- Options are 'land' and 'air'
                -- },
                -- ['ambulance15'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                -- label = 'Mercedes Viano (Överläkare+)',
                -- category = 'land', -- Options are 'land' and 'air'
                -- },
                -- ['blazer5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                -- label = 'Fyrhjuling',
                -- category = 'land', -- Options are 'land' and 'air'
                -- },
                -- ['ambulance12'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                -- label = 'Jourläkarbil',
                -- category = 'land', -- Options are 'land' and 'air'
                -- },
                -- ['sheriff2'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                -- label = 'Ledningsbil',
                -- category = 'land', -- Options are 'land' and 'air'
                -- },
                -- ['volvoxc90'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                -- label = 'Understödbil',
                -- category = 'land', -- Options are 'land' and 'air'
                -- },
                -- ['ambulans2021'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                -- label = 'Ambulanc MC',
                -- category = 'land', -- Options are 'land' and 'air'
                -- },
                -- ['romero'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                -- label = 'Likbil',
                -- category = 'land', -- Options are 'land' and 'air'
                -- },                                                
                -- ['pbus'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                --     label = 'Buss',
                --     category = 'land', -- Options are 'land' and 'air'
                -- },                                                                                                                                                                                
                -- ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                --     label = 'Helikopter - AugustaWestland AW139',
                --     category = 'air', -- Options are 'land' and 'air'
                -- },
                -- ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                --     label = 'Helikopter - Swedish Air Ambulance',
                --     category = 'air', -- Options are 'land' and 'air'
                -- },
                -- ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                --     label = 'Helikopter - Röda Svenska Ambulansen',
                --     category = 'air', -- Options are 'land' and 'air'
                -- },                                
                },

                [1] = {
                -- ['ambulance11'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                --     label = 'Volvo XC70 - Transportbil',
                --     category = 'land', -- Options are 'land' and 'air'
                -- },
                -- ['ambulance'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                --     label = 'Insats Lastbil',
                --     category = 'land', -- Options are 'land' and 'air'
                -- },                
                -- ['ambulance18'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                --     label = 'Mercedes E-Class',
                --     category = 'land', -- Options are 'land' and 'air'
                -- },
                -- ['ambulance4'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                --     label = 'Mercedes Vito',
                --     category = 'land', -- Options are 'land' and 'air'
                -- },
                -- ['ambulance3'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                --     label = 'Volvo XC90 - Transportbil',
                --     category = 'land', -- Options are 'land' and 'air'
                -- },
                -- ['ambulance1'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                --     label = 'Volkswagen Amarok',
                --     category = 'land', -- Options are 'land' and 'air'
                -- },
                -- ['ambulance10'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                --     label = 'Mercedes Sprinter',
                --     category = 'land', -- Options are 'land' and 'air'
                -- },
                -- ['ambulance19'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                --     label = 'Mercedes Otaris',
                --     category = 'land', -- Options are 'land' and 'air'
                -- },
                -- ['ambulance20'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                --     label = 'VW Crafter',
                --     category = 'land', -- Options are 'land' and 'air'
                -- },
                -- ['ambulance5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                --     label = 'Chevrolet Silverado',
                --     category = 'land', -- Options are 'land' and 'air'
                -- },
                -- ['ambulance17'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                -- label = 'Volvo V90 Cross Country',
                -- category = 'land', -- Options are 'land' and 'air'
                -- },
                -- ['ambulance7'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                -- label = 'Volvo XC70 - Akutläkare',
                -- category = 'land', -- Options are 'land' and 'air'
                -- },
                -- ['ambulance15'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                -- label = 'Mercedes Viano (Överläkare+)',
                -- category = 'land', -- Options are 'land' and 'air'
                -- },
                -- ['blazer5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                -- label = 'Fyrhjuling',
                -- category = 'land', -- Options are 'land' and 'air'
                -- },
                -- ['ambulance12'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                -- label = 'Jourläkarbil',
                -- category = 'land', -- Options are 'land' and 'air'
                -- },
                -- ['sheriff2'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                -- label = 'Ledningsbil',
                -- category = 'land', -- Options are 'land' and 'air'
                -- },
                -- ['volvoxc90'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                -- label = 'Understödbil',
                -- category = 'land', -- Options are 'land' and 'air'
                -- },
                -- ['ambulans2021'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                -- label = 'Ambulanc MC',
                -- category = 'land', -- Options are 'land' and 'air'
                -- },
                -- ['romero'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                -- label = 'Likbil',
                -- category = 'land', -- Options are 'land' and 'air'
                -- },                                                
                -- ['pbus'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                --     label = 'Buss',
                --     category = 'land', -- Options are 'land' and 'air'
                -- },                                                                                                                                                                                
                -- ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                --     label = 'Helikopter - AugustaWestland AW139',
                --     category = 'air', -- Options are 'land' and 'air'
                -- },
                -- ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                --     label = 'Helikopter - Swedish Air Ambulance',
                --     category = 'air', -- Options are 'land' and 'air'
                -- },
                -- ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                --     label = 'Helikopter - Röda Svenska Ambulansen',
                --     category = 'air', -- Options are 'land' and 'air'
                -- },                                
                },

                [2] = {
                ['ambulance11'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Volvo XC70 - Transportbil',
                    category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Insats Lastbil',
                    category = 'land', -- Options are 'land' and 'air'
                },                
                ['ambulance18'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Mercedes E-Class',
                    category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance4'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Mercedes Vito',
                    category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance3'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Volvo XC90 - Transportbil',
                    category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance1'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Volkswagen Amarok',
                    category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance10'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Mercedes Sprinter',
                    category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance19'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Mercedes Otaris',
                    category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance20'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'VW Crafter',
                    category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Chevrolet Silverado',
                    category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance17'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                label = 'Volvo V90 Cross Country',
                category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance7'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                label = 'Volvo XC70 - Akutläkare',
                category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance15'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                label = 'Mercedes Viano (Överläkare+)',
                category = 'land', -- Options are 'land' and 'air'
                },
                ['blazer5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                label = 'Fyrhjuling',
                category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance12'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                label = 'Jourläkarbil',
                category = 'land', -- Options are 'land' and 'air'
                },
                ['sheriff2'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                label = 'Ledningsbil',
                category = 'land', -- Options are 'land' and 'air'
                },
                ['volvoxc90'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                label = 'Understödbil',
                category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulans2021'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                label = 'Ambulanc MC',
                category = 'land', -- Options are 'land' and 'air'
                },
                ['romero'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                label = 'Likbil',
                category = 'land', -- Options are 'land' and 'air'
                },                                                
                ['pbus'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Buss',
                    category = 'land', -- Options are 'land' and 'air'
                },                                                                                                                                                                                
                ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Helikopter - AugustaWestland AW139',
                    category = 'air', -- Options are 'land' and 'air'
                },
                ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Helikopter - Swedish Air Ambulance',
                    category = 'air', -- Options are 'land' and 'air'
                },
                ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Helikopter - Röda Svenska Ambulansen',
                    category = 'air', -- Options are 'land' and 'air'
                },                                
                },
                [3] = {
                    ['ambulance11'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Volvo XC70 - Transportbil',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['ambulance'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Insats Lastbil',
                        category = 'land', -- Options are 'land' and 'air'
                    },                
                    ['ambulance18'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Mercedes E-Class',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['ambulance4'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Mercedes Vito',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['ambulance3'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Volvo XC90 - Transportbil',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['ambulance1'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Volkswagen Amarok',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['ambulance10'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Mercedes Sprinter',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['ambulance19'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Mercedes Otaris',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['ambulance20'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'VW Crafter',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['ambulance5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Chevrolet Silverado',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['ambulance17'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Volvo V90 Cross Country',
                    category = 'land', -- Options are 'land' and 'air'
                    },
                    ['ambulance7'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Volvo XC70 - Akutläkare',
                    category = 'land', -- Options are 'land' and 'air'
                    },
                    ['ambulance15'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Mercedes Viano (Överläkare+)',
                    category = 'land', -- Options are 'land' and 'air'
                    },
                    ['blazer5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Fyrhjuling',
                    category = 'land', -- Options are 'land' and 'air'
                    },
                    ['ambulance12'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Jourläkarbil',
                    category = 'land', -- Options are 'land' and 'air'
                    },
                    ['sheriff2'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Ledningsbil',
                    category = 'land', -- Options are 'land' and 'air'
                    },
                    ['volvoxc90'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Understödbil',
                    category = 'land', -- Options are 'land' and 'air'
                    },
                    ['ambulans2021'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Ambulanc MC',
                    category = 'land', -- Options are 'land' and 'air'
                    },
                    ['romero'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Likbil',
                    category = 'land', -- Options are 'land' and 'air'
                    },                                                
                    ['pbus'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Buss',
                        category = 'land', -- Options are 'land' and 'air'
                    },                                                                                                                                                                                
                    ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Helikopter - AugustaWestland AW139',
                        category = 'air', -- Options are 'land' and 'air'
                    },
                    ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Helikopter - Swedish Air Ambulance',
                        category = 'air', -- Options are 'land' and 'air'
                    },
                    ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Helikopter - Röda Svenska Ambulansen',
                        category = 'air', -- Options are 'land' and 'air'
                    },                                
                    },
                    [4] = {
                        ['ambulance11'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'Volvo XC70 - Transportbil',
                            category = 'land', -- Options are 'land' and 'air'
                        },
                        ['ambulance'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'Insats Lastbil',
                            category = 'land', -- Options are 'land' and 'air'
                        },                
                        ['ambulance18'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'Mercedes E-Class',
                            category = 'land', -- Options are 'land' and 'air'
                        },
                        ['ambulance4'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'Mercedes Vito',
                            category = 'land', -- Options are 'land' and 'air'
                        },
                        ['ambulance3'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'Volvo XC90 - Transportbil',
                            category = 'land', -- Options are 'land' and 'air'
                        },
                        ['ambulance1'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'Volkswagen Amarok',
                            category = 'land', -- Options are 'land' and 'air'
                        },
                        ['ambulance10'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'Mercedes Sprinter',
                            category = 'land', -- Options are 'land' and 'air'
                        },
                        ['ambulance19'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'Mercedes Otaris',
                            category = 'land', -- Options are 'land' and 'air'
                        },
                        ['ambulance20'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'VW Crafter',
                            category = 'land', -- Options are 'land' and 'air'
                        },
                        ['ambulance5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'Chevrolet Silverado',
                            category = 'land', -- Options are 'land' and 'air'
                        },
                        ['ambulance17'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Volvo V90 Cross Country',
                        category = 'land', -- Options are 'land' and 'air'
                        },
                        ['ambulance7'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Volvo XC70 - Akutläkare',
                        category = 'land', -- Options are 'land' and 'air'
                        },
                        ['ambulance15'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Mercedes Viano (Överläkare+)',
                        category = 'land', -- Options are 'land' and 'air'
                        },
                        ['blazer5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Fyrhjuling',
                        category = 'land', -- Options are 'land' and 'air'
                        },
                        ['ambulance12'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Jourläkarbil',
                        category = 'land', -- Options are 'land' and 'air'
                        },
                        ['sheriff2'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Ledningsbil',
                        category = 'land', -- Options are 'land' and 'air'
                        },
                        ['volvoxc90'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Understödbil',
                        category = 'land', -- Options are 'land' and 'air'
                        },
                        ['ambulans2021'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Ambulanc MC',
                        category = 'land', -- Options are 'land' and 'air'
                        },
                        ['romero'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Likbil',
                        category = 'land', -- Options are 'land' and 'air'
                        },                                                
                        ['pbus'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'Buss',
                            category = 'land', -- Options are 'land' and 'air'
                        },                                                                                                                                                                                
                        ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'Helikopter - AugustaWestland AW139',
                            category = 'air', -- Options are 'land' and 'air'
                        },
                        ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'Helikopter - Swedish Air Ambulance',
                            category = 'air', -- Options are 'land' and 'air'
                        },
                        ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'Helikopter - Röda Svenska Ambulansen',
                            category = 'air', -- Options are 'land' and 'air'
                        },                                
                        },
                        [5] = {
                            ['ambulance11'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'Volvo XC70 - Transportbil',
                                category = 'land', -- Options are 'land' and 'air'
                            },
                            ['ambulance'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'Insats Lastbil',
                                category = 'land', -- Options are 'land' and 'air'
                            },                
                            ['ambulance18'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'Mercedes E-Class',
                                category = 'land', -- Options are 'land' and 'air'
                            },
                            ['ambulance4'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'Mercedes Vito',
                                category = 'land', -- Options are 'land' and 'air'
                            },
                            ['ambulance3'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'Volvo XC90 - Transportbil',
                                category = 'land', -- Options are 'land' and 'air'
                            },
                            ['ambulance1'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'Volkswagen Amarok',
                                category = 'land', -- Options are 'land' and 'air'
                            },
                            ['ambulance10'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'Mercedes Sprinter',
                                category = 'land', -- Options are 'land' and 'air'
                            },
                            ['ambulance19'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'Mercedes Otaris',
                                category = 'land', -- Options are 'land' and 'air'
                            },
                            ['ambulance20'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'VW Crafter',
                                category = 'land', -- Options are 'land' and 'air'
                            },
                            ['ambulance5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'Chevrolet Silverado',
                                category = 'land', -- Options are 'land' and 'air'
                            },
                            ['ambulance17'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'Volvo V90 Cross Country',
                            category = 'land', -- Options are 'land' and 'air'
                            },
                            ['ambulance7'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'Volvo XC70 - Akutläkare',
                            category = 'land', -- Options are 'land' and 'air'
                            },
                            ['ambulance15'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'Mercedes Viano (Överläkare+)',
                            category = 'land', -- Options are 'land' and 'air'
                            },
                            ['blazer5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'Fyrhjuling',
                            category = 'land', -- Options are 'land' and 'air'
                            },
                            ['ambulance12'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'Jourläkarbil',
                            category = 'land', -- Options are 'land' and 'air'
                            },
                            ['sheriff2'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'Ledningsbil',
                            category = 'land', -- Options are 'land' and 'air'
                            },
                            ['volvoxc90'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'Understödbil',
                            category = 'land', -- Options are 'land' and 'air'
                            },
                            ['ambulans2021'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'Ambulanc MC',
                            category = 'land', -- Options are 'land' and 'air'
                            },
                            ['romero'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'Likbil',
                            category = 'land', -- Options are 'land' and 'air'
                            },                                                
                            ['pbus'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'Buss',
                                category = 'land', -- Options are 'land' and 'air'
                            },                                                                                                                                                                                
                            ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'Helikopter - AugustaWestland AW139',
                                category = 'air', -- Options are 'land' and 'air'
                            },
                            ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'Helikopter - Swedish Air Ambulance',
                                category = 'air', -- Options are 'land' and 'air'
                            },
                            ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'Helikopter - Röda Svenska Ambulansen',
                                category = 'air', -- Options are 'land' and 'air'
                            },                                
                            },
                            [6] = {
                                ['ambulance11'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Volvo XC70 - Transportbil',
                                    category = 'land', -- Options are 'land' and 'air'
                                },
                                ['ambulance'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Insats Lastbil',
                                    category = 'land', -- Options are 'land' and 'air'
                                },                
                                ['ambulance18'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Mercedes E-Class',
                                    category = 'land', -- Options are 'land' and 'air'
                                },
                                ['ambulance4'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Mercedes Vito',
                                    category = 'land', -- Options are 'land' and 'air'
                                },
                                ['ambulance3'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Volvo XC90 - Transportbil',
                                    category = 'land', -- Options are 'land' and 'air'
                                },
                                ['ambulance1'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Volkswagen Amarok',
                                    category = 'land', -- Options are 'land' and 'air'
                                },
                                ['ambulance10'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Mercedes Sprinter',
                                    category = 'land', -- Options are 'land' and 'air'
                                },
                                ['ambulance19'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Mercedes Otaris',
                                    category = 'land', -- Options are 'land' and 'air'
                                },
                                ['ambulance20'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'VW Crafter',
                                    category = 'land', -- Options are 'land' and 'air'
                                },
                                ['ambulance5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Chevrolet Silverado',
                                    category = 'land', -- Options are 'land' and 'air'
                                },
                                ['ambulance17'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'Volvo V90 Cross Country',
                                category = 'land', -- Options are 'land' and 'air'
                                },
                                ['ambulance7'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'Volvo XC70 - Akutläkare',
                                category = 'land', -- Options are 'land' and 'air'
                                },
                                ['ambulance15'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'Mercedes Viano (Överläkare+)',
                                category = 'land', -- Options are 'land' and 'air'
                                },
                                ['blazer5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'Fyrhjuling',
                                category = 'land', -- Options are 'land' and 'air'
                                },
                                ['ambulance12'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'Jourläkarbil',
                                category = 'land', -- Options are 'land' and 'air'
                                },
                                ['sheriff2'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'Ledningsbil',
                                category = 'land', -- Options are 'land' and 'air'
                                },
                                ['volvoxc90'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'Understödbil',
                                category = 'land', -- Options are 'land' and 'air'
                                },
                                ['ambulans2021'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'Ambulanc MC',
                                category = 'land', -- Options are 'land' and 'air'
                                },
                                ['romero'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'Likbil',
                                category = 'land', -- Options are 'land' and 'air'
                                },                                                
                                ['pbus'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Buss',
                                    category = 'land', -- Options are 'land' and 'air'
                                },                                                                                                                                                                                
                                ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Helikopter - AugustaWestland AW139',
                                    category = 'air', -- Options are 'land' and 'air'
                                },
                                ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Helikopter - Swedish Air Ambulance',
                                    category = 'air', -- Options are 'land' and 'air'
                                },
                                ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Helikopter - Röda Svenska Ambulansen',
                                    category = 'air', -- Options are 'land' and 'air'
                                },                                
                                },
                                [7] = {
                                    ['ambulance11'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Volvo XC70 - Transportbil',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Insats Lastbil',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },                
                                    ['ambulance18'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Mercedes E-Class',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance4'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Mercedes Vito',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance3'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Volvo XC90 - Transportbil',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance1'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Volkswagen Amarok',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance10'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Mercedes Sprinter',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance19'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Mercedes Otaris',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance20'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'VW Crafter',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Chevrolet Silverado',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance17'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Volvo V90 Cross Country',
                                    category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance7'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Volvo XC70 - Akutläkare',
                                    category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance15'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Mercedes Viano (Överläkare+)',
                                    category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['blazer5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Fyrhjuling',
                                    category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance12'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Jourläkarbil',
                                    category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['sheriff2'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Ledningsbil',
                                    category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['volvoxc90'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Understödbil',
                                    category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulans2021'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Ambulanc MC',
                                    category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['romero'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Likbil',
                                    category = 'land', -- Options are 'land' and 'air'
                                    },                                                
                                    ['pbus'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Buss',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },                                                                                                                                                                                                               
                                    },
                                [8] = {
                                    ['ambulance11'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Volvo XC70 - Transportbil',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Insats Lastbil',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },                
                                    ['ambulance18'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Mercedes E-Class',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance4'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Mercedes Vito',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance3'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Volvo XC90 - Transportbil',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance1'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Volkswagen Amarok',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance10'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Mercedes Sprinter',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance19'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Mercedes Otaris',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance20'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'VW Crafter',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Chevrolet Silverado',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance17'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Volvo V90 Cross Country',
                                    category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance7'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Volvo XC70 - Akutläkare',
                                    category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance15'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Mercedes Viano (Överläkare+)',
                                    category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['blazer5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Fyrhjuling',
                                    category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance12'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Jourläkarbil',
                                    category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['sheriff2'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Ledningsbil',
                                    category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['volvoxc90'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Understödbil',
                                    category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulans2021'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Ambulanc MC',
                                    category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['romero'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Likbil',
                                    category = 'land', -- Options are 'land' and 'air'
                                    },                                                
                                    ['pbus'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Buss',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },                                                                                                                                                                                
                                    ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Helikopter - AugustaWestland AW139',
                                        category = 'air', -- Options are 'land' and 'air'
                                    },
                                    ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Helikopter - Swedish Air Ambulance',
                                        category = 'air', -- Options are 'land' and 'air'
                                    },
                                    ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Helikopter - Röda Svenska Ambulansen',
                                        category = 'air', -- Options are 'land' and 'air'
                                    },                                
                                    },
                                    [9] = {
                                        ['ambulance11'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'Volvo XC70 - Transportbil',
                                            category = 'land', -- Options are 'land' and 'air'
                                        },
                                        ['ambulance'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'Insats Lastbil',
                                            category = 'land', -- Options are 'land' and 'air'
                                        },                
                                        ['ambulance18'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'Mercedes E-Class',
                                            category = 'land', -- Options are 'land' and 'air'
                                        },
                                        ['ambulance4'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'Mercedes Vito',
                                            category = 'land', -- Options are 'land' and 'air'
                                        },
                                        ['ambulance3'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'Volvo XC90 - Transportbil',
                                            category = 'land', -- Options are 'land' and 'air'
                                        },
                                        ['ambulance1'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'Volkswagen Amarok',
                                            category = 'land', -- Options are 'land' and 'air'
                                        },
                                        ['ambulance10'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'Mercedes Sprinter',
                                            category = 'land', -- Options are 'land' and 'air'
                                        },
                                        ['ambulance19'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'Mercedes Otaris',
                                            category = 'land', -- Options are 'land' and 'air'
                                        },
                                        ['ambulance20'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'VW Crafter',
                                            category = 'land', -- Options are 'land' and 'air'
                                        },
                                        ['ambulance5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'Chevrolet Silverado',
                                            category = 'land', -- Options are 'land' and 'air'
                                        },
                                        ['ambulance17'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Volvo V90 Cross Country',
                                        category = 'land', -- Options are 'land' and 'air'
                                        },
                                        ['ambulance7'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Volvo XC70 - Akutläkare',
                                        category = 'land', -- Options are 'land' and 'air'
                                        },
                                        ['ambulance15'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Mercedes Viano (Överläkare+)',
                                        category = 'land', -- Options are 'land' and 'air'
                                        },
                                        ['blazer5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Fyrhjuling',
                                        category = 'land', -- Options are 'land' and 'air'
                                        },
                                        ['ambulance12'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Jourläkarbil',
                                        category = 'land', -- Options are 'land' and 'air'
                                        },
                                        ['sheriff2'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Ledningsbil',
                                        category = 'land', -- Options are 'land' and 'air'
                                        },
                                        ['volvoxc90'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Understödbil',
                                        category = 'land', -- Options are 'land' and 'air'
                                        },
                                        ['ambulans2021'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Ambulanc MC',
                                        category = 'land', -- Options are 'land' and 'air'
                                        },
                                        ['romero'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Likbil',
                                        category = 'land', -- Options are 'land' and 'air'
                                        },                                                
                                        ['pbus'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'Buss',
                                            category = 'land', -- Options are 'land' and 'air'
                                        },                                                                                                                                                                                
                                        ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'Helikopter - AugustaWestland AW139',
                                            category = 'air', -- Options are 'land' and 'air'
                                        },
                                        ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'Helikopter - Swedish Air Ambulance',
                                            category = 'air', -- Options are 'land' and 'air'
                                        },
                                        ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'Helikopter - Röda Svenska Ambulansen',
                                            category = 'air', -- Options are 'land' and 'air'
                                        },                                
                                        },
                                        [10] = {
                                            ['ambulance11'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'Volvo XC70 - Transportbil',
                                                category = 'land', -- Options are 'land' and 'air'
                                            },
                                            ['ambulance'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'Insats Lastbil',
                                                category = 'land', -- Options are 'land' and 'air'
                                            },                
                                            ['ambulance18'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'Mercedes E-Class',
                                                category = 'land', -- Options are 'land' and 'air'
                                            },
                                            ['ambulance4'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'Mercedes Vito',
                                                category = 'land', -- Options are 'land' and 'air'
                                            },
                                            ['ambulance3'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'Volvo XC90 - Transportbil',
                                                category = 'land', -- Options are 'land' and 'air'
                                            },
                                            ['ambulance1'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'Volkswagen Amarok',
                                                category = 'land', -- Options are 'land' and 'air'
                                            },
                                            ['ambulance10'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'Mercedes Sprinter',
                                                category = 'land', -- Options are 'land' and 'air'
                                            },
                                            ['ambulance19'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'Mercedes Otaris',
                                                category = 'land', -- Options are 'land' and 'air'
                                            },
                                            ['ambulance20'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'VW Crafter',
                                                category = 'land', -- Options are 'land' and 'air'
                                            },
                                            ['ambulance5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'Chevrolet Silverado',
                                                category = 'land', -- Options are 'land' and 'air'
                                            },
                                            ['ambulance17'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'Volvo V90 Cross Country',
                                            category = 'land', -- Options are 'land' and 'air'
                                            },
                                            ['ambulance7'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'Volvo XC70 - Akutläkare',
                                            category = 'land', -- Options are 'land' and 'air'
                                            },
                                            ['ambulance15'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'Mercedes Viano (Överläkare+)',
                                            category = 'land', -- Options are 'land' and 'air'
                                            },
                                            ['blazer5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'Fyrhjuling',
                                            category = 'land', -- Options are 'land' and 'air'
                                            },
                                            ['ambulance12'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'Jourläkarbil',
                                            category = 'land', -- Options are 'land' and 'air'
                                            },
                                            ['sheriff2'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'Ledningsbil',
                                            category = 'land', -- Options are 'land' and 'air'
                                            },
                                            ['volvoxc90'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'Understödbil',
                                            category = 'land', -- Options are 'land' and 'air'
                                            },
                                            ['ambulans2021'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'Ambulanc MC',
                                            category = 'land', -- Options are 'land' and 'air'
                                            },
                                            ['romero'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'Likbil',
                                            category = 'land', -- Options are 'land' and 'air'
                                            },                                                
                                            ['pbus'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'Buss',
                                                category = 'land', -- Options are 'land' and 'air'
                                            },                                                                                                                                                                                
                                            ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'Helikopter - AugustaWestland AW139',
                                                category = 'air', -- Options are 'land' and 'air'
                                            },
                                            ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'Helikopter - Swedish Air Ambulance',
                                                category = 'air', -- Options are 'land' and 'air'
                                            },
                                            ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'Helikopter - Röda Svenska Ambulansen',
                                                category = 'air', -- Options are 'land' and 'air'
                                            },                                
                                            },
                                            [11] = {
                                                ['ambulance11'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                    label = 'Volvo XC70 - Transportbil',
                                                    category = 'land', -- Options are 'land' and 'air'
                                                },
                                                ['ambulance'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                    label = 'Insats Lastbil',
                                                    category = 'land', -- Options are 'land' and 'air'
                                                },                
                                                ['ambulance18'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                    label = 'Mercedes E-Class',
                                                    category = 'land', -- Options are 'land' and 'air'
                                                },
                                                ['ambulance4'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                    label = 'Mercedes Vito',
                                                    category = 'land', -- Options are 'land' and 'air'
                                                },
                                                ['ambulance3'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                    label = 'Volvo XC90 - Transportbil',
                                                    category = 'land', -- Options are 'land' and 'air'
                                                },
                                                ['ambulance1'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                    label = 'Volkswagen Amarok',
                                                    category = 'land', -- Options are 'land' and 'air'
                                                },
                                                ['ambulance10'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                    label = 'Mercedes Sprinter',
                                                    category = 'land', -- Options are 'land' and 'air'
                                                },
                                                ['ambulance19'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                    label = 'Mercedes Otaris',
                                                    category = 'land', -- Options are 'land' and 'air'
                                                },
                                                ['ambulance20'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                    label = 'VW Crafter',
                                                    category = 'land', -- Options are 'land' and 'air'
                                                },
                                                ['ambulance5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                    label = 'Chevrolet Silverado',
                                                    category = 'land', -- Options are 'land' and 'air'
                                                },
                                                ['ambulance17'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'Volvo V90 Cross Country',
                                                category = 'land', -- Options are 'land' and 'air'
                                                },
                                                ['ambulance7'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'Volvo XC70 - Akutläkare',
                                                category = 'land', -- Options are 'land' and 'air'
                                                },
                                                ['ambulance15'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'Mercedes Viano (Överläkare+)',
                                                category = 'land', -- Options are 'land' and 'air'
                                                },
                                                ['blazer5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'Fyrhjuling',
                                                category = 'land', -- Options are 'land' and 'air'
                                                },
                                                ['ambulance12'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'Jourläkarbil',
                                                category = 'land', -- Options are 'land' and 'air'
                                                },
                                                ['sheriff2'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'Ledningsbil',
                                                category = 'land', -- Options are 'land' and 'air'
                                                },
                                                ['volvoxc90'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'Understödbil',
                                                category = 'land', -- Options are 'land' and 'air'
                                                },
                                                ['ambulans2021'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'Ambulanc MC',
                                                category = 'land', -- Options are 'land' and 'air'
                                                },
                                                ['romero'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'Likbil',
                                                category = 'land', -- Options are 'land' and 'air'
                                                },                                                
                                                ['pbus'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                    label = 'Buss',
                                                    category = 'land', -- Options are 'land' and 'air'
                                                },                                                                                                                                                                                
                                                ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                    label = 'Helikopter - AugustaWestland AW139',
                                                    category = 'air', -- Options are 'land' and 'air'
                                                },
                                                ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                    label = 'Helikopter - Swedish Air Ambulance',
                                                    category = 'air', -- Options are 'land' and 'air'
                                                },
                                                ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                    label = 'Helikopter - Röda Svenska Ambulansen',
                                                    category = 'air', -- Options are 'land' and 'air'
                                                },                                
                                                }
            }
        },
    },
    -- Pillbox = {
    --     RespawnPoint = { -- When player dies and bleeds out; they will revive at nearest hospital; Define the coords of this hospital here.
    --         coords = vec3(317.8, -585.14, 44.2),
    --         heading = 332.22,
    --         -- Even if you have useCheckInInstead to true, you must still define these coords for finding closest hospital
    --         -- If you want to use check-in instead of respawning at this location(Otherwise will just spawn at the coords above)
    --         useCheckInInstead = true
    --     },

    --     Blip = {
    --         Enabled = true,
    --         Coords = vec3(324.15, -583.14, 44.20),
    --         Sprite = 61,
    --         Color = 2,
    --         Scale = 1.0,
    --         String = 'Sjukhuset'
    --     },

    --     clockInAndOut = {
    --         enabled = false,                       -- Enable clocking in and out at a set location? (If using ESX you must have a off duty job for Config.ambulanceJob with same grades - example in main _install_first directory)
    --         coords = vec3(334.75, -580.24, 43.28), -- Location of where to go on and off duty(If not using target)
    --         label = '[E] - Go On/Off Duty',        -- Text to display(If not using target)
    --         distance = 3.0,                        -- Distance to display text UI(If not using target)
    --         target = {
    --             enabled = false,                   -- If enabled, the location and distance above will be obsolete
    --             label = 'Go On/Off Duty',
    --             coords = vec3(334.75, -580.24, 43.28),
    --             heading = 337.07,
    --             width = 2.0,
    --             length = 1.0,
    --             minZ = 43.28 - 0.9,
    --             maxZ = 43.28 + 0.9
    --         }
    --     },

    --     PersonalLocker = {
    --         enabled = false,                        -- Enable personal locker(stash) - THIS IS CURRENTLY ONLY AVALIABLE IN QB-INVENTORY
    --         coords = vec3(298.6, -598.45, 43.28),   -- Location of where to access personal locker (If target is disabled)
    --         label = '[E] - Access Personal Locker', -- Text to display(If not using target)
    --         distance = 1.5,                         -- Distance to display text UI(If not using target)
    --         target = {
    --             enabled = false,                    -- If enabled, the location and distance above will be obsolete
    --             label = 'Access Locker',
    --             coords = vec3(298.6, -598.45, 43.28),
    --             heading = 70.18,
    --             width = 2.0,
    --             length = 1.0,
    --             minZ = 43.28 - 0.9,
    --             maxZ = 43.28 + 0.9
    --         }
    --     },


    --     BossMenu = {
    --         Enabled = true,                        -- Enabled boss menu?
    --         Coords = vec3(335.59, -594.33, 43.21), -- Location of boss menu (If not using target)
    --         Label = '[E] - Få tillgång till chefsmenyn', -- Text UI label string (If not using target)
    --         Distance = 2.5,                        -- Distance to allow access/prompt with text UI (If not using target)
    --         Target = {
    --             enabled = false,                   -- Enable Target? (Can be customized in wasabi_bridge/customize/cl_customize.lua the target system)
    --             label = 'Access Boss Menu',
    --             coords = vec3(335.59, -594.33, 43.21),
    --             heading = 269.85,
    --             width = 2.0,
    --             length = 1.0,
    --             minZ = 43.21 - 0.9,
    --             maxZ = 43.21 + 0.9
    --         }
    --     },

    --     CheckIn = {                                      -- Hospital check-in
    --         Enabled = true,                              -- Enable ped and check-in area?
    --         Ped = 's_f_y_scrubs_01',                  -- Check in ped
    --         Coords = vec3(308.58, -595.31, 43.28 - 0.9), -- Coords of ped
    --         Distance = 4.85,                             -- Distance to show textUI (If target is not enabled below)
    --         Heading = 63.26,                             -- Heading of ped
    --         Cost = 3000,                                 -- Cost of using hospital check-in. Set to false for free
    --         Duration = 15 * seconds,                     -- Time it takes to spend in hospital bed
    --         MaxOnDuty = 6,                               -- If this amount or less you can use, otherwise it will tell you that EMS is avaliable(Set to false to always enable check-in)
    --         PayAccount = 'bank',                         -- Account dead player pays from to check-in
    --         Label = '[E] - Få hjälp av Svetlana',                    -- label of text UI if target is not enabled below
    --         HotKey = 38,                                 -- Default: 38 (E) (If target below is not enabled)
    --         Target = {
    --             enabled = false,                          -- Enable Target? (Can be customized in wasabi_bridge/customize/cl_customize.lua the target system)
    --             label = 'Checka In',
    --             coords = vec3(308.58, -595.31, 43.28),
    --             heading = 63.26,
    --             distance = 5.0,
    --             width = 2.0,
    --             length = 1.0,
    --             minZ = 43.28 - 0.9,
    --             maxZ = 43.28 + 0.9
    --         },
    --         DisableHospitalBeds = false,                                                       -- Disable hospital beds for check-in at this location?(Player will spend Duration checking in before respawning in RespawnNoBedLocation when set to true)
    --         RespawnNoBedLocation = { coords = vec3(316.66, -581.3, 43.28), heading = 339.02 }, -- Coords and heading of where to spawn player if DisableHospitalBeds is set to true or beds are full
    --         HospitalBeds = {
    --             --              { coords = vec3(332.62, -587.17, 42.84+0.3), heading = 160.0 },
    --             { coords = vec3(317.67, -585.37, 42.84 + 0.3), heading = 160.0 },
    --             { coords = vec3(319.41, -581.04, 42.84 + 0.3), heading = 340.0 },
    --             { coords = vec3(314.47, -584.2, 42.84 + 0.3),  heading = 160.0 },
    --             { coords = vec3(313.93, -579.04, 42.84 + 0.3), heading = 340.0 },
    --             { coords = vec3(311.06, -582.96, 42.84 + 0.3), heading = 160.0 },
    --             { coords = vec3(307.72, -581.75, 42.84 + 0.3), heading = 160.0 },
    --             { coords = vec3(309.35, -577.38, 42.84 + 0.3), heading = 340.0 },
    --             { coords = vec3(361.36, -581.3, 42.83 + 0.3),  heading = 250.0 },
    --             { coords = vec3(359.54, -586.23, 42.84 + 0.3), heading = 250.0 },
    --             { coords = vec3(354.44, -600.19, 42.85 + 0.3), heading = 250.0 },
    --             { coords = vec3(324.26, -582.8, 42.84 + 0.3),  heading = 340.0 },
    --             -- Stock qb-ambulance hospital bed coords:
    --             --                { coords = vec3(353.1, -584.6, 43.11), heading = 152.08 },
    --             --                { coords = vec3(356.79, -585.86, 43.11), heading = 152.08 },
    --             --                { coords = vec3(354.12, -593.12, 43.1), heading = 336.32 },
    --             --                { coords = vec3(350.79, -591.8, 43.1), heading = 336.32 },
    --             --                { coords = vec3(346.99, -590.48, 43.1), heading = 336.32 },
    --             --                { coords = vec3(360.32, -587.19, 43.02), heading = 152.08 },
    --             --                { coords = vec3(349.82, -583.33, 43.02), heading = 152.08 },
    --             --                { coords = vec3(326.98, -576.17, 43.02), heading = 152.08 }
    --         }

    --     },
    --     Cloakroom = {
    --         Enabled = true,
    --         Coords = vector3(301.88217163086, -599.37969970703, 43.280212402344),
    --         -- Coords of cloakroom
    --         Label = '[E] - Ändra kläder',     -- String of text ui of cloakroom
    --         HotKey = 38,                        -- Default: 38 (E)
    --         Range = 1.5,                        -- Range away from coords you can use.
    --         Uniforms = { -- Uniform choices
    --             [1] = { -- Order it will display
    --                 label = 'Jobbkläder Sommar', -- Name of outfit that will display in menu
    --                 male = { -- Male variation
    --                     ['tshirt_1'] = 141,  ['tshirt_2'] = 0,
    --                     ['torso_1'] = 340,   ['torso_2'] = 0,
    --                     ['arms'] = 35,
    --                     ['mask_1'] = 27,   ['mask_2'] = 0,                        
    --                     ['pants_1'] = 66,   ['pants_2'] = 0,
    --                     ['shoes_1'] = 63,   ['shoes_2'] = 0,
    --                     ['helmet_1'] = 136,  ['helmet_2'] = 0,
    --                     ['decals_1'] = 57,  ['decals_2'] = 0,
    --                     ['chains_1'] = 157,  ['chains_2'] = 0,                                                
    --                 },
    --                 female = {
    --                     ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
    --                     ['torso_1'] = 4,   ['torso_2'] = 14,
    --                     ['arms'] = 4,
    --                     ['pants_1'] = 25,   ['pants_2'] = 1,
    --                     ['shoes_1'] = 16,   ['shoes_2'] = 4,
    --                 }
    --             },

    --             [2] = { -- Order it will display
    --                 label = 'Jobbkläder Vinter', -- Name of outfit that will display in menu
    --                 male = { -- Male variation
    --                     ['tshirt_1'] = 141,  ['tshirt_2'] = 0,
    --                     ['torso_1'] = 341,   ['torso_2'] = 0,
    --                     ['arms'] = 44,
    --                     ['mask_1'] = 27,   ['mask_2'] = 0,                        
    --                     ['pants_1'] = 66,   ['pants_2'] = 0,
    --                     ['shoes_1'] = 63,   ['shoes_2'] = 0,
    --                     ['helmet_1'] = 136,  ['helmet_2'] = 0,
    --                     ['decals_1'] = 57,  ['decals_2'] = 0,
    --                     ['chains_1'] = 157,  ['chains_2'] = 0,                                                
    --                 },
    --                 female = {
    --                     ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
    --                     ['torso_1'] = 4,   ['torso_2'] = 14,
    --                     ['arms'] = 4,
    --                     ['pants_1'] = 25,   ['pants_2'] = 1,
    --                     ['shoes_1'] = 16,   ['shoes_2'] = 4,
    --                 }
    --             },

    --             [2] = { -- Order it will display
    --                 label = 'Möteskläder', -- Name of outfit that will display in menu
    --                 male = { -- Male variation
    --                     ['tshirt_1'] = 163,  ['tshirt_2'] = 0,
    --                     ['torso_1'] = 404,   ['torso_2'] = 0,
    --                     ['arms'] = 4,                     
    --                     ['pants_1'] = 10,   ['pants_2'] = 0,
    --                     ['shoes_1'] = 10,   ['shoes_2'] = 0,
    --                     ['helmet_1'] = 136,  ['helmet_2'] = 0,
    --                     ['chains_1'] = 158,  ['chains_2'] = 0,                                                
    --                 },
    --                 female = {
    --                     ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
    --                     ['torso_1'] = 4,   ['torso_2'] = 14,
    --                     ['arms'] = 4,
    --                     ['pants_1'] = 25,   ['pants_2'] = 1,
    --                     ['shoes_1'] = 16,   ['shoes_2'] = 4,
    --                 }
    --             },

    --             [3] = { -- Order it will display
    --                 label = 'Utbildnings Kläder', -- Name of outfit that will display in menu
    --                 male = { -- Male variation
    --                     ['tshirt_1'] = 141,  ['tshirt_2'] = 0,
    --                     ['torso_1'] = 360,   ['torso_2'] = 0,
    --                     ['arms'] = 35,
    --                     ['mask_1'] = 27,   ['mask_2'] = 0,                                             
    --                     ['pants_1'] = 66,   ['pants_2'] = 0,
    --                     ['shoes_1'] = 63,   ['shoes_2'] = 0,
    --                     ['helmet_1'] = 136,  ['helmet_2'] = 0,
    --                     ['decals_1'] = 57,  ['decals_2'] = 0,                        
    --                     ['chains_1'] = 157,  ['chains_2'] = 0,
    --                     ['bulletproof_1'] = 3,  ['bulletproof_2'] = 3,                                                                                                
    --                 },
    --                 female = {
    --                     ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
    --                     ['torso_1'] = 4,   ['torso_2'] = 14,
    --                     ['arms'] = 4,
    --                     ['pants_1'] = 25,   ['pants_2'] = 1,
    --                     ['shoes_1'] = 16,   ['shoes_2'] = 4,
    --                 }
    --             },

    --             [4] = { -- Order it will display
    --                 label = 'Kirurg Kläder Nivå 1', -- Name of outfit that will display in menu
    --                 male = { -- Male variation
    --                     ['tshirt_1'] = 77,  ['tshirt_2'] = 0,
    --                     ['torso_1'] = 176,   ['torso_2'] = 0,
    --                     ['arms'] = 80,
    --                     ['mask_1'] = 185,   ['mask_2'] = 2,                                             
    --                     ['pants_1'] = 74,   ['pants_2'] = 0,
    --                     ['shoes_1'] = 63,   ['shoes_2'] = 0,
    --                     ['helmet_1'] = 26,  ['helmet_2'] = 0,                       
    --                     ['chains_1'] = 61,  ['chains_2'] = 0,                                                                                               
    --                 },
    --                 female = {
    --                     ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
    --                     ['torso_1'] = 4,   ['torso_2'] = 14,
    --                     ['arms'] = 4,
    --                     ['pants_1'] = 25,   ['pants_2'] = 1,
    --                     ['shoes_1'] = 16,   ['shoes_2'] = 4,
    --                 }
    --             },

    --             [5] = { -- Order it will display
    --                 label = 'Kirurg Kläder Nivå 2', -- Name of outfit that will display in menu
    --                 male = { -- Male variation
    --                     ['tshirt_1'] = 77,  ['tshirt_2'] = 2,
    --                     ['torso_1'] = 176,   ['torso_2'] = 2,
    --                     ['arms'] = 76,
    --                     ['mask_1'] = 185,   ['mask_2'] = 2,                                             
    --                     ['pants_1'] = 74,   ['pants_2'] = 2,
    --                     ['shoes_1'] = 63,   ['shoes_2'] = 0,
    --                     ['helmet_1'] = 26,  ['helmet_2'] = 0,                       
    --                     ['chains_1'] = 61,  ['chains_2'] = 0,                                                                                               
    --                 },
    --                 female = {
    --                     ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
    --                     ['torso_1'] = 4,   ['torso_2'] = 14,
    --                     ['arms'] = 4,
    --                     ['pants_1'] = 25,   ['pants_2'] = 1,
    --                     ['shoes_1'] = 16,   ['shoes_2'] = 4,
    --                 }
    --             },

    --             [6] = { -- Order it will display
    --                 label = 'Kirurg Kläder Nivå 3', -- Name of outfit that will display in menu
    --                 male = { -- Male variation
    --                     ['tshirt_1'] = 77,  ['tshirt_2'] = 3,
    --                     ['torso_1'] = 176,   ['torso_2'] = 3,
    --                     ['arms'] = 91,
    --                     ['mask_1'] = 185,   ['mask_2'] = 0,                                             
    --                     ['pants_1'] = 74,   ['pants_2'] = 3,
    --                     ['shoes_1'] = 63,   ['shoes_2'] = 0,
    --                     ['helmet_1'] = 26,  ['helmet_2'] = 0,                       
    --                     ['chains_1'] = 61,  ['chains_2'] = 0,                                                                                               
    --                 },
    --                 female = {
    --                     ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
    --                     ['torso_1'] = 4,   ['torso_2'] = 14,
    --                     ['arms'] = 4,
    --                     ['pants_1'] = 25,   ['pants_2'] = 1,
    --                     ['shoes_1'] = 16,   ['shoes_2'] = 4,
    --                 }
    --             },

    --             [7] = { -- Order it will display
    --                 label = 'Kirurg Kläder Nivå 4', -- Name of outfit that will display in menu
    --                 male = { -- Male variation
    --                     ['tshirt_1'] = 77,  ['tshirt_2'] = 1,
    --                     ['torso_1'] = 176,   ['torso_2'] = 1,
    --                     ['arms'] = 87,
    --                     ['mask_1'] = 185,   ['mask_2'] = 0,                                             
    --                     ['pants_1'] = 74,   ['pants_2'] = 1,
    --                     ['shoes_1'] = 63,   ['shoes_2'] = 0,
    --                     ['helmet_1'] = 26,  ['helmet_2'] = 0,                       
    --                     ['chains_1'] = 61,  ['chains_2'] = 0,                                                                                               
    --                 },
    --                 female = {
    --                     ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
    --                     ['torso_1'] = 4,   ['torso_2'] = 14,
    --                     ['arms'] = 4,
    --                     ['pants_1'] = 25,   ['pants_2'] = 1,
    --                     ['shoes_1'] = 16,   ['shoes_2'] = 4,
    --                 }
    --             },

    --             [8] = { -- Order it will display
    --                 label = 'Kirurg Kläder Nivå 6', -- Name of outfit that will display in menu
    --                 male = { -- Male variation
    --                     ['tshirt_1'] = 77,  ['tshirt_2'] = 1,
    --                     ['torso_1'] = 176,   ['torso_2'] = 1,
    --                     ['arms'] = 51,
    --                     ['mask_1'] = 185,   ['mask_2'] = 0,                                             
    --                     ['pants_1'] = 70,   ['pants_2'] = 1,
    --                     ['shoes_1'] = 63,   ['shoes_2'] = 0,
    --                     ['helmet_1'] = 26,  ['helmet_2'] = 0,                       
    --                     ['chains_1'] = 61,  ['chains_2'] = 0,                                                                                               
    --                 },
    --                 female = {
    --                     ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
    --                     ['torso_1'] = 4,   ['torso_2'] = 14,
    --                     ['arms'] = 4,
    --                     ['pants_1'] = 25,   ['pants_2'] = 1,
    --                     ['shoes_1'] = 16,   ['shoes_2'] = 4,
    --                 }
    --             },

    --             [9] = { -- Order it will display
    --                 label = 'Mc Kläder', -- Name of outfit that will display in menu
    --                 male = { -- Male variation
    --                     ['tshirt_1'] = 87,  ['tshirt_2'] = 3,
    --                     ['torso_1'] = 250,   ['torso_2'] = 1,
    --                     ['arms'] = 177,
    --                     ['mask_1'] = 68,   ['mask_2'] = 0,                                             
    --                     ['pants_1'] = 80,   ['pants_2'] = 0,
    --                     ['shoes_1'] = 63,   ['shoes_2'] = 0,
    --                     ['helmet_1'] = 76,  ['helmet_2'] = 8,
    --                     ['decals_1'] = 56,  ['decals_2'] = 0,                                               
    --                     ['chains_1'] = 61,  ['chains_2'] = 0,
    --                     ['glasses_1'] = 15,  ['glasses_2'] = 0,                        
    --                     ['bulletproof_1'] = 41,  ['bulletproof_2'] = 0,                        
                                                                                                                       
    --                 },
    --                 female = {
    --                     ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
    --                     ['torso_1'] = 4,   ['torso_2'] = 14,
    --                     ['arms'] = 4,
    --                     ['pants_1'] = 25,   ['pants_2'] = 1,
    --                     ['shoes_1'] = 16,   ['shoes_2'] = 4,
    --                 }
    --             },

    --             [10] = { -- Order it will display
    --                 label = 'Atv Kläder', -- Name of outfit that will display in menu
    --                 male = { -- Male variation
    --                     ['tshirt_1'] = 87,  ['tshirt_2'] = 3,
    --                     ['torso_1'] = 250,   ['torso_2'] = 1,
    --                     ['arms'] = 177,
    --                     ['mask_1'] = 68,   ['mask_2'] = 0,                                             
    --                     ['pants_1'] = 80,   ['pants_2'] = 0,
    --                     ['shoes_1'] = 63,   ['shoes_2'] = 0,
    --                     ['helmet_1'] = 76,  ['helmet_2'] = 8,
    --                     ['decals_1'] = 56,  ['decals_2'] = 0,                                               
    --                     ['chains_1'] = 61,  ['chains_2'] = 0,
    --                     ['glasses_1'] = 15,  ['glasses_2'] = 0,                        
    --                     ['bulletproof_1'] = 41,  ['bulletproof_2'] = 0,                        
                                                                                                                       
    --                 },
    --                 female = {
    --                     ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
    --                     ['torso_1'] = 4,   ['torso_2'] = 14,
    --                     ['arms'] = 4,
    --                     ['pants_1'] = 25,   ['pants_2'] = 1,
    --                     ['shoes_1'] = 16,   ['shoes_2'] = 4,
    --                 }
    --             },

    --             [11] = { -- Order it will display
    --                 label = 'Båtkläder', -- Name of outfit that will display in menu
    --                 male = { -- Male variation
    --                     ['tshirt_1'] = 141,  ['tshirt_2'] = 0,
    --                     ['torso_1'] = 341,   ['torso_2'] = 0,
    --                     ['arms'] = 43,
    --                     ['mask_1'] = 185,   ['mask_2'] = 0,                                             
    --                     ['pants_1'] = 66,   ['pants_2'] = 1,
    --                     ['shoes_1'] = 63,   ['shoes_2'] = 0,
    --                     ['helmet_1'] = 117,  ['helmet_2'] = 8,
    --                     ['decals_1'] = 57,  ['decals_2'] = 0,                                               
    --                     ['chains_1'] = 157,  ['chains_2'] = 0,
    --                     ['glasses_1'] = 1,  ['glasses_2'] = 1,                        
    --                     ['bulletproof_1'] = 6,  ['bulletproof_2'] = 3,                        
                                                                                                                       
    --                 },
    --                 female = {
    --                     ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
    --                     ['torso_1'] = 4,   ['torso_2'] = 14,
    --                     ['arms'] = 4,
    --                     ['pants_1'] = 25,   ['pants_2'] = 1,
    --                     ['shoes_1'] = 16,   ['shoes_2'] = 4,
    --                 }
    --             },

    --             [12] = { -- Order it will display
    --                 label = 'Jetskikläder', -- Name of outfit that will display in menu
    --                 male = { -- Male variation
    --                     ['tshirt_1'] = 141,  ['tshirt_2'] = 0,
    --                     ['torso_1'] = 340,   ['torso_2'] = 0,
    --                     ['arms'] = 42,
    --                     ['mask_1'] = 158,   ['mask_2'] = 0,                                             
    --                     ['pants_1'] = 66,   ['pants_2'] = 1,
    --                     ['shoes_1'] = 63,   ['shoes_2'] = 0,
    --                     ['helmet_1'] = 103,  ['helmet_2'] = 2,
    --                     ['decals_1'] = 57,  ['decals_2'] = 0,                                               
    --                     ['chains_1'] = 157,  ['chains_2'] = 0,
    --                     ['glasses_1'] = 30,  ['glasses_2'] = 1,                        
    --                     ['bulletproof_1'] = 6,  ['bulletproof_2'] = 3,                        
                                                                                                                       
    --                 },
    --                 female = {
    --                     ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
    --                     ['torso_1'] = 4,   ['torso_2'] = 14,
    --                     ['arms'] = 4,
    --                     ['pants_1'] = 25,   ['pants_2'] = 1,
    --                     ['shoes_1'] = 16,   ['shoes_2'] = 4,
    --                 }
    --             },

    --             [12] = { -- Order it will display
    --                 label = 'Dykarkläder', -- Name of outfit that will display in menu
    --                 male = { -- Male variation
    --                     ['tshirt_1'] = 123,  ['tshirt_2'] = 0,
    --                     ['torso_1'] = 176,   ['torso_2'] = 1,
    --                     ['arms'] = 101,
    --                     ['mask_1'] = 138,   ['mask_2'] = 0,                                             
    --                     ['pants_1'] = 128,   ['pants_2'] = 5,
    --                     ['shoes_1'] = 19,   ['shoes_2'] = 0,
    --                     ['helmet_1'] = 26,  ['helmet_2'] = 0,
    --                     ['decals_1'] = 56,  ['decals_2'] = 0,                                               
    --                     ['glasses_1'] = 27,  ['glasses_2'] = 0,                        
    --                     ['bulletproof_1'] = 6,  ['bulletproof_2'] = 3,                        
                                                                                                                       
    --                 },
    --                 female = {
    --                     ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
    --                     ['torso_1'] = 4,   ['torso_2'] = 14,
    --                     ['arms'] = 4,
    --                     ['pants_1'] = 25,   ['pants_2'] = 1,
    --                     ['shoes_1'] = 16,   ['shoes_2'] = 4,
    --                 }
    --             },

    --             [13] = { -- Order it will display
    --                 label = 'Helikopter Kläder', -- Name of outfit that will display in menu
    --                 male = { -- Male variation
    --                     ['tshirt_1'] = 141,  ['tshirt_2'] = 0,
    --                     ['torso_1'] = 353,   ['torso_2'] = 0,
    --                     ['arms'] = 43,
    --                     ['mask_1'] = 169,   ['mask_2'] = 0,                                             
    --                     ['pants_1'] = 66,   ['pants_2'] = 0,
    --                     ['shoes_1'] = 63,   ['shoes_2'] = 0,
    --                     ['helmet_1'] = 19,  ['helmet_2'] = 0,
    --                     ['decals_1'] = 57,  ['decals_2'] = 0,                                               
    --                     ['glasses_1'] = 27,  ['glasses_2'] = 0,                        
    --                     ['bulletproof_1'] = 6,  ['bulletproof_2'] = 1,                        
                                                                                                                       
    --                 },
    --                 female = {
    --                     ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
    --                     ['torso_1'] = 4,   ['torso_2'] = 14,
    --                     ['arms'] = 4,
    --                     ['pants_1'] = 25,   ['pants_2'] = 1,
    --                     ['shoes_1'] = 16,   ['shoes_2'] = 4,
    --                 }
    --             },

    --             [14] = { -- Order it will display
    --                 label = 'Jourläkar Kläder', -- Name of outfit that will display in menu
    --                 male = { -- Male variation
    --                     ['tshirt_1'] = 70,  ['tshirt_2'] = 0,
    --                     ['torso_1'] = 162,   ['torso_2'] = 0,
    --                     ['arms'] = 41,
    --                     ['mask_1'] = 27,   ['mask_2'] = 0,                                             
    --                     ['pants_1'] = 87,   ['pants_2'] = 0,
    --                     ['shoes_1'] = 63,   ['shoes_2'] = 0,
    --                     ['helmet_1'] = 136,  ['helmet_2'] = 0,
    --                     ['decals_1'] = 57,  ['decals_2'] = 0,
    --                     ['chains_1'] = 61,  ['chains_2'] = 0,                                                                       
    --                     ['glasses_1'] = 27,  ['glasses_2'] = 0,                        
    --                     ['bulletproof_1'] = 6,  ['bulletproof_2'] = 2,                        
                                                                                                                       
    --                 },
    --                 female = {
    --                     ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
    --                     ['torso_1'] = 4,   ['torso_2'] = 14,
    --                     ['arms'] = 4,
    --                     ['pants_1'] = 25,   ['pants_2'] = 1,
    --                     ['shoes_1'] = 16,   ['shoes_2'] = 4,
    --                 }
    --             },                                                                                                                                                                                                                
    --         }
    --     },

    --     MedicalSupplies = {                                                     -- EMS Shop for supplies
    --         Enabled = true,                                                     -- If set to false, rest of this table do not matter
    --         Ped = 's_m_m_doctor_01',                                            -- Ped to target
    --         Coords = vec3(306.63, -601.44, 43.28 - 0.95),                       -- Coords of ped/target
    --         Heading = 337.64,                                                   -- Heading of ped
    --         Supplies = {     
    --             { item = 'morphine30', label = 'Morphine 30MG', price = 100 },    
    --             { item = 'morphine15', label = 'Morphine 15MG', price = 100 },         
    --             { item = 'perc30', label = 'Percocet 30MG', price = 100 },         
    --             { item = 'perc10', label = 'Percocet 10MG', price = 100 },             
    --             { item = 'perc5', label = 'Percocet 5MG', price = 100 },    
    --             { item = 'vic10', label = 'Vicodin 10MG', price = 100 },              
    --             { item = 'vic5', label = 'Vicodin 5MG', price = 100 },                           -- Supplies
    --         { item = 'defib', label = 'Defibrillator', price = 100 }, -- Pretty self explanatory, price may be set to 'false' to make free
    --         { item = 'radio', label = 'Radio', price = 100 },
    --             { item = 'medbag', label = 'Medicineväska', price = 100 }, -- Pretty self explanatory, price may be set to 'false' to make free
    --             { item = 'medikit', label = 'Förbandsväska', price = 150 },
    --             { item = 'alvedon', label = 'Alvedon 500 mg', price = 150 },
    --             { item = 'ipren', label = 'Ipren 400 mg', price = 175 },
    --             { item = 'panodil', label = 'Panodil 500 mg', price = 150 },
    --             { item = 'aqua', label = 'Salvequick Aqua', price = 150 },
    --             { item = 'apoteket', label = 'Apoteket Sterilt Snabbförband', price = 160 },
    --             { item = 'tiger', label = 'Tiger Balsam 25 g', price = 125 },
    --             { item = 'idomin', label = 'Idomin Salva 100 g', price = 180 },
    --             { item = 'voltaren', label = 'Voltaren 23,2 mg', price = 110 },
    --         }
    --     },

    --     Helicopters = {                                   -- Vehicle Garage
    --     Enabled = true,                            -- Enable? False if you have you're own way for medics to obtain vehicles.
    --     Zone = {
    --         coords = vector3(-462.53384399414, -1027.634765625, 38.299999237061), -- Area to prompt vehicle garage
    --         range = 5.5,                           -- Range it will prompt from coords above
    --         label = '[E] - Öppna Garage',
    --         return_label = '[E] - Lämna TIllbaka Bil'
    --     },
    --     Spawn = {
    --         -- land = {
    --         --     coords = vector3(340.15710449219, -584.11102294922, 74.161682128906),
    --         --     heading = 253.55
    --         -- },
    --         air = {
    --             coords = vector3(-453.63192749023, -1029.9309082031, 38.396800994873),
    --             heading = 1.05
    --         }
    --     },
    --     Options = {
    --         [0] = {   
    --         ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
    --         label = 'Helikopter - AugustaWestland AW139',
    --         category = 'air', -- Options are 'land' and 'air'
    --     },
    --     ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
    --         label = 'Helikopter - Swedish Air Ambulance',
    --         category = 'air', -- Options are 'land' and 'air'
    --     },
    --     ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
    --         label = 'Helikopter - Röda Svenska Ambulansen',
    --         category = 'air', -- Options are 'land' and 'air'
    --     },
    -- },
--     [1] = {   
--         ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--         label = 'Helikopter - AugustaWestland AW139',
--         category = 'air', -- Options are 'land' and 'air'
--     },
--     ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--         label = 'Helikopter - Swedish Air Ambulance',
--         category = 'air', -- Options are 'land' and 'air'
--     },
--     ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--         label = 'Helikopter - Röda Svenska Ambulansen',
--         category = 'air', -- Options are 'land' and 'air'
--     },
-- },
--     [2] = {   
--         ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--         label = 'Helikopter - AugustaWestland AW139',
--         category = 'air', -- Options are 'land' and 'air'
--     },
--     ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--         label = 'Helikopter - Swedish Air Ambulance',
--         category = 'air', -- Options are 'land' and 'air'
--     },
--     ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--         label = 'Helikopter - Röda Svenska Ambulansen',
--         category = 'air', -- Options are 'land' and 'air'
--     },
-- },
--     [3] = {   
--         ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--         label = 'Helikopter - AugustaWestland AW139',
--         category = 'air', -- Options are 'land' and 'air'
--     },
--     ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--         label = 'Helikopter - Swedish Air Ambulance',
--         category = 'air', -- Options are 'land' and 'air'
--     },
--     ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--         label = 'Helikopter - Röda Svenska Ambulansen',
--         category = 'air', -- Options are 'land' and 'air'
--     },
-- },
--     [4] = {   
--         ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--         label = 'Helikopter - AugustaWestland AW139',
--         category = 'air', -- Options are 'land' and 'air'
--     },
--     ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--         label = 'Helikopter - Swedish Air Ambulance',
--         category = 'air', -- Options are 'land' and 'air'
--     },
--     ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--         label = 'Helikopter - Röda Svenska Ambulansen',
--         category = 'air', -- Options are 'land' and 'air'
--     },
-- },
--     [5] = {   
--         ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--         label = 'Helikopter - AugustaWestland AW139',
--         category = 'air', -- Options are 'land' and 'air'
--     },
--     ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--         label = 'Helikopter - Swedish Air Ambulance',
--         category = 'air', -- Options are 'land' and 'air'
--     },
--     ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--         label = 'Helikopter - Röda Svenska Ambulansen',
--         category = 'air', -- Options are 'land' and 'air'
--     },
-- },
--     [6] = {   
--         ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--         label = 'Helikopter - AugustaWestland AW139',
--         category = 'air', -- Options are 'land' and 'air'
--     },
--     ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--         label = 'Helikopter - Swedish Air Ambulance',
--         category = 'air', -- Options are 'land' and 'air'
--     },
--     ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--         label = 'Helikopter - Röda Svenska Ambulansen',
--         category = 'air', -- Options are 'land' and 'air'
--     },
-- },
--     [7] = {   
--         ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--         label = 'Helikopter - AugustaWestland AW139',
--         category = 'air', -- Options are 'land' and 'air'
--     },
--     ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--         label = 'Helikopter - Swedish Air Ambulance',
--         category = 'air', -- Options are 'land' and 'air'
--     },
--     ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--         label = 'Helikopter - Röda Svenska Ambulansen',
--         category = 'air', -- Options are 'land' and 'air'
--     },
-- },
--     [8] = {   
--         ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--         label = 'Helikopter - AugustaWestland AW139',
--         category = 'air', -- Options are 'land' and 'air'
--     },
--     ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--         label = 'Helikopter - Swedish Air Ambulance',
--         category = 'air', -- Options are 'land' and 'air'
--     },
--     ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--         label = 'Helikopter - Röda Svenska Ambulansen',
--         category = 'air', -- Options are 'land' and 'air'
--     },
--     },
--     [9] = {   
--         ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--         label = 'Helikopter - AugustaWestland AW139',
--         category = 'air', -- Options are 'land' and 'air'
--     },
--     ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--         label = 'Helikopter - Swedish Air Ambulance',
--         category = 'air', -- Options are 'land' and 'air'
--     },
--     ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--         label = 'Helikopter - Röda Svenska Ambulansen',
--         category = 'air', -- Options are 'land' and 'air'
--     },
-- },
--     [10] = {   
--         ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--         label = 'Helikopter - AugustaWestland AW139',
--         category = 'air', -- Options are 'land' and 'air'
--     },
--     ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--         label = 'Helikopter - Swedish Air Ambulance',
--         category = 'air', -- Options are 'land' and 'air'
--     },
--     ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--         label = 'Helikopter - Röda Svenska Ambulansen',
--         category = 'air', -- Options are 'land' and 'air'
--     },
-- },
-- },
--     [11] = {   
--         ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--         label = 'Helikopter - AugustaWestland AW139',
--         category = 'air', -- Options are 'land' and 'air'
--     },
--     ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--         label = 'Helikopter - Swedish Air Ambulance',
--         category = 'air', -- Options are 'land' and 'air'
--     },
--     ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--         label = 'Helikopter - Röda Svenska Ambulansen',
--         category = 'air', -- Options are 'land' and 'air'
--     },


--     },
-- },
--         Vehicles = {                                   -- Vehicle Garage
--             Enabled = true,                            -- Enable? False if you have you're own way for medics to obtain vehicles.
--             Zone = {
--                 coords = vector3(325.29452514648, -586.13580322266, 28.79683303833), -- Area to prompt vehicle garage
--                 range = 5.5,                           -- Range it will prompt from coords above
--                 label = '[E] - Öppna Garage',
--                 return_label = '[E] - Lämna TIllbaka Bil'
--             },
--             Spawn = {
--                 land = {
--                     coords = vector3(324.9592590332, -578.23681640625, 28.796836853027),
--                     heading = 345.432
--                 },
--                 -- air = {
--                 --     coords = vec3(351.24, -587.67, 74.55),
--                 --     heading = 289.29
--                 -- }
--             },
--             Options = {
--                 [0] = {                    -- Job grade as table name
--                 ['ambulance11'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'Volvo XC70 - Transportbil',
--                     category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['ambulance'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'Insats Lastbil',
--                     category = 'land', -- Options are 'land' and 'air'
--                 },                
--                 ['ambulance18'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'Mercedes E-Class',
--                     category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['ambulance4'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'Mercedes Vito',
--                     category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['ambulance3'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'Volvo XC90 - Transportbil',
--                     category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['ambulance1'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'Volkswagen Amarok',
--                     category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['ambulance10'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'Mercedes Sprinter',
--                     category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['ambulance19'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'Mercedes Otaris',
--                     category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['ambulance20'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'VW Crafter',
--                     category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['ambulance5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'Chevrolet Silverado',
--                     category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['ambulance17'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                 label = 'Volvo V90 Cross Country',
--                 category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['ambulance7'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                 label = 'Volvo XC70 - Akutläkare',
--                 category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['ambulance15'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                 label = 'Mercedes Viano (Överläkare+)',
--                 category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['blazer5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                 label = 'Fyrhjuling',
--                 category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['ambulance12'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                 label = 'Jourläkarbil',
--                 category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['sheriff2'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                 label = 'Ledningsbil',
--                 category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['volvoxc90'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                 label = 'Understödbil',
--                 category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['ambulans2021'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                 label = 'Ambulanc MC',
--                 category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['romero'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                 label = 'Likbil',
--                 category = 'land', -- Options are 'land' and 'air'
--                 },                                                
--                 ['pbus'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'Buss',
--                     category = 'land', -- Options are 'land' and 'air'
--                 },                                                                                                                                                                                                                
--                 },

--                 [1] = {
--                 ['ambulance11'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'Volvo XC70 - Transportbil',
--                     category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['ambulance'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'Insats Lastbil',
--                     category = 'land', -- Options are 'land' and 'air'
--                 },                
--                 ['ambulance18'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'Mercedes E-Class',
--                     category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['ambulance4'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'Mercedes Vito',
--                     category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['ambulance3'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'Volvo XC90 - Transportbil',
--                     category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['ambulance1'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'Volkswagen Amarok',
--                     category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['ambulance10'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'Mercedes Sprinter',
--                     category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['ambulance19'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'Mercedes Otaris',
--                     category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['ambulance20'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'VW Crafter',
--                     category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['ambulance5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'Chevrolet Silverado',
--                     category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['ambulance17'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                 label = 'Volvo V90 Cross Country',
--                 category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['ambulance7'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                 label = 'Volvo XC70 - Akutläkare',
--                 category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['ambulance15'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                 label = 'Mercedes Viano (Överläkare+)',
--                 category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['blazer5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                 label = 'Fyrhjuling',
--                 category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['ambulance12'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                 label = 'Jourläkarbil',
--                 category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['sheriff2'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                 label = 'Ledningsbil',
--                 category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['volvoxc90'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                 label = 'Understödbil',
--                 category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['ambulans2021'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                 label = 'Ambulanc MC',
--                 category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['romero'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                 label = 'Likbil',
--                 category = 'land', -- Options are 'land' and 'air'
--                 },                                                
--                 ['pbus'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'Buss',
--                     category = 'land', -- Options are 'land' and 'air'
--                 },                                                                                                                                                                                                                
--                 },

--                 [2] = {
--                 ['ambulance11'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'Volvo XC70 - Transportbil',
--                     category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['ambulance'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'Insats Lastbil',
--                     category = 'land', -- Options are 'land' and 'air'
--                 },                
--                 ['ambulance18'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'Mercedes E-Class',
--                     category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['ambulance4'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'Mercedes Vito',
--                     category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['ambulance3'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'Volvo XC90 - Transportbil',
--                     category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['ambulance1'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'Volkswagen Amarok',
--                     category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['ambulance10'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'Mercedes Sprinter',
--                     category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['ambulance19'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'Mercedes Otaris',
--                     category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['ambulance20'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'VW Crafter',
--                     category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['ambulance5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'Chevrolet Silverado',
--                     category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['ambulance17'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                 label = 'Volvo V90 Cross Country',
--                 category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['ambulance7'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                 label = 'Volvo XC70 - Akutläkare',
--                 category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['ambulance15'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                 label = 'Mercedes Viano (Överläkare+)',
--                 category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['blazer5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                 label = 'Fyrhjuling',
--                 category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['ambulance12'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                 label = 'Jourläkarbil',
--                 category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['sheriff2'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                 label = 'Ledningsbil',
--                 category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['volvoxc90'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                 label = 'Understödbil',
--                 category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['ambulans2021'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                 label = 'Ambulanc MC',
--                 category = 'land', -- Options are 'land' and 'air'
--                 },
--                 ['romero'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                 label = 'Likbil',
--                 category = 'land', -- Options are 'land' and 'air'
--                 },                                                
--                 ['pbus'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'Buss',
--                     category = 'land', -- Options are 'land' and 'air'
--                 },                                                                                                                                                                                                                
--                 },
--                 [3] = {
--                     ['ambulance11'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                         label = 'Volvo XC70 - Transportbil',
--                         category = 'land', -- Options are 'land' and 'air'
--                     },
--                     ['ambulance'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                         label = 'Insats Lastbil',
--                         category = 'land', -- Options are 'land' and 'air'
--                     },                
--                     ['ambulance18'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                         label = 'Mercedes E-Class',
--                         category = 'land', -- Options are 'land' and 'air'
--                     },
--                     ['ambulance4'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                         label = 'Mercedes Vito',
--                         category = 'land', -- Options are 'land' and 'air'
--                     },
--                     ['ambulance3'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                         label = 'Volvo XC90 - Transportbil',
--                         category = 'land', -- Options are 'land' and 'air'
--                     },
--                     ['ambulance1'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                         label = 'Volkswagen Amarok',
--                         category = 'land', -- Options are 'land' and 'air'
--                     },
--                     ['ambulance10'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                         label = 'Mercedes Sprinter',
--                         category = 'land', -- Options are 'land' and 'air'
--                     },
--                     ['ambulance19'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                         label = 'Mercedes Otaris',
--                         category = 'land', -- Options are 'land' and 'air'
--                     },
--                     ['ambulance20'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                         label = 'VW Crafter',
--                         category = 'land', -- Options are 'land' and 'air'
--                     },
--                     ['ambulance5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                         label = 'Chevrolet Silverado',
--                         category = 'land', -- Options are 'land' and 'air'
--                     },
--                     ['ambulance17'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'Volvo V90 Cross Country',
--                     category = 'land', -- Options are 'land' and 'air'
--                     },
--                     ['ambulance7'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'Volvo XC70 - Akutläkare',
--                     category = 'land', -- Options are 'land' and 'air'
--                     },
--                     ['ambulance15'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'Mercedes Viano (Överläkare+)',
--                     category = 'land', -- Options are 'land' and 'air'
--                     },
--                     ['blazer5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'Fyrhjuling',
--                     category = 'land', -- Options are 'land' and 'air'
--                     },
--                     ['ambulance12'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'Jourläkarbil',
--                     category = 'land', -- Options are 'land' and 'air'
--                     },
--                     ['sheriff2'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'Ledningsbil',
--                     category = 'land', -- Options are 'land' and 'air'
--                     },
--                     ['volvoxc90'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'Understödbil',
--                     category = 'land', -- Options are 'land' and 'air'
--                     },
--                     ['ambulans2021'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'Ambulanc MC',
--                     category = 'land', -- Options are 'land' and 'air'
--                     },
--                     ['romero'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                     label = 'Likbil',
--                     category = 'land', -- Options are 'land' and 'air'
--                     },                                                
--                     ['pbus'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                         label = 'Buss',
--                         category = 'land', -- Options are 'land' and 'air'
--                     },                                                                                                                                                                                                                
--                     },
--                     [4] = {
--                         ['ambulance11'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                             label = 'Volvo XC70 - Transportbil',
--                             category = 'land', -- Options are 'land' and 'air'
--                         },
--                         ['ambulance'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                             label = 'Insats Lastbil',
--                             category = 'land', -- Options are 'land' and 'air'
--                         },                
--                         ['ambulance18'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                             label = 'Mercedes E-Class',
--                             category = 'land', -- Options are 'land' and 'air'
--                         },
--                         ['ambulance4'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                             label = 'Mercedes Vito',
--                             category = 'land', -- Options are 'land' and 'air'
--                         },
--                         ['ambulance3'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                             label = 'Volvo XC90 - Transportbil',
--                             category = 'land', -- Options are 'land' and 'air'
--                         },
--                         ['ambulance1'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                             label = 'Volkswagen Amarok',
--                             category = 'land', -- Options are 'land' and 'air'
--                         },
--                         ['ambulance10'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                             label = 'Mercedes Sprinter',
--                             category = 'land', -- Options are 'land' and 'air'
--                         },
--                         ['ambulance19'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                             label = 'Mercedes Otaris',
--                             category = 'land', -- Options are 'land' and 'air'
--                         },
--                         ['ambulance20'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                             label = 'VW Crafter',
--                             category = 'land', -- Options are 'land' and 'air'
--                         },
--                         ['ambulance5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                             label = 'Chevrolet Silverado',
--                             category = 'land', -- Options are 'land' and 'air'
--                         },
--                         ['ambulance17'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                         label = 'Volvo V90 Cross Country',
--                         category = 'land', -- Options are 'land' and 'air'
--                         },
--                         ['ambulance7'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                         label = 'Volvo XC70 - Akutläkare',
--                         category = 'land', -- Options are 'land' and 'air'
--                         },
--                         ['ambulance15'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                         label = 'Mercedes Viano (Överläkare+)',
--                         category = 'land', -- Options are 'land' and 'air'
--                         },
--                         ['blazer5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                         label = 'Fyrhjuling',
--                         category = 'land', -- Options are 'land' and 'air'
--                         },
--                         ['ambulance12'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                         label = 'Jourläkarbil',
--                         category = 'land', -- Options are 'land' and 'air'
--                         },
--                         ['sheriff2'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                         label = 'Ledningsbil',
--                         category = 'land', -- Options are 'land' and 'air'
--                         },
--                         ['volvoxc90'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                         label = 'Understödbil',
--                         category = 'land', -- Options are 'land' and 'air'
--                         },
--                         ['ambulans2021'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                         label = 'Ambulanc MC',
--                         category = 'land', -- Options are 'land' and 'air'
--                         },
--                         ['romero'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                         label = 'Likbil',
--                         category = 'land', -- Options are 'land' and 'air'
--                         },                                                
--                         ['pbus'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                             label = 'Buss',
--                             category = 'land', -- Options are 'land' and 'air'
--                         },                                                                                                                                                                                                             
--                         },
--                         [5] = {
--                             ['ambulance11'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                 label = 'Volvo XC70 - Transportbil',
--                                 category = 'land', -- Options are 'land' and 'air'
--                             },
--                             ['ambulance'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                 label = 'Insats Lastbil',
--                                 category = 'land', -- Options are 'land' and 'air'
--                             },                
--                             ['ambulance18'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                 label = 'Mercedes E-Class',
--                                 category = 'land', -- Options are 'land' and 'air'
--                             },
--                             ['ambulance4'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                 label = 'Mercedes Vito',
--                                 category = 'land', -- Options are 'land' and 'air'
--                             },
--                             ['ambulance3'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                 label = 'Volvo XC90 - Transportbil',
--                                 category = 'land', -- Options are 'land' and 'air'
--                             },
--                             ['ambulance1'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                 label = 'Volkswagen Amarok',
--                                 category = 'land', -- Options are 'land' and 'air'
--                             },
--                             ['ambulance10'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                 label = 'Mercedes Sprinter',
--                                 category = 'land', -- Options are 'land' and 'air'
--                             },
--                             ['ambulance19'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                 label = 'Mercedes Otaris',
--                                 category = 'land', -- Options are 'land' and 'air'
--                             },
--                             ['ambulance20'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                 label = 'VW Crafter',
--                                 category = 'land', -- Options are 'land' and 'air'
--                             },
--                             ['ambulance5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                 label = 'Chevrolet Silverado',
--                                 category = 'land', -- Options are 'land' and 'air'
--                             },
--                             ['ambulance17'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                             label = 'Volvo V90 Cross Country',
--                             category = 'land', -- Options are 'land' and 'air'
--                             },
--                             ['ambulance7'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                             label = 'Volvo XC70 - Akutläkare',
--                             category = 'land', -- Options are 'land' and 'air'
--                             },
--                             ['ambulance15'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                             label = 'Mercedes Viano (Överläkare+)',
--                             category = 'land', -- Options are 'land' and 'air'
--                             },
--                             ['blazer5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                             label = 'Fyrhjuling',
--                             category = 'land', -- Options are 'land' and 'air'
--                             },
--                             ['ambulance12'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                             label = 'Jourläkarbil',
--                             category = 'land', -- Options are 'land' and 'air'
--                             },
--                             ['sheriff2'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                             label = 'Ledningsbil',
--                             category = 'land', -- Options are 'land' and 'air'
--                             },
--                             ['volvoxc90'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                             label = 'Understödbil',
--                             category = 'land', -- Options are 'land' and 'air'
--                             },
--                             ['ambulans2021'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                             label = 'Ambulanc MC',
--                             category = 'land', -- Options are 'land' and 'air'
--                             },
--                             ['romero'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                             label = 'Likbil',
--                             category = 'land', -- Options are 'land' and 'air'
--                             },                                                
--                             ['pbus'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                 label = 'Buss',
--                                 category = 'land', -- Options are 'land' and 'air'
--                             },                                                                                                                                                                                                              
--                             },
--                             [6] = {
--                                 ['ambulance11'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                     label = 'Volvo XC70 - Transportbil',
--                                     category = 'land', -- Options are 'land' and 'air'
--                                 },
--                                 ['ambulance'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                     label = 'Insats Lastbil',
--                                     category = 'land', -- Options are 'land' and 'air'
--                                 },                
--                                 ['ambulance18'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                     label = 'Mercedes E-Class',
--                                     category = 'land', -- Options are 'land' and 'air'
--                                 },
--                                 ['ambulance4'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                     label = 'Mercedes Vito',
--                                     category = 'land', -- Options are 'land' and 'air'
--                                 },
--                                 ['ambulance3'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                     label = 'Volvo XC90 - Transportbil',
--                                     category = 'land', -- Options are 'land' and 'air'
--                                 },
--                                 ['ambulance1'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                     label = 'Volkswagen Amarok',
--                                     category = 'land', -- Options are 'land' and 'air'
--                                 },
--                                 ['ambulance10'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                     label = 'Mercedes Sprinter',
--                                     category = 'land', -- Options are 'land' and 'air'
--                                 },
--                                 ['ambulance19'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                     label = 'Mercedes Otaris',
--                                     category = 'land', -- Options are 'land' and 'air'
--                                 },
--                                 ['ambulance20'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                     label = 'VW Crafter',
--                                     category = 'land', -- Options are 'land' and 'air'
--                                 },
--                                 ['ambulance5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                     label = 'Chevrolet Silverado',
--                                     category = 'land', -- Options are 'land' and 'air'
--                                 },
--                                 ['ambulance17'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                 label = 'Volvo V90 Cross Country',
--                                 category = 'land', -- Options are 'land' and 'air'
--                                 },
--                                 ['ambulance7'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                 label = 'Volvo XC70 - Akutläkare',
--                                 category = 'land', -- Options are 'land' and 'air'
--                                 },
--                                 ['ambulance15'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                 label = 'Mercedes Viano (Överläkare+)',
--                                 category = 'land', -- Options are 'land' and 'air'
--                                 },
--                                 ['blazer5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                 label = 'Fyrhjuling',
--                                 category = 'land', -- Options are 'land' and 'air'
--                                 },
--                                 ['ambulance12'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                 label = 'Jourläkarbil',
--                                 category = 'land', -- Options are 'land' and 'air'
--                                 },
--                                 ['sheriff2'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                 label = 'Ledningsbil',
--                                 category = 'land', -- Options are 'land' and 'air'
--                                 },
--                                 ['volvoxc90'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                 label = 'Understödbil',
--                                 category = 'land', -- Options are 'land' and 'air'
--                                 },
--                                 ['ambulans2021'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                 label = 'Ambulanc MC',
--                                 category = 'land', -- Options are 'land' and 'air'
--                                 },
--                                 ['romero'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                 label = 'Likbil',
--                                 category = 'land', -- Options are 'land' and 'air'
--                                 },                                                
--                                 ['pbus'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                     label = 'Buss',
--                                     category = 'land', -- Options are 'land' and 'air'
--                                 },                                                                                                                                                                                                               
--                                 },
--                                 [8] = {
--                                     ['ambulance11'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                         label = 'Volvo XC70 - Transportbil',
--                                         category = 'land', -- Options are 'land' and 'air'
--                                     },
--                                     ['ambulance'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                         label = 'Insats Lastbil',
--                                         category = 'land', -- Options are 'land' and 'air'
--                                     },                
--                                     ['ambulance18'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                         label = 'Mercedes E-Class',
--                                         category = 'land', -- Options are 'land' and 'air'
--                                     },
--                                     ['ambulance4'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                         label = 'Mercedes Vito',
--                                         category = 'land', -- Options are 'land' and 'air'
--                                     },
--                                     ['ambulance3'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                         label = 'Volvo XC90 - Transportbil',
--                                         category = 'land', -- Options are 'land' and 'air'
--                                     },
--                                     ['ambulance1'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                         label = 'Volkswagen Amarok',
--                                         category = 'land', -- Options are 'land' and 'air'
--                                     },
--                                     ['ambulance10'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                         label = 'Mercedes Sprinter',
--                                         category = 'land', -- Options are 'land' and 'air'
--                                     },
--                                     ['ambulance19'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                         label = 'Mercedes Otaris',
--                                         category = 'land', -- Options are 'land' and 'air'
--                                     },
--                                     ['ambulance20'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                         label = 'VW Crafter',
--                                         category = 'land', -- Options are 'land' and 'air'
--                                     },
--                                     ['ambulance5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                         label = 'Chevrolet Silverado',
--                                         category = 'land', -- Options are 'land' and 'air'
--                                     },
--                                     ['ambulance17'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                     label = 'Volvo V90 Cross Country',
--                                     category = 'land', -- Options are 'land' and 'air'
--                                     },
--                                     ['ambulance7'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                     label = 'Volvo XC70 - Akutläkare',
--                                     category = 'land', -- Options are 'land' and 'air'
--                                     },
--                                     ['ambulance15'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                     label = 'Mercedes Viano (Överläkare+)',
--                                     category = 'land', -- Options are 'land' and 'air'
--                                     },
--                                     ['blazer5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                     label = 'Fyrhjuling',
--                                     category = 'land', -- Options are 'land' and 'air'
--                                     },
--                                     ['ambulance12'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                     label = 'Jourläkarbil',
--                                     category = 'land', -- Options are 'land' and 'air'
--                                     },
--                                     ['sheriff2'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                     label = 'Ledningsbil',
--                                     category = 'land', -- Options are 'land' and 'air'
--                                     },
--                                     ['volvoxc90'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                     label = 'Understödbil',
--                                     category = 'land', -- Options are 'land' and 'air'
--                                     },
--                                     ['ambulans2021'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                     label = 'Ambulanc MC',
--                                     category = 'land', -- Options are 'land' and 'air'
--                                     },
--                                     ['romero'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                     label = 'Likbil',
--                                     category = 'land', -- Options are 'land' and 'air'
--                                     },                                                
--                                     ['pbus'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                         label = 'Buss',
--                                         category = 'land', -- Options are 'land' and 'air'
--                                     },                                                                                                                                                                                                               
--                                     },
--                                     [9] = {
--                                         ['ambulance11'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                             label = 'Volvo XC70 - Transportbil',
--                                             category = 'land', -- Options are 'land' and 'air'
--                                         },
--                                         ['ambulance'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                             label = 'Insats Lastbil',
--                                             category = 'land', -- Options are 'land' and 'air'
--                                         },                
--                                         ['ambulance18'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                             label = 'Mercedes E-Class',
--                                             category = 'land', -- Options are 'land' and 'air'
--                                         },
--                                         ['ambulance4'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                             label = 'Mercedes Vito',
--                                             category = 'land', -- Options are 'land' and 'air'
--                                         },
--                                         ['ambulance3'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                             label = 'Volvo XC90 - Transportbil',
--                                             category = 'land', -- Options are 'land' and 'air'
--                                         },
--                                         ['ambulance1'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                             label = 'Volkswagen Amarok',
--                                             category = 'land', -- Options are 'land' and 'air'
--                                         },
--                                         ['ambulance10'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                             label = 'Mercedes Sprinter',
--                                             category = 'land', -- Options are 'land' and 'air'
--                                         },
--                                         ['ambulance19'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                             label = 'Mercedes Otaris',
--                                             category = 'land', -- Options are 'land' and 'air'
--                                         },
--                                         ['ambulance20'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                             label = 'VW Crafter',
--                                             category = 'land', -- Options are 'land' and 'air'
--                                         },
--                                         ['ambulance5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                             label = 'Chevrolet Silverado',
--                                             category = 'land', -- Options are 'land' and 'air'
--                                         },
--                                         ['ambulance17'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                         label = 'Volvo V90 Cross Country',
--                                         category = 'land', -- Options are 'land' and 'air'
--                                         },
--                                         ['ambulance7'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                         label = 'Volvo XC70 - Akutläkare',
--                                         category = 'land', -- Options are 'land' and 'air'
--                                         },
--                                         ['ambulance15'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                         label = 'Mercedes Viano (Överläkare+)',
--                                         category = 'land', -- Options are 'land' and 'air'
--                                         },
--                                         ['blazer5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                         label = 'Fyrhjuling',
--                                         category = 'land', -- Options are 'land' and 'air'
--                                         },
--                                         ['ambulance12'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                         label = 'Jourläkarbil',
--                                         category = 'land', -- Options are 'land' and 'air'
--                                         },
--                                         ['sheriff2'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                         label = 'Ledningsbil',
--                                         category = 'land', -- Options are 'land' and 'air'
--                                         },
--                                         ['volvoxc90'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                         label = 'Understödbil',
--                                         category = 'land', -- Options are 'land' and 'air'
--                                         },
--                                         ['ambulans2021'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                         label = 'Ambulanc MC',
--                                         category = 'land', -- Options are 'land' and 'air'
--                                         },
--                                         ['romero'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                         label = 'Likbil',
--                                         category = 'land', -- Options are 'land' and 'air'
--                                         },                                                
--                                         ['pbus'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                             label = 'Buss',
--                                             category = 'land', -- Options are 'land' and 'air'
--                                         },                                                                                                                                                                                                             
--                                         },
--                                         [10] = {
--                                             ['ambulance11'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                                 label = 'Volvo XC70 - Transportbil',
--                                                 category = 'land', -- Options are 'land' and 'air'
--                                             },
--                                             ['ambulance'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                                 label = 'Insats Lastbil',
--                                                 category = 'land', -- Options are 'land' and 'air'
--                                             },                
--                                             ['ambulance18'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                                 label = 'Mercedes E-Class',
--                                                 category = 'land', -- Options are 'land' and 'air'
--                                             },
--                                             ['ambulance4'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                                 label = 'Mercedes Vito',
--                                                 category = 'land', -- Options are 'land' and 'air'
--                                             },
--                                             ['ambulance3'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                                 label = 'Volvo XC90 - Transportbil',
--                                                 category = 'land', -- Options are 'land' and 'air'
--                                             },
--                                             ['ambulance1'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                                 label = 'Volkswagen Amarok',
--                                                 category = 'land', -- Options are 'land' and 'air'
--                                             },
--                                             ['ambulance10'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                                 label = 'Mercedes Sprinter',
--                                                 category = 'land', -- Options are 'land' and 'air'
--                                             },
--                                             ['ambulance19'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                                 label = 'Mercedes Otaris',
--                                                 category = 'land', -- Options are 'land' and 'air'
--                                             },
--                                             ['ambulance20'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                                 label = 'VW Crafter',
--                                                 category = 'land', -- Options are 'land' and 'air'
--                                             },
--                                             ['ambulance5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                                 label = 'Chevrolet Silverado',
--                                                 category = 'land', -- Options are 'land' and 'air'
--                                             },
--                                             ['ambulance17'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                             label = 'Volvo V90 Cross Country',
--                                             category = 'land', -- Options are 'land' and 'air'
--                                             },
--                                             ['ambulance7'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                             label = 'Volvo XC70 - Akutläkare',
--                                             category = 'land', -- Options are 'land' and 'air'
--                                             },
--                                             ['ambulance15'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                             label = 'Mercedes Viano (Överläkare+)',
--                                             category = 'land', -- Options are 'land' and 'air'
--                                             },
--                                             ['blazer5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                             label = 'Fyrhjuling',
--                                             category = 'land', -- Options are 'land' and 'air'
--                                             },
--                                             ['ambulance12'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                             label = 'Jourläkarbil',
--                                             category = 'land', -- Options are 'land' and 'air'
--                                             },
--                                             ['sheriff2'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                             label = 'Ledningsbil',
--                                             category = 'land', -- Options are 'land' and 'air'
--                                             },
--                                             ['volvoxc90'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                             label = 'Understödbil',
--                                             category = 'land', -- Options are 'land' and 'air'
--                                             },
--                                             ['ambulans2021'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                             label = 'Ambulanc MC',
--                                             category = 'land', -- Options are 'land' and 'air'
--                                             },
--                                             ['romero'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                             label = 'Likbil',
--                                             category = 'land', -- Options are 'land' and 'air'
--                                             },                                                
--                                             ['pbus'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                                 label = 'Buss',
--                                                 category = 'land', -- Options are 'land' and 'air'
--                                             },                                                                                                                                                                                
                           
--                                             },
--                                             [11] = {
--                                                 ['ambulance11'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                                     label = 'Volvo XC70 - Transportbil',
--                                                     category = 'land', -- Options are 'land' and 'air'
--                                                 },
--                                                 ['ambulance'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                                     label = 'Insats Lastbil',
--                                                     category = 'land', -- Options are 'land' and 'air'
--                                                 },                
--                                                 ['ambulance18'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                                     label = 'Mercedes E-Class',
--                                                     category = 'land', -- Options are 'land' and 'air'
--                                                 },
--                                                 ['ambulance4'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                                     label = 'Mercedes Vito',
--                                                     category = 'land', -- Options are 'land' and 'air'
--                                                 },
--                                                 ['ambulance3'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                                     label = 'Volvo XC90 - Transportbil',
--                                                     category = 'land', -- Options are 'land' and 'air'
--                                                 },
--                                                 ['ambulance1'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                                     label = 'Volkswagen Amarok',
--                                                     category = 'land', -- Options are 'land' and 'air'
--                                                 },
--                                                 ['ambulance10'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                                     label = 'Mercedes Sprinter',
--                                                     category = 'land', -- Options are 'land' and 'air'
--                                                 },
--                                                 ['ambulance19'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                                     label = 'Mercedes Otaris',
--                                                     category = 'land', -- Options are 'land' and 'air'
--                                                 },
--                                                 ['ambulance20'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                                     label = 'VW Crafter',
--                                                     category = 'land', -- Options are 'land' and 'air'
--                                                 },
--                                                 ['ambulance5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                                     label = 'Chevrolet Silverado',
--                                                     category = 'land', -- Options are 'land' and 'air'
--                                                 },
--                                                 ['ambulance17'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                                 label = 'Volvo V90 Cross Country',
--                                                 category = 'land', -- Options are 'land' and 'air'
--                                                 },
--                                                 ['ambulance7'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                                 label = 'Volvo XC70 - Akutläkare',
--                                                 category = 'land', -- Options are 'land' and 'air'
--                                                 },
--                                                 ['ambulance15'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                                 label = 'Mercedes Viano (Överläkare+)',
--                                                 category = 'land', -- Options are 'land' and 'air'
--                                                 },
--                                                 ['blazer5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                                 label = 'Fyrhjuling',
--                                                 category = 'land', -- Options are 'land' and 'air'
--                                                 },
--                                                 ['ambulance12'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                                 label = 'Jourläkarbil',
--                                                 category = 'land', -- Options are 'land' and 'air'
--                                                 },
--                                                 ['sheriff2'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                                 label = 'Ledningsbil',
--                                                 category = 'land', -- Options are 'land' and 'air'
--                                                 },
--                                                 ['volvoxc90'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                                 label = 'Understödbil',
--                                                 category = 'land', -- Options are 'land' and 'air'
--                                                 },
--                                                 ['ambulans2021'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                                 label = 'Ambulanc MC',
--                                                 category = 'land', -- Options are 'land' and 'air'
--                                                 },
--                                                 ['romero'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                                 label = 'Likbil',
--                                                 category = 'land', -- Options are 'land' and 'air'
--                                                 },                                                
--                                                 ['pbus'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
--                                                     label = 'Buss',
--                                                     category = 'land', -- Options are 'land' and 'air'
--                                                 },                                                                                                                                                                                
                                
--                                                 }
--             }
--         },
--     },
    Sandy = {
        RespawnPoint = { -- When player dies and bleeds out; they will revive at nearest hospital; Define the coords of this hospital here.
        coords = vector3(1828.259765625, 3667.0864257812, 34.276741027832),
        heading = 218.74,
        -- Even if you have useCheckInInstead to true, you must still define these coords for finding closest hospital
        -- If you want to use check-in instead of respawning at this location(Otherwise will just spawn at the coords above)
        useCheckInInstead = true
    },
    Blip = {
        Enabled = true,
        Coords = vector3(1828.259765625, 3667.0864257812, 34.276741027832),
        Sprite = 61,
        Color = 0,
        Scale = 0.8,
        String = 'Sjukhuset'
    },
        clockInAndOut = {
            enabled = false,                       -- Enable clocking in and out at a set location? (If using ESX you must have a off duty job for Config.ambulanceJob with same grades - example in main _install_first directory)
            coords = vec3(334.75, -580.24, 43.28), -- Location of where to go on and off duty(If not using target)
            label = '[E] - Go On/Off Duty',        -- Text to display(If not using target)
            distance = 3.0,                        -- Distance to display text UI(If not using target)
            target = {
                enabled = false,                   -- If enabled, the location and distance above will be obsolete
                label = 'Go On/Off Duty',
                coords = vec3(334.75, -580.24, 43.28),
                heading = 337.07,
                width = 2.0,
                length = 1.0,
                minZ = 43.28 - 0.9,
                maxZ = 43.28 + 0.9
            }
        },

        PersonalLocker = {
            enabled = false,                        -- Enable personal locker(stash) - THIS IS CURRENTLY ONLY AVALIABLE IN QB-INVENTORY
            coords = vec3(298.6, -598.45, 43.28),   -- Location of where to access personal locker (If target is disabled)
            label = '[E] - Access Personal Locker', -- Text to display(If not using target)
            distance = 1.5,                         -- Distance to display text UI(If not using target)
            target = {
                enabled = false,                    -- If enabled, the location and distance above will be obsolete
                label = 'Access Locker',
                coords = vec3(298.6, -598.45, 43.28),
                heading = 70.18,
                width = 2.0,
                length = 1.0,
                minZ = 43.28 - 0.9,
                maxZ = 43.28 + 0.9
            }
        },


        BossMenu = {
            Enabled = true,                        -- Enabled boss menu?
            Coords = vector3(1814.826171875, 3674.9130859375, 34.272754669189), -- Location of boss menu (If not using target)
            Label = '[E] - Få tillgång till chefsmenyn', -- Text UI label string (If not using target)
            Distance = 2.5,                        -- Distance to allow access/prompt with text UI (If not using target)
            Target = {
                enabled = false,                   -- Enable Target? (Can be customized in wasabi_bridge/customize/cl_customize.lua the target system)
                label = 'Access Boss Menu',
                coords = vec3(335.59, -594.33, 43.21),
                heading = 269.85,
                width = 2.0,
                length = 1.0,
                minZ = 43.21 - 0.9,
                maxZ = 43.21 + 0.9
            }
        },

        CheckIn = {                                      -- Hospital check-in
            Enabled = true,                              -- Enable ped and check-in area?
            Ped = 's_f_y_scrubs_01',                  -- Check in ped
            Coords = vector3(1837.5302734375, 3682.0766601562, 34.272727966309-0.9), -- Coords of ped
            Distance = 4.85,                             -- Distance to show textUI (If target is not enabled below)
            Heading = 63.26,                             -- Heading of ped
            Cost = 3000,                                 -- Cost of using hospital check-in. Set to false for free
            Duration = 15 * seconds,                     -- Time it takes to spend in hospital bed
            MaxOnDuty = 6,                               -- If this amount or less you can use, otherwise it will tell you that EMS is avaliable(Set to false to always enable check-in)
            PayAccount = 'bank',                         -- Account dead player pays from to check-in
            Label = '[E] - Få hjälp av Svetlana',                    -- label of text UI if target is not enabled below
            HotKey = 38,                                 -- Default: 38 (E) (If target below is not enabled)
            Target = {
                enabled = false,                          -- Enable Target? (Can be customized in wasabi_bridge/customize/cl_customize.lua the target system)
                label = 'Checka In',
                coords = vec3(308.58, -595.31, 43.28),
                heading = 63.26,
                distance = 5.0,
                width = 2.0,
                length = 1.0,
                minZ = 43.28 - 0.9,
                maxZ = 43.28 + 0.9
            },
            DisableHospitalBeds = false,                                                       -- Disable hospital beds for check-in at this location?(Player will spend Duration checking in before respawning in RespawnNoBedLocation when set to true)
            RespawnNoBedLocation = { coords = vec3(316.66, -581.3, 43.28), heading = 339.02 }, -- Coords and heading of where to spawn player if DisableHospitalBeds is set to true or beds are full
            HospitalBeds = {
                --              { coords = vec3(332.62, -587.17, 42.84+0.3), heading = 160.0 },
                { coords = vector3(1829.9770507812, 3680.7924804688, 35.192081451416-0.9), heading = 300.0 },
                { coords = vector3(1831.8719482422, 3678.1875, 35.190868377686-0.9), heading = 300.0 },
                { coords = vector3(1833.3386230469, 3675.71484375, 35.196529388428-0.9),  heading = 300.0 },
                { coords = vector3(1834.9736328125, 3672.6823730469, 35.192268371582-0.9), heading = 300.0 },

                -- Stock qb-ambulance hospital bed coords:
                --                { coords = vec3(353.1, -584.6, 43.11), heading = 152.08 },
                --                { coords = vec3(356.79, -585.86, 43.11), heading = 152.08 },
                --                { coords = vec3(354.12, -593.12, 43.1), heading = 336.32 },
                --                { coords = vec3(350.79, -591.8, 43.1), heading = 336.32 },
                --                { coords = vec3(346.99, -590.48, 43.1), heading = 336.32 },
                --                { coords = vec3(360.32, -587.19, 43.02), heading = 152.08 },
                --                { coords = vec3(349.82, -583.33, 43.02), heading = 152.08 },
                --                { coords = vec3(326.98, -576.17, 43.02), heading = 152.08 }
            }

        },
        Cloakroom = {
            Enabled = true,
            Coords = vector3(1824.7799072266, 3686.2790527344, 34.272705078125),
            -- Coords of cloakroom
            Label = '[E] - Ändra kläder',     -- String of text ui of cloakroom
            HotKey = 38,                        -- Default: 38 (E)
            Range = 1.5,                        -- Range away from coords you can use.
            Uniforms = { -- Uniform choices
                [1] = { -- Order it will display
                    label = 'Jobbkläder Sommar', -- Name of outfit that will display in menu
                    male = { -- Male variation
                        ['tshirt_1'] = 141,  ['tshirt_2'] = 0,
                        ['torso_1'] = 340,   ['torso_2'] = 0,
                        ['arms'] = 35,
                        ['mask_1'] = 27,   ['mask_2'] = 0,                        
                        ['pants_1'] = 66,   ['pants_2'] = 0,
                        ['shoes_1'] = 63,   ['shoes_2'] = 0,
                        ['helmet_1'] = 136,  ['helmet_2'] = 0,
                        ['decals_1'] = 57,  ['decals_2'] = 0,
                        ['chains_1'] = 157,  ['chains_2'] = 0,                                                
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 4,   ['torso_2'] = 14,
                        ['arms'] = 4,
                        ['pants_1'] = 25,   ['pants_2'] = 1,
                        ['shoes_1'] = 16,   ['shoes_2'] = 4,
                    }
                },

                [2] = { -- Order it will display
                    label = 'Jobbkläder Vinter', -- Name of outfit that will display in menu
                    male = { -- Male variation
                        ['tshirt_1'] = 141,  ['tshirt_2'] = 0,
                        ['torso_1'] = 341,   ['torso_2'] = 0,
                        ['arms'] = 44,
                        ['mask_1'] = 27,   ['mask_2'] = 0,                        
                        ['pants_1'] = 66,   ['pants_2'] = 0,
                        ['shoes_1'] = 63,   ['shoes_2'] = 0,
                        ['helmet_1'] = 136,  ['helmet_2'] = 0,
                        ['decals_1'] = 57,  ['decals_2'] = 0,
                        ['chains_1'] = 157,  ['chains_2'] = 0,                                                
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 4,   ['torso_2'] = 14,
                        ['arms'] = 4,
                        ['pants_1'] = 25,   ['pants_2'] = 1,
                        ['shoes_1'] = 16,   ['shoes_2'] = 4,
                    }
                },

                [2] = { -- Order it will display
                    label = 'Möteskläder', -- Name of outfit that will display in menu
                    male = { -- Male variation
                        ['tshirt_1'] = 163,  ['tshirt_2'] = 0,
                        ['torso_1'] = 404,   ['torso_2'] = 0,
                        ['arms'] = 4,                     
                        ['pants_1'] = 10,   ['pants_2'] = 0,
                        ['shoes_1'] = 10,   ['shoes_2'] = 0,
                        ['helmet_1'] = 136,  ['helmet_2'] = 0,
                        ['chains_1'] = 158,  ['chains_2'] = 0,                                                
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 4,   ['torso_2'] = 14,
                        ['arms'] = 4,
                        ['pants_1'] = 25,   ['pants_2'] = 1,
                        ['shoes_1'] = 16,   ['shoes_2'] = 4,
                    }
                },

                [3] = { -- Order it will display
                    label = 'Utbildnings Kläder', -- Name of outfit that will display in menu
                    male = { -- Male variation
                        ['tshirt_1'] = 141,  ['tshirt_2'] = 0,
                        ['torso_1'] = 360,   ['torso_2'] = 0,
                        ['arms'] = 35,
                        ['mask_1'] = 27,   ['mask_2'] = 0,                                             
                        ['pants_1'] = 66,   ['pants_2'] = 0,
                        ['shoes_1'] = 63,   ['shoes_2'] = 0,
                        ['helmet_1'] = 136,  ['helmet_2'] = 0,
                        ['decals_1'] = 57,  ['decals_2'] = 0,                        
                        ['chains_1'] = 157,  ['chains_2'] = 0,
                        ['bulletproof_1'] = 3,  ['bulletproof_2'] = 3,                                                                                                
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 4,   ['torso_2'] = 14,
                        ['arms'] = 4,
                        ['pants_1'] = 25,   ['pants_2'] = 1,
                        ['shoes_1'] = 16,   ['shoes_2'] = 4,
                    }
                },

                [4] = { -- Order it will display
                    label = 'Kirurg Kläder Nivå 1', -- Name of outfit that will display in menu
                    male = { -- Male variation
                        ['tshirt_1'] = 77,  ['tshirt_2'] = 0,
                        ['torso_1'] = 176,   ['torso_2'] = 0,
                        ['arms'] = 80,
                        ['mask_1'] = 185,   ['mask_2'] = 2,                                             
                        ['pants_1'] = 74,   ['pants_2'] = 0,
                        ['shoes_1'] = 63,   ['shoes_2'] = 0,
                        ['helmet_1'] = 26,  ['helmet_2'] = 0,                       
                        ['chains_1'] = 61,  ['chains_2'] = 0,                                                                                               
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 4,   ['torso_2'] = 14,
                        ['arms'] = 4,
                        ['pants_1'] = 25,   ['pants_2'] = 1,
                        ['shoes_1'] = 16,   ['shoes_2'] = 4,
                    }
                },

                [5] = { -- Order it will display
                    label = 'Kirurg Kläder Nivå 2', -- Name of outfit that will display in menu
                    male = { -- Male variation
                        ['tshirt_1'] = 77,  ['tshirt_2'] = 2,
                        ['torso_1'] = 176,   ['torso_2'] = 2,
                        ['arms'] = 76,
                        ['mask_1'] = 185,   ['mask_2'] = 2,                                             
                        ['pants_1'] = 74,   ['pants_2'] = 2,
                        ['shoes_1'] = 63,   ['shoes_2'] = 0,
                        ['helmet_1'] = 26,  ['helmet_2'] = 0,                       
                        ['chains_1'] = 61,  ['chains_2'] = 0,                                                                                               
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 4,   ['torso_2'] = 14,
                        ['arms'] = 4,
                        ['pants_1'] = 25,   ['pants_2'] = 1,
                        ['shoes_1'] = 16,   ['shoes_2'] = 4,
                    }
                },

                [6] = { -- Order it will display
                    label = 'Kirurg Kläder Nivå 3', -- Name of outfit that will display in menu
                    male = { -- Male variation
                        ['tshirt_1'] = 77,  ['tshirt_2'] = 3,
                        ['torso_1'] = 176,   ['torso_2'] = 3,
                        ['arms'] = 91,
                        ['mask_1'] = 185,   ['mask_2'] = 0,                                             
                        ['pants_1'] = 74,   ['pants_2'] = 3,
                        ['shoes_1'] = 63,   ['shoes_2'] = 0,
                        ['helmet_1'] = 26,  ['helmet_2'] = 0,                       
                        ['chains_1'] = 61,  ['chains_2'] = 0,                                                                                               
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 4,   ['torso_2'] = 14,
                        ['arms'] = 4,
                        ['pants_1'] = 25,   ['pants_2'] = 1,
                        ['shoes_1'] = 16,   ['shoes_2'] = 4,
                    }
                },

                [7] = { -- Order it will display
                    label = 'Kirurg Kläder Nivå 4', -- Name of outfit that will display in menu
                    male = { -- Male variation
                        ['tshirt_1'] = 77,  ['tshirt_2'] = 1,
                        ['torso_1'] = 176,   ['torso_2'] = 1,
                        ['arms'] = 87,
                        ['mask_1'] = 185,   ['mask_2'] = 0,                                             
                        ['pants_1'] = 74,   ['pants_2'] = 1,
                        ['shoes_1'] = 63,   ['shoes_2'] = 0,
                        ['helmet_1'] = 26,  ['helmet_2'] = 0,                       
                        ['chains_1'] = 61,  ['chains_2'] = 0,                                                                                               
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 4,   ['torso_2'] = 14,
                        ['arms'] = 4,
                        ['pants_1'] = 25,   ['pants_2'] = 1,
                        ['shoes_1'] = 16,   ['shoes_2'] = 4,
                    }
                },

                [8] = { -- Order it will display
                    label = 'Kirurg Kläder Nivå 6', -- Name of outfit that will display in menu
                    male = { -- Male variation
                        ['tshirt_1'] = 77,  ['tshirt_2'] = 1,
                        ['torso_1'] = 176,   ['torso_2'] = 1,
                        ['arms'] = 51,
                        ['mask_1'] = 185,   ['mask_2'] = 0,                                             
                        ['pants_1'] = 70,   ['pants_2'] = 1,
                        ['shoes_1'] = 63,   ['shoes_2'] = 0,
                        ['helmet_1'] = 26,  ['helmet_2'] = 0,                       
                        ['chains_1'] = 61,  ['chains_2'] = 0,                                                                                               
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 4,   ['torso_2'] = 14,
                        ['arms'] = 4,
                        ['pants_1'] = 25,   ['pants_2'] = 1,
                        ['shoes_1'] = 16,   ['shoes_2'] = 4,
                    }
                },

                [9] = { -- Order it will display
                    label = 'Mc Kläder', -- Name of outfit that will display in menu
                    male = { -- Male variation
                        ['tshirt_1'] = 87,  ['tshirt_2'] = 3,
                        ['torso_1'] = 250,   ['torso_2'] = 1,
                        ['arms'] = 177,
                        ['mask_1'] = 68,   ['mask_2'] = 0,                                             
                        ['pants_1'] = 80,   ['pants_2'] = 0,
                        ['shoes_1'] = 63,   ['shoes_2'] = 0,
                        ['helmet_1'] = 76,  ['helmet_2'] = 8,
                        ['decals_1'] = 56,  ['decals_2'] = 0,                                               
                        ['chains_1'] = 61,  ['chains_2'] = 0,
                        ['glasses_1'] = 15,  ['glasses_2'] = 0,                        
                        ['bulletproof_1'] = 41,  ['bulletproof_2'] = 0,                        
                                                                                                                       
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 4,   ['torso_2'] = 14,
                        ['arms'] = 4,
                        ['pants_1'] = 25,   ['pants_2'] = 1,
                        ['shoes_1'] = 16,   ['shoes_2'] = 4,
                    }
                },

                [10] = { -- Order it will display
                    label = 'Atv Kläder', -- Name of outfit that will display in menu
                    male = { -- Male variation
                        ['tshirt_1'] = 87,  ['tshirt_2'] = 3,
                        ['torso_1'] = 250,   ['torso_2'] = 1,
                        ['arms'] = 177,
                        ['mask_1'] = 68,   ['mask_2'] = 0,                                             
                        ['pants_1'] = 80,   ['pants_2'] = 0,
                        ['shoes_1'] = 63,   ['shoes_2'] = 0,
                        ['helmet_1'] = 76,  ['helmet_2'] = 8,
                        ['decals_1'] = 56,  ['decals_2'] = 0,                                               
                        ['chains_1'] = 61,  ['chains_2'] = 0,
                        ['glasses_1'] = 15,  ['glasses_2'] = 0,                        
                        ['bulletproof_1'] = 41,  ['bulletproof_2'] = 0,                        
                                                                                                                       
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 4,   ['torso_2'] = 14,
                        ['arms'] = 4,
                        ['pants_1'] = 25,   ['pants_2'] = 1,
                        ['shoes_1'] = 16,   ['shoes_2'] = 4,
                    }
                },

                [11] = { -- Order it will display
                    label = 'Båtkläder', -- Name of outfit that will display in menu
                    male = { -- Male variation
                        ['tshirt_1'] = 141,  ['tshirt_2'] = 0,
                        ['torso_1'] = 341,   ['torso_2'] = 0,
                        ['arms'] = 43,
                        ['mask_1'] = 185,   ['mask_2'] = 0,                                             
                        ['pants_1'] = 66,   ['pants_2'] = 1,
                        ['shoes_1'] = 63,   ['shoes_2'] = 0,
                        ['helmet_1'] = 117,  ['helmet_2'] = 8,
                        ['decals_1'] = 57,  ['decals_2'] = 0,                                               
                        ['chains_1'] = 157,  ['chains_2'] = 0,
                        ['glasses_1'] = 1,  ['glasses_2'] = 1,                        
                        ['bulletproof_1'] = 6,  ['bulletproof_2'] = 3,                        
                                                                                                                       
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 4,   ['torso_2'] = 14,
                        ['arms'] = 4,
                        ['pants_1'] = 25,   ['pants_2'] = 1,
                        ['shoes_1'] = 16,   ['shoes_2'] = 4,
                    }
                },

                [12] = { -- Order it will display
                    label = 'Jetskikläder', -- Name of outfit that will display in menu
                    male = { -- Male variation
                        ['tshirt_1'] = 141,  ['tshirt_2'] = 0,
                        ['torso_1'] = 340,   ['torso_2'] = 0,
                        ['arms'] = 42,
                        ['mask_1'] = 158,   ['mask_2'] = 0,                                             
                        ['pants_1'] = 66,   ['pants_2'] = 1,
                        ['shoes_1'] = 63,   ['shoes_2'] = 0,
                        ['helmet_1'] = 103,  ['helmet_2'] = 2,
                        ['decals_1'] = 57,  ['decals_2'] = 0,                                               
                        ['chains_1'] = 157,  ['chains_2'] = 0,
                        ['glasses_1'] = 30,  ['glasses_2'] = 1,                        
                        ['bulletproof_1'] = 6,  ['bulletproof_2'] = 3,                        
                                                                                                                       
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 4,   ['torso_2'] = 14,
                        ['arms'] = 4,
                        ['pants_1'] = 25,   ['pants_2'] = 1,
                        ['shoes_1'] = 16,   ['shoes_2'] = 4,
                    }
                },

                [12] = { -- Order it will display
                    label = 'Dykarkläder', -- Name of outfit that will display in menu
                    male = { -- Male variation
                        ['tshirt_1'] = 123,  ['tshirt_2'] = 0,
                        ['torso_1'] = 176,   ['torso_2'] = 1,
                        ['arms'] = 101,
                        ['mask_1'] = 138,   ['mask_2'] = 0,                                             
                        ['pants_1'] = 128,   ['pants_2'] = 5,
                        ['shoes_1'] = 19,   ['shoes_2'] = 0,
                        ['helmet_1'] = 26,  ['helmet_2'] = 0,
                        ['decals_1'] = 56,  ['decals_2'] = 0,                                               
                        ['glasses_1'] = 27,  ['glasses_2'] = 0,                        
                        ['bulletproof_1'] = 6,  ['bulletproof_2'] = 3,                        
                                                                                                                       
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 4,   ['torso_2'] = 14,
                        ['arms'] = 4,
                        ['pants_1'] = 25,   ['pants_2'] = 1,
                        ['shoes_1'] = 16,   ['shoes_2'] = 4,
                    }
                },

                [13] = { -- Order it will display
                    label = 'Helikopter Kläder', -- Name of outfit that will display in menu
                    male = { -- Male variation
                        ['tshirt_1'] = 141,  ['tshirt_2'] = 0,
                        ['torso_1'] = 353,   ['torso_2'] = 0,
                        ['arms'] = 43,
                        ['mask_1'] = 169,   ['mask_2'] = 0,                                             
                        ['pants_1'] = 66,   ['pants_2'] = 0,
                        ['shoes_1'] = 63,   ['shoes_2'] = 0,
                        ['helmet_1'] = 19,  ['helmet_2'] = 0,
                        ['decals_1'] = 57,  ['decals_2'] = 0,                                               
                        ['glasses_1'] = 27,  ['glasses_2'] = 0,                        
                        ['bulletproof_1'] = 6,  ['bulletproof_2'] = 1,                        
                                                                                                                       
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 4,   ['torso_2'] = 14,
                        ['arms'] = 4,
                        ['pants_1'] = 25,   ['pants_2'] = 1,
                        ['shoes_1'] = 16,   ['shoes_2'] = 4,
                    }
                },

                [14] = { -- Order it will display
                    label = 'Jourläkar Kläder', -- Name of outfit that will display in menu
                    male = { -- Male variation
                        ['tshirt_1'] = 70,  ['tshirt_2'] = 0,
                        ['torso_1'] = 162,   ['torso_2'] = 0,
                        ['arms'] = 41,
                        ['mask_1'] = 27,   ['mask_2'] = 0,                                             
                        ['pants_1'] = 87,   ['pants_2'] = 0,
                        ['shoes_1'] = 63,   ['shoes_2'] = 0,
                        ['helmet_1'] = 136,  ['helmet_2'] = 0,
                        ['decals_1'] = 57,  ['decals_2'] = 0,
                        ['chains_1'] = 61,  ['chains_2'] = 0,                                                                       
                        ['glasses_1'] = 27,  ['glasses_2'] = 0,                        
                        ['bulletproof_1'] = 6,  ['bulletproof_2'] = 2,                        
                                                                                                                       
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 4,   ['torso_2'] = 14,
                        ['arms'] = 4,
                        ['pants_1'] = 25,   ['pants_2'] = 1,
                        ['shoes_1'] = 16,   ['shoes_2'] = 4,
                    }
                },                                                                                                                                                                                                                
            }
        },

        MedicalSupplies = {                                                     -- EMS Shop for supplies
            Enabled = true,                                                     -- If set to false, rest of this table do not matter
            Ped = 's_m_m_doctor_01',                                            -- Ped to target
            Coords = vector3(1820.2542724609, 3677.5417480469, 34.272701263428-0.95),                       -- Coords of ped/target
            Heading = 300.0,                                                   -- Heading of ped
            Supplies = {     
                { item = 'morphine30', label = 'Morphine 30MG', price = 100 },    
                { item = 'morphine15', label = 'Morphine 15MG', price = 100 },         
                { item = 'perc30', label = 'Percocet 30MG', price = 100 },         
                { item = 'perc10', label = 'Percocet 10MG', price = 100 },             
                { item = 'perc5', label = 'Percocet 5MG', price = 100 },    
                { item = 'vic10', label = 'Vicodin 10MG', price = 100 },              
                { item = 'vic5', label = 'Vicodin 5MG', price = 100 },                           -- Supplies
            { item = 'defib', label = 'Defibrillator', price = 100 }, -- Pretty self explanatory, price may be set to 'false' to make free
            { item = 'radio', label = 'Radio', price = 100 },
                { item = 'medbag', label = 'Medicineväska', price = 100 }, -- Pretty self explanatory, price may be set to 'false' to make free
                { item = 'medikit', label = 'Förbandsväska', price = 150 },
                { item = 'alvedon', label = 'Alvedon 500 mg', price = 150 },
                { item = 'ipren', label = 'Ipren 400 mg', price = 175 },
                { item = 'panodil', label = 'Panodil 500 mg', price = 150 },
                { item = 'aqua', label = 'Salvequick Aqua', price = 150 },
                { item = 'apoteket', label = 'Apoteket Sterilt Snabbförband', price = 160 },
                { item = 'tiger', label = 'Tiger Balsam 25 g', price = 125 },
                { item = 'idomin', label = 'Idomin Salva 100 g', price = 180 },
                { item = 'voltaren', label = 'Voltaren 23,2 mg', price = 110 },
            }
        },

        Helicopters = {                                   -- Vehicle Garage
        Enabled = true,                            -- Enable? False if you have you're own way for medics to obtain vehicles.
        Zone = {
            coords = vector3(-462.53384399414, -1027.634765625, 38.299999237061), -- Area to prompt vehicle garage
            range = 5.5,                           -- Range it will prompt from coords above
            label = '[E] - Öppna Garage',
            return_label = '[E] - Lämna TIllbaka Bil'
        },
        Spawn = {
            -- land = {
            --     coords = vector3(340.15710449219, -584.11102294922, 74.161682128906),
            --     heading = 253.55
            -- },
            air = {
                coords = vector3(-453.63192749023, -1029.9309082031, 38.396800994873),
                heading = 1.05
            }
        },
        Options = {
            [0] = {   
        --     ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        --     label = 'Helikopter - AugustaWestland AW139',
        --     category = 'air', -- Options are 'land' and 'air'
        -- },
        -- ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        --     label = 'Helikopter - Swedish Air Ambulance',
        --     category = 'air', -- Options are 'land' and 'air'
        -- },
        -- ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        --     label = 'Helikopter - Röda Svenska Ambulansen',
        --     category = 'air', -- Options are 'land' and 'air'
        -- },
    },
    [1] = {   
    --     ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
    --     label = 'Helikopter - AugustaWestland AW139',
    --     category = 'air', -- Options are 'land' and 'air'
    -- },
    -- ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
    --     label = 'Helikopter - Swedish Air Ambulance',
    --     category = 'air', -- Options are 'land' and 'air'
    -- },
    -- ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
    --     label = 'Helikopter - Röda Svenska Ambulansen',
    --     category = 'air', -- Options are 'land' and 'air'
    -- },
},
    [2] = {   
        ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - AugustaWestland AW139',
        category = 'air', -- Options are 'land' and 'air'
    },
    ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - Swedish Air Ambulance',
        category = 'air', -- Options are 'land' and 'air'
    },
    ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - Röda Svenska Ambulansen',
        category = 'air', -- Options are 'land' and 'air'
    },
},
    [3] = {   
        ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - AugustaWestland AW139',
        category = 'air', -- Options are 'land' and 'air'
    },
    ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - Swedish Air Ambulance',
        category = 'air', -- Options are 'land' and 'air'
    },
    ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - Röda Svenska Ambulansen',
        category = 'air', -- Options are 'land' and 'air'
    },
},
    [4] = {   
        ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - AugustaWestland AW139',
        category = 'air', -- Options are 'land' and 'air'
    },
    ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - Swedish Air Ambulance',
        category = 'air', -- Options are 'land' and 'air'
    },
    ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - Röda Svenska Ambulansen',
        category = 'air', -- Options are 'land' and 'air'
    },
},
    [5] = {   
        ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - AugustaWestland AW139',
        category = 'air', -- Options are 'land' and 'air'
    },
    ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - Swedish Air Ambulance',
        category = 'air', -- Options are 'land' and 'air'
    },
    ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - Röda Svenska Ambulansen',
        category = 'air', -- Options are 'land' and 'air'
    },
},
    [6] = {   
        ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - AugustaWestland AW139',
        category = 'air', -- Options are 'land' and 'air'
    },
    ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - Swedish Air Ambulance',
        category = 'air', -- Options are 'land' and 'air'
    },
    ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - Röda Svenska Ambulansen',
        category = 'air', -- Options are 'land' and 'air'
    },
},
    [7] = {   
        ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - AugustaWestland AW139',
        category = 'air', -- Options are 'land' and 'air'
    },
    ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - Swedish Air Ambulance',
        category = 'air', -- Options are 'land' and 'air'
    },
    ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - Röda Svenska Ambulansen',
        category = 'air', -- Options are 'land' and 'air'
    },
},
    [8] = {   
        ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - AugustaWestland AW139',
        category = 'air', -- Options are 'land' and 'air'
    },
    ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - Swedish Air Ambulance',
        category = 'air', -- Options are 'land' and 'air'
    },
    ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - Röda Svenska Ambulansen',
        category = 'air', -- Options are 'land' and 'air'
    },
    },
    [9] = {   
        ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - AugustaWestland AW139',
        category = 'air', -- Options are 'land' and 'air'
    },
    ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - Swedish Air Ambulance',
        category = 'air', -- Options are 'land' and 'air'
    },
    ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - Röda Svenska Ambulansen',
        category = 'air', -- Options are 'land' and 'air'
    },
},
    [10] = {   
        ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - AugustaWestland AW139',
        category = 'air', -- Options are 'land' and 'air'
    },
    ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - Swedish Air Ambulance',
        category = 'air', -- Options are 'land' and 'air'
    },
    ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - Röda Svenska Ambulansen',
        category = 'air', -- Options are 'land' and 'air'
    },
},
},
    [11] = {   
        ['aw139'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - AugustaWestland AW139',
        category = 'air', -- Options are 'land' and 'air'
    },
    ['supervolito'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - Swedish Air Ambulance',
        category = 'air', -- Options are 'land' and 'air'
    },
    ['Ambmav'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
        label = 'Helikopter - Röda Svenska Ambulansen',
        category = 'air', -- Options are 'land' and 'air'
    },


    },
},
        Vehicles = {                                   -- Vehicle Garage
            Enabled = true,                            -- Enable? False if you have you're own way for medics to obtain vehicles.
            Zone = {
                coords = vector3(1813.7355957031, 3669.642578125, 34.272747039795), -- Area to prompt vehicle garage
                range = 8.0,                           -- Range it will prompt from coords above
                label = '[E] - Öppna Garage',
                return_label = '[E] - Lämna TIllbaka Bil'
            },
            Spawn = {
                land = {
                    coords = vector3(1822.8684082031, 3652.7326660156, 34.174533843994),
                    heading = 305.32
                },
                -- air = {
                --     coords = vec3(351.24, -587.67, 74.55),
                --     heading = 289.29
                -- }
            },
            Options = {
                [0] = {                    -- Job grade as table name
                ['ambulance11'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Volvo XC70 - Transportbil',
                    category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Insats Lastbil',
                    category = 'land', -- Options are 'land' and 'air'
                },                
                ['ambulance18'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Mercedes E-Class',
                    category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance4'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Mercedes Vito',
                    category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance3'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Volvo XC90 - Transportbil',
                    category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance1'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Volkswagen Amarok',
                    category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance10'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Mercedes Sprinter',
                    category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance19'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Mercedes Otaris',
                    category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance20'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'VW Crafter',
                    category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Chevrolet Silverado',
                    category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance17'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                label = 'Volvo V90 Cross Country',
                category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance7'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                label = 'Volvo XC70 - Akutläkare',
                category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance15'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                label = 'Mercedes Viano (Överläkare+)',
                category = 'land', -- Options are 'land' and 'air'
                },
                ['blazer5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                label = 'Fyrhjuling',
                category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance12'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                label = 'Jourläkarbil',
                category = 'land', -- Options are 'land' and 'air'
                },
                ['sheriff2'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                label = 'Ledningsbil',
                category = 'land', -- Options are 'land' and 'air'
                },
                ['volvoxc90'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                label = 'Understödbil',
                category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulans2021'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                label = 'Ambulanc MC',
                category = 'land', -- Options are 'land' and 'air'
                },
                ['romero'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                label = 'Likbil',
                category = 'land', -- Options are 'land' and 'air'
                },                                                
                ['pbus'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Buss',
                    category = 'land', -- Options are 'land' and 'air'
                },                                                                                                                                                                                                                
                },

                [1] = {
                ['ambulance11'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Volvo XC70 - Transportbil',
                    category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Insats Lastbil',
                    category = 'land', -- Options are 'land' and 'air'
                },                
                ['ambulance18'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Mercedes E-Class',
                    category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance4'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Mercedes Vito',
                    category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance3'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Volvo XC90 - Transportbil',
                    category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance1'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Volkswagen Amarok',
                    category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance10'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Mercedes Sprinter',
                    category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance19'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Mercedes Otaris',
                    category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance20'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'VW Crafter',
                    category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Chevrolet Silverado',
                    category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance17'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                label = 'Volvo V90 Cross Country',
                category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance7'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                label = 'Volvo XC70 - Akutläkare',
                category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance15'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                label = 'Mercedes Viano (Överläkare+)',
                category = 'land', -- Options are 'land' and 'air'
                },
                ['blazer5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                label = 'Fyrhjuling',
                category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance12'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                label = 'Jourläkarbil',
                category = 'land', -- Options are 'land' and 'air'
                },
                ['sheriff2'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                label = 'Ledningsbil',
                category = 'land', -- Options are 'land' and 'air'
                },
                ['volvoxc90'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                label = 'Understödbil',
                category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulans2021'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                label = 'Ambulanc MC',
                category = 'land', -- Options are 'land' and 'air'
                },
                ['romero'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                label = 'Likbil',
                category = 'land', -- Options are 'land' and 'air'
                },                                                
                ['pbus'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Buss',
                    category = 'land', -- Options are 'land' and 'air'
                },                                                                                                                                                                                                                
                },

                [2] = {
                ['ambulance11'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Volvo XC70 - Transportbil',
                    category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Insats Lastbil',
                    category = 'land', -- Options are 'land' and 'air'
                },                
                ['ambulance18'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Mercedes E-Class',
                    category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance4'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Mercedes Vito',
                    category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance3'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Volvo XC90 - Transportbil',
                    category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance1'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Volkswagen Amarok',
                    category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance10'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Mercedes Sprinter',
                    category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance19'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Mercedes Otaris',
                    category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance20'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'VW Crafter',
                    category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Chevrolet Silverado',
                    category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance17'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                label = 'Volvo V90 Cross Country',
                category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance7'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                label = 'Volvo XC70 - Akutläkare',
                category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance15'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                label = 'Mercedes Viano (Överläkare+)',
                category = 'land', -- Options are 'land' and 'air'
                },
                ['blazer5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                label = 'Fyrhjuling',
                category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulance12'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                label = 'Jourläkarbil',
                category = 'land', -- Options are 'land' and 'air'
                },
                ['sheriff2'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                label = 'Ledningsbil',
                category = 'land', -- Options are 'land' and 'air'
                },
                ['volvoxc90'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                label = 'Understödbil',
                category = 'land', -- Options are 'land' and 'air'
                },
                ['ambulans2021'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                label = 'Ambulanc MC',
                category = 'land', -- Options are 'land' and 'air'
                },
                ['romero'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                label = 'Likbil',
                category = 'land', -- Options are 'land' and 'air'
                },                                                
                ['pbus'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Buss',
                    category = 'land', -- Options are 'land' and 'air'
                },                                                                                                                                                                                                                
                },
                [3] = {
                    ['ambulance11'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Volvo XC70 - Transportbil',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['ambulance'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Insats Lastbil',
                        category = 'land', -- Options are 'land' and 'air'
                    },                
                    ['ambulance18'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Mercedes E-Class',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['ambulance4'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Mercedes Vito',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['ambulance3'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Volvo XC90 - Transportbil',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['ambulance1'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Volkswagen Amarok',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['ambulance10'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Mercedes Sprinter',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['ambulance19'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Mercedes Otaris',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['ambulance20'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'VW Crafter',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['ambulance5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Chevrolet Silverado',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['ambulance17'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Volvo V90 Cross Country',
                    category = 'land', -- Options are 'land' and 'air'
                    },
                    ['ambulance7'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Volvo XC70 - Akutläkare',
                    category = 'land', -- Options are 'land' and 'air'
                    },
                    ['ambulance15'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Mercedes Viano (Överläkare+)',
                    category = 'land', -- Options are 'land' and 'air'
                    },
                    ['blazer5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Fyrhjuling',
                    category = 'land', -- Options are 'land' and 'air'
                    },
                    ['ambulance12'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Jourläkarbil',
                    category = 'land', -- Options are 'land' and 'air'
                    },
                    ['sheriff2'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Ledningsbil',
                    category = 'land', -- Options are 'land' and 'air'
                    },
                    ['volvoxc90'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Understödbil',
                    category = 'land', -- Options are 'land' and 'air'
                    },
                    ['ambulans2021'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Ambulanc MC',
                    category = 'land', -- Options are 'land' and 'air'
                    },
                    ['romero'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                    label = 'Likbil',
                    category = 'land', -- Options are 'land' and 'air'
                    },                                                
                    ['pbus'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Buss',
                        category = 'land', -- Options are 'land' and 'air'
                    },                                                                                                                                                                                                                
                    },
                    [4] = {
                        ['ambulance11'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'Volvo XC70 - Transportbil',
                            category = 'land', -- Options are 'land' and 'air'
                        },
                        ['ambulance'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'Insats Lastbil',
                            category = 'land', -- Options are 'land' and 'air'
                        },                
                        ['ambulance18'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'Mercedes E-Class',
                            category = 'land', -- Options are 'land' and 'air'
                        },
                        ['ambulance4'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'Mercedes Vito',
                            category = 'land', -- Options are 'land' and 'air'
                        },
                        ['ambulance3'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'Volvo XC90 - Transportbil',
                            category = 'land', -- Options are 'land' and 'air'
                        },
                        ['ambulance1'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'Volkswagen Amarok',
                            category = 'land', -- Options are 'land' and 'air'
                        },
                        ['ambulance10'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'Mercedes Sprinter',
                            category = 'land', -- Options are 'land' and 'air'
                        },
                        ['ambulance19'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'Mercedes Otaris',
                            category = 'land', -- Options are 'land' and 'air'
                        },
                        ['ambulance20'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'VW Crafter',
                            category = 'land', -- Options are 'land' and 'air'
                        },
                        ['ambulance5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'Chevrolet Silverado',
                            category = 'land', -- Options are 'land' and 'air'
                        },
                        ['ambulance17'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Volvo V90 Cross Country',
                        category = 'land', -- Options are 'land' and 'air'
                        },
                        ['ambulance7'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Volvo XC70 - Akutläkare',
                        category = 'land', -- Options are 'land' and 'air'
                        },
                        ['ambulance15'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Mercedes Viano (Överläkare+)',
                        category = 'land', -- Options are 'land' and 'air'
                        },
                        ['blazer5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Fyrhjuling',
                        category = 'land', -- Options are 'land' and 'air'
                        },
                        ['ambulance12'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Jourläkarbil',
                        category = 'land', -- Options are 'land' and 'air'
                        },
                        ['sheriff2'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Ledningsbil',
                        category = 'land', -- Options are 'land' and 'air'
                        },
                        ['volvoxc90'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Understödbil',
                        category = 'land', -- Options are 'land' and 'air'
                        },
                        ['ambulans2021'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Ambulanc MC',
                        category = 'land', -- Options are 'land' and 'air'
                        },
                        ['romero'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Likbil',
                        category = 'land', -- Options are 'land' and 'air'
                        },                                                
                        ['pbus'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'Buss',
                            category = 'land', -- Options are 'land' and 'air'
                        },                                                                                                                                                                                                             
                        },
                        [5] = {
                            ['ambulance11'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'Volvo XC70 - Transportbil',
                                category = 'land', -- Options are 'land' and 'air'
                            },
                            ['ambulance'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'Insats Lastbil',
                                category = 'land', -- Options are 'land' and 'air'
                            },                
                            ['ambulance18'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'Mercedes E-Class',
                                category = 'land', -- Options are 'land' and 'air'
                            },
                            ['ambulance4'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'Mercedes Vito',
                                category = 'land', -- Options are 'land' and 'air'
                            },
                            ['ambulance3'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'Volvo XC90 - Transportbil',
                                category = 'land', -- Options are 'land' and 'air'
                            },
                            ['ambulance1'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'Volkswagen Amarok',
                                category = 'land', -- Options are 'land' and 'air'
                            },
                            ['ambulance10'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'Mercedes Sprinter',
                                category = 'land', -- Options are 'land' and 'air'
                            },
                            ['ambulance19'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'Mercedes Otaris',
                                category = 'land', -- Options are 'land' and 'air'
                            },
                            ['ambulance20'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'VW Crafter',
                                category = 'land', -- Options are 'land' and 'air'
                            },
                            ['ambulance5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'Chevrolet Silverado',
                                category = 'land', -- Options are 'land' and 'air'
                            },
                            ['ambulance17'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'Volvo V90 Cross Country',
                            category = 'land', -- Options are 'land' and 'air'
                            },
                            ['ambulance7'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'Volvo XC70 - Akutläkare',
                            category = 'land', -- Options are 'land' and 'air'
                            },
                            ['ambulance15'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'Mercedes Viano (Överläkare+)',
                            category = 'land', -- Options are 'land' and 'air'
                            },
                            ['blazer5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'Fyrhjuling',
                            category = 'land', -- Options are 'land' and 'air'
                            },
                            ['ambulance12'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'Jourläkarbil',
                            category = 'land', -- Options are 'land' and 'air'
                            },
                            ['sheriff2'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'Ledningsbil',
                            category = 'land', -- Options are 'land' and 'air'
                            },
                            ['volvoxc90'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'Understödbil',
                            category = 'land', -- Options are 'land' and 'air'
                            },
                            ['ambulans2021'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'Ambulanc MC',
                            category = 'land', -- Options are 'land' and 'air'
                            },
                            ['romero'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                            label = 'Likbil',
                            category = 'land', -- Options are 'land' and 'air'
                            },                                                
                            ['pbus'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'Buss',
                                category = 'land', -- Options are 'land' and 'air'
                            },                                                                                                                                                                                                              
                            },
                            [6] = {
                                ['ambulance11'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Volvo XC70 - Transportbil',
                                    category = 'land', -- Options are 'land' and 'air'
                                },
                                ['ambulance'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Insats Lastbil',
                                    category = 'land', -- Options are 'land' and 'air'
                                },                
                                ['ambulance18'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Mercedes E-Class',
                                    category = 'land', -- Options are 'land' and 'air'
                                },
                                ['ambulance4'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Mercedes Vito',
                                    category = 'land', -- Options are 'land' and 'air'
                                },
                                ['ambulance3'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Volvo XC90 - Transportbil',
                                    category = 'land', -- Options are 'land' and 'air'
                                },
                                ['ambulance1'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Volkswagen Amarok',
                                    category = 'land', -- Options are 'land' and 'air'
                                },
                                ['ambulance10'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Mercedes Sprinter',
                                    category = 'land', -- Options are 'land' and 'air'
                                },
                                ['ambulance19'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Mercedes Otaris',
                                    category = 'land', -- Options are 'land' and 'air'
                                },
                                ['ambulance20'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'VW Crafter',
                                    category = 'land', -- Options are 'land' and 'air'
                                },
                                ['ambulance5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Chevrolet Silverado',
                                    category = 'land', -- Options are 'land' and 'air'
                                },
                                ['ambulance17'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'Volvo V90 Cross Country',
                                category = 'land', -- Options are 'land' and 'air'
                                },
                                ['ambulance7'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'Volvo XC70 - Akutläkare',
                                category = 'land', -- Options are 'land' and 'air'
                                },
                                ['ambulance15'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'Mercedes Viano (Överläkare+)',
                                category = 'land', -- Options are 'land' and 'air'
                                },
                                ['blazer5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'Fyrhjuling',
                                category = 'land', -- Options are 'land' and 'air'
                                },
                                ['ambulance12'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'Jourläkarbil',
                                category = 'land', -- Options are 'land' and 'air'
                                },
                                ['sheriff2'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'Ledningsbil',
                                category = 'land', -- Options are 'land' and 'air'
                                },
                                ['volvoxc90'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'Understödbil',
                                category = 'land', -- Options are 'land' and 'air'
                                },
                                ['ambulans2021'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'Ambulanc MC',
                                category = 'land', -- Options are 'land' and 'air'
                                },
                                ['romero'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                label = 'Likbil',
                                category = 'land', -- Options are 'land' and 'air'
                                },                                                
                                ['pbus'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Buss',
                                    category = 'land', -- Options are 'land' and 'air'
                                },                                                                                                                                                                                                               
                                },
                                [7] = {
                                    ['ambulance11'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Volvo XC70 - Transportbil',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Insats Lastbil',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },                
                                    ['ambulance18'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Mercedes E-Class',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance4'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Mercedes Vito',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance3'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Volvo XC90 - Transportbil',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance1'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Volkswagen Amarok',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance10'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Mercedes Sprinter',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance19'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Mercedes Otaris',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance20'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'VW Crafter',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Chevrolet Silverado',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance17'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Volvo V90 Cross Country',
                                    category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance7'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Volvo XC70 - Akutläkare',
                                    category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance15'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Mercedes Viano (Överläkare+)',
                                    category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['blazer5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Fyrhjuling',
                                    category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance12'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Jourläkarbil',
                                    category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['sheriff2'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Ledningsbil',
                                    category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['volvoxc90'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Understödbil',
                                    category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulans2021'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Ambulanc MC',
                                    category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['romero'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Likbil',
                                    category = 'land', -- Options are 'land' and 'air'
                                    },                                                
                                    ['pbus'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Buss',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },                                                                                                                                                                                                               
                                    },
                                [8] = {
                                    ['ambulance11'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Volvo XC70 - Transportbil',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Insats Lastbil',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },                
                                    ['ambulance18'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Mercedes E-Class',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance4'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Mercedes Vito',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance3'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Volvo XC90 - Transportbil',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance1'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Volkswagen Amarok',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance10'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Mercedes Sprinter',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance19'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Mercedes Otaris',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance20'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'VW Crafter',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Chevrolet Silverado',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance17'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Volvo V90 Cross Country',
                                    category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance7'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Volvo XC70 - Akutläkare',
                                    category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance15'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Mercedes Viano (Överläkare+)',
                                    category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['blazer5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Fyrhjuling',
                                    category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulance12'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Jourläkarbil',
                                    category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['sheriff2'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Ledningsbil',
                                    category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['volvoxc90'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Understödbil',
                                    category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['ambulans2021'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Ambulanc MC',
                                    category = 'land', -- Options are 'land' and 'air'
                                    },
                                    ['romero'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                    label = 'Likbil',
                                    category = 'land', -- Options are 'land' and 'air'
                                    },                                                
                                    ['pbus'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Buss',
                                        category = 'land', -- Options are 'land' and 'air'
                                    },                                                                                                                                                                                                               
                                    },
                                    [9] = {
                                        ['ambulance11'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'Volvo XC70 - Transportbil',
                                            category = 'land', -- Options are 'land' and 'air'
                                        },
                                        ['ambulance'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'Insats Lastbil',
                                            category = 'land', -- Options are 'land' and 'air'
                                        },                
                                        ['ambulance18'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'Mercedes E-Class',
                                            category = 'land', -- Options are 'land' and 'air'
                                        },
                                        ['ambulance4'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'Mercedes Vito',
                                            category = 'land', -- Options are 'land' and 'air'
                                        },
                                        ['ambulance3'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'Volvo XC90 - Transportbil',
                                            category = 'land', -- Options are 'land' and 'air'
                                        },
                                        ['ambulance1'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'Volkswagen Amarok',
                                            category = 'land', -- Options are 'land' and 'air'
                                        },
                                        ['ambulance10'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'Mercedes Sprinter',
                                            category = 'land', -- Options are 'land' and 'air'
                                        },
                                        ['ambulance19'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'Mercedes Otaris',
                                            category = 'land', -- Options are 'land' and 'air'
                                        },
                                        ['ambulance20'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'VW Crafter',
                                            category = 'land', -- Options are 'land' and 'air'
                                        },
                                        ['ambulance5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'Chevrolet Silverado',
                                            category = 'land', -- Options are 'land' and 'air'
                                        },
                                        ['ambulance17'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Volvo V90 Cross Country',
                                        category = 'land', -- Options are 'land' and 'air'
                                        },
                                        ['ambulance7'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Volvo XC70 - Akutläkare',
                                        category = 'land', -- Options are 'land' and 'air'
                                        },
                                        ['ambulance15'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Mercedes Viano (Överläkare+)',
                                        category = 'land', -- Options are 'land' and 'air'
                                        },
                                        ['blazer5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Fyrhjuling',
                                        category = 'land', -- Options are 'land' and 'air'
                                        },
                                        ['ambulance12'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Jourläkarbil',
                                        category = 'land', -- Options are 'land' and 'air'
                                        },
                                        ['sheriff2'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Ledningsbil',
                                        category = 'land', -- Options are 'land' and 'air'
                                        },
                                        ['volvoxc90'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Understödbil',
                                        category = 'land', -- Options are 'land' and 'air'
                                        },
                                        ['ambulans2021'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Ambulanc MC',
                                        category = 'land', -- Options are 'land' and 'air'
                                        },
                                        ['romero'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                        label = 'Likbil',
                                        category = 'land', -- Options are 'land' and 'air'
                                        },                                                
                                        ['pbus'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'Buss',
                                            category = 'land', -- Options are 'land' and 'air'
                                        },                                                                                                                                                                                                             
                                        },
                                        [10] = {
                                            ['ambulance11'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'Volvo XC70 - Transportbil',
                                                category = 'land', -- Options are 'land' and 'air'
                                            },
                                            ['ambulance'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'Insats Lastbil',
                                                category = 'land', -- Options are 'land' and 'air'
                                            },                
                                            ['ambulance18'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'Mercedes E-Class',
                                                category = 'land', -- Options are 'land' and 'air'
                                            },
                                            ['ambulance4'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'Mercedes Vito',
                                                category = 'land', -- Options are 'land' and 'air'
                                            },
                                            ['ambulance3'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'Volvo XC90 - Transportbil',
                                                category = 'land', -- Options are 'land' and 'air'
                                            },
                                            ['ambulance1'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'Volkswagen Amarok',
                                                category = 'land', -- Options are 'land' and 'air'
                                            },
                                            ['ambulance10'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'Mercedes Sprinter',
                                                category = 'land', -- Options are 'land' and 'air'
                                            },
                                            ['ambulance19'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'Mercedes Otaris',
                                                category = 'land', -- Options are 'land' and 'air'
                                            },
                                            ['ambulance20'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'VW Crafter',
                                                category = 'land', -- Options are 'land' and 'air'
                                            },
                                            ['ambulance5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'Chevrolet Silverado',
                                                category = 'land', -- Options are 'land' and 'air'
                                            },
                                            ['ambulance17'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'Volvo V90 Cross Country',
                                            category = 'land', -- Options are 'land' and 'air'
                                            },
                                            ['ambulance7'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'Volvo XC70 - Akutläkare',
                                            category = 'land', -- Options are 'land' and 'air'
                                            },
                                            ['ambulance15'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'Mercedes Viano (Överläkare+)',
                                            category = 'land', -- Options are 'land' and 'air'
                                            },
                                            ['blazer5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'Fyrhjuling',
                                            category = 'land', -- Options are 'land' and 'air'
                                            },
                                            ['ambulance12'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'Jourläkarbil',
                                            category = 'land', -- Options are 'land' and 'air'
                                            },
                                            ['sheriff2'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'Ledningsbil',
                                            category = 'land', -- Options are 'land' and 'air'
                                            },
                                            ['volvoxc90'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'Understödbil',
                                            category = 'land', -- Options are 'land' and 'air'
                                            },
                                            ['ambulans2021'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'Ambulanc MC',
                                            category = 'land', -- Options are 'land' and 'air'
                                            },
                                            ['romero'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                            label = 'Likbil',
                                            category = 'land', -- Options are 'land' and 'air'
                                            },                                                
                                            ['pbus'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'Buss',
                                                category = 'land', -- Options are 'land' and 'air'
                                            },                                                                                                                                                                                
                           
                                            },
                                            [11] = {
                                                ['ambulance11'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                    label = 'Volvo XC70 - Transportbil',
                                                    category = 'land', -- Options are 'land' and 'air'
                                                },
                                                ['ambulance'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                    label = 'Insats Lastbil',
                                                    category = 'land', -- Options are 'land' and 'air'
                                                },                
                                                ['ambulance18'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                    label = 'Mercedes E-Class',
                                                    category = 'land', -- Options are 'land' and 'air'
                                                },
                                                ['ambulance4'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                    label = 'Mercedes Vito',
                                                    category = 'land', -- Options are 'land' and 'air'
                                                },
                                                ['ambulance3'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                    label = 'Volvo XC90 - Transportbil',
                                                    category = 'land', -- Options are 'land' and 'air'
                                                },
                                                ['ambulance1'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                    label = 'Volkswagen Amarok',
                                                    category = 'land', -- Options are 'land' and 'air'
                                                },
                                                ['ambulance10'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                    label = 'Mercedes Sprinter',
                                                    category = 'land', -- Options are 'land' and 'air'
                                                },
                                                ['ambulance19'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                    label = 'Mercedes Otaris',
                                                    category = 'land', -- Options are 'land' and 'air'
                                                },
                                                ['ambulance20'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                    label = 'VW Crafter',
                                                    category = 'land', -- Options are 'land' and 'air'
                                                },
                                                ['ambulance5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                    label = 'Chevrolet Silverado',
                                                    category = 'land', -- Options are 'land' and 'air'
                                                },
                                                ['ambulance17'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'Volvo V90 Cross Country',
                                                category = 'land', -- Options are 'land' and 'air'
                                                },
                                                ['ambulance7'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'Volvo XC70 - Akutläkare',
                                                category = 'land', -- Options are 'land' and 'air'
                                                },
                                                ['ambulance15'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'Mercedes Viano (Överläkare+)',
                                                category = 'land', -- Options are 'land' and 'air'
                                                },
                                                ['blazer5'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'Fyrhjuling',
                                                category = 'land', -- Options are 'land' and 'air'
                                                },
                                                ['ambulance12'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'Jourläkarbil',
                                                category = 'land', -- Options are 'land' and 'air'
                                                },
                                                ['sheriff2'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'Ledningsbil',
                                                category = 'land', -- Options are 'land' and 'air'
                                                },
                                                ['volvoxc90'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'Understödbil',
                                                category = 'land', -- Options are 'land' and 'air'
                                                },
                                                ['ambulans2021'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'Ambulanc MC',
                                                category = 'land', -- Options are 'land' and 'air'
                                                },
                                                ['romero'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                label = 'Likbil',
                                                category = 'land', -- Options are 'land' and 'air'
                                                },                                                
                                                ['pbus'] = { -- Car/Helicopter/Vehicle Spawn Code/Model Name
                                                    label = 'Buss',
                                                    category = 'land', -- Options are 'land' and 'air'
                                                },                                                                                                                                                                                
                                
                                                }
            }
        },
    },
}

--[[ IMPORTANT THIS COULD BREAK SOMETHING ]]
--
Config.DisableDeathAnimation = false -- Really, really, REALLY do not recommend setting this to true and it was added per request

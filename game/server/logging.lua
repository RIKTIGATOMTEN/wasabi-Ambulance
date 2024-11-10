-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

local DISCORD_IMAGE = 'https://r2.fivemanage.com/ifNzgj8SWFv0Iqz10Vtwf/images/revine.png'

local weaponNames = {
    [`WEAPON_UNARMED`] = 'Unarmed',
    [`WEAPON_KNIFE`] = 'Knife',
    [`WEAPON_NIGHTSTICK`] = 'Nightstick',
    [`WEAPON_HAMMER`] = 'Hammer',
    [`WEAPON_BAT`] = 'Baseball Bat',
    [`WEAPON_GOLFCLUB`] = 'Golf Club',
    [`WEAPON_CROWBAR`] = 'Crowbar',
    [`WEAPON_PISTOL`] = 'Pistol',
    [`WEAPON_COMBATPISTOL`] = 'Combat Pistol',
    [`WEAPON_APPISTOL`] = 'AP Pistol',
    [`WEAPON_PISTOL50`] = 'Pistol .50',
    [`WEAPON_MICROSMG`] = 'Micro SMG',
    [`WEAPON_SMG`] = 'SMG',
    [`WEAPON_ASSAULTSMG`] = 'Assault SMG',
    [`WEAPON_ASSAULTRIFLE`] = 'Assault Rifle',
    [`WEAPON_CARBINERIFLE`] = 'Carbine Rifle',
    [`WEAPON_ADVANCEDRIFLE`] = 'Advanced Rifle',
    [`WEAPON_MG`] = 'MG',
    [`WEAPON_COMBATMG`] = 'Combat MG',
    [`WEAPON_PUMPSHOTGUN`] = 'Pump Shotgun',
    [`WEAPON_SAWNOFFSHOTGUN`] = 'Sawed-Off Shotgun',
    [`WEAPON_ASSAULTSHOTGUN`] = 'Assault Shotgun',
    [`WEAPON_BULLPUPSHOTGUN`] = 'Bullpup Shotgun',
    [`WEAPON_STUNGUN`] = 'Stun Gun',
    [`WEAPON_SNIPERRIFLE`] = 'Sniper Rifle',
    [`WEAPON_HEAVYSNIPER`] = 'Heavy Sniper',
    [`WEAPON_REMOTESNIPER`] = 'Remote Sniper',
    [`WEAPON_GRENADELAUNCHER`] = 'Grenade Launcher',
    [`WEAPON_GRENADELAUNCHER_SMOKE`] = 'Smoke Grenade Launcher',
    [`WEAPON_RPG`] = 'RPG',
    [`WEAPON_PASSENGER_ROCKET`] = 'Passenger Rocket',
    [`WEAPON_AIRSTRIKE_ROCKET`] = 'Airstrike Rocket',
    [`WEAPON_STINGER`] = 'Stinger [Vehicle]',
    [`WEAPON_MINIGUN`] = 'Minigun',
    [`WEAPON_GRENADE`] = 'Grenade',
    [`WEAPON_STICKYBOMB`] = 'Sticky Bomb',
    [`WEAPON_SMOKEGRENADE`] = 'Tear Gas',
    [`WEAPON_BZGAS`] = 'BZ Gas',
    [`WEAPON_MOLOTOV`] = 'Molotov',
    [`WEAPON_FIREEXTINGUISHER`] = 'Fire Extinguisher',
    [`WEAPON_PETROLCAN`] = 'Jerry Can',
    [`OBJECT`] = 'Object',
    [`WEAPON_BALL`] = 'Ball',
    [`WEAPON_FLARE`] = 'Flare',
    [`VEHICLE_WEAPON_TANK`] = 'Tank Cannon',
    [`VEHICLE_WEAPON_SPACE_ROCKET`] = 'Rockets',
    [`VEHICLE_WEAPON_PLAYER_LASER`] = 'Laser',
    [`AMMO_RPG`] = 'Rocket',
    [`AMMO_TANK`] = 'Tank',
    [`AMMO_SPACE_ROCKET`] = 'Rocket',
    [`AMMO_PLAYER_LASER`] = 'Laser',
    [`AMMO_ENEMY_LASER`] = 'Laser',
    [`WEAPON_RAMMED_BY_CAR`] = 'Rammed by Car',
    [`WEAPON_BOTTLE`] = 'Bottle',
    [`WEAPON_GUSENBERG`] = 'Gusenberg Sweeper',
    [`WEAPON_SNSPISTOL`] = 'SNS Pistol',
    [`WEAPON_VINTAGEPISTOL`] = 'Vintage Pistol',
    [`WEAPON_DAGGER`] = 'Antique Cavalry Dagger',
    [`WEAPON_FLAREGUN`] = 'Flare Gun',
    [`WEAPON_HEAVYPISTOL`] = 'Heavy Pistol',
    [`WEAPON_SPECIALCARBINE`] = 'Special Carbine',
    [`WEAPON_MUSKET`] = 'Musket',
    [`WEAPON_FIREWORK`] = 'Firework Launcher',
    [`WEAPON_MARKSMANRIFLE`] = 'Marksman Rifle',
    [`WEAPON_HEAVYSHOTGUN`] = 'Heavy Shotgun',
    [`WEAPON_PROXMINE`] = 'Proximity Mine',
    [`WEAPON_HOMINGLAUNCHER`] = 'Homing Launcher',
    [`WEAPON_HATCHET`] = 'Hatchet',
    [`WEAPON_COMBATPDW`] = 'Combat PDW',
    [`WEAPON_KNUCKLE`] = 'Knuckle Duster',
    [`WEAPON_MARKSMANPISTOL`] = 'Marksman Pistol',
    [`WEAPON_MACHETE`] = 'Machete',
    [`WEAPON_MACHINEPISTOL`] = 'Machine Pistol',
    [`WEAPON_FLASHLIGHT`] = 'Flashlight',
    [`WEAPON_DBSHOTGUN`] = 'Double Barrel Shotgun',
    [`WEAPON_COMPACTRIFLE`] = 'Compact Rifle',
    [`WEAPON_SWITCHBLADE`] = 'Switchblade',
    [`WEAPON_REVOLVER`] = 'Heavy Revolver',
    [`WEAPON_FIRE`] = 'Fire',
    [`WEAPON_HELI_CRASH`] = 'Heli Crash',
    [`WEAPON_RUN_OVER_BY_CAR`] = 'Run over by Car',
    [`WEAPON_HIT_BY_WATER_CANNON`] = 'Hit by Water Cannon',
    [`WEAPON_EXHAUSTION`] = 'Exhaustion',
    [`WEAPON_EXPLOSION`] = 'Explosion',
    [`WEAPON_ELECTRIC_FENCE`] = 'Electric Fence',
    [`WEAPON_BLEEDING`] = 'Bleeding',
    [`WEAPON_DROWNING_IN_VEHICLE`] = 'Drowning in Vehicle',
    [`WEAPON_DROWNING`] = 'Drowning',
    [`WEAPON_BARBED_WIRE`] = 'Barbed Wire',
    [`WEAPON_VEHICLE_ROCKET`] = 'Vehicle Rocket',
    [`WEAPON_BULLPUPRIFLE`] = 'Bullpup Rifle',
    [`WEAPON_ASSAULTSNIPER`] = 'Assault Sniper',
    [`VEHICLE_WEAPON_ROTORS`] = 'Rotors',
    [`WEAPON_RAILGUN`] = 'Railgun',
    [`WEAPON_AIR_DEFENCE_GUN`] = 'Air Defence Gun',
    [`WEAPON_AUTOSHOTGUN`] = 'Automatic Shotgun',
    [`WEAPON_BATTLEAXE`] = 'Battle Axe',
    [`WEAPON_COMPACTLAUNCHER`] = 'Compact Grenade Launcher',
    [`WEAPON_MINISMG`] = 'Mini SMG',
    [`WEAPON_PIPEBOMB`] = 'Pipebomb',
    [`WEAPON_POOLCUE`] = 'Poolcue',
    [`WEAPON_WRENCH`] = 'Wrench',
    [`WEAPON_SNOWBALL`] = 'Snowball',
    [`WEAPON_ANIMAL`] = 'Animal',
    [`WEAPON_COUGAR`] = 'Cougar'
   }

LogPlayerInfo = function(src)
    local playerOnline = wsb.getPlayer(src)
    if not playerOnline then return end
    local identifiers = {
        name = GetPlayerName(src),
        identifier = wsb.getIdentifier(src)
    }

    for i = 0, GetNumPlayerIdentifiers(src) - 1 do
        local id = GetPlayerIdentifier(src, i)
        if string.find(id, 'steam:') then
            identifiers['steam'] = id:gsub('steam:', '')
        elseif string.find(id, 'ip:') then
            identifiers['ip'] = id:gsub('ip:', '')
        elseif string.find(id, 'discord:') then
            identifiers['discord'] = id:gsub('discord:', '')
        elseif string.find(id, 'license:') then
            identifiers['license'] = id:gsub('license:', '')
        elseif string.find(id, 'license2:') then
            identifiers['license2'] = id:gsub('license2:', '')
        elseif string.find(id, 'xbl:') then
            identifiers['xbl'] = id:gsub('xbl:', '')
        elseif string.find(id, 'live:') then
            identifiers['live'] = id:gsub('live:', '')
        elseif string.find(id, 'fivem:') then
            identifiers['fivem'] = id:gsub('fivem:', '')
        end
    end
    if not identifiers.steam then
        identifiers.steam = Strings.unknown
    end
    if not Config.LogIPs then
        identifiers.ip = Strings.unknown
    end
    if not identifiers.ip then
        identifiers.ip = Strings.unknown
    end
    if not identifiers.discord then
        identifiers.discord = Strings.unknown
    end
    if not identifiers.license then
        identifiers.license = Strings.unknown
    end
    if not identifiers.license2 then
        identifiers.license2 = Strings.unknown
    end
    if not identifiers.xbl then
        identifiers.xbl = Strings.unknown
    end
    if not identifiers.fivem then
        identifiers.fivem = Strings.unknown
    end
    return identifiers
end

local sendDeathToDiscord = function(victim, cause, killer)
	if not Config.DeathLogs then return end
	if SConfig.deathLogs.webhook == 'CHANGE_ME' or SConfig.deathLogs.webhook == '' then
		print('[wasabi_ambulance] - Death logs enabled but webhook link is not set in config!')
        return
    end
    if cause then
        cause = weaponNames[cause] or Strings.unknown
    end
    local connect = {}
    local victimInfo = LogPlayerInfo(victim)
    if killer and killer > 0 then
        local killerInfo = LogPlayerInfo(killer)
		connect = {
			{
				['color'] = SConfig.deathLogs.color,
				['title'] = '**'..Strings.log_killed_title..'**',
				['description'] = (Strings.log_killed_desc):format(killerInfo.name, killer, victimInfo.name, victim, killerInfo.name, killer, killerInfo.identifier, killerInfo.steam, killerInfo.discord, killerInfo.license, killerInfo.license2, killerInfo.xbl, killerInfo.fivem, killerInfo.ip, victimInfo.name, victim, victimInfo.identifier, victimInfo.steam, victimInfo.discord, victimInfo.license, victimInfo.license2, victimInfo.xbl, victimInfo.fivem, victimInfo.ip, cause),
				['footer'] = {
					['text'] = 'Wasabi Ambulance',
				},
			}
		}
        PerformHttpRequest(SConfig.deathLogs.webhook, function() end, 'POST', json.encode({username = Strings.log_death_logs, embeds = connect, avatarrl = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
    else
        connect = {
			{
				['color'] = SConfig.deathLogs.color,
				['title'] = '**'..Strings.log_suicide_title..'**',
				['description'] = (Strings.log_suicide_desc):format(victimInfo.name, victim, victimInfo.name, victim, victimInfo.identifier, victimInfo.steam, victimInfo.discord, victimInfo.license, victimInfo.license2, victimInfo.xbl, victimInfo.fivem, victimInfo.ip, cause),
				['footer'] = {
					['text'] = 'Wasabi Ambulance',
				},
			}
		}
        PerformHttpRequest(SConfig.deathLogs.webhook, function() end, 'POST', json.encode({username = Strings.log_death_logs, embeds = connect, avatarrl = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
    end
end

local sendReviveToDiscord = function(source, target)
	if not Config.ReviveLogs then return end
    if not source or source == 0 then return end
	if SConfig.reviveLogs.webhook == 'CHANGE_ME' or SConfig.reviveLogs.webhook == '' or not SConfig.reviveLogs.webhook then
		print('[wasabi_ambulance] - Revive logs enabled but webhook link is not set in config!')
        return
    end
    local connect, targetInfo = {}, nil
    local adminInfo = LogPlayerInfo(source)
    if target then
        targetInfo = LogPlayerInfo(target)
        if not targetInfo then return end
        connect = {
			{
				['color'] = SConfig.reviveLogs.color,
				['title'] = '**'..Strings.log_admin_revive_title..'**',
				['description'] = (Strings.log_admin_revive_desc):format(adminInfo.name, source, targetInfo.name, target, targetInfo.name, target, targetInfo.identifier, targetInfo.steam, targetInfo.discord, targetInfo.license, targetInfo.license2, targetInfo.xbl, targetInfo.fivem, targetInfo.ip, targetInfo.name, source, adminInfo.identifier, adminInfo.steam, adminInfo.discord, adminInfo.license, adminInfo.license2, adminInfo.xbl, adminInfo.fivem, adminInfo.ip),
				['footer'] = {
					['text'] = 'Wasabi Ambulance',
				},
			}
		}
        PerformHttpRequest(SConfig.reviveLogs.webhook, function() end, 'POST', json.encode({username = Strings.log_revive_logs, embeds = connect, avatarrl = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
    else
        connect = {
			{
				['color'] = SConfig.reviveLogs.color,
				['title'] = '**'..Strings.log_self_revive_title..'**',
				['description'] = (Strings.log_self_revive_desc):format(adminInfo.name, source, adminInfo.name, source, adminInfo.identifier, adminInfo.steam, adminInfo.discord, adminInfo.license, adminInfo.license2, adminInfo.xbl, adminInfo.fivem, adminInfo.ip),
				['footer'] = {
					['text'] = 'Wasabi Ambulance',
				},
			}
		}
        PerformHttpRequest(SConfig.reviveLogs.webhook, function() end, 'POST', json.encode({username = Strings.log_revive_logs, embeds = connect, avatarrl = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })    end
end

RegisterNetEvent('wasabi_ambulance:logRevive', function(source, target)
    if target and target == source then target = nil end
    if not source then source = nil end
    sendReviveToDiscord(source, (target or false))
end)

RegisterNetEvent('wasabi_ambulance:logDeath', function(cause, killer)
    sendDeathToDiscord(source, cause, killer)
end)

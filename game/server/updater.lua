-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
if not Config.CheckForUpdates then return end
if not wsb then return print((Strings.no_wsb):format(GetCurrentResourceName())) end

local resource = 'wasabi_ambulance'
local resourceName = 'wasabi_ambulance'
local version = GetResourceMetadata(GetCurrentResourceName(), 'version')
local repoLink = 'https://api.github.com/repos/wasabi-versions/' .. resource .. '/releases/latest'
local reqBridge = '1.1.5'

local function getRepoVersion()
    local repoVersion = false
    PerformHttpRequest(repoLink, function(err, response, headers)
        if err == 200 then
            local data = json.decode(response)
            repoVersion = data.tag_name
        end
    end, "GET")
    repeat
        Wait(50)
    until repoVersion
    return repoVersion
end

local function checkVersion(err, responseText, headers)
    local repoVersion = getRepoVersion()
    CreateThread(function()
        if version ~= repoVersion then
            Wait(4500)
            print("^0[^3WARNING^0] " .. resourceName .. " is ^1NOT ^0up to date!")
            print("^0[^3WARNING^0] Your Version: ^1" .. version .. "^0")
            print("^0[^3WARNING^0] Latest Version: ^2" .. repoVersion .. "^0")
            print("^0[^3WARNING^0] ^1Get the latest version from keymaster!^0")
        end
    end)
end
CreateThread(function()
    if GetCurrentResourceName() ~= resourceName then
        resourceName = resourceName .. '(' .. GetCurrentResourceName() .. ')'
        Wait(4500)
        print('^0[^3WARNING^0] Rename the folder to \"' ..
        resource .. '\", otherwise this resource could experience problems!')
    end
    local bVer = wsb.getVersion()
    bVer = bVer:gsub('%.', '')
    bVer = tonumber(bVer)
    local rVer = reqBridge:gsub('%.', '')
    rVer = tonumber(rVer)
    if bVer and bVer < rVer then
        print('^0[^3WARNING^0] ^1' .. resourceName .. ' requires wasabi_bridge version: ' .. reqBridge .. ' or higher!^0')
    end
    while true do
        PerformHttpRequest(repoLink, checkVersion, "GET")
        Wait(3600000)
    end
end)

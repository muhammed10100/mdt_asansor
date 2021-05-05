-- MDT YAZILIM TARAFINDAN YAPILDI --
-- MDT YAZILIM TARAFINDAN YAPILDI --
-- MDT YAZILIM TARAFINDAN YAPILDI --
ESX = nil
PlayerData = nil
TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)

local mevcutkat = nil
-- job kısmı
RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(job)
    PlayerData.job = job
end)
-- function kısmı
Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(100)
    end
    if #Config.mdtyazilim > 0 then
        KonturolBaslat()
    end
end)
-- marker kısmı
function KonturolBaslat()
    Citizen.CreateThread(function()
        while true do
            local kordinatmdtyazilim = GetEntityCoords(PlayerPedId())

            for i = 1, #Config.mdtyazilim, 1 do
                if GetDistanceBetweenCoords(Config.mdtyazilim[i][1].x, Config.mdtyazilim[i][1].y, Config.mdtyazilim[i][1].z, kordinatmdtyazilim, false) <= 50.0 then
                    if mevcutkat == nil then
                        for f = 1, #Config.mdtyazilim[i], 1 do
                            if GetDistanceBetweenCoords(Config.mdtyazilim[i][f].x, Config.mdtyazilim[i][f].y, Config.mdtyazilim[i][f].z, kordinatmdtyazilim, true) <= 3.0 then
                                DrawText3D(Config.mdtyazilim[i][f].x, Config.mdtyazilim[i][f].y, Config.mdtyazilim[i][f].z, "[~r~E~w~] Asansör-"..f, 0.40)
                                DrawMarker(27, Config.mdtyazilim[i][f].x, Config.mdtyazilim[i][f].y, Config.mdtyazilim[i][f].z - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.8, 0.8, 0.8, 255, 255, 255, 155, false, false, 2, false, 0, 0, 0, 0)
                                if GetDistanceBetweenCoords(Config.mdtyazilim[i][f].x, Config.mdtyazilim[i][f].y, Config.mdtyazilim[i][f].z, kordinatmdtyazilim, true) <= 1.0 and IsControlJustReleased(0, 38) then
                                    AcıkAsansor(i, f)
                                end
                            end
                        end
                    else
                        if GetDistanceBetweenCoords(Config.mdtyazilim[i][mevcutkat].x, Config.mdtyazilim[i][mevcutkat].y, Config.mdtyazilim[i][mevcutkat].z, kordinatmdtyazilim, true) <= 3.0 then
                            DrawText3D(Config.mdtyazilim[i][mevcutkat].x, Config.mdtyazilim[i][mevcutkat].y, Config.mdtyazilim[i][mevcutkat].z, "[~r~E~w~] Asansör-"..mevcutkat, 0.40)
                            DrawMarker(27, Config.mdtyazilim[i][mevcutkat].x, Config.mdtyazilim[i][mevcutkat].y, Config.mdtyazilim[i][mevcutkat].z - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.8, 0.8, 0.8, 255, 255, 255, 155, false, false, 2, false, 0, 0, 0, 0)
                            if GetDistanceBetweenCoords(Config.mdtyazilim[i][mevcutkat].x, Config.mdtyazilim[i][mevcutkat].y, Config.mdtyazilim[i][mevcutkat].z, kordinatmdtyazilim, true) <= 1.0 and IsControlJustReleased(0, 38) then
                                AcıkAsansor(i, mevcutkat)
                            end
                        end
                    end
                end
            end
            Citizen.Wait(1)
        end
    end)
end
-- asansör txtleme kısmı
function AcikAsansor(yazilim, mdt)
    local developend = {}
    for asansor = 1, #Config.mdtyazilim[yazilim], 1 do
        if asansor ~= mdt then
            table.insert(developend, {label = Config.mdtyazilim[yazilim][asansor].text, floor = asansor})
        end
    end
    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open("default", "mdt_asansor", "elevator", {
        title = "Asansör Menüsü -"..mdt,
        align = "top-left",
        elements = developend
    }, function(data, menu)
        if data.current.floor ~= nil then
            ESX.UI.Menu.CloseAll()
            Teleport(yazilim, data.current.floor)
        end
    end, function(data, menu)
        menu.close()
    end)
end

function Teleport(yazilim, mdt)
    mevcutkat = mdt
    DoScreenFadeOut(500)
    Citizen.Wait(600)
    PlaySoundFrontend(-1, "OPENING", "MP_PROPERTIES_ELEVATOR_DOORS" , 1)
    SetEntityCoords(PlayerPedId(), Config.mdtyazilim[yazilim][mdt].x, Config.mdtyazilim[yazilim][mdt].y, Config.mdtyazilim[yazilim][mdt].z, 1, 0, 0, 0)
    Citizen.Wait(200)
    DoScreenFadeIn(500)
end

function DisableControl() DisableControlAction(0, 73, false) 
	DisableControlAction(0, 24, true) 
	DisableControlAction(0, 257, true) 
	DisableControlAction(0, 25, true) 
	DisableControlAction(0, 263, true) 
	DisableControlAction(0, 32, true) 
	DisableControlAction(0, 34, true) 
	DisableControlAction(0, 31, true) 
	DisableControlAction(0, 30, true) 
	DisableControlAction(0, 45, true) 
	DisableControlAction(0, 22, true) 
	DisableControlAction(0, 44, true) 
	DisableControlAction(0, 37, true) 
	DisableControlAction(0, 23, true) 
	DisableControlAction(0, 288, true) 
	DisableControlAction(0, 289, true) 
	DisableControlAction(0, 170, true) 
	DisableControlAction(0, 167, true) 
	DisableControlAction(0, 73, true)
	DisableControlAction(2, 199, true)
	DisableControlAction(0, 47, true) 
	DisableControlAction(0, 264, true)
	DisableControlAction(0, 257, true) 
	DisableControlAction(0, 140, true) 
	DisableControlAction(0, 141, true)
	DisableControlAction(0, 142, true) 
	DisableControlAction(0, 143, true) 
end
-- txt yazı birimi yeri
function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.40, 0.40)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215) -- renk ayarı
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    --local factor = (string.len(text)) / 250
    --DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 140)
end
-- MDT YAZILIM TARAFINDAN YAPILDI --
-- MDT YAZILIM TARAFINDAN YAPILDI --
-- MDT YAZILIM TARAFINDAN YAPILDI --

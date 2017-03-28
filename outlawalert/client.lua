
RegisterNetEvent('thiefPlace')
AddEventHandler('thiefPlace', function(tx, ty, tz)
    transT = 255
    local thiefBlip = AddBlipForCoord(tx, ty, tz)
    SetBlipSprite(thiefBlip,  10)
    SetBlipColour(thiefBlip,  1)
    SetBlipAlpha(thiefBlip,  transT)
    SetBlipAsShortRange(thiefBlip,  1)
    while transT ~= 0 do
        Wait(40)
        transT = transT - 1
        SetBlipAlpha(thiefBlip,  transT)
    end
    if transT == 0 then
        return end
end)

RegisterNetEvent('gunshotPlace')
AddEventHandler('gunshotPlace', function(gx, gy, gz)
    transG = 255
    local thiefBlip = AddBlipForCoord(gx, gy, gz)
    SetBlipSprite(thiefBlip,  1)
    SetBlipColour(thiefBlip,  1)
    SetBlipAlpha(thiefBlip,  transG)
    SetBlipAsShortRange(thiefBlip,  1)
    while transG ~= 0 do
        Wait(10)
        transG = transG - 1
        SetBlipAlpha(thiefBlip,  transG)
    end
    if transG == 0 then
        return end
end)


Citizen.CreateThread( function()
    while true do
        Wait(0)
        
        local plyPos = GetEntityCoords(GetPlayerPed(-1),  true)
        local s1, s2 = Citizen.InvokeNative( 0x2EB41072B4C1E4C0, plyPos.x, plyPos.y, plyPos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
        local street1 = GetStreetNameFromHashKey(s1)
        local street2 = GetStreetNameFromHashKey(s2)
        if IsPedTryingToEnterALockedVehicle(GetPlayerPed(-1)) or IsPedJacking(GetPlayerPed(-1)) then
            local male = IsPedMale(GetPlayerPed(-1))
            if male then
                sex = "men"
            elseif not male then
                sex = "women"
            end
            TriggerServerEvent('thiefInProgressPos', plyPos.x, plyPos.y, plyPos.z)
            local veh = GetVehiclePedIsTryingToEnter(GetPlayerPed(-1))
            local vehName = GetDisplayNameFromVehicleModel(GetEntityModel(veh))
            local vehName2 = GetLabelText(vehName)
            if s2 == 0 then
                TriggerServerEvent('thiefInProgressS1', street1, vehName2, sex)
            elseif s2 ~= 0 then
                TriggerServerEvent('thiefInProgress', street1, street2, vehName2, sex)
            end
            Wait(5000)
        end
    end
end)


Citizen.CreateThread( function()
    while true do
        Wait(0)
        
        local plyPos = GetEntityCoords(GetPlayerPed(-1),  true)
        local s1, s2 = Citizen.InvokeNative( 0x2EB41072B4C1E4C0, plyPos.x, plyPos.y, plyPos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
        local street1 = GetStreetNameFromHashKey(s1)
        local street2 = GetStreetNameFromHashKey(s2)
        if IsPedShooting(GetPlayerPed(-1)) then
            local male = IsPedMale(GetPlayerPed(-1))
            if male then
                sex = "men"
            elseif not male then
                sex = "women"
            end
            TriggerServerEvent('gunshotInProgressPos', plyPos.x, plyPos.y, plyPos.z)
            if s2 == 0 then
                TriggerServerEvent('gunshotInProgressS1', street1, sex)
            elseif s2 ~= 0 then
                TriggerServerEvent("gunshotInProgress", street1, street2, sex)
            end
            Wait(3000)
        end
    end
end)
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
    end
end)

local hasJob = false
local aajuns = true
local culege = false
local cursaf = false
local cutie = 0

function DrawText3D(x,y,z, text, scl) 

    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*scl
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextScale(0.0*scale, 1.1*scale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

function CreateCar(x,y,z,heading) -- spawn vehicle
	local hash = GetHashKey("kalahari")
    local n = 0
    while not HasModelLoaded(hash) and n < 500 do
        RequestModel(hash)
        Citizen.Wait(10)
        n = n+1
    end
    if HasModelLoaded(hash) then
        veh = CreateVehicle(hash,x,y,z,heading,true,false)
        SetEntityHeading(veh,heading)
        SetEntityInvincible(veh,false)
        SetModelAsNoLongerNeeded(hash)
        SetVehicleLights(veh,2)
        SetVehicleColours(veh,147,41)
        SetVehicleNumberPlateTextIndex(veh,2)
		SetVehicleNumberPlateText(veh,"CHERRYFARM")
		SetPedIntoVehicle(GetPlayerPed(-1),veh,-1)
		SetEntityAsMissionEntity(veh, true, true)
        for i = 0,24 do
            SetVehicleModKit(veh,0)
            RemoveVehicleMod(veh,i)
        end
    end    
end


local coordonate = {
    {2348.7211914063,4990.3676757813,43.043785095215},
    {2335.6193847656,4976.548828125,42.603000640869},
    {2347.6796875,4975.4033203125,42.716747283936},
    {2360.48828125,4976.1762695313,43.187522888184},
    {2361.806640625,4987.51171875,43.310264587402},
    {2373.6062011719,4988.861328125,43.98099899292},
    {2388.8107910156,4992.7407226563,45.098552703857},
    {2389.5842285156,5003.8559570313,45.684902191162},
    {2377.5905761719,5004.5571289063,44.645648956299},
    {2375.7756347656,5016.8115234375,45.361560821533},
    {2368.6567382813,5012.1323242188,44.356273651123},
    {2357.9260253906,5019.6025390625,43.891975402832},
    {2345.3579101563,5007.0161132813,42.725841522217},
    {2332.3029785156,4995.7612304688,42.125686645508},
    {2318.837890625,4984.4018554688,41.771705627441},
    {2317.6384277344,4993.2856445313,42.032917022705},
    {2331.1645507813,5006.3735351563,42.314880371094},
    {2343.9565429688,5022.1870117188,43.50581741333},
    {2342.6948242188,5034.3696289063,44.287811279297},
    {2330.7739257813,5021.5014648438,42.897998809814},
    {2317.208984375,5007.9169921875,42.486145019531},
    {2305.8037109375,4996.6220703125,42.273220062256},
    {2317.6071777344,5022.9165039063,43.229526519775},
    {2330.2463378906,5036.1245117188,44.325420379639},
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local metrii2 = math.floor(GetDistanceBetweenCoords(2345.5437011719,5000.8325195313,42.6506690979, GetEntityCoords(GetPlayerPed(-1))))
        local carPos = GetEntityCoords(veh, false)
        local pos = GetEntityCoords(GetPlayerPed(-1))
        if cutie == 6 then      
            DrawText3D(carPos.x,carPos.y,carPos.z+2, "~r~Go sell the cherries", 1.2)
        end
        if not DoesEntityExist(veh) and hasJob then
            hasJob = false
            aajuns = false
            culege = false
            cutie = 0
        end
        if culege then
            if (Vdist(pos.x, pos.y, pos.z, carPos.x , carPos.y, carPos.z) <= 7.0) and DoesEntityExist(veh) then
                DrawText3D(carPos.x,carPos.y,carPos.z, "Press ~y~[E]~w~ to put the box in car", 1.2)
                DrawText3D(carPos.x,carPos.y,carPos.z+2, "~r~"..cutie.."~w~/~g~6", 1.2)
                if IsControlJustPressed(1,51) then
                    DeleteEntity(myObject)
                    ClearPedTasksImmediately(GetPlayerPed(-1))
                    culege = false
                    cutie = cutie + 1
                    if cutie == 1 then
                        local objectModel1 = GetHashKey("v_ind_cf_chckbox1")
                        myObject1 = CreateObject(objectModel1, carPos.x, carPos.y, carPos.z, true, true, false)
                        AttachEntityToEntity(myObject1, veh, veh, 0.23, -0.8,4, -0.5, 5.0, 0.0, 0.0, true, true, false, true, 1, true)
                    elseif cutie == 3 then  
                        local objectModel2 = GetHashKey("v_ind_cf_chckbox1")
                        myObject2 = CreateObject(objectModel2, carPos.x, carPos.y, carPos.z, true, true, false)
                        AttachEntityToEntity(myObject2, veh, veh, 0.13, -1.3,4, -0.9, 5.0, 0.0, 0.0, true, true, false, true, 1, true)
                    elseif cutie == 6 then  
                        local objectModel3 = GetHashKey("v_ind_cf_chckbox1")
                        myObject3 = CreateObject(objectModel3, carPos.x, carPos.y, carPos.z, true, true, false)
                        AttachEntityToEntity(myObject3, veh, veh, -0.23, -0.8,4, -0.9, 5.0, 0.0, 0.0, true, true, false, true, 1, true)
                        aajuns = false
                        cursaf = true
                        if cursaf then
                            SetNewWaypoint(2553.9436035156,4668.5922851563)
                            for i,v in pairs(coordonate) do
                                table.remove(coordonate,i)
                            end
                        end
                    end
                end 
            end
        end  
        if aajuns == true and hasJob == true then
            for i,v in pairs(coordonate) do
                if metrii2 <= 50 then
                    DrawMarker(2, v[1], v[2], v[3], 0, 0, 0, 0, 0, 0, 0.4, 0.4, 0.4, 35, 170, 25, 165, 0, 0, 2, 1, 0, 1, 0,1)
                    local metrii3 = math.floor(GetDistanceBetweenCoords(v[1],v[2],v[3], GetEntityCoords(GetPlayerPed(-1))))
                    if metrii3 <= 2 then
                        DrawText3D(pos.x,pos.y,pos.z, "Press ~y~[E]~w~ to start picking cherries", 1.2)
                        if IsControlJustPressed(1,51) then
                            if (Vdist(pos.x, pos.y, pos.z, carPos.x , carPos.y, carPos.z) <= 50.0) and hasJob and aajuns and DoesEntityExist(veh) then
                                if culege == false then
                                    table.remove(coordonate,i)
                                    local playerPed = PlayerPedId()
                                    TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_PARKING_METER', 0, false)
                                    SetTimeout(10000, function()
                                        ClearPedTasks(playerPed)
                                        RequestAnimDict("anim@heists@box_carry@")
                                        TaskPlayAnim(GetPlayerPed(-1), 'anim@heists@box_carry@', 'idle', 8.0, 8.0, -1, 50, 0, false, false, false)
                                        local objectModel = GetHashKey("v_ind_cf_chckbox1")
                                        local pos = GetEntityCoords(GetPlayerPed(-1), true)
                                        local bone = GetPedBoneIndex(GetPlayerPed(-1), 28422)
                                        RequestModel(objectModel)
                                        myObject = CreateObject(objectModel, pos.x, pos.y, pos.z, true, true, false)
                                        AttachEntityToEntity(myObject, PlayerPedId(), bone, 0.0, 0,4, -0.1, 5.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
                                        FreezeEntityPosition(myObject, true)
                                        SetEntityInvincible(myObject, true)
                                        SetEntityCollision(myObject,0,1)
                                        culege = true
            
                                        exports['mythic_notify']:SendAlert('inform', 'Go to put the box with cherries in car', 2500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
                                    end)
                                else
                                    exports['mythic_notify']:SendAlert('inform', 'You are picking allready', 2500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
                                
                                end
                            else
                             
                                exports['mythic_notify']:SendAlert('inform', 'The car is not near', 2500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })

                            end
                        end
                    end
                end
            end
        end
        local metrii = math.floor(GetDistanceBetweenCoords(2553.8410644531,4668.697265625,33.987251281738, GetEntityCoords(GetPlayerPed(-1))))
        if metrii <= 3 then
            DrawText3D(pos.x,pos.y,pos.z+0.6, "Press ~y~[E]~w~ to be an Cherries Farmer \n Press ~y~[Y]~w~ to sell the cherries", 1.2)
            if IsControlJustPressed(1,51) then
                if hasJob == false then
                    aajuns = true
                    hasJob = true
               exports['mythic_notify']:SendAlert('success', 'You have been hired', 2500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
                    CreateCar(2544.0529785156,4660.63671875,34.076808929443,100)
                    if hasJob then
                        SetNewWaypoint(2345.5437011719,5000.8325195313)
                    end
                else
                    exports['mythic_notify']:SendAlert('error', 'You are already hired', 2500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
                end
            elseif IsControlJustPressed(1,246) then
                if cursaf then
                    if DoesEntityExist(veh) then
                        DeleteEntity(veh)
                        DeleteEntity(myObject1)
                        DeleteEntity(myObject2)
                        DeleteEntity(myObject3)
                        hasJob = false
                        culege = false
                        cursaf = false
                        cutie = 0
                        table.insert(coordonate,{2348.7211914063,4990.3676757813,43.043785095215})
                        table.insert(coordonate,{2335.6193847656,4976.548828125,42.603000640869})
                        table.insert(coordonate,{2347.6796875,4975.4033203125,42.716747283936})
                        table.insert(coordonate,{2360.48828125,4976.1762695313,43.187522888184})
                        table.insert(coordonate,{2361.806640625,4987.51171875,43.310264587402})
                        table.insert(coordonate,{2373.6062011719,4988.861328125,43.98099899292})
                        table.insert(coordonate,{2388.8107910156,4992.7407226563,45.098552703857})
                        table.insert(coordonate,{2389.5842285156,5003.8559570313,45.684902191162})
                        table.insert(coordonate,{2377.5905761719,5004.5571289063,44.645648956299})
                        table.insert(coordonate,{2375.7756347656,5016.8115234375,45.361560821533})
                        table.insert(coordonate,{2368.6567382813,5012.1323242188,44.356273651123})
                        table.insert(coordonate,{2357.9260253906,5019.6025390625,43.891975402832})
                        table.insert(coordonate,{2345.3579101563,5007.0161132813,42.725841522217})
                        table.insert(coordonate,{2332.3029785156,4995.7612304688,42.125686645508})
                        table.insert(coordonate,{2318.837890625,4984.4018554688,41.771705627441})
                        table.insert(coordonate,{2317.6384277344,4993.2856445313,42.032917022705})
                        table.insert(coordonate,{2331.1645507813,5006.3735351563,42.314880371094})
                        table.insert(coordonate,{2343.9565429688,5022.1870117188,43.50581741333})
                        table.insert(coordonate,{2342.6948242188,5034.3696289063,44.287811279297})
                        table.insert(coordonate,{2330.7739257813,5021.5014648438,42.897998809814})
                        table.insert(coordonate,{2317.208984375,5007.9169921875,42.486145019531})
                        table.insert(coordonate,{2305.8037109375,4996.6220703125,42.273220062256})
                        table.insert(coordonate,{2317.6071777344,5022.9165039063,43.229526519775})
                        table.insert(coordonate,{2330.2463378906,5036.1245117188,44.325420379639})
                        TriggerServerEvent("hell_cherryfarmer:sell")
                    else
            
                        exports['mythic_notify']:SendAlert('inform', 'You dont have a car', 2500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })

                    end
                else
            
                    exports['mythic_notify']:SendAlert('inform', 'You have not finished', 2500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
                end
            end
        end      
    end
end)

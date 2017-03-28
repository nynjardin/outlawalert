RegisterServerEvent('thiefInProgress')
AddEventHandler('thiefInProgress', function(street1, street2, veh, sex)
	if veh == "NULL" then
		TriggerClientEvent("chatMessage", -1, '', { 0, 0, 0 }, "^1Thief of a vehicle by a ^0"..sex.." ^1between ^0"..street1.."^1 and ^0"..street2)
	else
		TriggerClientEvent("chatMessage", -1, '', { 0, 0, 0 }, "^1Thief of a ^0"..veh.." ^1by a ^0"..sex.." ^1between ^0"..street1.."^1 and ^0"..street2)
	end
end)

RegisterServerEvent('thiefInProgressS1')
AddEventHandler('thiefInProgressS1', function(street1, veh, sex)
	if veh == "NULL" then
		TriggerClientEvent("chatMessage", -1, '', { 0, 0, 0 }, "^1Thief of a vehicle by a ^0"..sex.." ^1at ^0"..street1)
	else
		TriggerClientEvent("chatMessage", -1, '', { 0, 0, 0 }, "^1Thief of a ^0"..veh.." ^1by a ^0"..sex.." ^1at ^0"..street1)
	end
end)

RegisterServerEvent('gunshotInProgress')
AddEventHandler('gunshotInProgress', function(street1, street2, sex)
	TriggerClientEvent("chatMessage", -1, '', { 0, 0, 0 }, "^1Gunshot by a ^0"..sex.." ^1between ^0"..street1.."^1 and ^0"..street2)
end)

RegisterServerEvent('gunshotInProgressS1')
AddEventHandler('gunshotInProgressS1', function(street1, sex)
	TriggerClientEvent("chatMessage", -1, '', { 0, 0, 0 }, "^1Gunshot by a ^0"..sex.." ^1at ^0"..street1)
end)
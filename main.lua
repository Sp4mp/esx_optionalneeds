ESX.RegisterUsableItem('fixkit', function(source)

	local _source = source
  	local xPlayer  = ESX.GetPlayerFromId(source)
  	local acls = 0
 	 if xPlayer.job.name == 'mechanic' then
		xPlayer.removeInventoryItem('fixkit', 1)
		TriggerClientEvent('esx_bennys:onFixkit', _source)
    	TriggerClientEvent('esx:showNotification', _source, ('Werkzeugkasten benutzt'))
  	else
    	local xPlayers = ESX.GetPlayers()
    	for i = 1, #xPlayers do
       	 local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        	if xPlayer.job.name == 'mechanic' then
            	acls = acls + 1
        	end
    	end
		if acls < 1 then
  			xPlayer.removeInventoryItem('fixkit', 1)
  			TriggerClientEvent('esx_bennys:onFixkit', _source)
    		TriggerClientEvent('esx:showNotification', _source, ('Werkzeugkasten benutzt'))
		else
			TriggerClientEvent('esx:showNotification', _source, ('Schick einen Dispatch an den ACLS mit /ACLS !'))
		end
	end
end)

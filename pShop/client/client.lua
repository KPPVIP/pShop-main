Citizen.CreateThread(function()
    while ESX == nil do
         TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
         Citizen.Wait(5000)
     end
 end)

 function RefreshMoney()
    Citizen.CreateThread(function()
            ESX.Math.GroupDigits(ESX.PlayerData.money)
            ESX.Math.GroupDigits(ESX.PlayerData.accounts[1].money)
            ESX.Math.GroupDigits(ESX.PlayerData.accounts[2].money)
    end)
end
 
 -- MENU
 local mainMenu = RageUI.CreateMenu("", "Moyen de payement") 
 local manger = RageUI.CreateSubMenu(mainMenu, "", "MENU") 
 local boire = RageUI.CreateSubMenu(mainMenu, "", "MENU") 
 local liquide = RageUI.CreateSubMenu(mainMenu, "", "MENU")
 local liquidemanger = RageUI.CreateSubMenu(liquide, "", "MENU")
 local liquideboire = RageUI.CreateSubMenu(liquide, "", "MENU")
 local liquidedivers = RageUI.CreateSubMenu(liquide, "", "MENU")
 local banque = RageUI.CreateSubMenu(mainMenu, "", "MENU")
 local banquedivers = RageUI.CreateSubMenu(banque, "", "MENU")
 local banquemanger = RageUI.CreateSubMenu(banque, "", "MENU")
 local banqueboire = RageUI.CreateSubMenu(banque, "", "MENU")


 local open = false
 
 mainMenu.X = 0 
 mainMenu.Y = 0
 
 mainMenu.Closed = function() 
     open = false 
 end 
 
 function pshop()
     if open then 
         open = false 
             RageUI.Visible(mainMenu, false) 
         return 
     else 
         open = true 
             RageUI.Visible(mainMenu, true)
         Citizen.CreateThread(function()
             while open do 
                 RageUI.IsVisible(mainMenu, function()
                    ESX.PlayerData = ESX.GetPlayerData()
                    RefreshMoney()
                     RageUI.Button("Liquide", nil, {RightLabel = "→"}, true, {
                     onSelected = function()
                     end
                    }, liquide)
                     RageUI.Button("Banque", nil, {RightLabel = "→"}, true, {
                        onSelected = function()
                        end
                        }, banque)  
                     RageUI.Separator("→ ~o~2~r~4~s~/~g~7 ~s~Superette ←")
                 end)

                 RageUI.IsVisible(liquide, function()
                    ESX.PlayerData = ESX.GetPlayerData()
                    RefreshMoney()
                    RageUI.Separator("→ Mode de Paiement : ~g~Liquide ~s~ ←")
                    RageUI.Separator("→ Votre Solde liquide : ~g~".. ESX.Math.GroupDigits(ESX.PlayerData.money).."~s~ $ ←")
                    RageUI.Button("Nourriture", nil, {RightLabel = "→"}, true, {}, liquidemanger) 
                    RageUI.Button("Boissons", nil, {RightLabel = "→"}, true, {}, liquideboire)   
                    RageUI.Button("Divers", nil, {RightLabel = "→"}, true, {}, liquidedivers) 
                end)

                RageUI.IsVisible(liquideboire, function()
                    RageUI.Button("Eau", "Acheter de l'eau", {RightLabel = "5$"}, true, { 
                    onSelected = function()
                         TriggerServerEvent('pawal:achatEau')
                    end
                  })

                    RageUI.Button("Ice Tea", "Acheter de l'ice tea", {RightLabel = "10$"}, true, { 
                    onSelected = function()
                         TriggerServerEvent('pawal:achatIcetea')
                      end
                })

                    RageUI.Button("Jus de fruit", "Acheter du jus de fruit", {RightLabel = "15$"}, true, { 
                    onSelected = function()
                         TriggerServerEvent('pawal:achatJusfruit')
                      end
                })

                end)

                RageUI.IsVisible(liquidemanger, function()
                    RageUI.Button("Pain", "Acheter du pain", {RightLabel = "4$"}, true, { 
                    onSelected = function()
                         TriggerServerEvent('pawal:achatPain')
                    end
                  })

                    RageUI.Button("Chips", "Acheter des chips", {RightLabel = "8$"}, true, { 
                    onSelected = function()
                         TriggerServerEvent('pawal:achatChips')
                      end
                })

                    RageUI.Button("Saucisson", "Acheter du saucisson", {RightLabel = "13$"}, true, { 
                    onSelected = function()
                         TriggerServerEvent('pawal:achatSaucisson')
                      end
                })

                end)

                RageUI.IsVisible(liquidedivers, function()
                    RageUI.Button("Golden Ticket", "Acheter un Golden Ticket", {RightLabel = "750$"}, true, { 
                    onSelected = function()
                         TriggerServerEvent('pawal:achatTicket')
                    end
                  })
                  RageUI.Button("Standard Ticket", "Acheter un Standard Ticket", {RightLabel = "250$"}, true, { 
                    onSelected = function()
                         TriggerServerEvent('pawal:achatTicketStandard')
                    end
                  })

                end)

                RageUI.IsVisible(banque, function()
                    ESX.PlayerData = ESX.GetPlayerData()
                    RefreshMoney()
                    RageUI.Separator("→ Mode de Paiement : ~o~Banque ~s~ ←")
                    RageUI.Separator("→ Votre Solde Banque : ~o~".. ESX.Math.GroupDigits(ESX.PlayerData.accounts[1].money).."~s~ $ ←")
                    RageUI.Button("Nourriture", nil, {RightLabel = "→"}, true, {}, banquemanger) 
                    RageUI.Button("Boissons", nil, {RightLabel = "→"}, true, {}, banqueboire)  
                    RageUI.Button("Divers", nil, {RightLabel = "→"}, true, {}, banquedivers) 

            end)

            RageUI.IsVisible(banquemanger, function()
                RageUI.Button("Pain", "Acheter du pain", {RightLabel = "4$"}, true, { 
                    onSelected = function()
                         TriggerServerEvent('pawal:banqueachatPain')
                    end
                  })

                    RageUI.Button("Chips", "Acheter des chips", {RightLabel = "8$"}, true, { 
                    onSelected = function()
                         TriggerServerEvent('pawal:banqueachatChips')
                      end
                })

                    RageUI.Button("Saucisson", "Acheter du saucisson", {RightLabel = "13$"}, true, { 
                    onSelected = function()
                         TriggerServerEvent('pawal:banqueachatSaucisson')
                      end
                })

            end)

            RageUI.IsVisible(banquedivers, function()
                RageUI.Button("Golden Ticket", "Acheter un Golden Ticket", {RightLabel = "750$"}, true, { 
                onSelected = function()
                     TriggerServerEvent('pawal:banqueachatTicket')
                end
              })
              RageUI.Button("Standard Ticket", "Acheter un Standard Ticket", {RightLabel = "250$"}, true, { 
                onSelected = function()
                     TriggerServerEvent('pawal:banqueachatTicketStandard')
                end
              })

            end)

            RageUI.IsVisible(banqueboire, function()
                RageUI.Button("Eau", "Acheter de l'eau", {RightLabel = "5$"}, true, { 
                    onSelected = function()
                         TriggerServerEvent('pawal:banqueachatEau')
                    end
                  })

                    RageUI.Button("Ice Tea", "Acheter de l'ice tea", {RightLabel = "10$"}, true, { 
                    onSelected = function()
                         TriggerServerEvent('pawal:banqueachatIcetea')
                      end
                })

                    RageUI.Button("Jus de fruit", "Acheter du jus de fruit", {RightLabel = "15$"}, true, { 
                    onSelected = function()
                         TriggerServerEvent('pawal:banqueachatJusfruit')
                      end
                })

            end)
             Wait(0)
             end
         end)
     end
 end
 
 -- MARKERS
 
 Citizen.CreateThread(function()
     while true do
       local wait = 900
         for k,v in pairs(Config.position) do
             local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
             local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, v.x, v.y, v.z)
             if dist <= 7 then 
                 wait = 1                                                 
                 DrawMarker(config.markertype, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.6, 0.6, 0.6, config.red, config.green, config.blue, config.opacity, 55555, false, true, 2, false, false, false, false)
             end
             if dist <= 1.1 then
                 wait = 1
                 ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour intéragir") 
                 if IsControlJustPressed(1,51) then
                     pshop() 
                 end
             end 
         end
     Citizen.Wait(wait)
     end
 end)
 
 -- BLIPS
 
 Citizen.CreateThread(function() 
     for k, v in pairs(Config.position) do 
         local blip = AddBlipForCoord(v.x, v.y, v.z) 
                      SetBlipSprite  (blip, config.blipsprite) 
                      SetBlipDisplay (blip, config.blipdisplay) 
                      SetBlipScale   (blip, config.blipscale) 
                      SetBlipColour  (blip, config.blipcolour)
                      SetBlipAsShortRange(blip, true) 
                      BeginTextCommandSetBlipName('STRING') 
                      AddTextComponentSubstringPlayerName(config.blipname) 
                      EndTextCommandSetBlipName(blip) 
     end 
 end)
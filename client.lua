-- Edited By Naben

ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)


RegisterCommand('rockstareditor', function()
    rockstart()
end)

function rockstart()
    local rockstareditor = RageUI.CreateMenu("Rockstar Editor", "Actions")
    RageUI.Visible(rockstareditor, not RageUI.Visible(rockstareditor))
    while rockstareditor do
        Wait(0)
            RageUI.IsVisible(rockstareditor, true, true, true, function()
                RageUI.ButtonWithStyle("Démarrer l'enregistrement du replay", nil, {RightLabel = nil}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        StartRecording(0)
                    end
                end)
                RageUI.ButtonWithStyle("Démarrer l'enregistrement", nil, {RightLabel = nil}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        StartRecording(1)
                    end
                end)
                RageUI.ButtonWithStyle("Arreter et sauvegarder l'enregistrement", nil, {RightLabel = nil}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        StopRecordingAndSaveClip()
                    end
                end)
                RageUI.ButtonWithStyle("Arreter et supprimer l'enregistrement", nil, {RightLabel = nil}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        StopRecordingAndDiscardClip()
                    end
                end)
                RageUI.ButtonWithStyle("Ouvrir le rockstar editor", nil, {RightLabel = nil}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        NetworkSessionLeaveSinglePlayer()
                        ActivateRockstarEditor()
                    end
                end)
			end, function()
			end)
              if not RageUI.Visible(rockstareditor) and not RageUI.Visible(rockstareditorSub) then
              rockstareditor = RMenu:DeleteType("rockstareditor", true)
        end
    end
end
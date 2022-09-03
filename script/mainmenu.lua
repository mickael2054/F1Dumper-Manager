-- F1Dumper & Manager by Mickael2054 (First project)

System.memclean()
System.setHigh()
 
fichiers = nil
Selecteur = 1

------------------------------------------------------------------
System.sleep(200)
batterie()
while true do
screen:clear()

pad = Controls.read()

if pad:up() then
Selecteur = Selecteur - 1
System.sleep(200)
end 

if pad:down() then 
Selecteur = Selecteur + 1
System.sleep(200)
end

if pad:left() then
Selecteur = 1
end 

if pad:right() then 
Selecteur = 10
end
----
if Selecteur==7 then-----
oldselect="up"
end

if Selecteur==8 and System.usbState(1,0) == 1 then-----
if oldselect == "up" then
Selecteur = Selecteur + 1
end

if oldselect == "down" then
Selecteur = Selecteur - 1
end
end

if Selecteur==9 then
oldselect="down"
end
--
if System.usbState(1,0) == 0 then
text_Mainmenu[7] = USBMS0
text_Mainmenu[8] = USBF10
else
text_Mainmenu[7] = USB1
text_Mainmenu[8] = USB1
end
-----------

if Selecteur > 10 then
Selecteur = 1
end 

if Selecteur < 1 then
Selecteur = 10
end


screen:blit(0,0,screenfree)
topmenu()
Textecentre(100,text_Mainmenu[Selecteur-1],blanc)
Textecentre(150,"--> "..text_Mainmenu[Selecteur].." <--",noir)
Textecentre(200,text_Mainmenu[Selecteur+1],blanc)

----Choix menu(pad)---->
if pad:cross() and Selecteur == 1 then
dofile("ms0:/PSP/GAME/F1Dumper & Manager/script/copytoms.lua")
end

if pad:cross() and Selecteur == 2 then
dofile("ms0:/PSP/GAME/F1Dumper & Manager/script/dumpsmanager.lua")
end

if pad:cross() and Selecteur == 3 and f1drivers == "ok" then
dofile("ms0:/PSP/GAME/F1Dumper & Manager/script/format.lua")
end

if pad:cross() and Selecteur == 4 then
dofile("ms0:/PSP/GAME/F1Dumper & Manager/script/config.se.lua")
end

if pad:cross() and Selecteur == 5 then
dofile("ms0:/PSP/GAME/F1Dumper & Manager/script/webbrowser.lua")
end

if pad:cross() and Selecteur == 6 then
dofile("ms0:/PSP/GAME/F1Dumper & Manager/script/advanced.lua")
end

if pad:cross() and Selecteur == 7 then
mode = "MS"
dofile("ms0:/PSP/GAME/F1Dumper & Manager/script/usb.lua")
end

if pad:cross() and Selecteur == 8 then
mode = "F1"
dofile("ms0:/PSP/GAME/F1Dumper & Manager/script/usb.lua")
end

if pad:cross() and Selecteur == 9 then
dofile("ms0:/PSP/GAME/F1Dumper & Manager/script/by.lua")
end

if pad:cross() and Selecteur == 10 then
screen:clear()
screen:blit(0,0,screenfree)
screen:print(160,136,"Good bye : "..System.nickName().."!",noir)
screen.flip()
System.sleep(2500)
System.Quit()
end
screen.flip()
screen.waitVblankStart()
end
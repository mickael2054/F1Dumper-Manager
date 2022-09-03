--advanced operations

System.memclean()
System.setHigh()

Selecteur = 1

------------------------------------------------------------------
System.sleep(100)
batterie()
while true do
screen:clear()

----Contrôle menu ---->
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
Selecteur = 5
end

if Selecteur > 4 then
Selecteur = 1
end 

if Selecteur < 1 then
Selecteur = 4
end


screen:blit(0,0,screenfree)
topmenu()
Textecentre(100,text_RegistryHack[Selecteur-1],blanc)
Textecentre(150,"--> "..text_RegistryHack[Selecteur].." <--",noir)
Textecentre(200,text_RegistryHack[Selecteur+1],blanc)

----Choix menu(pad)---->
if pad:cross() and Selecteur == 1 then
crackParentalPass()
while true do
screen:clear()
screen:blit(0,0,screenfree)
Textecentre(130,text_Function[1],rouge)
Textecentre(160,p,blanc)
screen:print(130,260,text_Function[2],blanc)
screen:print(210,260,text_Function[3],blanc)
screen.flip()

if Controls.read():square() then
System.startGameSave("F1Dumper","Files","Password : "..p.."","","F1DUMPER")
System.message(text_Function[4]..""..p..")",0)
end
if Controls.read():circle() then break end
end
end

if pad:cross() and Selecteur == 2 then
crackWKey()
while true do
screen:clear()
screen:blit(0,0,screenfree)
Textecentre(60,text_Function[5].." 1 : "..Wname1,rouge)
Textecentre(90,text_Function[6]..""..SSID1,blanc)
Textecentre(110,text_Function[7]..""..key1,blanc)

Textecentre(160,text_Function[5].." 2 : "..Wname2,rouge)
Textecentre(190,text_Function[6]..""..SSID2,blanc)
Textecentre(210,text_Function[7]..""..key2,blanc)
screen:print(130,260,text_Function[2],blanc)
screen:print(210,260,text_Function[8],blanc)
screen.flip()

if Controls.read():square() then
System.startGameSave("F1Dumper","Files","Wireless : "..Wname1 and SSID1 and key1,"","F1DUMPER")
System.message(text_Function[9]..""..Wname1.."\n\n"..SSID1.."\n"..key1.."",0)
end
if Controls.read():circle() then break end
end
end

if pad:cross() and Selecteur == 3 then
borowserHomePage()
while true do
screen:clear()
screen:blit(0,0,screenfree)
Textecentre(130,text_Function[10],rouge)
Textecentre(160,text_Function[11]..""..address,blanc)

screen:print(130,260,text_Function[2],blanc)
screen.flip()

if Controls.read():circle() then break end
end
end

if pad:cross() and Selecteur == 4 then
dofile("ms0:/PSP/GAME/F1Dumper & Manager/script/mainmenu.lua")
end

screen.flip()
screen.waitVblankStart()
end

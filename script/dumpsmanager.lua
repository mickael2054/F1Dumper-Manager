System.memclean()

System.setHigh()

System.currentDirectory("ms0:/DUMPF1")

------------------------------------------------------------------

fbrowser = {s = 3, fl = System.listDirectory("ms0:/DUMPF1"),ls = 3, sp = 20}
numberfile = table.getn(fbrowser.fl)

batterie()
while true do
screen:clear()

screen:blit(0,0,screenfree)

aff_batterie(405,10)

pad = Controls.read()

screen:print(220,200,text_DumpsManager[1],bleu)
screen:print(220,215,text_DumpsManager[2],bleu)
screen:print(220,230,text_DumpsManager[3],bleu)
screen:print(220,245,text_DumpsManager[4],bleu)
screen:print(220,260,text_DumpsManager[5],bleu)

runfbrowser()

----Restaurer ---->
if pad:square() and f1drivers == "ok" then

file = io.open("ms0:/PSP/GAME/F1Dumper & Manager/script/backname.txt" ,"w")
file:write(fbrowser.fl[fbrowser.s].name)
file:close()

System.rename(fbrowser.fl[fbrowser.s].name,"copy")

dofile("ms0:/PSP/GAME/F1Dumper & Manager/script/copytoflash.lua")
end

if pad:start() then
infodumptext(fbrowser.fl[fbrowser.s].name)
end

----Supprimer dump ---->
if pad:triangle() then
file = io.open("ms0:/DUMPF1/"..fbrowser.fl[fbrowser.s].name.."/About this dump.txt" ,"r")
saut = file:read()
saut = file:read()
saut = file:read()
infodump = file:read("*a")
file:close()
System.message(text_DumpsManager[6].."\n\n"..infodump, 1)

if System.buttonPressed(0) == 1 then
deletedump()
end
end

if pad:l() and pad:r() then
file = io.open("ms0:/PSP/GAME/F1Dumper & Manager/script/dumpnametext.txt" ,"r")
num = file:read()
file:close()
if sysMessInit (text_DumpsManager[7]..""..num..")") == 1 then
file = io.open("ms0:/PSP/GAME/F1Dumper & Manager/script/dumpnametext.txt" ,"w")
file:write("0")
file:close()
end
end

if pad:circle() then
dofile("ms0:/PSP/GAME/F1Dumper & Manager/script/mainmenu.lua")
end

screen.waitVblankStart()
screen.flip()
end

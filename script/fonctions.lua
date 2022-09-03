--Fonctions.lua

ver="V2.6"

text_First = {}
text_First[1] = "Warning,\n\nLuaPlayerHM Drivers have been installed into your flash1:/.\nAt the moment F1Dumper & Manager is not able to delet these files!\nOtherwise that would corrupt the nand.\nConsequently, the following functions will be deactivated:\n\n-Format flash1:/\n\n-Restore flash1:/\n\n\nThank you for your comprehension!\n\nMickael2054"

text_Mainmenu = {}
text_Mainmenu[0] = ""
text_Mainmenu[1] = "Dump flash1"
text_Mainmenu[2] = "Restore flash1 / Dumps Manager"
text_Mainmenu[3] = "Format flash1 and reset all settings"
text_Mainmenu[4] = "Delete CFW settings files"
text_Mainmenu[5] = "Delete Webbrowser settings and files"
text_Mainmenu[6] = "Registry hack"

USBMS0 = "Enable USB MS mode"
USBF10 = "Enable USB flash1 mode"
USB1 = "Disable USB"

text_Mainmenu[9] = "Credits"
text_Mainmenu[10] = "Exit F1Dumper & Manager "..ver
text_Mainmenu[11] = ""
text_Mainmenu[18] = "Your current firmware is "
text_Mainmenu[19] = "USB enabled"



text_RegistryHack = {}
text_RegistryHack[0] = ""
text_RegistryHack[1] = "Crack parental password"
text_RegistryHack[2] = "Crack wireless key"
text_RegistryHack[3] = "Browser home page"
text_RegistryHack[4] = "Return to the mainmenu"
text_RegistryHack[5] = ""


text_Credits = {}
text_Credits[1] = "F1Dumper & Manager "..ver..""
text_Credits[2] = "By Mickael2054"
text_Credits[3] = "********************"
text_Credits[4] = "Thanks:"
text_Credits[5] = "Homemister and PickDat"
text_Credits[6] = "Essgeeaych"
text_Credits[7] = "Flav1994"
text_Credits[8] = "Spimort"
text_Credits[9] = "BigProMan"
text_Credits[10] = "Albandu51"
text_Credits[11] = "Devsgen Forums"
text_Credits[12] = "Pspgen Forums"
text_Credits[13] = "XtreamLua"
text_Credits[14] = "To check if a new release is available"
text_Credits[15] = "Press triangle or visit the web site :"
text_Credits[16] = "http://teampct.e3b.org/releasesSite/"

text_USBDisabled = "USB Disabled"


text_Function = {}
text_Function[1] = "Parental password :"
text_Function[2] = "O Back"
text_Function[3] = "[] Save password"
text_Function[4] = "Parental password has been saved with succes! \n\n(Password : "
text_Function[5] = "Wireless"
text_Function[6] = "SSID : "
text_Function[7] = "Wireless key : "
text_Function[8] = "[] Save Wireless 1 files"
text_Function[9] = "Wireless key has been seved with succes! \n\nWireless : "
text_Function[10] = "Netfront Webbrowser homepage"
text_Function[11] = "Address : "

text_DumpsManager = {}
text_DumpsManager[1] = "Triangle : delete this dump"
text_DumpsManager[2] = "Square : restore this dump"
text_DumpsManager[3] = "Start : infos on the dump"
text_DumpsManager[4] = "L and R : Meter of dumps --> 0"
text_DumpsManager[5] = "Circle : back to main menu"
text_DumpsManager[6] = "Do you really want to delete this dump?"
text_DumpsManager[7] = "Do you really want put back the meter of dumps to 0? \n\n(Currently : "
text_DumpsManager[8] = "No dumps"
text_DumpsManager[9] = ""
text_DumpsManager[10] = ""




--function text
function Textecentre(y,string,color)
screen:print( 240 - (string.len(string)*8) / 2 ,y,string,color);
end


function batterie()
if System.powerGetBatteryLifePercent() >= 0 then battery = batterie1 end
if System.powerGetBatteryLifePercent() > 10 then battery = batterie2 end
if System.powerGetBatteryLifePercent() > 50 then battery = batterie3 end
if System.powerGetBatteryLifePercent() > 75 then battery = batterie4 end
pourcent = System.powerGetBatteryLifePercent()
end

function aff_batterie(posx, posy)
screen:blit(posx,posy,battery)
screen:print(posx+30,posy+5,"("..pourcent.."%)",blanc)
end


function Time()
if System.getTime(5) == "pm" then
heure = System.getTime(1)+12
else
heure = System.getTime(1)
end

if heure < 10 then
heure = "0"..heure
end

if System.getTime(2) < 10 then
minutes = "0"..System.getTime(2)
else
minutes = System.getTime(2)
end
end

function topmenu()
Time()

Textecentre(10,System.getDate(3).."/"..System.getDate(2).." "..heure.."."..minutes,blanc)

screen:print(30,30,"Hello "..System.nickName(),bleu)

screen:print(30,50,text_Mainmenu[18]..""..System.cfwVersion(),bleu)

aff_batterie(405,10)

if System.usbState(1,0) == 1 then

screen:print(30,257,text_Mainmenu[19],noir)
end
end


function runfbrowser()
if numberfile < 3 then
screen:print(35,35,text_DumpsManager[8],noir)
else

for i = ((fbrowser.ls-1)*fbrowser.sp)+1, fbrowser.ls*fbrowser.sp do
if numberfile >= i then
screen:print(35,((i-((fbrowser.ls-1)*fbrowser.sp))*13),fbrowser.fl[i].name,noir)


elseif numberfile < i then break end
end

screen:print(10,((fbrowser.s-((fbrowser.ls-1)*fbrowser.sp))*13),"-->",bleu)

if pad:down() then fbrowser.s = fbrowser.s + 1 System.sleep(200)end
if pad:up() then fbrowser.s = fbrowser.s - 1 System.sleep(200) end

if fbrowser.s > numberfile then fbrowser.s = numberfile elseif fbrowser.s < 3 then fbrowser.s = 3 end
if fbrowser.s > fbrowser.sp*fbrowser.ls then fbrowser.ls = fbrowser.ls + 1
elseif fbrowser.s < ((fbrowser.ls-1) * fbrowser.sp)+1 then fbrowser.ls = fbrowser.ls - 1 fbrowser.s = (fbrowser.ls)*fbrowser.sp end
end
end


function infodumptext(path)
file = io.open("ms0:/DUMPF1/"..path.."/About this dump.txt" ,"r")
saut = file:read()
saut = file:read()
saut = file:read()
infodump1 = file:read()
infodump2 = file:read()
saut = file:read()
infodump3 = file:read()
infodump4 = file:read()
saut = file:read()
infodump5 = file:read()
infodump6 = file:read()
file:close()


screen:print(220,50,infodump1,blanc)
screen:print(310,50,infodump2,blanc)
screen:print(220,90,infodump3,blanc)
screen:print(220,110,infodump4,blanc)
screen:print(220,130,infodump5,blanc)
screen:print(220,150,infodump6,blanc)
end

function deletedump()
check = System.doesFileExist("ms0:/DUMPF1/"..fbrowser.fl[fbrowser.s].name.."/config.se")
if check == 1 then
System.removeFile("ms0:/DUMPF1/"..fbrowser.fl[fbrowser.s].name.."/config.se")
end

check = System.doesFileExist("ms0:/DUMPF1/"..fbrowser.fl[fbrowser.s].name.."/config.note")
if check == 1 then
System.removeFile("ms0:/DUMPF1/"..fbrowser.fl[fbrowser.s].name.."/config.note")
end

check = System.doesDirExist("ms0:/DUMPF1/"..fbrowser.fl[fbrowser.s].name.."/dic")
if check == 1 then
System.currentDirectory("ms0:/DUMPF1/"..fbrowser.fl[fbrowser.s].name.."/dic") 
fichiers = System.listDirectory() 
nombre_fichiers = table.getn(fichiers) 

for z = 1, nombre_fichiers do -- Pour tout les fichiers
if fichiers[z].directory == false then
System.removeFile(fichiers[z].name)
end
end
System.removeDirectory("ms0:/DUMPF1/"..fbrowser.fl[fbrowser.s].name.."/dic")
end

check = System.doesDirExist("ms0:/DUMPF1/"..fbrowser.fl[fbrowser.s].name.."/gps") 
if check == 1 then
System.currentDirectory("ms0:/DUMPF1/"..fbrowser.fl[fbrowser.s].name.."/gps") 
fichiers = System.listDirectory() 
nombre_fichiers = table.getn(fichiers) 

for z = 1, nombre_fichiers do -- Pour tout les fichiers
if fichiers[z].directory == false then
System.removeFile(fichiers[z].name)
end
end
System.removeDirectory("ms0:/DUMPF1/"..fbrowser.fl[fbrowser.s].name.."/gps")
end

check = System.doesDirExist("ms0:/DUMPF1/"..fbrowser.fl[fbrowser.s].name.."/net/http") 
if check == 1 then
System.currentDirectory("ms0:/DUMPF1/"..fbrowser.fl[fbrowser.s].name.."/net/http") 
fichiers = System.listDirectory() 
nombre_fichiers = table.getn(fichiers) 

for z = 1, nombre_fichiers do -- Pour tout les fichiers
if fichiers[z].directory == false then
System.removeFile(fichiers[z].name)
end
end
System.removeDirectory("ms0:/DUMPF1/"..fbrowser.fl[fbrowser.s].name.."/net/http")
end

check = System.doesDirExist("ms0:/DUMPF1/"..fbrowser.fl[fbrowser.s].name.."/net") 
if check == 1 then
System.currentDirectory("ms0:/DUMPF1/"..fbrowser.fl[fbrowser.s].name.."/net") 
fichiers = System.listDirectory() 
nombre_fichiers = table.getn(fichiers) 

for z = 1, nombre_fichiers do -- Pour tout les fichiers
if fichiers[z].directory == false then
System.removeFile(fichiers[z].name)
end
end
System.removeDirectory("ms0:/DUMPF1/"..fbrowser.fl[fbrowser.s].name.."/net")
end

check = System.doesDirExist("ms0:/DUMPF1/"..fbrowser.fl[fbrowser.s].name.."/registry") 
if check == 1 then
System.currentDirectory("ms0:/DUMPF1/"..fbrowser.fl[fbrowser.s].name.."/registry") 
fichiers = System.listDirectory() 
nombre_fichiers = table.getn(fichiers) 

for z = 1, nombre_fichiers do -- Pour tout les fichiers
if fichiers[z].directory == false then
System.removeFile(fichiers[z].name)
end
end
System.removeDirectory("ms0:/DUMPF1/"..fbrowser.fl[fbrowser.s].name.."/registry")
end

check = System.doesDirExist("ms0:/DUMPF1/"..fbrowser.fl[fbrowser.s].name.."/updater") 
if check == 1 then
System.currentDirectory("ms0:/DUMPF1/"..fbrowser.fl[fbrowser.s].name.."/updater") 
fichiers = System.listDirectory() 
nombre_fichiers = table.getn(fichiers) 

for z = 1, nombre_fichiers do -- Pour tout les fichiers
if fichiers[z].directory == false then
System.removeFile(fichiers[z].name)
end
end
System.removeDirectory("ms0:/DUMPF1/"..fbrowser.fl[fbrowser.s].name.."/updater")
end

check = System.doesDirExist("ms0:/DUMPF1/"..fbrowser.fl[fbrowser.s].name.."/vsh/theme") 
if check == 1 then
System.currentDirectory("ms0:/DUMPF1/"..fbrowser.fl[fbrowser.s].name.."/vsh/theme") 
fichiers = System.listDirectory() 
nombre_fichiers = table.getn(fichiers) 

for z = 1, nombre_fichiers do -- Pour tout les fichiers
if fichiers[z].directory == false then
System.removeFile(fichiers[z].name)
end
end
System.removeDirectory("ms0:/DUMPF1/"..fbrowser.fl[fbrowser.s].name.."/vsh/theme")
end

check = System.doesDirExist("ms0:/DUMPF1/"..fbrowser.fl[fbrowser.s].name.."/vsh") 
if check == 1 then
System.currentDirectory("ms0:/DUMPF1/"..fbrowser.fl[fbrowser.s].name.."/vsh") 
fichiers = System.listDirectory() 
nombre_fichiers = table.getn(fichiers) 

for z = 1, nombre_fichiers do -- Pour tout les fichiers
if fichiers[z].directory == false then
System.removeFile(fichiers[z].name)
end
end
System.removeDirectory("ms0:/DUMPF1/"..fbrowser.fl[fbrowser.s].name.."/vsh")
end

System.currentDirectory("ms0:/DUMPF1/"..fbrowser.fl[fbrowser.s].name) 
fichiers = System.listDirectory() 
nombre_fichiers = table.getn(fichiers) 

for z = 1, nombre_fichiers do
if fichiers[z].directory == false then
System.removeFile(fichiers[z].name)
else
System.removeDirectory(fichiers[z].name)
end
end

System.removeDirectory("ms0:/DUMPF1/"..fbrowser.fl[fbrowser.s].name)
dofile("ms0:/PSP/GAME/F1Dumper & Manager/script/mainmenu.lua")
end



function FormatFlash1()
check = System.doesDirExist("flash1:/dic") 
if check == 1 then
System.currentDirectory("flash1:/dic") 
fichiers = System.listDirectory() 
nombre_fichiers = table.getn(fichiers) 

for z = 1, nombre_fichiers do
if fichiers[z].directory == false then
System.removeFile(fichiers[z].name)
end
end
end

check = System.doesDirExist("flash1:/gps") 
if check == 1 then
System.currentDirectory("flash1:/gps") 
fichiers = System.listDirectory() 
nombre_fichiers = table.getn(fichiers) 

for z = 1, nombre_fichiers do
if fichiers[z].directory == false then
System.removeFile(fichiers[z].name)
end
end
System.removeDirectory("flash1:/gps")
end

check = System.doesDirExist("flash1:/net/http") 
if check == 1 then
System.currentDirectory("flash1:/net/http") 
fichiers = System.listDirectory() 
nombre_fichiers = table.getn(fichiers) 

for z = 1, nombre_fichiers do
if fichiers[z].directory == false then
System.removeFile(fichiers[z].name)
end
end
end

check = System.doesDirExist("flash1:/net") 
if check == 1 then
System.currentDirectory("flash1:/net") 
fichiers = System.listDirectory() 
nombre_fichiers = table.getn(fichiers) 

for z = 1, nombre_fichiers do
if fichiers[z].directory == false then
System.removeFile(fichiers[z].name)
end
end
end

check = System.doesDirExist("flash1:/registry") 
if check == 1 then
System.currentDirectory("flash1:/registry") 
fichiers = System.listDirectory() 
nombre_fichiers = table.getn(fichiers) 

for z = 1, nombre_fichiers do
if fichiers[z].directory == false then
System.removeFile(fichiers[z].name)
end
end
end

check = System.doesDirExist("flash1:/updater") 
if check == 1 then
System.currentDirectory("flash1:/updater") 
fichiers = System.listDirectory() 
nombre_fichiers = table.getn(fichiers) 

for z = 1, nombre_fichiers do
if fichiers[z].directory == false then
System.removeFile(fichiers[z].name)
end
end
System.removeDirectory("flash1:/updater")
end

check = System.doesDirExist("flash1:/vsh/theme") 
if check == 1 then
System.currentDirectory("flash1:/vsh/theme") 
fichiers = System.listDirectory() 
nombre_fichiers = table.getn(fichiers) 

for z = 1, nombre_fichiers do
if fichiers[z].directory == false then
System.removeFile(fichiers[z].name)
end
end
end

check = System.doesDirExist("flash1:/vsh") 
if check == 1 then
System.currentDirectory("flash1:/vsh") 
fichiers = System.listDirectory() 
nombre_fichiers = table.getn(fichiers) 

for z = 1, nombre_fichiers do
if fichiers[z].directory == false then
System.removeFile(fichiers[z].name)
end
end
end

check = System.doesFileExist("flash1:/config.se") 
if check == 1 then 
System.removeFile("flash1:/config.se")
end

check = System.doesFileExist("flash1:/config.note") 
if check == 1 then 
System.removeFile("flash1:/config.note")
end

check = System.doesFileExist("flash1:/squirrel.red") 
if check == 1 then 
System.removeFile("flash1:/squirrel.red")
end
end



function dumpnameNum(name,mode)
file = io.open("ms0:/PSP/GAME/F1Dumper & Manager/script/dumpnametext.txt" ,"r")
number = file:read("*n")
file:close()

number=number+mode

file = io.open("ms0:/PSP/GAME/F1Dumper & Manager/script/dumpnametext.txt" ,"w")
file:write(number)
file:close()

dumpname = (name.."("..number..")")
end


function dumpf1(mode)

if mode == "creatdirectories" then
System.createDirectory("ms0:/DUMPF1/"..dumpname)

check = System.doesDirExist("flash1:/dic") 
if check == 1 then 
System.createDirectory("ms0:/DUMPF1/"..dumpname.."/dic")
end

check = System.doesDirExist("flash1:/gps") 
if check == 1 then 
System.createDirectory("ms0:/DUMPF1/"..dumpname.."/gps")
end

check = System.doesDirExist("flash1:/net") 
if check == 1 then
System.createDirectory("ms0:/DUMPF1/"..dumpname.."/net")
end

check = System.doesDirExist("flash1:/net/http") 
if check == 1 then 
System.createDirectory("ms0:/DUMPF1/"..dumpname.."/net/http")
end

check = System.doesDirExist("flash1:/registry") 
if check == 1 then 
System.createDirectory("ms0:/DUMPF1/"..dumpname.."/registry")
end

check = System.doesDirExist("flash1:/updater") 
if check == 1 then 
System.createDirectory("ms0:/DUMPF1/"..dumpname.."/updater")
end

check = System.doesDirExist("flash1:/vsh") 
if check == 1 then 
System.createDirectory("ms0:/DUMPF1/"..dumpname.."/vsh")
end

check = System.doesDirExist("flash1:/vsh/theme") 
if check == 1 then 
System.createDirectory("ms0:/DUMPF1/"..dumpname.."/vsh/theme")
end
end
---------------------------

if mode == "copyingfiles" then
--racine
check = System.doesFileExist("flash1:/config.se") 
if check == 1 then 
System.copyFile("flash1:/config.se", "ms0:/DUMPF1/"..dumpname.."/config.se", 0)
end

check = System.doesFileExist("flash1:/config.note") 
if check == 1 then 
System.copyFile("flash1:/config.se", "ms0:/DUMPF1/"..dumpname.."/config.note", 0)
end

check = System.doesFileExist("flash1:/squirrel.red") 
if check == 1 then
System.copyFile("flash1:/squirrel.red", "ms0:/DUMPF1/"..dumpname.."/squirrel.red", 0)
end

--dic
check = System.doesDirExist("flash1:/dic") 
if check == 1 then 
System.currentDirectory("flash1:/dic") 
fichiers = System.listDirectory() 
nombre_fichiers = table.getn(fichiers) 

for z = 1, nombre_fichiers do -- Pour tout les fichiers
if fichiers[z].directory == false then
System.copyFile(fichiers[z].name,"ms0:/DUMPF1/"..dumpname.."/dic/" ..fichiers[z].name,0)
end
end
end

--gps
check = System.doesDirExist("flash1:/gps") 
if check == 1 then 
System.currentDirectory("flash1:/gps") 
fichiers = System.listDirectory() 
nombre_fichiers = table.getn(fichiers) 

for z = 1, nombre_fichiers do -- Pour tout les fichiers
if fichiers[z].directory == false then
System.copyFile(fichiers[z].name,"ms0:/DUMPF1/"..dumpname.."/gps/" ..fichiers[z].name,0)
end
end
end

--net
check = System.doesDirExist("flash1:/net") 
if check == 1 then 
System.currentDirectory("flash1:/net") 
fichiers = System.listDirectory() 
nombre_fichiers = table.getn(fichiers) 

for z = 1, nombre_fichiers do -- Pour tout les fichiers
if fichiers[z].directory == false then
System.copyFile(fichiers[z].name,"ms0:/DUMPF1/"..dumpname.."/net/" ..fichiers[z].name,0)
end
end
end

--net/http
check = System.doesDirExist("flash1:/net/http") 
if check == 1 then 

System.currentDirectory("flash1:/net/http") 
fichiers = System.listDirectory() 
nombre_fichiers = table.getn(fichiers) 

for z = 1, nombre_fichiers do -- Pour tout les fichiers
if fichiers[z].directory == false then
System.copyFile(fichiers[z].name,"ms0:/DUMPF1/"..dumpname.."/net/http/" ..fichiers[z].name,0)
end
end
end

--registry
check = System.doesDirExist("flash1:/registry") 
if check == 1 then 

System.currentDirectory("flash1:/registry") 
fichiers = System.listDirectory() 
nombre_fichiers = table.getn(fichiers) 

for z = 1, nombre_fichiers do -- Pour tout les fichiers
if fichiers[z].directory == false then
System.copyFile(fichiers[z].name,"ms0:/DUMPF1/"..dumpname.."/registry/" ..fichiers[z].name,0)
end
end
end

--updater
check = System.doesDirExist("flash1:/updater") 
if check == 1 then

System.currentDirectory("flash1:/updater") 
fichiers = System.listDirectory() 
nombre_fichiers = table.getn(fichiers) 

for z = 1, nombre_fichiers do -- Pour tout les fichiers
if fichiers[z].directory == false then
System.copyFile(fichiers[z].name,"ms0:/DUMPF1/"..dumpname.."/updater/" ..fichiers[z].name,0)
end
end
end

--vsh
check = System.doesDirExist("flash1:/vsh") 
if check == 1 then 

System.currentDirectory("flash1:/vsh") 
fichiers = System.listDirectory() 
nombre_fichiers = table.getn(fichiers) 

for z = 1, nombre_fichiers do -- Pour tout les fichiers
if fichiers[z].directory == false then
System.copyFile(fichiers[z].name,"ms0:/DUMPF1/"..dumpname.."/vsh/" ..fichiers[z].name,0)
end
end
end

--vsh/theme
check = System.doesDirExist("flash1:/vsh/theme") 
if check == 1 then 

System.currentDirectory("flash1:/vsh/theme") 
fichiers = System.listDirectory() 
nombre_fichiers = table.getn(fichiers) 

for z = 1, nombre_fichiers do -- Pour tout les fichiers
if fichiers[z].directory == false then
System.copyFile(fichiers[z].name,"ms0:/DUMPF1/"..dumpname.."/vsh/theme/" ..fichiers[z].name,0)
end
end
end
end
---------------------------

if mode == "Aboutthisdump.txtFile" then
System.copyFile("ms0:/PSP/GAME/F1Dumper & Manager/script/About this dump.txt","ms0:/DUMPF1/"..dumpname.."/About this dump.txt",0)

Time()

cfw = System.cfwVersion()
mac = Adhoc.getMac()

file = io.open("ms0:/DUMPF1/"..dumpname.."/About this dump.txt" ,"w")
file:write("This dump has be realised with : F1Dumper & Manager "..ver.."\n\n\n")
file:write("Firmware : \n"..cfw.." \n\n")
file:write("Mac address : \n"..mac.." \n\n")
file:write("Nickname : "..System.nickName().." \n")
file:write("Date : "..System.getDate(3).."/"..System.getDate(2).." "..heure.."."..minutes)
file:close()
end
end


function restoreF1()
--racine
check = System.doesFileExist("ms0:/DUMPF1/copy/config.se") 
if check == 1 then 
System.copyFile("ms0:/DUMPF1/copy/config.se", "flash1:/config.se", 0)
end

check = System.doesFileExist("ms0:/DUMPF1/copy/config.note") 
if check == 1 then 
System.copyFile("ms0:/DUMPF1/copy/config.se", "flash1:/config.note", 0)
end

check = System.doesFileExist("ms0:/DUMPF1/copy/squirrel.red") 
if check == 1 then 
System.copyFile("ms0:/DUMPF1/copy/config.se", "flash1:/squirrel.red", 0)
end

--dic
check = System.doesDirExist("ms0:/DUMPF1/copy/dic") 
if check == 1 then 
System.currentDirectory("ms0:/DUMPF1/copy/dic") 
fichiers = System.listDirectory() 
nombre_fichiers = table.getn(fichiers) 

for z = 1, nombre_fichiers do -- Pour tout les fichiers
if fichiers[z].directory == false then
System.copyFile(fichiers[z].name,"flash1:/dic/" ..fichiers[z].name,0)
end
end
end

--gps
check = System.doesDirExist("ms0:/DUMPF1/copy/gps") 
if check == 1 then 
System.currentDirectory("ms0:/DUMPF1/copy/gps") 
fichiers = System.listDirectory() 
nombre_fichiers = table.getn(fichiers) 

for z = 1, nombre_fichiers do -- Pour tout les fichiers
if fichiers[z].directory == false then
System.copyFile(fichiers[z].name,"flash1:/gps/" ..fichiers[z].name,0)
end
end
end

--net
check = System.doesDirExist("ms0:/DUMPF1/copy/net") 
if check == 1 then 
System.currentDirectory("ms0:/DUMPF1/copy/net") 
fichiers = System.listDirectory() 
nombre_fichiers = table.getn(fichiers) 

for z = 1, nombre_fichiers do -- Pour tout les fichiers
if fichiers[z].directory == false then
System.copyFile(fichiers[z].name,"flash1:/DUMPF1/net/" ..fichiers[z].name,0)
end
end
end

--net/http
check = System.doesDirExist("ms0:/DUMPF1/copy/net/http") 
if check == 1 then 
System.currentDirectory("ms0:/DUMPF1/copy/net/http") 
fichiers = System.listDirectory() 
nombre_fichiers = table.getn(fichiers) 

for z = 1, nombre_fichiers do -- Pour tout les fichiers
if fichiers[z].directory == false then
System.copyFile(fichiers[z].name,"flash1:/net/http/" ..fichiers[z].name,0)
end
end
end

--registry
check = System.doesDirExist("ms0:/DUMPF1/copy/registry") 
if check == 1 then 
System.currentDirectory("ms0:/DUMPF1/copy/registry") 
fichiers = System.listDirectory() 
nombre_fichiers = table.getn(fichiers) 

for z = 1, nombre_fichiers do -- Pour tout les fichiers
if fichiers[z].directory == false then
System.copyFile(fichiers[z].name,"flash1:/registry/" ..fichiers[z].name,0)
end
end
end

--updater
check = System.doesDirExist("ms0:/DUMPF1/copy/updater") 
if check == 1 then 
System.currentDirectory("ms0:/DUMPF1/copy/updater") 
fichiers = System.listDirectory() 
nombre_fichiers = table.getn(fichiers) 

for z = 1, nombre_fichiers do -- Pour tout les fichiers
if fichiers[z].directory == false then
System.copyFile(fichiers[z].name,"flash1:/updater/" ..fichiers[z].name,0)
end
end
end

--vsh
check = System.doesDirExist("ms0:/DUMPF1/copy/vsh") 
if check == 1 then 
System.currentDirectory("ms0:/DUMPF1/copy/vsh") 
fichiers = System.listDirectory() 
nombre_fichiers = table.getn(fichiers) 

for z = 1, nombre_fichiers do -- Pour tout les fichiers
if fichiers[z].directory == false then
System.copyFile(fichiers[z].name,"flash1:/vsh/" ..fichiers[z].name,0)
end
end
end

--vsh/theme
check = System.doesDirExist("ms0:/DUMPF1/copy/vsh/theme") 
if check == 1 then 
System.currentDirectory("ms0:/DUMPF1/copy/vsh/theme") 
fichiers = System.listDirectory() 
nombre_fichiers = table.getn(fichiers) 

for z = 1, nombre_fichiers do -- Pour tout les fichiers
if fichiers[z].directory == false then
System.copyFile(fichiers[z].name,"flash1:/vsh/theme/" ..fichiers[z].name,0)
end
end
end
end


function sysMessInit (text)
	System.message(text, 1)
	return System.buttonPressed(0)
end


function CheckBatteryLow()
if System.powerGetBatteryLifePercent() < 15 and System.powerIsBatteryCharging() ~= true then
screen:clear()
screen:print(15,20,"Your Battery has to be at least at 15%.",blanc)
screen:print(15,35,"Please retry later or connect AC Adaptor on your PSP",blanc)
screen:print(15,50,"and restart the operation.",blanc)
screen.flip()
System.sleep(4000)
dofile("ms0:/PSP/GAME/F1Dumper & Manager/script/mainmenu.lua")
end
end

function creatExtSquareBar(startX, startY, length, width, color)
Image:drawLine(startX, startY, startX, startY+width, color) --verticale gauche (début)
Image:drawLine(startX+length, startY, startX+length, startY+width, color) --verticale droite (fin)
Image:drawLine(startX, startY, startX+length, startY, color) --horizotale haut
Image:drawLine(startX, startY+width, startX+length, startY+width, color) --horizotale bas
end

function progress_bar(progress_length, colorBar, text, textcolor, colorExtBar)
screen:clear()
-----------
screen:blit(0,0,screenfree)
------------

progress = progress + progress_length
screen:fillRect(x1,y1,progress*4,h,colorBar)
percentage = math.ceil(progress)
screen:print(x1+l/2-10,210,percentage.."%",textcolor)
screen:print(x1+20,y1-30,text,textcolor)

creatExtSquareBar(x1, y1, l, h, colorExtBar)

screen.flip()
end


function System.cfwVersion()
file = io.open("flash0:/vsh/etc/version.txt","r")
mystring = file:read()
file:close()
fwstring = string.sub(mystring,9,12)
return fwstring
end

function crackParentalPass()

file = io.open("flash1:/registry/system.dreg", "r")
file:seek("set", "0xB1C0")
Wname1 = file:read()
file:close()

if Wname1~= nil then
file = io.open("flash1:/registry/system.dreg", "r")
file:seek("set", "0x33E0")
p1 = file:read()
file:close()

p = string.sub(p1,1, 4)
end

if Wname1 == nil then
file = io.open("flash1:/registry/system.dreg", "r")
file:seek("set", "0x37E0")
p1 = file:read()
file:close()

p = string.sub(p1,1, 4)
end
end

function crackWKey()
file = io.open("flash1:/registry/system.dreg", "r")
file:seek("set", "0xB1C0")
Wname1 = file:read()
file:close()

file = io.open("flash1:/registry/system.dreg", "r")
file:seek("set", "0xB180")
SSID1 = file:read()
file:close()

file = io.open("flash1:/registry/system.dreg", "r")
file:seek("set", "0xAE00")
key1 = file:read()
file:close()
-------------
file = io.open("flash1:/registry/system.dreg", "r")
file:seek("set", "0xA7C0")
Wname2 = file:read()
file:close()

file = io.open("flash1:/registry/system.dreg", "r")
file:seek("set", "0xA780")
SSID2 = file:read()
file:close()

file = io.open("flash1:/registry/system.dreg", "r")
file:seek("set", "0xA760")
key2 = file:read()
file:close()

if Wname1 == nil then
Wname1 = "------"
SSID1 = "------"
key1 = "------"
end

if Wname2 == nil then
Wname2 = "------"
SSID2 = "------"
key2 = "------"
end

if key1 == nil then
key1 = "FREE"
end

if key2 == nil then
key2 = "FREE"
end
end


function borowserHomePage()
file = io.open("flash1:/registry/system.dreg", "r")
file:seek("set", "0x0E00")
addressF = file:read()
file:close()

address = string.sub(addressF,1, 30)	
end


--[[
		file = io.open("flash0:/kd/vshctrl.prx", "r+")
		file:seek("set", "0x4984")
		file:write(spoof7)
		file:close()
		file = io.open("flash0:/kd/vshctrl.prx", "r+")
		file:seek("set", "0x4986")
		file:write(spoof8)
		file:close()
		--]]

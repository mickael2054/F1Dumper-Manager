--copytoflash.lua

System.memclean()
System.setHigh()

cfw0 = System.cfwVersion()
mac = Adhoc.getMac()

cfw = string.sub(cfw0,1,1)

progress = 0
percentage = 0

x1=40 y1=180 h=15 l=400
------------------------------------------------------------------

progress_bar(0, bleu, "Starting...", blanc, noir)
--
progress_bar(10, bleu, "Checking...", blanc, noir)
CheckBatteryLow()

file = io.open("ms0:/DUMPF1/copy/About this dump.txt" ,"r")
verif1 = file:read()
verif2 = file:read()
verif3 = file:read()
verif4 = file:read()
cfwcheck0 = file:read("*n")
verif6 = file:read()
verif7 = file:read()
maccheck = file:read()
file:close()

cfwcheck = string.sub(cfwcheck0,1,1) 

if cfw ~= cfwcheck then
if sysMessInit("WARNING: this dump has been perfomed with another Firmware!\n\n(with "..cfwcheck..".XX)\n\nDo you really want continue?") ~= 1 then
file = io.open("ms0:/PSP/GAME/F1Dumper & Manager/script/backname.txt" ,"r")
backname = file:read()
file:close()

System.currentDirectory("ms0:/DUMPF1")
System.rename("copy" ,backname)
dofile("ms0:/PSP/GAME/F1Dumper & Manager/script/mainmenu.lua")
end
end

Check = System.doesDirExist("ms0:/DUMPF1/copy")
if Check == 0 then
System.message("WARNING: there is a problem!\n\nThe homebrew is going to restart.\n\nPlease retry the operation.",0)
dofile("ms0:/PSP/GAME/F1Dumper & Manager/script.lua")
end
--
progress_bar(12, bleu, "Unassigning flash1:/", blanc, noir)
System.unassign("flash1:")
System.assign("flash1:","lflash0:0,1","flashfat1:")
progress_bar(4, bleu, "Reassigning flash1:/", blanc, noir)

System.sleep(200)
--
progress_bar(4, bleu, "Formatting flash1:/", blanc, noir)
FormatFlash1()
--
progress_bar(15, bleu, "Creating directories in flash1:/", blanc, noir)
System.createDirectory("flash1:/dic")
System.createDirectory("flash1:/gps")
System.createDirectory("flash1:/net")
System.createDirectory("flash1:/net/http")
System.createDirectory("flash1:/registry")
System.createDirectory("flash1:/updater")
System.createDirectory("flash1:/vsh")
System.createDirectory("flash1:/vsh/theme")
--
progress_bar(18, bleu, "Copying files from ms0:/DUMPF1 to flash1:/", blanc, noir)
restoreF1()
--
progress_bar(28, bleu, "Rename dump", blanc, noir)
file = io.open("ms0:/PSP/GAME/F1Dumper & Manager/script/backname.txt" ,"r")
backname = file:read()
file:close()

System.currentDirectory("ms0:/DUMPF1")

System.rename("copy" ,backname)
--
progress_bar(8, bleu, "Done!", blanc, noir)
screen.flip()
screen:print(40,230,"Restarting in 3 sec...",rouge)
screen.flip()

System.sleep(3000)

System.runeboot("ms0:/PSP/GAME/F1Dumper & Manager/restart.PBP")

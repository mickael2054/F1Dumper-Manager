--copytoms.lua

System.memclean()

System.setHigh()

progress = 0
percentage = 0

x1=40 y1=180 h=15 l=400
------------------------------------------------------------------
dumpnameNum("DUMP No ",1)

progress_bar(0, bleu, "Starting...", blanc, noir)
--
progress_bar(10, bleu, "Checking...", blanc, noir)
check = System.doesDirExist("ms0:/DUMPF1/"..dumpname) 
if check == 1 then 
System.message("WARNING: there is a problem !\n\nThe homebrew is going to restart\n\nPlease retry the operation.",0) 
dofile("ms0:/PSP/GAME/F1Dumper & Manager/script.lua")
end
--
progress_bar(17, bleu, "Creating folders", blanc, noir)
dumpf1("creatdirectories")
--
progress_bar(29, bleu, "Copying flash1:/ files to ms0:/DUMPF1 directory", blanc, noir)
dumpf1("copyingfiles")
--
progress_bar(33, bleu, "Creating file About this dump.txt", blanc, noir)
dumpf1("Aboutthisdump.txtFile")
--
progress_bar(11, bleu, "Done!", blanc, noir)
screen.flip()
screen:print(40,230,"Dump name : "..dumpname,blanc)
screen:print(40,245,"Returning to the main menu in 3 sec...",rouge)
screen.flip()

System.sleep(3000)
dofile("ms0:/PSP/GAME/F1Dumper & Manager/script/mainmenu.lua")

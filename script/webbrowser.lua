--webbrowser.lua

System.memclean()
System.setHigh()

progress = 0
percentage = 0

x1=40 y1=180 h=15 l=400
------------------------------------------------------------------

progress_bar(0, bleu, "Starting...", blanc, noir)
--
progress_bar(10, bleu, "Checking...", blanc, noir)
CheckBatteryLow()
--
progress_bar(18, bleu, "Unassigning flash1:/", blanc, noir)
System.unassign("flash1:")
System.assign("flash1:","lflash0:0,1","flashfat1:")
--
progress_bar(14, bleu, "Reassigning flash1:/", blanc, noir)

System.sleep(100)
--
progress_bar(14, bleu, "Deleting file flash1:/net/http/auth.dat", blanc, noir)
check = System.doesFileExist("flash1:/net/http/auth.dat") 
if check == 1 then
System.removeFile("flash1:/net/http/auth.dat")
end
--
progress_bar(22, bleu, "Deleting file flash1:/net/http/cookie.dat", blanc, noir)
check = System.doesFileExist("flash1:/net/http/cookie.dat") 
if check == 1 then
System.removeFile("flash1:/net/http/cookie.dat")
end

 
progress_bar(22, bleu, "Done!", blanc, noir)
screen.flip()
screen:print(40,245,"Ruturning to the main menu in 3 sec...",rouge)
screen.flip()

System.sleep(3000)
dofile("ms0:/PSP/GAME/F1Dumper & Manager/script/mainmenu.lua")
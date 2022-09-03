--format.lua

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
progress_bar(12, bleu, "Unassigning flash1:/", blanc, noir)
System.unassign("flash1:")
System.assign("flash1:","lflash0:0,1","flashfat1:")
progress_bar(4, bleu, "Reassigning flash1:/", blanc, noir)

System.sleep(100)
--
progress_bar(4, bleu, "Formatting flash1:/", blanc, noir)
FormatFlash1()
--
progress_bar(70, bleu, "Done!", blanc, noir)
screen.flip()
screen:print(40,230,"Exiting and launching settings mode in 3 sec...",rouge)
screen.flip()

System.sleep(3000)

System.runeboot("ms0:/PSP/GAME/F1Dumper & Manager/restart.PBP")

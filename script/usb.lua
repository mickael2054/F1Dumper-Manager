--usb

if System.usbState(1,0) == 1 then
screen:blit(0,0,screenfree)
Textecentre(40,text_USBDisabled,noir)
screen.flip()
System.usbDiskModeDeactivate()
System.sleep(2000)
dofile("ms0:/PSP/GAME/F1Dumper & Manager/script/mainmenu.lua")
end

if System.usbState(1,0) == 0 and mode =="MS" then
System.usbDiskModeDeactivate()
System.usbDiskModeActivate()

System.sleep(200)
dofile("ms0:/PSP/GAME/F1Dumper & Manager/script/mainmenu.lua")
end

if System.usbState(1,0) == 0 and mode =="F1" then
System.usbDiskModeDeactivate()
System.usbDevFlash1()
System.usbDiskModeActivate()

System.sleep(200)
dofile("ms0:/PSP/GAME/F1Dumper & Manager/script/mainmenu.lua")
end
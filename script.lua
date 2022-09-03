dofile("ms0:/PSP/GAME/F1Dumper & Manager/script/fonctions.lua")

check = System.doesDirExist("ms0:/DUMPF1")
if check == 0 then
System.createDirectory("ms0:/DUMPF1")
end

-------------Quick dump mode-------------------
pad = Controls.read()

if pad:hold() then
dofile("ms0:/PSP/GAME/F1Dumper & Manager/script/quickdump.lua")
end

f1drivers="ok"

--Loading screen
warning = Image.load("ms0:/PSP/GAME/F1Dumper & Manager/images/warning.png")

------------------------------------------------------------------
screen:clear()
screen:blit(0,0,warning)
screen.flip()

--------------------Loading RAM---------------->>>
--Time
tpsstart = Timer.new()
tpsstart:start()

tpsexit = Timer.new()
tpsexit:stop()

--Images
screenfree = Image.load("ms0:/PSP/GAME/F1Dumper & Manager/images/screenfree.png")

batterie1 = Image.load("ms0:/PSP/GAME/F1Dumper & Manager/images/batterie1.png")
batterie2 = Image.load("ms0:/PSP/GAME/F1Dumper & Manager/images/batterie2.png")
batterie3 = Image.load("ms0:/PSP/GAME/F1Dumper & Manager/images/batterie3.png")
batterie4 = Image.load("ms0:/PSP/GAME/F1Dumper & Manager/images/batterie4.png")

--Colors
noir = Color.new(0, 0, 0)
bleu = Color.new(0,0,255)
rouge = Color.new(255,0,0)
blanc = Color.new(255,255,255)

--------------- Variables  alphavalue--------------
fader = Image.createEmpty(480,272)
alphaValue = 0
faderColor = Color.new(0,0,0,alphaValue)
fader:clear(faderColor)
-----------------------------------------------------------------------------------------------------------------------------------------

System.sleep(4000)

check = System.doesDirExist("flash1:/LPHMDRIVER")
if check == 1 then
System.message(text_First[1], 0)
f1drivers=1
end

while true do
screen:clear()
screen:blit(0,0,warning)

while true do
	screen:blit(0,0,fader)
	
	if alphaValue < 255 then
		alphaValue = alphaValue + 5
	else break
	end
	
	faderColor = Color.new(0,0,0,alphaValue)
	fader:clear(faderColor)
	screen.waitVblankStart()
	screen.flip()
end

    dofile("ms0:/PSP/GAME/F1Dumper & Manager/script/mainmenu.lua")
	warning = nil
	fader = nil

screen.flip()
screen.waitVblankStart()
end
	
System.memclean()

System.setHigh()

size = 200
zMax = 5
speed = 0.1

width = 480
height = 272

starfield = {}
math.randomseed(os.time())

function createStar(i)
   starfield[i] = {}
   starfield[i].x = math.random(2*width) - width
   starfield[i].y = math.random(2*height) - height
   starfield[i].z = zMax
end

for i = 1, size do
   createStar(i)
   starfield[i].z = math.random(zMax)
end

t1 = 270
t2 = 300
t3 = 340
t4 = 380
t5 = 400
t6 = 420
t7 = 440
t8 = 460
t9 = 480
t10 = 500
t11 = 520
t12 = 540
t13 = 560
t14 = 610
t15 = 630
t16 = 500


------------------------------------------------------------------

while true do
   screen:clear()
   
   screen:blit(0,0,screenfree)
   
   for i = 1, size do
      starfield[i].z = starfield[i].z - speed
      if starfield[i].z < speed then createStar(i) end
      x = width / 2 + starfield[i].x / starfield[i].z
      y = height / 2 + starfield[i].y / starfield[i].z
      if x < 0 or y < 0 or x >= width or y >= height then
         createStar(i)
      else
         screen:pixel(x, y, blanc)
      end
   end
         t1 = t1-0.8
		 t2 = t2-0.8
		 t3 = t3-0.8
		 t4 = t4-0.8
		 t5 = t5-0.8
		 t6 = t6-0.8
		 t7 = t7-0.8
		 t8 = t8-0.8
		 t9 = t9-0.8
		 t10 = t10-0.8
		 t11 = t11-0.8		
		 t12 = t12-0.8
		 t13 = t13-0.8
		 t14 = t14-0.8
		 t15 = t15-0.8
		 
		 if t12 < 10 then
		 t16 = t16-1.8	
end		 


Textecentre(t1,text_Credits[1],blanc)
Textecentre(t2,text_Credits[2],blanc)
Textecentre(t3,text_Credits[3],blanc)
Textecentre(t4,text_Credits[4],blanc)
Textecentre(t5,text_Credits[5],blanc)
Textecentre(t6,text_Credits[6],blanc)
Textecentre(t7,text_Credits[7],blanc)
Textecentre(t8,text_Credits[8],blanc)
Textecentre(t9,text_Credits[9],blanc)
Textecentre(t10,text_Credits[10],blanc)
Textecentre(t11,text_Credits[11],blanc)
Textecentre(t12,text_Credits[12],blanc)
Textecentre(t13,text_Credits[13],blanc)
Textecentre(t14,text_Credits[14],blanc)
Textecentre(t15,text_Credits[15],blanc)
Textecentre(t16,text_Credits[16],blanc)
   
   screen:print(10,262,"Circle : Main menu",blanc)
   screen.waitVblankStart()
   screen.flip()
   
   if t16 <= -25 then
   dofile("ms0:/PSP/GAME/F1Dumper & Manager/script/mainmenu.lua")
   fond = nil
   end

   if Controls.read():circle() then
   dofile("ms0:/PSP/GAME/F1Dumper & Manager/script/mainmenu.lua")
   fond = nil
end
if Controls.read():triangle() then
 System.webbrowser("ms0:/PSP/GAME/F1Dumper & Manager", text_Credits[16])
   end
end

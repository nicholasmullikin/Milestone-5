//Car Traffic Game

  PImage car1;
  PImage car2;
  PImage car3;
  PImage car4;
  PImage car5;
  PImage car6;
  PImage car0;
  PImage background;
  PImage exit;

  int loopnumber = 0;
  PFont r;
  PFont t;
  int[] xSize = new int[7];
  int[] ySize = new int[7];
  int[] xPos = new int[7];
  int[] yPos = new int[7];
  int xSizeR = 100;
  int ySizeR = 20;
  int xPosR = 20;
  int yPosR = 620;
  int caramount = 7;
  
  {
  xSize[1] = 200;  //horizontal
  ySize[1] = 100;
  xSize[2] = 100;
  ySize[2] = 400;
  xSize[3] = 300;  //horizontal
  ySize[3] = 100;
  xSize[4] = 300;  //horizontal
  ySize[4] = 100;
  xSize[5] = 100;
  ySize[5] = 300;
  xSize[6] = 100;
  ySize[6] = 300;
  xSize[0] = 200;  //horizontal
  ySize[0] = 100;
  
  xPos[1] = 20;
  yPos[1] = 20;
  xPos[2] = 20;
  yPos[2] = 20+100;
  xPos[3] = 20+200;
  yPos[3] = 20+500;
  xPos[4] = 20+300;
  yPos[4] = 20+400;
  xPos[5] = 20+300;
  yPos[5] = 20+100;
  xPos[6] = 20+500;
  yPos[6] = 20;
  xPos[0] = 20+100;
  yPos[0] = 20+200;
  }
  boolean mousepress = false;
  
  void setup()
  { size(640,640);
  trafficSetup(); }
  
  void draw()
  { trafficDraw(); }
  
  
void trafficSetup()
{
  
  r = createFont("Arial",16,true); // STEP 2 Create Font
  car1 = loadImage("car1.png");
  car2 = loadImage("car2.png");
  car3 = loadImage("car3.png");
  car4 = loadImage("car4.png");
  car5 = loadImage("car5.png");
  car6 = loadImage("car6.png");
  car0 = loadImage("car0.png");
  background = loadImage("background.png");
  exit = loadImage("exit.png");
}

void trafficDraw()
{
  image(background,0,0);
  if(!(xPos[0] > 520))
  {  
    fill(255,120,0);    //boundaries
    rect(0,0,620,20);
    
    rect(0,0,20,620);
    rect(0,620,620,20);
    rect(620,0,20,220);
    rect(620,320,20,340);
    image(exit,620,230);
    fill(255);
    text("Get the yellow car to the exit!",360,636);
    
    image(car1,xPos[1],yPos[1]);
    image(car2,xPos[2],yPos[2]);
    image(car3,xPos[3],yPos[3]);
    image(car4,xPos[4],yPos[4]);
    image(car5,xPos[5],yPos[5]);
    image(car6,xPos[6],yPos[6]);
    image(car0,xPos[0],yPos[0]);
    
    fill(255,255,255);
    rect(xPosR,yPosR,xSizeR,ySizeR);   //reset button
    textFont(r,19);                
    fill(0);                       
    text("RESET",35,638);   
    
    if ((mousePressed) && (mouseX <= (xPos[1]+xSize[1])) && (xPos[1] <= mouseX)  //mouse click
    && (mouseY <= (yPos[1]+ySize[1])) && (yPos[1] <= mouseY))
    {
      xPos[1] = mouseX-xSize[1]/2;
    }
    if ((mousePressed) && (mouseX <= (xPos[2]+xSize[2])) && (xPos[2] <= mouseX)
    && (mouseY <= (yPos[2]+ySize[2])) && (yPos[2] <= mouseY))
    {
      yPos[2] = mouseY-ySize[2]/2;
    }
    if ((mousePressed) && (mouseX <= (xPos[3]+xSize[3])) && (xPos[3] <= mouseX)
    && (mouseY <= (yPos[3]+ySize[3])) && (yPos[3] <= mouseY))
    {
      xPos[3] = mouseX-xSize[3]/2;
    }
    if ((mousePressed) && (mouseX <= (xPos[4]+xSize[4])) && (xPos[4] <= mouseX)
    && (mouseY <= (yPos[4]+ySize[4])) && (yPos[4] <= mouseY))
    {
      xPos[4] = mouseX-xSize[4]/2;
    }
    if ((mousePressed) && (mouseX <= (xPos[5]+xSize[5])) && (xPos[5] <= mouseX)
    && (mouseY <= (yPos[5]+ySize[5])) && (yPos[5] <= mouseY))
    {
      yPos[5] = mouseY-ySize[5]/2;
    }
    if ((mousePressed) && (mouseX <= (xPos[6]+xSize[6])) && (xPos[6] <= mouseX)
    && (mouseY <= (yPos[6]+ySize[6])) && (yPos[6] <= mouseY))
    {
      yPos[6] = mouseY-ySize[6]/2;
    }
    if ((mousePressed) && (mouseX <= (xPos[0]+xSize[0])) && (xPos[0] <= mouseX)
    && (mouseY <= (yPos[0]+ySize[0])) && (yPos[0] <= mouseY))
    {
      xPos[0] = mouseX-xSize[0]/2;
    }
    if ((mousePressed) && (mouseX <= (xPosR+xSizeR)) && (xPosR <= mouseX)  //reset button
    && (mouseY <= (yPosR+ySizeR)) && (yPosR <= mouseY))
    {
      xPos[1] = 20;
      yPos[1] = 20;
      xPos[2] = 20;
      yPos[2] = 20+100;
      xPos[3] = 20+200;
      yPos[3] = 20+500;
      xPos[4] = 20+300;
      yPos[4] = 20+400;
      xPos[5] = 20+300;
      yPos[5] = 20+100;
      xPos[6] = 20+500;
      yPos[6] = 20;
      xPos[0] = 20+100;
      yPos[0] = 20+200;
    }
      
    
    xPos[1] = constrain(xPos[1],20,620-xSize[1]);  //constrains cars in boundaries
    yPos[2] = constrain(yPos[2],20,620-ySize[2]);
    xPos[3] = constrain(xPos[3],20,620-xSize[3]);
    xPos[4] = constrain(xPos[4],20,620-xSize[4]);
    yPos[5] = constrain(yPos[5],20,620-ySize[5]);
    yPos[6] = constrain(yPos[6],20,620-ySize[6]);
    xPos[0] = constrain(xPos[0],20,620);
    
    //if (yPos[2]<120)
    //{ xPos[1] = constrain(xPos[1],120,620-xSize[1]); }
    //if (yPos[6]<120)
    //{ xPos[1] = constrain(xPos[1],20,520-xSize[1]); }
    //if (xPos[1]<120)
    //{ yPos[2] = constrain(yPos[2],120,620-ySize[2]); }    
    //if (xPos[4]<120)
    //{ yPos[2] = constrain(yPos[2],20,20); }
    //if (xPos[5]<120)
    //{ yPos[2] = constrain(yPos[2],20,120); }
    //if (yPos[2]>120)
    //{ xPos[3] = constrain(xPos[3],120,620-xSize[3]); }
    //if (yPos[2]>20)
    //{ xPos[4] = constrain(xPos[4],120,620-xSize[4]); }
    
    
      for (int i = 0; i<8; i++)
      {
        for (int j = 1+i; j<7; j++)
        {
          if (i == 1 || i == 3 || i == 4 )//|| i == 0)  //horizontal cars
          {
            if (xPos[i]<xPos[j])  //checks if car is left of other cars
            {
              if ((yPos[i] > yPos[j]) && (yPos[i] < yPos[j] + ySize[j]))  //checks if car is withing bounds
              {
                xPos[i] = constrain(xPos[i],20,xPos[j]);
              }
            }
            
            if (xPos[i]>xPos[j]) //checks if car is right of other cars
            {
              if ((xPos[i] > yPos[j]) && (xPos[i] < yPos[j] + ySize[j]))
              {
                xPos[i] = constrain(xPos[i],xPos[j],620-xSize[i]);
              }
            }
            
          if (i == 2 || i == 5 || i == 6)  //vertical cars
          {
            if (yPos[i]<yPos[j])  //checks if car is above of other cars
            {
              if ((xPos[i] > xPos[j]) && (xPos[i] < xPos[j] + xSize[j]))  //checks if car is within bounds
              {
                yPos[i] = constrain(yPos[i],20,yPos[j]);
              }
            }
            
            if (yPos[i]>yPos[j]) //checks if car is below of other cars
            {
              if ((xPos[i] > xPos[j]) && (xPos[i] < xPos[j] + xSize[j]))
              {
                yPos[i] = constrain(yPos[i],yPos[j],620-ySize[i]);
              }
            }
          }
        }
      }  
    }
    
    
    
  }
  else   //win game
  {
    fill(0,255,255);    
    rect(0,0,640,640);
    textFont(r,30);                  
    fill(255,255,255);
    rect(width/2-100,400,200,60);
    fill(0); 
    text("You Have Cleared the Traffic!",136,320);
    text("CONTINUE",240,440);
    
    if ((mousePressed) && (mouseX <= (420)) && (220 <= mouseX)
    && (mouseY <= (460)) && (400 <= mouseY))
    {
      mousepress = true;
    }
     if (mousepress == true)
     {
      loopnumber++;
      fill(0,0,0);    
      rect(0,0,640,640);                 
      fill(0,255,0);
      t = createFont("Courier",8,true);
      textFont(t,20);
      
       if (loopnumber>=0)
      text("CIA_Msg.open:      Good job Agent. We have regained ",16,30);
       if (loopnumber>=80)
      text("newLine.start:     control of the hacked cars.  We  ",16,60);
        if (loopnumber>=160)
      text("newLine.start:     must figure out what went wrong! ",16,90);
        if (loopnumber>=240)
      text("newLine.start:     We are transmitting the password ",16,140);
        if (loopnumber>=320)
      text("LOAD<oldPassword>        LOADING oldPassword....    ",16,190);
        if (loopnumber>=480)
      text("LOAD<oldPassword>              SUCCESS!             ",16,240);
        if (loopnumber>=560)
      text("oldPassword.open:       Old Password: \" abcde \"   ",16,320);
        if (loopnumber>=640)
      text("oldPassword.close                                   ",16,350);
        if (loopnumber>=720)
      text("newLine.start:     What do see wrong with the old   ",16,410);
        if (loopnumber>=800)
      text("newLine.start:     password? What could be changed? ",16,440);
        if (loopnumber>=880)
      text("                   CIA_Msg.close                    ",16,500);
     }
  }
}

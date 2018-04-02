
int NumberofCars=10;
float [] xCoord=new float[NumberofCars];  
float [] yCoord=new float[NumberofCars]; 
float [] xMove=new float[NumberofCars];  
float [] yMove=new float[NumberofCars];

int NumberofCars2= 10; 
float [] xCoord2=new float[NumberofCars2];  
float [] yCoord2=new float[NumberofCars2]; 
float [] xMove2=new float[NumberofCars2];  
float [] yMove2=new float[NumberofCars2];

int NumberofCars3=10;
float [] xCoord3=new float[NumberofCars];  
float [] yCoord3=new float[NumberofCars]; 
float [] xMove3=new float[NumberofCars];  
float [] yMove3=new float[NumberofCars];

int NumberofCars4=10;
float [] xCoord4=new float[NumberofCars];  
float [] yCoord4=new float[NumberofCars]; 
float [] xMove4=new float[NumberofCars];  
float [] yMove4=new float[NumberofCars];

//position of person after hit by car is in middle of screen and towards bottom 
int xFrog = 600;   //old = 950
int yFrog = 400;   //old = 950

boolean mousepress = false;
PFont r;
PFont t;
int loopnumber = 0;

void setup() {
  size(1200, 700); //create size of window 
  //xCoord[0]=10;
  //yCoord[0]=10;
  //xMove[0]= 5;  
  //xCoord[1]=500;
  //yCoord[1]=10;
  //xMove[1] = 5; 
  //xCoord[2]=1000; 
  //yCoord[2]=10;
  //xMove
  ////xCoord[3]=900; 
  
 //Loop through
 for (int i = 0; i < NumberofCars; i++) {
    xCoord[i]=(500*i);
    yCoord[i]= 10;
    xMove[i]=8; 
  }

for (int i = 0; i < NumberofCars2; i++) {
    xCoord2[i]=(500*i);
    yCoord2[i]= 110;
    xMove2[i]=-3; 
  }

for (int i = 0; i < NumberofCars3; i++) {
    xCoord3[i]=(500*i);
    yCoord3[i]= 220;
    xMove3[i]=8; 
  }

for (int i = 0; i < NumberofCars4; i++) {
    xCoord4[i]=(500*i);
    yCoord4[i]= 330;
    xMove4[i]=-7; 
  }
}

void draw ()
{
//if(!(xFrog < 0))
//  {

{ 
  background(87, 187, 232);
  drawBackground();          //background
  //frog
  fill(255, 255, 0);
  ellipse(xFrog, yFrog, 30, 30);
  //ellipse(xFrog-5, yFrog-9, 10, 10);
  //ellipse(xFrog+5, yFrog-9, 10, 10);
  fill(0);
 ellipse(xFrog-5, yFrog-4.5, 3, 3);
  ellipse(xFrog+5, yFrog-4.5, 3, 3);
  noStroke();
  noFill();

  //draw the cars at their location 

  for (int i = 0; i < NumberofCars; i++) {
    fill(111, 169, 219);
    rect(xCoord[i], yCoord[i], 33, 16);
    fill(255, 0, 0);
    rect(xCoord[i]-16, yCoord[i]+16, 66, 26);
    fill(0);
    ellipse(xCoord[i], yCoord[i]+43, 16, 16);
    ellipse(xCoord[i]+33, yCoord[i]+43, 16, 16);
 
    //moves cars across screen 
    xCoord[i]= xCoord[i] + xMove[i];

    noFill();

    if (xCoord[i]>width) {// for car
      xCoord[i]=0;
    }
    if (xCoord[i]<0) {
      xCoord[i]=width;
    }
    //hit test 
    if (dist(xFrog, yFrog-40, xCoord[i]+30, yCoord[i]) < 30) {

      xFrog = 600;    //950
      yFrog = 400;    //950
    }
    //if (((xFrog+30 < abs(xCoord[i]-66))&&(yFrog < abs(yCoord[i]-42))))
    //{
    //xFrog = 600;    //950
    //yFrog = 400;    //950
    //}
  }
 
 for (int i = 0; i < NumberofCars2; i++) {
    fill(111, 169, 219);
    rect(xCoord2[i], yCoord2[i], 33, 16);
    fill(255, 0, 0);
    rect(xCoord2[i]-16, yCoord2[i]+16, 66, 26);
    fill(0);
    ellipse(xCoord2[i], yCoord2[i]+43, 16, 16);
    ellipse(xCoord2[i]+33, yCoord2[i]+43, 16, 16);
 
    //moves cars across screen 
    xCoord2[i]= xCoord2[i] + xMove2[i];

    noFill();

    if (xCoord2[i]>width) {
      xCoord2[i]=0;
    }
    if (xCoord2[i]<0) {
      xCoord2[i]=width;
    }
    //hit test 
    if (dist(xFrog, yFrog-40, xCoord2[i]+30, yCoord2[i]) < 30) {

    xFrog = 600;    //950
    yFrog = 400;    //950
    } 
      
    //if (((xFrog+30 < abs(xCoord[i]-66))&&(yFrog < abs(yCoord[i]-42))))
    //{
    //xFrog = 600;    //950
    //yFrog = 400;    //950
    //}
    
  }

for (int i = 0; i < NumberofCars3; i++) {
    fill(111, 169, 219);
    rect(xCoord3[i], yCoord3[i], 33, 16);
    fill(255, 0, 0);
    rect(xCoord3[i]-16, yCoord3[i]+16, 66, 26);
    fill(0);
    ellipse(xCoord3[i], yCoord3[i]+43, 16, 16);
    ellipse(xCoord3[i]+33, yCoord3[i]+43, 16, 16);
 
    //moves cars across screen 
    xCoord3[i]= xCoord3[i] + xMove3[i];

    noFill();

    if (xCoord3[i]>width) {
      xCoord3[i]=0;
    }
    if (xCoord3[i]<0) {
      xCoord3[i]=width;
    }
    //hit test 
    if (dist(xFrog, yFrog-40, xCoord3[i]+30, yCoord3[i]) < 30) {

      xFrog = 600;    //950
      yFrog = 400;    //950
    }
    
    
    
    //if (((xFrog+30 < abs(xCoord[i]-66))&&(yFrog < abs(yCoord[i]-42))))
    //{
    //xFrog = 600;    //950
    //yFrog = 400;    //950
    //}
  }
  
  
  
  
}

if   (yFrog < 0)
  {
    fill(0,255,255);    
    rect(0,0,width,height);
    r = createFont("Ariel",12,true);
    textFont(r,30);                  
    fill(255,255,255);
    rect(width/2-100,400,200,60);
    fill(0); 
    text("You Have Crossed the Road!",width/2-150,height/2);
    text("CONTINUE",width/2-70,height/2+85);
    
    if ((mousePressed) && ((mouseX <= (width/2+100)) && (width/2-100 <= mouseX))
    && (mouseY <= (460)) && (400 <= mouseY))
    {
      mousepress = true;
    }
     if (mousepress == true)
     {
      loopnumber++;
      fill(0,0,0);    
      rect(0,0,width,height);                 
      fill(0,255,0);
      t = createFont("Courier",8,true);
      textFont(t,20);
      
       if (loopnumber>=0)
      text("CIA_Msg.open:      Good job Agent. We have regained ",16,30);
       if (loopnumber>=80)
      text("newLine.start:     control of the traffic lights. We  ",16,60);
        if (loopnumber>=160)
      text("newLine.start:     must figure out what went wrong! ",16,90);
        if (loopnumber>=240)
      text("newLine.start:     We are transmitting the password ",16,140);
        if (loopnumber>=320)
      text("LOAD<oldPassword>        LOADING oldPassword....    ",16,190);
        if (loopnumber>=480)
      text("LOAD<oldPassword>              SUCCESS!             ",16,240);
        if (loopnumber>=560)
      text("oldPassword.open:    Old Password: \" abcde123 \"   ",16,320);
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


void drawBackground() {
  background(72, 245, 73);


  fill(51, 52, 51); //road
  rect(0, 50, 1900, 50);

  fill(239, 247, 32); //dash line
   rect(0, 70, 40, 10);
  for (int i = 0; i < 20; i++) {
  rect(100*i, 70, 50, 10);}

  fill(51, 52, 51);
  rect(0, 140, 1900, 50);
  
  fill(239, 247, 32); //dash line
  for (int i = 0; i < 20; i++) {
  rect(100*i, 160, 50, 10);}

fill(51, 52, 51); //road
  rect(0, 230, 1900, 50);
  
  fill(239, 247, 32); //dash line
  for (int i = 0; i < 20; i++) {
  rect(100*i, 250, 50, 10);}
  
  //fill(239, 247, 32);
  //rect(50, 320, 50, 10);
  //rect(150, 320, 50, 10);
  //rect(250, 320, 50, 10);
  //rect(350, 320, 50, 10);
  //rect(450, 320, 50, 10);

  //fill(8, 79, 139);
  //rect(0, 150, 500, 100);
}


//controlkeys
  




void keyPressed() {
  if ((key=='d')||(keyCode==RIGHT))
    xFrog= xFrog+30;
  if ((key=='a')||(keyCode==LEFT))
    xFrog= xFrog - 30;
  if ((key=='s')||(keyCode==DOWN))
    yFrog= yFrog+30;
  if ((key=='w')||(keyCode==UP))
    yFrog= yFrog - 30;
}

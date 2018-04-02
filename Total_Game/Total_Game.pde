import processing.serial.*;
import gifAnimation.*;


Serial myPort;
//for game_state = 0
//Gif myAnimation;
int rect_height = 100, rect_width = 500;

//for game_state = 1
PImage pedestrian;
PImage traffic;
PImage blackout;
PImage water;

//for game_state = 2 -- pipe game
PImage corner;  // Declare variable "a" of type PImage
PImage straight;  // Declare variable "a" of type PImage
PImage tri;
PImage cross;

PImage corner_water;  // Declare variable "a" of type PImage
PImage straight_water;  // Declare variable "a" of type PImage
PImage tri_water;
PImage cross_water;

int[][] map1 = { { 4, 4, 0, 12, 0, 12, 4, 16, 4, 16, 16}, 
  {16, 4, 0, 4, 12, 0, 4, 16, 0, 0, 0}, 
  {16, 0, 4, 2, 0, 0, 5, 0, 8, 4, 0}, 
  { 8, 4, 0, 16, 4, 0, 16, 0, 4, 0, 4}, 
  {20, 16, 12, 16, 16, 16, 16, 16, 16, 16, 16} };
int[][] water_map = { {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1}, 
  {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1}, 
  {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1}, 
  {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1}, 
  {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1} };                    
int[][] win_map1 = {  { 4, 4, 3, -1, -1, -1, -1, -1, -1, -1, -1}, 
  {-1, -1, 1, 4, 15, 3, -1, -1, -1, 2, 3}, 
  {-1, -1, -1, -1, -1, 1, 6, 3, -1, 5, 1}, 
  {-1, -1, -1, -1, -1, -1, -1, 1, 6, 0, -1}, 
  {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1}};
Boolean game_won = false;
final int board_width = 11, board_height = 5;
int[][] board;


//for game state = 3
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

boolean mousepress = false; // also used by car traffic game
PFont r;
PFont t;
int loopnumber = 0;



//for game_state = 4 -- traffic game
//Car Traffic Game
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
// game_state == 5 lines
int[] x1Pos = new int[8];
int[] y1Pos = new int[8];
int[] x2Pos = new int[8];
int[] y2Pos = new int[8];

int[] xLineStart = new int[100];
int[] yLineStart = new int[100];
int[] xLineEnd = new int[100];
int[] yLineEnd = new int[100];
int radius = 50;
int counter = 0;



//overall game
int game_state = 0;

void setup() {
  size(1920, 872);
  
  printArray(Serial.list());
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  //led setup
  



  //game state 0
  //myAnimation = new Gif(this, "data/LoadingScreen.gif");
  //myAnimation.play();

  //game state 1
  pedestrian = loadImage("pedestrian.jpg");
  traffic = loadImage("traffic.jpg");
  blackout = loadImage("blackout.jpg");
  water = loadImage("water.jpg");

  //game state 2
  corner = loadImage("data/corner.png");  // Load the image into the program  
  straight = loadImage("data/straight.png");  // Load the image into the program 
  cross = loadImage("data/cross.png");
  tri = loadImage("data/tri.png");
  corner_water = loadImage("data/corner_water.png");  // Load the image into the program  
  straight_water = loadImage("data/straight_water.png");  // Load the image into the program 
  cross_water = loadImage("data/cross_water.png");
  tri_water = loadImage("data/tri_water.png");
  board = map1;

  //game state 3
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
  
  //game 5
    for (int i = 0; i<x1Pos.length;i++)
  {
    x1Pos[i] = 40;
    y1Pos[i] = 50+75*i;
    x2Pos[i] = width-50;
    y2Pos[i] = 50+75*i;
  }
  
}

void draw() {
  println(game_state);
  if (game_state == 0) {
    beginning_screen();
  } else if (game_state == 1) {
    mission_selection();
  } else if (game_state == 2) {
    pipe_game();
  } else if (game_state == 3) {
    frogger();
  } else if (game_state == 4) {
    trafficDraw();
  } else if (game_state == 5) {
    line_game(); 
  }
  
  
}
void mouseClicked() {
  if (game_state == 0) {
    if (mouseX > (width-rect_width)*1/2 && mouseX < (width+rect_width)*1/2 && mouseY > (height-rect_height)*1/2 && mouseY < (height+rect_height)*1/2) {
      game_state = 1;
    }
    myPort.write("1,0,24,255,0,0\n"); //red road
    myPort.write("2,0,4,255,0,0\n");  //red crosswalk
    myPort.write("3,0,9,255,0,0\n");  //red watertower
    myPort.write("4,0,9,255,0,0\n");  //red building
    myPort.write("5,0,8,255,0,0\n");  //red powerplant
  } else if (game_state == 1) {
    if (mouseX > width/2 && mouseY > height/2) { //traffic
      mousepress = false;
      loopnumber = 0;
      trafficSetup();
      game_state = 4;
      
    } else if (mouseX < width/2 && mouseY > height/2) {//electricity
      game_state = 5;
    } else if (mouseX > width/2 && mouseY < height/2) {//water
      game_state = 2;
    } else if (mouseX < width/2 && mouseY < height/2) {//frogger
      game_state = 3;
    }
  } else if (game_state == 2) {
    int i = (int)((float)mouseY/(float)height * board_height);
    int j = (int)((float)mouseX/(float)width * board_width);
    //println(mouseX+" "+mouseY);
    //println(i+" "+j);
    //println((float)i/(float)board_width * width + width/board_width/2+" "+ ((float)j/(float)board_height) * height +height/board_height/2);
    println(board[i][j]);
    if (board[i][j] < 4) {
      board[i][j]= ((board[i][j]+1)%4);
    } else if (board[i][j] < 8) {
      board[i][j]= ((board[i][j]+1)%4)+4;
    } else if (board[i][j] < 12) {
      board[i][j]= ((board[i][j]+1)%4)+8;
    } else if (board[i][j] < 16) {
      board[i][j]= ((board[i][j]+1)%4)+12;
    } else if (board[i][j] ==20) {
      if (check_map()) {
        game_won = true;
      }
    }
  } else if (game_state == 5){
    drawbackground();
  }
  
}

void beginning_screen() {
  //image(myAnimation, 0, 0, width, height);
  fill(250);
  rect((width-rect_width)*1/2, (height-rect_height)*1/2, rect_width, rect_height);
  fill(0);
  textSize(42);
  text("BEGIN YOUR MISSION", width/2 - 215, height/2 + 15);
}

void mission_selection() {
  background(0);
  fill(100);
  image(pedestrian, 0, 0, width/2, height/2);
  fill(150);
  image(water, width/2, 0, width/2, height/2);
  fill(200);
  image(blackout, 0, height/2, width/2, height/2);
  fill(255);
  image(traffic, width/2, height/2, width/2, height/2);
}

////////////////////////////////////////Pipe game

void pipe_game() {
  background(100);
  if (!game_won) {
    display();
  } else {
    myPort.write("3,0,9,0,255,0\n");  //green watertower
    fill(255);
    rect(100, 100, 200, 100);
    text("Continue", 110, 110);

  }
}

void display() {
  for (int i = 0; i<board_height; i++) {
    for (int j = 0; j<board_width; j++) {
      pushMatrix();
      //print("i:"+i+" j:"+j);
      translate( ((float)j/(float)board_height) * height +height/board_height/2, (float)i/(float)board_width * width + width/board_width/2);
      rotate((board[i][j]%4)/4.0*2.0*PI);
      if (water_map[i][j] == -1) {
        if (board[i][j] < 4) {//bend
          //image_array[i][j] = corner;
          image(corner, -height/board_height/2, -width/board_width/2, width/board_width, height/board_height);
        } else if (board[i][j] < 8) {//straight
          //image_array[i][j] = straight;
          image(straight, -height/board_height/2, -width/board_width/2, width/board_width, height/board_height);
        } else if (board[i][j] < 12) {//tri
          //image_array[i][j] = straight;
          image(tri, -height/board_height/2, -width/board_width/2, width/board_width, height/board_height);
        } else if (board[i][j] < 16) { //quad
          //image_array[i][j] = straight;
          image(cross, -height/board_height/2, -width/board_width/2, width/board_width, height/board_height);
        }
      } else {
        if (board[i][j] < 4) {
          //image_array[i][j] = corner;
          image(corner_water, -height/board_height/2, -width/board_width/2, width/board_width, height/board_height);
        } else if (board[i][j] < 8) {
          //image_array[i][j] = straight;
          image(straight_water, -height/board_height/2, -width/board_width/2, width/board_width, height/board_height);
        } else if (board[i][j] < 12) {
          //image_array[i][j] = straight;
          image(tri_water, -height/board_height/2, -width/board_width/2, width/board_width, height/board_height);
        } else if (board[i][j] < 16) { //
          //image_array[i][j] = straight;
          image(cross_water, -height/board_height/2, -width/board_width/2, width/board_width, height/board_height);
        }
      }
      popMatrix();
      if ( board[i][j] == 20) {
        fill(200, 50, 255);
        rect(((float)j/(float)board_height) * height, (float)i/(float)board_width * width, width/board_width, height/board_height);
        textSize(32);
        fill(0);
        text("Check", ((float)j/(float)board_height) * height+30, (float)i/(float)board_width * width+100);
      }
    }
  }
}

boolean check_map() {
  for (int x = 0; x<board_height; x++) {
    for (int y = 0; y<board_width; y++) {
      if (win_map1[x][y] != -1) { //works for bends
        println("Win: "+win_map1[x][y]+ " Board: "+board[x][y]);
        if (win_map1[x][y] == board[x][y]) {
          continue;
        } else if ((win_map1[x][y] == 5 || win_map1[x][y] == 7)&&(board[x][y] == 5 || board[x][y] == 7)) { //check for straights - vert
          continue;
        } else if ((win_map1[x][y] == 4 || win_map1[x][y] == 6)&&(board[x][y] == 6 || board[x][y] == 4)) { //check for straights - horiz
          continue;
        } else if ((win_map1[x][y] == 8 || win_map1[x][y] == 7)&&(board[x][y] == 5 || board[x][y] == 7)) { //check for tri - avoid this
          continue;
        } else if ((win_map1[x][y] == 12 || win_map1[x][y] == 13 || win_map1[x][y] == 14 || win_map1[x][y] == 15)&&(board[x][y] == 12 || board[x][y] == 13 || board[x][y] == 14 || board[x][y] == 15)) { //check for quad
          continue;
        } else if (win_map1[x][y] == -1) {
          continue;
        } else {
          print(x+" "+y);
          return false;
        }
      }
    }
  }
  return true;
}

///////////////// end of Pipe game


void frogger() { //game state 3
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


  if   (yFrog < 0)
  {
    fill(0, 255, 255);    
    rect(0, 0, width, height);
    r = createFont("Ariel", 12, true);
    textFont(r, 30);                  
    fill(255, 255, 255);
    rect(width/2-100, 400, 200, 60);
    fill(0); 
    text("You Have Crossed the Road!", width/2-150, height/2);
    text("CONTINUE", width/2-70, height/2+85);

    if ((mousePressed) && ((mouseX <= (width/2+100)) && (width/2-100 <= mouseX))
      && (mouseY <= (460)) && (400 <= mouseY))
    {
      mousepress = true;
    }
    if (mousepress == true)
    {
      loopnumber++;
      fill(0, 0, 0);    
      rect(0, 0, width, height);                 
      fill(0, 255, 0);
      t = createFont("Courier", 8, true);
      textFont(t, 20);

      if (loopnumber>=0)
        text("CIA_Msg.open:      Good job Agent. We have regained ", 16, 30);
      if (loopnumber>=80)
        text("newLine.start:     control of the traffic lights. We  ", 16, 60);
      if (loopnumber>=160)
        text("newLine.start:     must figure out what went wrong! ", 16, 90);
      if (loopnumber>=240)
        text("newLine.start:     We are transmitting the password ", 16, 140);
      if (loopnumber>=320)
        text("LOAD<oldPassword>        LOADING oldPassword....    ", 16, 190);
      if (loopnumber>=480)
        text("LOAD<oldPassword>              SUCCESS!             ", 16, 240);
      if (loopnumber>=560)
        text("oldPassword.open:    Old Password: \" abcde123 \"   ", 16, 320);
      if (loopnumber>=640)
        text("oldPassword.close                                   ", 16, 350);
      if (loopnumber>=720)
        text("newLine.start:     What do see wrong with the old   ", 16, 410);
      if (loopnumber>=800)
        text("newLine.start:     password? What could be changed? ", 16, 440);
      if (loopnumber>=880){
        text("                   CIA_Msg.close                    ", 16, 500);
        game_state = 1;
      }
      myPort.write("2,0,4,0,255,0\n");  //green crosswalk
      
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
    rect(100*i, 70, 50, 10);
  }

  fill(51, 52, 51);
  rect(0, 140, 1900, 50);

  fill(239, 247, 32); //dash line
  for (int i = 0; i < 20; i++) {
    rect(100*i, 160, 50, 10);
  }

  fill(51, 52, 51); //road
  rect(0, 230, 1900, 50);

  fill(239, 247, 32); //dash line
  for (int i = 0; i < 20; i++) {
    rect(100*i, 250, 50, 10);
  }
}
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


/////////////////////////end of frogger

//game state 4

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
  background(0);
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
    noStroke();
    background(0,255,255);
    fill(0,255,255);    
    rect(0,0,640,640);
    textFont(r,30);                  
    fill(255,255,255);
    rect(height/2,width/2,200,60);
    fill(0); 
    text("You Have Cleared the Traffic!",height/2,width/2);
    text("CONTINUE",240,440);
    
    if ((mousePressed) && (mouseX <= (420)) && (220 <= mouseX) && (mouseY <= (460)) && (400 <= mouseY))
    {
      mousepress = true;
    }
     if (mousepress == true)
     {
      background(0);
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
        if (loopnumber>=880){
          text("                   CIA_Msg.close                    ",16,500);
          game_state = 1;
        }
      myPort.write("1,0,24,0,255,0\n"); //green road
      
     }
  }
}

//////////////////////////////////line game game state == 5
void line_game(){
  drawbackground();
  strokeWeight(10);
  //if (mousePressed == true)
  //{
  //  xLineStart[counter] = mouseX;
  //  yLineStart[counter] = mouseY;
  //  counter++; 
  //}
  if(counter >= 9){
    myPort.write("4,0,9,0,255,0\n");  //green building
    myPort.write("5,0,8,0,255,0\n");  //green powerplant 
    game_state = 1;
  }
  for (int i = 0; i<100;i++)
  {
    line(xLineStart[i],yLineStart[i],xLineEnd[i],yLineEnd[i]);
  }
}
void drawbackground()
{
  background(102);
  strokeWeight(1);
  
  fill(255,120,0);    
  ellipse(x1Pos[0],y1Pos[0],radius,radius);
  
  fill(255,0,0);    
  ellipse(x1Pos[1],y1Pos[1],radius,radius);
  
  fill(0,120,120);   
  ellipse(x1Pos[2],y1Pos[2],radius,radius);
  
  fill(120,120,0);  
  ellipse(x1Pos[3],y1Pos[3],radius,radius);
  
  fill(0,120,255);    
  ellipse(x1Pos[4],y1Pos[4],radius,radius);
  
  fill(255,0,120);    
  ellipse(x1Pos[5],y1Pos[5],radius,radius);
  
  fill(50,120,120);   
  ellipse(x1Pos[6],y1Pos[6],radius,radius);
  
  fill(0,120,120);
  ellipse(x1Pos[7],y1Pos[7],radius,radius);
  
  
  fill(50,120,120);  
  ellipse(x2Pos[0],y1Pos[0],radius,radius);
  
 fill(255,0,120);    
  ellipse(x2Pos[1],y2Pos[1],radius,radius);
  
  fill(255,50,255);    
  ellipse(x2Pos[2],y2Pos[2],radius,radius);
  
  fill(120,120,0);   
  ellipse(x2Pos[3],y2Pos[3],radius,radius);
  
  fill(0,120,255);   
  ellipse(x2Pos[4],y2Pos[4],radius,radius);
  
  fill(255,120,0);     
  ellipse(x2Pos[5],y2Pos[5],radius,radius);
  
  fill(255,50,255);   
  ellipse(x2Pos[6],y2Pos[6],radius,radius);
  
   fill(255,0,0);   
  ellipse(x2Pos[7],y2Pos[7],radius,radius);
}

void mousePressed()
{
  if(game_state == 5){
    counter++; 
    xLineStart[counter] = mouseX;
    yLineStart[counter] = mouseY;
  }
  if(game_state == 2 && game_won){
    if(mouseX > 100 && mouseX < 300 && mouseY > 100 && mouseY < 200){
     game_state = 1;
    }
  }
  //if(game_state == 4){
  //if ((mouseX <= (xPos[1]+xSize[1])) && (xPos[1] <= mouseX)  //mouse click
  //  && (mouseY <= (yPos[1]+ySize[1])) && (yPos[1] <= mouseY))
  //  {
  //    xPos[1] = mouseX-xSize[1]/2;
  //  }
  //  if ((mouseX <= (xPos[2]+xSize[2])) && (xPos[2] <= mouseX)
  //  && (mouseY <= (yPos[2]+ySize[2])) && (yPos[2] <= mouseY))
  //  {
  //    yPos[2] = mouseY-ySize[2]/2;
  //  }
  //  if ((mouseX <= (xPos[3]+xSize[3])) && (xPos[3] <= mouseX)
  //  && (mouseY <= (yPos[3]+ySize[3])) && (yPos[3] <= mouseY))
  //  {
  //    xPos[3] = mouseX-xSize[3]/2;
  //  }
  //  if ( (mouseX <= (xPos[4]+xSize[4])) && (xPos[4] <= mouseX)
  //  && (mouseY <= (yPos[4]+ySize[4])) && (yPos[4] <= mouseY))
  //  {
  //    xPos[4] = mouseX-xSize[4]/2;
  //  }
  //  if ( (mouseX <= (xPos[5]+xSize[5])) && (xPos[5] <= mouseX)
  //  && (mouseY <= (yPos[5]+ySize[5])) && (yPos[5] <= mouseY))
  //  {
  //    yPos[5] = mouseY-ySize[5]/2;
  //  }
  //  if ( (mouseX <= (xPos[6]+xSize[6])) && (xPos[6] <= mouseX)
  //  && (mouseY <= (yPos[6]+ySize[6])) && (yPos[6] <= mouseY))
  //  {
  //    yPos[6] = mouseY-ySize[6]/2;
  //  }
  //  if ((mouseX <= (xPos[0]+xSize[0])) && (xPos[0] <= mouseX)
  //  && (mouseY <= (yPos[0]+ySize[0])) && (yPos[0] <= mouseY))
  //  {
  //    xPos[0] = mouseX-xSize[0]/2;
  //  }
  //  if ((mouseX <= (xPosR+xSizeR)) && (xPosR <= mouseX)  //reset button
  //  && (mouseY <= (yPosR+ySizeR)) && (yPosR <= mouseY))
  //  {
  //    xPos[1] = 20;
  //    yPos[1] = 20;
  //    xPos[2] = 20;
  //    yPos[2] = 20+100;
  //    xPos[3] = 20+200;
  //    yPos[3] = 20+500;
  //    xPos[4] = 20+300;
  //    yPos[4] = 20+400;
  //    xPos[5] = 20+300;
  //    yPos[5] = 20+100;
  //    xPos[6] = 20+500;
  //    yPos[6] = 20;
  //    xPos[0] = 20+100;
  //    yPos[0] = 20+200;
  //  }
  //}
}

void mouseDragged()
{
  if(game_state == 5){
    xLineEnd[counter] = mouseX;
    yLineEnd[counter] = mouseY;  
  }
  
}

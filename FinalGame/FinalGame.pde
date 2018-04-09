import processing.serial.*;
import gifAnimation.*;


Serial myPort;
//for (game_state = 0)
Gif myAnimation;
int rect_height = 100, rect_width = 500;

//for (game_state = 1)
PImage pedestrian;
PImage traffic;
PImage blackout;
PImage water;

//for (game_state = 2) -- pipe game
PImage corner;  // Declare variable "a" of type PImage
PImage straight;  // Declare variable "a" of type PImage
PImage tri;
PImage cross;

PImage corner_water;  // Declare variable "a" of type PImage
PImage straight_water;  // Declare variable "a" of type PImage
PImage tri_water;
PImage cross_water;

int[][] map1 = { { 4, 4, 0, 2, 0,12, 4,16, 4,16,16}, 
                 {16, 4, 0, 4,12, 0, 4,16, 0, 0, 0}, 
                 {16, 0, 4, 2, 0, 0, 5, 0, 8, 4, 0}, 
                 { 8, 4, 0,16, 4, 0,16, 0, 4, 0, 4}, 
                 {20,16,12,16,16,16,16,16,16,16,16}};
                 
int[][] win_map1 = {  { 4, 4, 3, -1, -1, -1, -1, -1, -1, -1, -1}, 
                      {-1, -1, 1, 4, 15, 3, -1, -1, -1, 2, 3}, 
                      {-1, -1, -1, -1, -1, 1, 6, 3, -1, 5, 1}, 
                      {-1, -1, -1, -1, -1, -1, -1, 1, 6, 0, -1}, 
                      {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1}};
                 
int[][] map2 = { {16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16},
                 { 6,  6,  3, 16, 11,  4,  5,  3, 16, 16, 16},
                 {16, 16,  2, 14,  7,  2,  3, 12,  6,  6,  6},
                 {16, 16, 12,  6, 16,  3,  6,  2, 16, 16, 16},
                 {20, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16}};
            
int[][] win_map2 = {  {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1}, 
                      { 6,  6,  3, -1, -1, -1, -1, -1, -1, -1, -1}, 
                      {-1, -1,  1, 14,  4,  3, -1, 12,  6,  6,  6},
                      {-1, -1, -1, -1, -1,  1,  6,  0, -1, -1, -1}, 
                      {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1}};
                                            
                      
int[][] water_map = { {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1}, 
                      { 1,  1, -1, -1, -1, -1, -1, -1, -1, -1, -1}, 
                      {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1}, 
                      {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1}, 
                      {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1} };                    

                      
Boolean game_won = false;
final int board_width = 11, board_height = 5;
int[][] board;


//for (game state) = 3
int NumberofCars=4;
float [] xCoord=new float[NumberofCars];  
float [] yCoord=new float[NumberofCars]; 
float [] xMove=new float[NumberofCars];  
float [] yMove=new float[NumberofCars];

int NumberofCars2= 4; 
float [] xCoord2=new float[NumberofCars2];  
float [] yCoord2=new float[NumberofCars2]; 
float [] xMove2=new float[NumberofCars2];  
float [] yMove2=new float[NumberofCars2];

int NumberofCars3=4;
float [] xCoord3=new float[NumberofCars3];  
float [] yCoord3=new float[NumberofCars3]; 
float [] xMove3=new float[NumberofCars3];  
float [] yMove3=new float[NumberofCars3];

int NumberofCars4=4;
float [] xCoord4=new float[NumberofCars4];  
float [] yCoord4=new float[NumberofCars4]; 
float [] xMove4=new float[NumberofCars4];  
float [] yMove4=new float[NumberofCars4];

//position of person after hit by car is in middle of screen and towards bottom 
int xFrog = 950;   //old = 950
int yFrog = 800;   //old = 950

boolean mousepress = false; // also used by car traffic game
PFont r;
PFont t;
int loopnumber = 0;



//for (game_state = 4) -- traffic game
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
// (game_state == 5) lines
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

color[] line_colors = new color[100];
color [] colors = new color[8];

int[][] line_numbers = { {0,1,2,3,4,5,6,7}, {6,2,5,1,3,7,4,0}};


// (game_state == 6) 
String user_string = "";
Boolean user_typing = false;
Boolean analyze_text = false;

// (game_state == 7)
Boolean misclick1 = false;
Boolean misclick2 = false;
Boolean infoclick = false;
Boolean question_screen = false;
Boolean win_screen = false;

Boolean first_win_check = false;
PImage two_fact;
Boolean second_win_check = false;

//overall game
int game_state = 0;

void setup() {
  size(1920, 872);
  
  printArray(Serial.list());
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  //led setup
  



  //game state 0
  myAnimation = new Gif(this, "data/LoadingScreen.gif");
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
  board = map2;

  //game state 3
  for (int i = 0; i < NumberofCars; i++) {
    xCoord[i]=(500*i);
    yCoord[i]= 10;
    xMove[i]=8+random(-1,1);
  }

  for (int i = 0; i < NumberofCars2; i++) {
    xCoord2[i]=(500*i);
    yCoord2[i]= 110;
    xMove2[i]=-3 + random(-1,1); 
  }

  for (int i = 0; i < NumberofCars3; i++) {
    xCoord3[i]=(500*i);
    yCoord3[i]= 220;
    xMove3[i]=6 + random(-1,1); 
  }

  for (int i = 0; i < NumberofCars4; i++) {
    xCoord4[i]=(500*i);
    yCoord4[i]= 560;
    xMove4[i]=5 + random(-1,1); ;
  }
  
    
  //game 5
  
    for (int i = 0; i<x1Pos.length;i++)
  {
    x1Pos[i] = 40;
    y1Pos[i] = 50+75*i;
    x2Pos[i] = width-50;
    y2Pos[i] = 50+75*i;
    
    colorMode(HSB, 100);
    colors[i] = (color(100/x1Pos.length*i, 100, 100)) ;
    colorMode(RGB, 255);
  }
  // for game_state == 7
  two_fact = loadImage("two_fact.png");
}

void draw() {
  println(first_win_check);
  //println(game_state);
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
  } else if (game_state == 6) {
    first_win();
  } else if (game_state == 7) {
    second_win(); 
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
  if(game_state == 6 && analyze_text){
    first_win_check = true;
    game_state = 1;
  }
  if(game_state == 7 && question_screen && !win_screen){
   if(mouseX < 716 && mouseX >0 && mouseY > 317 && mouseY < 700){
      misclick1 = true; 
   }
   if(mouseX < 700 && mouseX >0 && mouseY > 0 && mouseY < 290){
      misclick2 = true; 
   }
   if(mouseX < 340 && mouseX >330 && mouseY > 788 && mouseY < 800){
      infoclick = true; 
   }
   if(mouseX < 448 && mouseX >312 && mouseY > 831 && mouseY < 842){
      win_screen = true;
      
   }
   if(win_screen){
    if(mouseX > width-5 && mouseY > height -5){
     game_state = 0; 
    }
   }
   //println(mouseX+" "+mouseY);
  }
}

void beginning_screen() {
  image(myAnimation, 0, 0, width, height);
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
    if(first_win_check){
      loopnumber = 0;
      game_state = 7;
    }
    else{
      game_state = 6;
    }
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
    //print("X: "+x+"{");
    for (int y = 0; y<board_width; y++) {
      //print(" "+board[x][y]+",");
      if (win_map2[x][y] != -1) { 
        println("Win: "+win_map2[x][y]+ " Board: "+board[x][y]);
        if (win_map2[x][y] == board[x][y]) {//works for bends and rare tees
          continue;
        } else if ((win_map2[x][y] == 5 || win_map2[x][y] == 7)&&(board[x][y] == 5 || board[x][y] == 7)) { //check for straights - vert
          continue;
        } else if ((win_map2[x][y] == 4 || win_map2[x][y] == 6)&&(board[x][y] == 6 || board[x][y] == 4)) { //check for straights - horiz
          continue;
        } else if ((win_map2[x][y] == 8 || win_map2[x][y] == 7)&&(board[x][y] == 5 || board[x][y] == 7)) { //check for tri - avoid this
          continue;
        } else if ((win_map2[x][y] == 12 || win_map2[x][y] == 13 || win_map2[x][y] == 14 || win_map2[x][y] == 15)&&(board[x][y] == 12 || board[x][y] == 13 || board[x][y] == 14 || board[x][y] == 15)) { //check for quad
          continue;
        } else if (win_map2[x][y] == -1) {
          continue;
        } else {
          print(x+" "+y);
          return false;
        }
      }
    }
    //println();
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

   textSize(32); 
  text("FINISH HERE", 930, 30); 
  fill(0, 0, 0); 
  
  //draw the cars at their location 

  for (int i = 0; i < NumberofCars; i++) {
    fill(111, 169, 219);
    rect(xCoord[i], yCoord[i]+2, 33, 16, 10);
    fill(255, 0, 0);
    rect(xCoord[i]-16, yCoord[i]+16, 66, 26, 10);
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

      xFrog = 950;    //950
      yFrog = 800;    //950
    }
 
  }

  for (int i = 0; i < NumberofCars2; i++) {
    fill(111, 169, 219);
    rect(xCoord2[i], yCoord2[i]+2, 33, 16,10);
    fill(255, 0, 0);
    rect(xCoord2[i]-16, yCoord2[i]+16, 66, 26,10);
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

      xFrog = 950;    //950
      yFrog = 800;    //950
    }
  }
  
  for (int i = 0; i < NumberofCars3; i++) {
    fill(111, 169, 219);
    rect(xCoord3[i], yCoord3[i]+2, 33, 16,10);
    fill(255, 0, 0);
    rect(xCoord3[i]-16, yCoord3[i]+16, 66, 26,10);
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

      xFrog = 950;    //950
      yFrog = 800;    //950
    }
  }
  
   for (int i = 0; i < NumberofCars4; i++) {
    fill(220, 220, 220);
    rect(xCoord4[i]-50, yCoord4[i]+16, 125, 40,10);
     fill(0, 0, 0);
    rect(xCoord4[i]+35, yCoord4[i], 40, 25, 5);
    fill(0);
    ellipse(xCoord4[i]-20, yCoord4[i]+60, 30, 30);
    ellipse(xCoord4[i]+50, yCoord4[i]+60, 30, 30);

    //moves cars across screen 
    xCoord4[i]= xCoord4[i] + xMove4[i];

    noFill();

    if (xCoord4[i]>width) {
      xCoord4[i]=0;
    }
    if (xCoord4[i]<0) {
      xCoord4[i]=width;
    }
    //hit test 
    if (dist(xFrog, yFrog-40, xCoord4[i]+30, yCoord4[i]) < 30) {

      xFrog = 950;    //950
      yFrog = 800;    //950
    }
  } 
  
  //hit tests for lakes 
  if ( (xFrog>0) && (xFrog<550) && (yFrog>390) && (yFrog<460)) { 
      xFrog = 950;    //950
      yFrog = 800;}
  if ( (xFrog>712) && (xFrog< 1187) && (yFrog>390) && (yFrog<510)) {
      xFrog = 950;    //950
      yFrog = 800;}
  if( (xFrog >850) && (xFrog<1400) && (yFrog>490) && (yFrog<560)) {
    xFrog = 950;    //950
      yFrog = 800;}
  if( (xFrog>1500) && (xFrog<1900) && (yFrog>390) && (yFrog<510)) { 
    xFrog = 950;    //950
      yFrog = 800;}
      

  if   (yFrog < 0)
  {
      myPort.write("2,0,4,0,255,0\n");  //green crosswalk
      if(first_win_check){
        loopnumber = 0;
      game_state = 7;
    }
    else{
      game_state = 6;
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
  
  fill(51, 52, 51); //road
  rect(0, 590, 1900, 50);
  
  fill(239, 247, 32); //dash line 
  for (int i = 0; i < 20; i++) {
    rect(100*i, 610, 50, 10);
  }
  
  fill(0, 0, 255); // river
  rect(712, 400, 475, 100, 50);
  fill(0,0,255); 
  rect(0,400, 550, 50,50);
  fill(0,0,255); 
  rect(850, 500, 550, 50,50 ); 
  fill(0,0,255); 
  rect(1500, 400, 400, 100,50 ); 
  
}
void keyPressed() {
  if(game_state == 3){
    if ((key=='d')||(keyCode==RIGHT))
      xFrog= xFrog+30;
    if ((key=='a')||(keyCode==LEFT))
      xFrog= xFrog - 30;
    if ((key=='s')||(keyCode==DOWN))
      yFrog= yFrog+30;
    if ((key=='w')||(keyCode==UP))
      yFrog= yFrog - 30;
  }
  else if(game_state == 6){
    if(user_string.length() != 0 &&  (key == DELETE || key == BACKSPACE)){
     user_string = user_string.substring(0, user_string.length()-1);
    }else{
      user_string+=key;
    }
    if(key == ENTER){
     user_typing = false; 
     analyze_text = true;
    }
  }
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
    myPort.write("1,0,24,0,255,0\n"); //green road
    if(first_win_check){
      loopnumber = 0;
      game_state = 7;
    }
    else{
      game_state = 6;
    }
     
  }
}

//////////////////////////////////line game game state == 5
void line_game(){
  //frameRate(1);
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
    //myPort.write("5,0,8,0,255,0\n");  //green powerplant 
    if(first_win_check){
      loopnumber = 0;
      game_state = 7;
    }
    else{
      game_state = 6;
    }
  }
  for (int i = 0; i<100;i++)
  {
    for(int j = 0; j < x1Pos.length; j++){
      //if( pow(xLineStart[line_numbers[0][j]]-x1Pos[j],2) < 100){
        println(dist(xLineStart[i],yLineStart[i],x1Pos[j],y1Pos[j]));
      //}
      
      if(dist(xLineStart[i],yLineStart[i],x1Pos[j],y1Pos[j]) <= radius){ //&& dist(xLineEnd[i],yLineEnd[i],x1Pos[line_numbers[1][j]],y1Pos[line_numbers[1][j]]) <= radius){
      //if(dist(xLineEnd[i],yLineEnd[i],x2Pos[line_numbers[1][j]],y2Pos[line_numbers[1][j]]) <= radius){
        line_colors[i] = colors[line_numbers[0][j]];
        //continue;
      }
    }
    
    stroke(line_colors[i]);  
    line(xLineStart[i],yLineStart[i],xLineEnd[i],yLineEnd[i]);
  }
}
void drawbackground()
{
  background(102);
  strokeWeight(1);
  
  for(int i = 0; i < x1Pos.length; i++){
    fill(colors[i]);
    ellipse(x1Pos[i],y1Pos[i],radius,radius);  
  }
  for(int i = 0; i < x1Pos.length; i++){
    fill(colors[line_numbers[1][i]]);
    ellipse(x2Pos[i],y2Pos[i],radius,radius);  
  }
 
}

void mousePressed()
{
  if(game_state == 5){
    counter++; 
    xLineStart[counter] = mouseX;
    yLineStart[counter] = mouseY;
    xLineEnd[counter] = mouseX;
    yLineEnd[counter] = mouseY;
  }
  if(game_state == 2 && game_won){
    if(mouseX > 100 && mouseX < 300 && mouseY > 100 && mouseY < 200){
     game_state = 1;
    }
  }
}

void mouseDragged()
{
  if(game_state == 5){
    xLineEnd[counter] = mouseX;
    yLineEnd[counter] = mouseY;  
  }
  
}


//game state == 6

void first_win(){
   background(0);
   loopnumber+=2;
   fill(0, 0, 0);    
   rect(0, 0, width, height);                 
   fill(0, 255, 0);
   t = createFont("Courier", 8, true);
   textFont(t, 20);
   if (loopnumber<=1100){
     if (loopnumber>=0)
       text("CIA_Msg.open:      Good job Agent. We have regained ", 16, 30);
     if (loopnumber>=80)
       text("newLine.start:     control of the system. We        ", 16, 60);
     if (loopnumber>=160)
       text("newLine.start:     must figure out what went wrong! ", 16, 90);
     if (loopnumber>=240)
       text("newLine.start:     We are transmitting the password ", 16, 140);
     if (loopnumber>=320)
       text("LOAD<oldPassword>        LOADING oldPassword....    ", 16, 190);
     if (loopnumber>=480)
       text("LOAD<oldPassword>              SUCCESS!             ", 16, 240);
     if (loopnumber>=560)
       text("oldPassword.open:    Old Password: \" ilovecats \"  ", 16, 320);
     if (loopnumber>=640)
       text("oldPassword.close                                   ", 16, 350);
     if (loopnumber>=720)
       text("newLine.start:     What do see wrong with the old   ", 16, 410);
     if (loopnumber>=800)
       text("newLine.start:     password? What could be changed? ", 16, 440);
     if (loopnumber>=880){
       text("                   CIA_Msg.close                    ", 16, 500);
     }  
   }else if (analyze_text == false){
     user_typing = true;
     text("Enter in a new password: (press enter to continue)", 16, 140);
     text(user_string, 16, 190);
   }
   else {
    if(user_string.length() < 8){
      text("You really need to work on your password skills! ", 16, 440);
      text("A hacker could guess your password without a computer ", 16, 500);
      text("Click to continue", 16, 550);
    }
    else if(user_string.length() < 16){
      text("You're getting there, but you still should have a longer password ", 16, 440);
      text("Try making it easy to remember, but long by using multiple words stuck together ", 16, 500);
      text("Click to continue", 16, 550);
    }
    else{
      text("Awesome job, a hacker would have a hard time guessing this password!", 16, 440);
      text("It would take many years to crack this password", 16, 500);
      text("Click to continue", 16, 550);
    }
   }
}

void second_win(){
   background(0);
   loopnumber+=2;
   fill(0, 0, 0);    
   rect(0, 0, width, height);                 
   fill(0, 255, 0);
   t = createFont("Courier", 8, true);
   textFont(t, 20);
   if (loopnumber<=1200){
     if (loopnumber>=0)
       text("CIA_Msg.open:      Good job Agent. We have regained ", 16, 30);
     if (loopnumber>=80)
       text("newLine.start:     control of this system. We must", 16, 60);
     if (loopnumber>=160)
       text("newLine.start:     figure out what went wrong! ", 16, 90);
     if (loopnumber>=240)
       text("newLine.start:     ....................................", 16, 140);
     if (loopnumber>=320)
       text("newLine.start:     After intense analysis, we discovered", 16, 190);
     if (loopnumber>=480)
       text("newLine.start:     that the hacker bypassed the password", 16, 240);
     if (loopnumber>=560)
       text("newLine.start:     Find out how to fix the leak!!!      ", 16, 320);
     if (loopnumber>=640)
       text("CIA_Msg.close                                   ", 16, 350);
     if (loopnumber>=720)
       text("newLine.start:     Find a way that is more secure   ", 16, 410);
     if (loopnumber>=800)
       text("newLine.start:     than just a password ", 16, 440);
     if (loopnumber>=880){
       text("                   HURRY!                    ", 16, 500);
     }  
   }
   else if(!win_screen)
   {
     question_screen = true;
     image(two_fact, 0,0, width, height);
   
    if(misclick1){
      text("We want something more secure than just a password!", 750, 500); 
    }
    if(misclick2){
      text("Changing the email will only delay the problem!", 750, 200);
    }
    if(infoclick){
      textFont(t, 16);
      text("Two-factor authentication adds additional security to your account. ", 70, 720);
      text("It requires you to give a 6-digit verification code generated from your phone ", 70, 750);
      text("in addition to your username and password login. ", 350, 780);
      textFont(t, 20);
    }
  }
  else{
    text("CIA_Msg.open:      Congrats agent, you have successfully completely your mission ", 16, 30);
    text("newLine.start:     Check on your partner to see if you have saved the city!", 16, 60);
    text("newLine.start:     We are forever indebited to you and your partner.", 16, 90);
    textFont(t, 40);
    text("Thank you!", 100, 140);
  }
 
}

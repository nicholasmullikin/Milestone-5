int[] x1Pos = new int[8];
int[] y1Pos = new int[8];
int[] x2Pos = new int[8];
int[] y2Pos = new int[8];

{
x1Pos[0] = 40;
x1Pos[1] = 40;
x1Pos[2] = 40;
x1Pos[3] = 40;
x1Pos[4] = 40;
x1Pos[5] = 40;
x1Pos[6] = 40;
x1Pos[7] = 40;

y1Pos[0] = 50;
y1Pos[1] = 125;
y1Pos[2] = 200;
y1Pos[3] = 275;
y1Pos[4] = 350;
y1Pos[5] = 425;
y1Pos[6] = 500;
y1Pos[7] = 575;

x2Pos[0] = width+470;
x2Pos[1] = width+470;
x2Pos[2] = width+470;
x2Pos[3] = width+470;
x2Pos[4] = width+470;
x2Pos[5] = width+470;
x2Pos[6] = width+470;
x2Pos[7] = width+470;

y2Pos[0] = 50;
y2Pos[1] = 125;
y2Pos[2] = 200;
y2Pos[3] = 275;
y2Pos[4] = 350;
y2Pos[5] = 425;
y2Pos[6] = 500;
y2Pos[7] = 575;
}


int radius = 50;

void setup() 
{
  size(640, 640);
}

void draw() 
{
  drawbackground();
  
  
  
  stroke(255);
  if ((mousePressed) && (mouseX <= (x1Pos[1] + radius)) && (radius <= mouseX)) 
  {
    line(x1Pos[0], y1, mouseX, mouseY);
  }
  
}


void drawbackground()
{
  background(102);
  
  fill(255,120,0);    //boundaries
  ellipse(x1Pos[0],y1Pos[0],radius,radius);
  
  fill(255,0,0);    //boundaries
  ellipse(x1Pos[1],y1Pos[1],radius,radius);
  
  fill(0,120,120);    //boundaries
  ellipse(x1Pos[2],y1Pos[2],radius,radius);
  
  fill(120,120,0);    //boundaries
  ellipse(x1Pos[3],y1Pos[3],radius,radius);
  
  fill(0,120,255);    //boundaries
  ellipse(x1Pos[4],y1Pos[4],radius,radius);
  
  fill(255,0,120);    //boundaries
  ellipse(x1Pos[5],y1Pos[5],radius,radius);
  
  fill(50,120,120);    //boundaries
  ellipse(x1Pos[6],y1Pos[6],radius,radius);
  
  fill(255,50,255);    //boundaries
  ellipse(x1Pos[7],y1Pos[7],radius,radius);
  
  
  fill(255,120,0);    //boundaries
  ellipse(x2Pos[0],y1Pos[0],radius,radius);
  
  fill(255,0,0);    //boundaries
  ellipse(x2Pos[1],y2Pos[1],radius,radius);
  
  fill(0,120,120);    //boundaries
  ellipse(x2Pos[2],y2Pos[2],radius,radius);
  
  fill(120,120,0);    //boundaries
  ellipse(x2Pos[3],y2Pos[3],radius,radius);
  
  fill(0,120,255);    //boundaries
  ellipse(x2Pos[4],y2Pos[4],radius,radius);
  
  fill(255,0,120);    //boundaries
  ellipse(x2Pos[5],y2Pos[5],radius,radius);
  
  fill(50,120,120);    //boundaries
  ellipse(x2Pos[6],y2Pos[6],radius,radius);
  
  fill(255,50,255);    //boundaries
  ellipse(x2Pos[7],y2Pos[7],radius,radius);
}

Ball[]balls=new Ball[1];
Line[]lines=new Line[1];
int[]X=new int[1];
int[]Y=new int[1];
//int fade=240;

void setup(){
  size(500, 500);
  smooth();
  for(int j=0; j<balls.length; j++){
  balls[j]=new Ball(width/2, height/2);
  lines[j]=new Line(width/2, height/2, width/2, height/2, width/2,height/2,0);
  X[j]=width/2;
  Y[j]=height/2;
}
}

void draw(){
  background(255);
  for(int i=0; i<balls.length; i++){
 balls[i].jiggle(0.77);
 balls[i].display();
  lines[i].show();
  
  if(i>0){
  lines[i].xpos1=balls[i-1].xpos;
  lines[i].ypos1=balls[i-1].ypos;
  lines[i].xpos2=balls[i].xpos;
  lines[i].ypos2=balls[i].ypos;
  }
  if(i>1){
  lines[i].xpos11=balls[i-2].xpos;
  lines[i].ypos11=balls[i-2].ypos;
  lines[i].xpos2=balls[i].xpos;
  lines[i].ypos2=balls[i].ypos;}
   
  
  }
  
}

void mousePressed(){
//fade=fade-10;
Ball b=new Ball(mouseX, mouseY);
balls=(Ball[])append(balls,b);
//println(balls);
X=append(X, mouseX);
Y=append(Y, mouseY);
if(balls.length>1&&balls.length<=2){
 Line a=new Line( X[balls.length-2],Y[balls.length-2], mouseX, mouseY, mouseX, mouseY,random(150, 255));
 lines=(Line[])append(lines, a);

}
else if(balls.length>2){
Line a=new Line(X[balls.length-3],Y[balls.length-3], X[balls.length-2],Y[balls.length-2], mouseX, mouseY,random(150, 255));
lines=(Line[])append(lines, a);
//if(balls.length>3){
//Line a1=new Line(X[balls.length-3],Y[balls.length-3],mouseX, mouseY);
//lines=(Line[])append(lines, a1);}

}

}

//ball1=new Ball(mouseX, mouseY);}
class Ball{
  float xpos;
  float ypos;

  Ball(float tempx, float tempy){
  xpos=tempx;
  ypos=tempy;
   }
  
  void jiggle(float speed){
    //fill(20);
    xpos=xpos+random(-1, 1)*speed;
    ypos=ypos+random(-1, 1)*speed;
   
  }
  void display(){
    noStroke();
    ellipse(xpos,ypos, 1, 1);      
}
   
   
   
   
}
class Line {
  float xpos11, ypos11, xpos1, ypos1, xpos2, ypos2;
  float fade;
  Line(float tempx11, float tempy11, float tempx1, float tempy1, float tempx2, float tempy2, float tempfade) {
    xpos11=tempx11;
    ypos11=tempy11;
    xpos1=tempx1;
    ypos1=tempy1;
    xpos2=tempx2;
    ypos2=tempy2;
    fade=tempfade;
  }

  void show() {

    stroke(180);
    //line(xpos11, ypos11,xpos2, ypos2);
    stroke(100); 
    line(xpos1, ypos1, xpos2, ypos2);
    stroke(40);
    line(xpos11, ypos11, xpos2, ypos2);
    fill(180, fade);
    triangle(xpos1, ypos1, xpos2, ypos2, xpos11, ypos11);
  }
}



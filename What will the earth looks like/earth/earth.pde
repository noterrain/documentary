Earth theEarth;
Linenumber[] lin = new Linenumber[20];
float diffuse_min = 20;
float diffuse = diffuse_min;
float diffuse_max = 200;



void setup() {
  size(640, 480);
  smooth();
  frameRate(10);
  for (int i=0;i<lin.length;i++) {
    lin[i] = new Linenumber(320, 240);
  }
  theEarth= new Earth();
}

void draw() {
  theEarth.display();
  if (mousePressed) {
    for (int i=0;i<lin.length;i++) {
      lin[i].xPos = mouseX + random(diffuse) - random(diffuse);
      lin[i].yPos = mouseY +random(diffuse) - random(diffuse);
      lin[i].drawLine();
      lin[i].fadeout();
    }
    if (diffuse>diffuse_min&&diffuse<diffuse_max) {
      diffuse++;
    } 
    else if (!mousePressed&&diffuse>diffuse_min) {
      diffuse--;
    }
  }
}

class Linenumber{
  float xPos, yPos, xo, yo;
  int fade=255;

  Linenumber(float xs, float ys){

    xo = xs;
    yo = ys;
  }

  void drawLine(){
    line(xPos,yPos,mouseX,mouseY);
    ellipseMode(CENTER);
    stroke(50, fade);
    line(xPos,yPos,xo,yo);
    
  }
  
  void fadeout(){
   fade=fade-2;}

}


class Earth {
  Earth() {
  }


  void display() {
    smooth();

    fill(50, frameCount/6);
    stroke(25);
    ellipse(320, 240, 180, 180);
  }
}



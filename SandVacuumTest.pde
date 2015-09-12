import processing.sound.*;
SoundFile file;
PImage bg, vacCur;

int sandNum = 6000;
int[] sandX = new int[sandNum];
int[] sandY = new int[sandNum];
int disRadius = 7;
int ellSize = 7;
int vacRadius;
boolean play = false;          


void setup() {
  size(400, 300);
  bg = loadImage("goldcoins.jpg");
  file = new SoundFile(this, "vacuum.mp3");
  fill(random(235,115),150,120);
  vacCur = loadImage("vacCur.png");
  cursor(MOVE);
  
  //Fill two arrays with random coordinates for each grain of sand 
  for(int i=0;i<sandNum;i++){
    sandX[i] = int(random(width)); 
    sandY[i] = int(random(height)); 
  }
}

void draw() {
  background(bg);
  float x,y;
  float easing = 0.15;
  if (play){file.loop();file.amp(1);}else{file.stop();}
  
   /*Check the array coordinates and the mouse position.
   If the grain is close enough to the mouse make it move towards it.
   When the grain gets close enough throw it off screen*/
    for(int i=0;i<sandNum;i++){
      if(mousePressed){
        play = true;
        vacRadius = int(random(25,35));
        
        //Vacuum radius check
        if(mouseX-sandX[i]<vacRadius && mouseX-sandX[i]>-vacRadius
        && mouseY-sandY[i]<vacRadius && mouseY-sandY[i]>-vacRadius){
          
          //Move towards mouse
          sandX[i] = int((1-easing) * float(sandX[i]) + easing * mouseX);
          sandY[i] = int((1-easing) * float(sandY[i]) + easing * mouseY);
          
          //Disappear radius check
          if(mouseX-sandX[i]<disRadius && mouseX-sandX[i]>-disRadius
          && mouseY-sandY[i]<disRadius && mouseY-sandY[i]>-disRadius){
            sandX[i] = -4*ellSize;
          }
        } 
    }else
    {
      play=false;
    }
    ellipse(sandX[i],sandY[i],ellSize,ellSize);
  }
}
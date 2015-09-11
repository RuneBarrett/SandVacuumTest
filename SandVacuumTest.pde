import processing.sound.*;
SoundFile file;
PImage bg, vacCur;

int sandNum = 6000;
int[] sandX = new int[sandNum];
int[] sandY = new int[sandNum];
int vacRadius = 29;
int disRadius = 7;
int ellSize = 6;
boolean play = false;          


void setup() {
  size(400, 300);
  bg = loadImage("goldcoins.jpg");
  file = new SoundFile(this, "vacuum.mp3");
  fill(random(235,115),150,120);
  vacCur = loadImage("vacCur.png");
  cursor(MOVE);
  
  for(int i=0;i<sandNum;i++){
    sandX[i] = int(random(width)); 
    sandY[i] = int(random(height)); 
  }
}

void draw() {
  background(bg);
  float x,y;
  float easing = 0.15;
  if (play){file.play();}else{file.stop();}
 
    for(int i=0;i<sandNum;i++){
      if(mousePressed){
        play = true;
        if(mouseX-sandX[i]<vacRadius && mouseX-sandX[i]>-vacRadius
        && mouseY-sandY[i]<vacRadius && mouseY-sandY[i]>-vacRadius){
          
          x = (1-easing) * float(sandX[i]) + easing * mouseX;
          y = (1-easing) * float(sandY[i]) + easing * mouseY;
    
          ellipse(x,y,ellSize,ellSize);
     
          sandX[i] = int(x);
          sandY[i] = int(y);
          
          if(mouseX-sandX[i]<disRadius && mouseX-sandX[i]>-disRadius
          && mouseY-sandY[i]<disRadius && mouseY-sandY[i]>-disRadius){
            sandX[i] = -50;
          }
        } 
    }else{play=false;}
    ellipse(sandX[i],sandY[i],ellSize,ellSize);
  }
}
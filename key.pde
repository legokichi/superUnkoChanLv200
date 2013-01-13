void keyPressed(){
  if(key==CODED){
    int p = 64;
    if(keyCode==UP)    move(p, p);
    if(keyCode==LEFT)  move(-p, p);
    if(keyCode==RIGHT) move(p, -p);
    if(keyCode==DOWN)  move(-p, -p);
  }
  if(key=='0') changeState("wait");
  if(key=='1') changeState("trackPole");
  if(key=='3') changeState("avoidPole");
  if(key=='4') changeState("goForward");
  if(key=='5') changeState("turnFast");
  if(key=='6') changeState("seekTheOtherPole");
  if(key=='7') changeState("trackTheOtherPole");
  if(key=='8') changeState("dribblePole");
  if(key=='9') changeState("test");
  if(key=='q') colorN = 0;
  if(key=='w') colorN = 1;
  if(key=='e') colorN = 2;
}

void keyReleased(){
  if(key==CODED) move(0, 0);
}
void keyPressed(){
  if(key==CODED){
    int p = 64;
    if(keyCode==UP)    move(p, p);
    if(keyCode==LEFT)  move(-p, p);
    if(keyCode==RIGHT) move(p, -p);
    if(keyCode==DOWN)  move(-p, -p);
  }
  if(key=='0') changeState("wait");
  if(key=='1') changeState("trackPole0");
  if(key=='2') changeState("avoidPole0");
  if(key=='3') changeState("goForward");
  if(key=='4') changeState("trackPole1AndGoal");
  if(key=='5') changeState("trackPole1");
  if(key=='6') changeState("dribblePole1");
  if(key=='7') changeState("goBack");
  if(key=='8') changeState("backToPole0");
  if(key=='9') changeState("goalAlone");
  if(key=='-') changeState("test");
  if(key=='^') changeState("randomClean");
  if(key=='q') colorN = 0;
  if(key=='w') colorN = 1;
  if(key=='e') colorN = 2;
}

void keyReleased(){
  if(key==CODED) move(0, 0);
}
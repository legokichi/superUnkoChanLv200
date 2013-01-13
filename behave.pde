String state = "wait";
int timer = 0;

void behaveSetup(){
  changeState("wait");
}

void changeState(String str){
  state = str;
  println("state: " + state);
  playSong();
  timer = millis();
}

boolean checkTimer(int wait){
  if(millis() - timer > wait) return true;
  else                        return false;
}

boolean feelColor(int n, int l, int r){
  changeDetectColor(n);
  if(l < X_ichi && X_ichi < r) return true;
  else                         return false;
}

void trackColor(int n){
  changeDetectColor(n);
  if(                X_ichi <  64) move(-63,  63);
  if( 64 < X_ichi && X_ichi < 128) move(127, 255);
  if(128 < X_ichi && X_ichi < 192) move(255, 255);
  if(192 < X_ichi && X_ichi < 256) move(255, 127);
  if(256 < X_ichi)                 move( 63, -63);
}

boolean feelColors(int n, int m, int l, int r){
  changeDetectColor(n);
  int X_1 = detectColor(colors[n]);
  int X_2 = detectColor(colors[m]);
  int X;
  if(X_1 > X_2) X = X_1 + abs(X_1-X_2)/2;
  else          X = X_1 - abs(X_2-X_1)/2;
  if(l < X && X < r) return true;
  else               return false;
}

void trackColors(int n, int m){
  changeDetectColor(n);
  int X_1 = detectColor(colors[n]);
  int X_2 = detectColor(colors[m]);
  if(X_1 > X_2) X_ichi = X_1 + abs(X_1-X_2)/2;
  else          X_ichi = X_1 - abs(X_2-X_1)/2;
  trackColor(n);
}

boolean feelPole(int depth){
  if(lbump_FL+lbump_CL > depth ||
     lbump_CR+lbump_CL > depth ||
     lbump_CR+lbump_FR > depth) return true;
  else                          return false;
}

void dribble(int fast, int slow){
       if(lbump_FL+lbump_CL > lbump_CR+lbump_FR) move(slow, fast);
  else if(lbump_FL+lbump_CL < lbump_CR+lbump_FR) move(fast, slow+4);
}

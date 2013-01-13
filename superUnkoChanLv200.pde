import processing.serial.*;
import processing.video.*;

void setup(){
  size(320, 240);
  captureSetup();
  sensorSetup();
  behaveSetup();
  songSetup();
}

void draw(){
  captureDraw();
  sensorDraw();
  thinkDraw();
  motorDraw();
}


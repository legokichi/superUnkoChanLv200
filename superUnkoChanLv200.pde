import processing.serial.*;
import processing.video.*;

void setup(){
  size(320, 240);
  captureSetup();
  sensorSetup();
  behaveSetup();
}

void draw(){
  captureDraw();
  sensorDraw();
  thinkDraw();
  motorDraw();
}


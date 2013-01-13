Capture capture;

color colors[] = {color(255,0,0), color(0,255,0), color(0,0,255)};
int colorN = 0;

int X_ichi = -1;
int X_size = 0;

void captureSetup() {  
  capture = new Capture(this, width, height, 30);
}

void captureDraw(){
  image(capture, 0, 0);
  detectColor(colors[colorN]);
  fill(colors[0]);
  rect(0, 0, 10, 10);
  fill(colors[1]);
  rect(10, 0, 10, 10);
  fill(colors[2]);
  rect(20, 0, 10, 10);
  fill(colors[colorN]);
  rect(0, 10, 10, 10);
}

void captureEvent(Capture capture){
  capture.read();
}

void mousePressed(){
  colors[colorN] = capture.pixels[mouseX + mouseY * width];
}

void changeDetectColor(int n){
  if(colorN != n){
    colorN = n;
    X_ichi = 0;
    X_size = 0;
  }
}

void detectColor(color clr){
  boolean detection = false;
  int xmin = width;
  int xmax = 0;
  int ymin = height;
  int ymax = 0;
  int depth = 10;
  for(int i=0; i<width*height; i++){
    float difR = abs(  red(clr) -   red(capture.pixels[i]));
    float difG = abs(green(clr) - green(capture.pixels[i]));
    float difB = abs( blue(clr) -  blue(capture.pixels[i]));
    if(difR < depth && difG < depth && difB < depth){
      detection = true;
      xmin = min(i % width, xmin);
      xmax = max(i % width, xmax);
      ymin = min(i / width, ymin);
      ymax = max(i / width, ymax);
    }
  }
  if(detection){
    int x = (xmin+xmax) / 2;
    int y = (ymin+ymax) / 2;
    X_ichi = x;
    X_size = xmax-xmin;
    fill(color(255, 0, 0));
    ellipse(x, y, 20, 20);
    fill(color(255, 0, 0));
    rect(0, 0, 10, 10);
  }
}
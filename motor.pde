int motor_R = 0;
int motor_L = 0;

void motorDraw(){
  byte[] a = {
    byte(128), // START
    byte(132), // FULL
    byte(146), // Drive PWM
    byte(motor_R>>8),
    byte(motor_R),
    byte(motor_L>>8),
    byte(motor_L)
  };
  serial.write(a);
}

void move(int l, int r){
  motor_R = r;
  motor_L = l;
}
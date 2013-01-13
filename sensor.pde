Serial serial;

int lbump_L, lbump_FL, lbump_CL = 0;
int lbump_CR, lbump_FR, lbump_R = 0;

void sensorSetup(){
  serial = new Serial(this, "COM25", 115200);
  serial.clear();
}

void sensorDraw(){
  byte[] com = {
    128-256, // START
    132-256, // FULL
    149-256, // QUERYLIST
    6,  // Number of packagets
    46, // light bump left (2byte)
    47, // light bump front left (2byte)
    48, // light bump center left (2byte)
    49, // light bump center right (2byte)
    50, // light bump front right (2byte)
    51, // light bump right (2byte);
  };
  serial.write(com);
  if(serial.available()>0){
    byte[] buffer = new byte[12];
    serial.readBytes(buffer);
    lbump_L  = conv_byte2int(buffer[0], buffer[1]);
    lbump_FL = conv_byte2int(buffer[2], buffer[3]);
    lbump_CL = conv_byte2int(buffer[4], buffer[5]);
    lbump_CR = conv_byte2int(buffer[6], buffer[7]);
    lbump_FR = conv_byte2int(buffer[8], buffer[9]);
    lbump_R  = conv_byte2int(buffer[10],buffer[11]);
  }
}

int conv_byte2int(byte high_byte, byte low_byte){
  int low_val, high_val;
  if(low_byte<0)  low_val = int(low_byte) + 256;
  else            low_val = int(low_byte);
  if(high_byte<0) high_val = int(high_byte) + 256;
  else            high_val = int(high_byte); 
  return high_val*256 + low_val;
}

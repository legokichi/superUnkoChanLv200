void songSetup(){
  byte[] buffer = {
    byte(120), // START
    byte(132), // FULL
    byte(140), // Song
    byte(0),   // Song Number
    byte(1),   // Length
    byte(60),  // C4
    byte(34)   // 0.5sec
  };
  serial.write(buffer);
}

void playSong(){
  byte[] buffer = new byte[4];
  buffer[0] = byte(120); // START
  buffer[1] = byte(132); // FULL
  buffer[2] = byte(141); // Play
  buffer[3] = byte(0);   // Song Number
  serial.write(buffer);
}

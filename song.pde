void playBeep(){
  byte[] buffer = {
    byte(120), // START
    byte(132), // FULL
    byte(140), // Song
    byte(0),   // Song Number
    byte(1),   // Length
    byte(60),  // C4
    byte(34),  // 0.5sec
    byte(120), // START
    byte(132), // FULL
    byte(141), // Play
    byte(0)    // Song Number
  };
  serial.write(buffer);
}

void thinkDraw(){
  if(state == "test"){
    println(lbump_L+","+lbump_FL+","+lbump_CL+","+lbump_CR+","+lbump_FR+","+lbump_R);
    println(feelPole(80));
    println(feelColors(1, 2, 128, 192));

  }else if(state == "wait"){
    move(0, 0);

  }else if(state == "trackPole0"){ // ポール0へ2.5秒近づく
    if(checkTimer(2500)) changeState("avoidPole0");
    else                 trackColor(0);

  }else if(state == "avoidPole0"){ // ポール0を避ける進路を取る
    if(feelColor(0, 80, 90)) changeState("goForward");
    else                     move(63, -63);

  }else if(state == "goForward"){ // 3.7秒前進
    if(checkTimer(3700)) changeState("trackPole1AndGoal");
    else                 move(255, 255);

  }else if(state == "trackPole1AndGoal"){ // ポール1とゴールが重なる点へ近づく
    if(feelColors(1, 2, 128, 192)) changeState("trackPole1");
    else if(checkTimer(4000))      changeState("trackPole1"); // 4秒後にポール1のみを追う
    else                           trackColors(1, 2);

  }else if(state == "trackPole1"){ // ポール1へ近づく
    if(feelPole(80))          changeState("dribblePole1"); // ポール1をIRで感じられればドリブル
    else if(checkTimer(2000)) changeState("goBack");       // 2秒経っても見つけられなければ一旦ポール0へ戻る
    else                      trackColor(1);

  }else if(state == "dribblePole1"){ // IRセンサを使ったドリブル行動。願わくばこのままゴール。
    if(!feelPole(80))          changeState("goBack"); // ポール1を見失ったら一旦ポール0へ戻る
    else if(checkTimer(10000)) changeState("goBack"); // 10秒経ったらに一旦ポール0へ戻る。うまくゴールできていればこの機能は使わない
    else                       dribble(127, 63);

  }else if(state == "goBack"){ // 2秒バックしてからポール0を探す
    if(checkTimer(2000)) changeState("backToPole0");
    move(-127, -127);

  }else if(state == "backToPole0"){ // ポール0へ6秒戻ってからゴールを目指す。何かに失敗してゴールから外れた時のためのフェイルバック機能
    if(checkTimer(6000)) changeState("goalAlone");
    else                 trackColor(0);

  }else if(state == "goalAlone"){ // ゴールへ。15秒後、それでもゴールできない場合はランダムウォークを開始。
    if(checkTimer(15000)){ changeState("randomClean"); clean();}
    else                   trackColor(2);

  }else if(state == "randomClean"){ // 15秒間テキトーに掃除して回り、ゴールを探す行動に戻る
    if(checkTimer(15000)){ changeState("goalAlone"); trackColor(0);}

  }else{
    changeState("test");

  }
}
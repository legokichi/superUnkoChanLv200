void thinkDraw(){
  if(state == "test"){
    println(lbump_L+","+lbump_FL+","+lbump_CL+","+lbump_CR+","+lbump_FR+","+lbump_R);
    println(feelPole(80));

  }else if(state == "wait"){
    move(0, 0);

  }else if(state == "trackPole0"){ // ポール0へ2.5秒近づく
    if(checkTimer(2500)) changeState("avoidPole0");
    else                 trackColor(0);

  }else if(state == "avoidPole0"){ // ポール0を避ける進路を取る
    if(feelColor(0, 80, 90)) changeState("goForward");
    else                     move(63, -63);

  }else if(state == "goForward"){ // 3.7秒前進
    if(checkTimer(3700)) changeState("trackPole1");
    else                 move(255, 255);

  }else if(state == "trackPole1"){ // ポール1へ近づく
    if(feelPole(80))          changeState("dribblePole1"); // ポール1を感じらればドリブル
    else if(checkTimer(5000)) changeState("backToPole0");  // 5秒経っても見つけられなければ一旦ポール0へ戻る
    else                      trackColor(1);

  }else if(state == "dribblePole1"){ // IRセンサを使ったドリブル行動。願わくばこのままゴール。
    if(!feelPole(80))          changeState("backToPole0"); // ポール1を見失ったら一旦ポール0へ戻る
    else if(checkTimer(10000)) changeState("backToPole0"); // 10秒経ったらに自動的にポール0へ戻る
    else                       dribble(127, 63);

  }else if(state == "backToPole0"){ // ポール0へ4秒戻ってからゴールを目指す。何か失敗してゴールから外れた時のためのフェイルバック機能。
    if(checkTimer(8000)) changeState("goalAlone");
    else                 trackColor(0);

  }else if(state == "goalAlone"){ // ゴールへ。
    trackColor(2);

  }
}
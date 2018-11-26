class Planet {

  float Xplanet;
  float Yplanet;
  PShape imaPla;
  float Zplanet;

  int RdmVi;

  Planet(String fichier_planet, float PlX, float PlY, float PlZ) {
    imaPla = loadShape(fichier_planet);
    Xplanet = PlX;
    Yplanet = PlY;
    Zplanet =  PlZ;
    RdmVi = (int)random(5, 10);
  }

  void dessinerPlanet() {
    shape(imaPla, Xplanet, Yplanet, 100, 100);
  }

  void animPlanet() {

    if ( Yplanet < height) {
      Yplanet = Yplanet + RdmVi;
    } else
    {     
      Xplanet = random(50, 950);
      Yplanet = 0;
    }


    if (Ytir <= (Yplanet)+50 && Ytir >= (Yplanet)-50 && Xtir <= (Xplanet)+50 && Xtir >= (Xplanet)-50) {
      Xplanet = random(50, 950);
      Yplanet = -200;
      Xtir = 5000;
      scoreDeux++;
      Boum.play();
      Boum.rewind();
    }

    if (YtirDeux <= (Yplanet)+50 && YtirDeux >= (Yplanet)-50 && XtirDeux <= (Xplanet)+50 && XtirDeux >= (Xplanet)-50) {
      Xplanet = random(50, 950);
      Yplanet = -200;
      XtirDeux = 5000;
      score++;
      Boum.play();
      Boum.rewind();
    }

    /*if (logoX > 50 || logoX < 950){
     if (logoX < 500 && FuseXDeux > logoX){
     FuseXDeux -= 7;
     }
     if (logoX > 500 && FuseXDeux < logoX){
     FuseXDeux += 7;
     }
     } else if ( Xplanet >= 500 && !(FuseX >= (Xplanet)+50 && FuseX <= (Xplanet)-50)){
     if (FuseXDeux < 950) {
     FuseXDeux += 7;
     if (FuseXDeux >= Xplanet){
     FuseXDeux -= 7;
     }
     }
     } else if ( Xplanet <= 500 && !(FuseX >= (Xplanet)+50 && FuseX <= (Xplanet)-50)){
     if (FuseXDeux > 50) {
     FuseXDeux -= 7;
     if (FuseXDeux <= Xplanet){
     FuseXDeux += 7;
     }
     }
     }*/

    if (Yplanet >= 50){
     
     if ( Xplanet >= FuseXDeux){
     if (FuseXDeux < 950) {
     FuseXDeux = FuseXDeux + 5;
     }
     }
     
     if ( Xplanet <= FuseXDeux){
     if (FuseXDeux > 50) {
     FuseXDeux = FuseXDeux - 5;
     }
     }
     
     if (Yplanet >= (FuseYDeux-150)){
     if (Xplanet >= (FuseXDeux+50)){
     FuseXDeux = FuseXDeux - 5;
     } else if (Xplanet <= (FuseXDeux-50)){
     FuseXDeux = FuseXDeux + 5;
     }
     }
     
     if (Yplanet == FuseYDeux){
     if (Xplanet >= (FuseXDeux+50)){
     FuseXDeux = FuseXDeux - 5;
     } else if (Xplanet <= (FuseXDeux-50)){
     FuseXDeux = FuseXDeux + 5;
     }
     }
     }

    /*
    TESTTSDJGFSQJFGJSDHGFYJHSJHF
    
    if (Yplanet >= (FuseYDeux-100)) {
      if (Xplanet <= (FuseXDeux-10) && FuseXDeux > 50) {
        FuseXDeux += 5;
      } else if (Xplanet >= (FuseXDeux+10) && FuseXDeux < 950) {
        FuseXDeux -= 5;
      }
      
      if(Xplanet <= FuseXDeux){
        if (FuseXDeux > 50) {
     FuseXDeux = FuseXDeux - 5;
     }
      } else if (Xplanet >= FuseXDeux) {
        if (FuseXDeux < 950) {
     FuseXDeux = FuseXDeux + 5;
     }
      }
    }*/


    /*if ( Yplanet <= FuseYDeux && !(FuseX >= (Xplanet)+50 && FuseX <= (Xplanet)-50 && FuseY >=(Yplanet)+50 && FuseY <=(Yplanet)-50)){
     if (FuseYDeux < 950) {
     FuseYDeux = FuseYDeux + 7;
     }
     }
     
     if ( Yplanet >= FuseYDeux && !(FuseX >= (Xplanet)+50 && FuseX <= (Xplanet)-50 && FuseY >=(Yplanet)+50 && FuseY <=(Yplanet)-50)){
     if (FuseYDeux > 500) {
     FuseYDeux = FuseYDeux - 7;
     }
     }*/

    if (FuseY <= (logoY)+50 && FuseY >= (logoY)-50 && FuseX <= (logoX)+50 && FuseX >= (logoX)-50) {
      //fill(255);
      textSize(30); 
      text("+5", (FuseX+5), (FuseY+15));
      logoX = 5000;
      XtirDeux = 5000;
      scoreDeux += 5;
      Boum.play();
      Boum.rewind();
    }

    if (FuseYDeux <= (logoY)+50 && FuseYDeux >= (logoY)-50 && FuseXDeux <= (logoX)+50 && FuseXDeux >= (logoX)-50) {
      textSize(30); 
      //fill(223, 12, 27);
      text("+5", (FuseXDeux+5), (FuseYDeux+15));
      logoX = 5000;
      Xtir = 5000;
      score += 5;
      Boum.play();
      Boum.rewind();
    }

    if (FuseY <= (Yplanet)+50 && FuseY >= (Yplanet)-50 && FuseX <= (Xplanet)+50 && FuseX >= (Xplanet)-50) {
      end = true;
      if (end == true) {
        savedTime = millis();
        cursor();
        Fin.play();
        fill(29, 29, 27);
        rect(500, 500, width, height);
        fill(255);
        textSize(35); 
        text("Score : "+score, 500, 450);
        text("La fusée blanche a gagné", 500, 500);
        //textSize(16); 
        //text("(Yes les bugs)", 250, 530);
        rect(replayX, replayY, 200, 50);
        textSize(25); 
        fill(29, 29, 27);
        text("Replay", 500, 590);
        mousePressed();
      }
    }

    if (score == 100) {
      end = true;
      if (end == true) {
        savedTime = millis();
        cursor();
        Fin.play();
        fill(29, 29, 27);
        rect(500, 500, width, height);
        fill(255);
        textSize(35); 
        text("Score : "+score, 500, 450);
        text("La fusée blanche a gagné", 500, 500);
        //textSize(16); 
        //text("(Yes les bugs)", 250, 530);
        rect(replayX, replayY, 200, 50);
        textSize(25); 
        fill(29, 29, 27);
        text("Replay", 500, 590);
        mousePressed();
      }
    }

    if (scoreDeux == 100) {
      end = true;
      if (end == true) {
        savedTime = millis();
        cursor();
        Fin.play();
        fill(29, 29, 27);
        rect(500, 500, width, height);
        fill(223, 12, 27);
        textSize(35); 
        text("Score : "+scoreDeux, 500, 450);
        text("La fusée rouge a gagné", 500, 500);
        //textSize(16); 
        //text("(Yes les bugs)", 250, 530);
        rect(replayX, replayY, 200, 50);
        textSize(25); 
        fill(29, 29, 27);
        text("Replay", 500, 590);
        mousePressed();
      }
    }

    if (FuseYDeux <= (Yplanet)+50 && FuseYDeux >= (Yplanet)-50 && FuseXDeux <= (Xplanet)+50 && FuseXDeux >= (Xplanet)-50) {
      end = true;
      if (end == true) {
        savedTime = millis();
        cursor();
        Fin.play();
        fill(29, 29, 27);
        rect(500, 500, width, height);
        fill(223, 12, 27);
        textSize(35); 
        text("Score : "+scoreDeux, 500, 450);
        text("La fusée rouge a gagné", 500, 500);
        //textSize(16); 
        //text("(Yes les bugs)", 250, 530);
        rect(replayX, replayY, 200, 50);
        textSize(25); 
        fill(29, 29, 27);
        text("Replay", 500, 590);
        mousePressed();
      }
    }
  }
}

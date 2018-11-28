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
    RdmVi = (int)random(10, 15);
  }

  void dessinerPlanet() {
    shape(imaPla, Xplanet, Yplanet, 100, 100);
  }

  void animPlanet() {

    if ( Yplanet < height) {
      Yplanet = Yplanet + RdmVi;
    } else {     
      Xplanet = random(50, (width-50));
      Yplanet = -100;
    }


    if (Ytir <= (Yplanet)+50 && Ytir >= (Yplanet)-50 && Xtir <= (Xplanet)+50 && Xtir >= (Xplanet)-50) {
      Xplanet = random(50, (width-50));
      Yplanet = -200;
      Xtir = 5000;
      score++;
      //Boum.play();
      //Boum.rewind();
    }

    if (YtirDeux <= (Yplanet)+50 && YtirDeux >= (Yplanet)-50 && XtirDeux <= (Xplanet)+50 && XtirDeux >= (Xplanet)-50) {
      Xplanet = random(50, (width-50));
      Yplanet = -200;
      XtirDeux = 5000;
      score++;
      //Boum.play();
      //Boum.rewind();
    }

    if (Yplanet >= 100) {

      if (  Xplanet >= (c5.FuseX+50) ) {
        if (c5.FuseX < width-50) {
          c5.FuseX += 10;
        }
      }


      if ( Xplanet <= (c5.FuseX-50)) {
        if (c5.FuseX > 50) {
          c5.FuseX -= 10;
        }
      }

      if ( Yplanet >= (c5.FuseY-50)) {
        if (  Xplanet >= c5.FuseX ) {
          c5.FuseX -= 10;
        }
        if (  Xplanet <= c5.FuseX ) {
          c5.FuseX += 10;
        }
      }

      if (Xplanet >= (c5.FuseX+100) || Xplanet <= (c5.FuseX-100)) {
        if (Yplanet <= (c5.FuseY-100)) {
          if (c5.FuseY < (height-50)) {
            c5.FuseY = c5.FuseY + 5;
          }
        }

        if (Yplanet > (c5.FuseY+10)) {
          if (c5.FuseY > 500) {
            c5.FuseY = c5.FuseY - 5;
          }
        }
      }
    }

    // si variable boolean vrai alors pousse
    // variable si 0.25s passe a se deplacer dans x direction


    if (c2.FuseX + 22 >= c5.FuseX - 22 && c2.FuseX - 22 <= c5.FuseX + 22 && c2.FuseY - 50 > c5.FuseY && c2.FuseY -50 <= c5.FuseY +50) {
      c2.FuseY = c2.FuseY + 50;  
      c5.FuseY = c5.FuseY - 50;
    }
    if (c2.FuseX + 22 >= c5.FuseX - 22 && c2.FuseX - 22 <= c5.FuseX + 22 && c2.FuseY + 50 < c5.FuseY && c2.FuseY + 50 >= c5.FuseY - 50) {
      c2.FuseY = c2.FuseY - 50;  
      c5.FuseY = c5.FuseY + 50;
    }

    if (c2.FuseX -22 > c5.FuseX && c2.FuseX - 22 <= c5.FuseX + 22 && c2.FuseY + 50 >= c5.FuseY - 50 && c2.FuseY - 50 <= c5.FuseY +50) {
      c2.FuseX = c2.FuseX + 50;
      c5.FuseX = c5.FuseX - 50;
    }
    if (c2.FuseX + 22 < c5.FuseX && c2.FuseX + 22 >= c5.FuseX - 22 && c2.FuseY + 50 >= c5.FuseY - 50 && c2.FuseY - 50 <= c5.FuseY +50) {
      c2.FuseX = c2.FuseX - 50;
      c5.FuseX = c5.FuseX + 50;
    }











    if (logoX >= 100 && logoX <= (width-100) && c5.FuseX > 500) {
      if (logoX >= c5.FuseX) {
        c5.FuseX = c5.FuseX + 10;
      }
      if (logoX <= c5.FuseX) {
        c5.FuseX = c5.FuseX - 10;
      }
      if (logoY <= c5.FuseY) {
        c5.FuseY = c5.FuseY - 10;
      }
      if (logoY >= c5.FuseY) {
        c5.FuseY = c5.FuseY +10;
      }
    }

    if (c2.FuseY <= (logoY)+50 && c2.FuseY >= (logoY)-50 && c2.FuseX <= (logoX)+50 && c2.FuseX >= (logoX)-50) {
      //fill(255);
      textSize(30); 
      text("+5", (FuseX+5), (FuseY+15));
      logoX = 5000;
      XtirDeux = 5000;

      scoreDeux += 5;

      //Boum.play();
      //Boum.rewind();
    }

    if (c5.FuseY <= (logoY)+50 && c5.FuseY >= (logoY)-50 && c5.FuseX <= (logoX)+50 && c5.FuseX >= (logoX)-50) {
      textSize(30); 
      //fill(223, 12, 27);
      text("+5", (c5.FuseX+5), (c5.FuseY+15));
      logoX = 5000;
      Xtir = 5000;
      score += 5;


      //Boum.play();
      //Boum.rewind();
    }

    if (c2.FuseY <= (Yplanet)+50 && c2.FuseY >= (Yplanet)-50 && c2.FuseX <= (Xplanet)+50 && c2.FuseX >= (Xplanet)-50) {
      end = true;
      if (end == true) {
        savedTime = millis();
        cursor();
        Fin.play();
        fill(29, 29, 27);
        rect(width/2, height/2, width, height);
        fill(255);
        textSize(35); 
        text("Score : "+score, width/2, (height/2)-50);
        text("La fusée blanche a gagné", width/2, height/2);
        //textSize(16); 
        //text("(Yes les bugs)", 250, 530);
        rect(22, 50, replayX, replayY);
        textSize(25); 
        fill(29, 29, 27);
        text("Replay", width/2, (height/2)+50);
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
        rect(width/2, height/2, width, height);
        fill(255);
        textSize(35); 
        text("Score : "+score, width/2, (height/2)-50);
        text("La fusée blanche a gagné", width/2, (height/2));
        //textSize(16); 
        //text("(Yes les bugs)", 250, 530);
        rect(22, 50, replayX, replayY);
        textSize(25); 
        fill(29, 29, 27);
        text("Replay", width/2, (height/2)+50);
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
        rect(width/2, height/2, width, height);
        fill(223, 12, 27);
        textSize(35); 
        text("Score : "+scoreDeux, width/2, (height/2)-50);
        text("La fusée rouge a gagné", width/2, height/2);
        //textSize(16); 
        //text("(Yes les bugs)", 250, 530);
        rect(22, 50, replayX, replayY);
        textSize(25); 
        fill(29, 29, 27);
        text("Replay", width/2, (height/2)+50);
        mousePressed();
      }
    }

    if (c5.FuseY <= (Yplanet)+50 && c5.FuseY >= (Yplanet)-50 && c5.FuseX <= (Xplanet)+50 && c5.FuseX >= (Xplanet)-50) {
      end = true;
      if (end == true) {
        savedTime = millis();
        cursor();
        Fin.play();
        fill(29, 29, 27);
        rect(width/2, height/2, width, height);
        fill(223, 12, 27);
        textSize(35); 
        text("Score : "+scoreDeux, width/2, (height/2)-50);
        text("La fusée rouge a gagné", width/2, height/2);
        //textSize(16); 
        //text("(Yes les bugs)", 250, 530);
        rect(22, 50, replayX, replayY);
        textSize(25); 
        fill(29, 29, 27);
        text("Replay", width/2, (height/2)+50);
        mousePressed();
      }
    }
  }
}

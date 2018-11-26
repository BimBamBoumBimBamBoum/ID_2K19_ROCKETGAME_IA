class Logo {

  PShape logogo = loadShape("imm.svg");
  float tailleLogo;
  
  boolean goRight = false;
  boolean goLeft = false;
  
  int randomLogo;

  Logo() {
    //logogo.disableStyle();
    //logoX = -500;
    //logoY = 500;
    logoY = random(550,700);
    tailleLogo = 0.3;
    if (logoAlea == 0){
      logoX = -100;
      goRight = true;
    } else{
      logoX = (width+100);
      goLeft = true;
    }
    randomLogo = (int)random(30000,50000);
  }

  void dessinerLogo() {
    //fill(223, 12, 27);
      shape(logogo, logoX, logoY, tailleLogo*logogo.getWidth(), tailleLogo*logogo.getHeight());
  }
  
  void animerLogo() {
    
    if (randomLogo <= TimerLogo){
    if (goRight == true){
      logoX = logoX + 5;
    }
    if (goLeft == true){
      logoX = logoX - 5;
    }
    //logoX = (logoX + 2)+random(-5,5);
    logoY = (logoY +random(-10,10));
    }
  }
}

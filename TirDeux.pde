class TirDeux {


  PShape imaTirDeux;
  float ZtirDeux;
  
  PShape TirBoumDeux = loadShape("tir.svg");

  TirDeux(String fichier_tirDeux, float tirXdeux, float tirYdeux, float tirZdeux) {
    imaTirDeux = loadShape(fichier_tirDeux);
    XtirDeux = tirXdeux;
    YtirDeux = tirYdeux;
    ZtirDeux =  tirZdeux;
    XtirDeux = FuseXDeux;
    imaTirDeux.disableStyle();
  
  }

  void dessinerTirDeux() {
    
   /*  */

    //tirY = FuseY;
    fill(255);
    /*for (int i = 0; i < tirboum.size() ; i++){
      TirDeux tirboum = (TirDeux) tirboum.get(i);*/
      shape(imaTirDeux, XtirDeux, YtirDeux, imaTirDeux.getWidth(), imaTirDeux.getHeight());
      YtirDeux = YtirDeux - 70;
  }
  

  void animTirDeux() {
    
    /*tirboum.add( new TirDeux("tir.svg", 0, testPos, 5));*/
    
    if (YtirDeux <= (-5)) {
      XtirDeux = 500000;
    }

    if ( YtirDeux <= (FuseYDeux-height)) {
      YtirDeux = FuseYDeux;
      XtirDeux = FuseXDeux;
      aah.rewind();
      //Xsmo = random(0,width);
      //translate(random(0, width), 5);
    } else
    {
      if (song.isPlaying() == false) {
        aah.play();
      }
    }
  }
}

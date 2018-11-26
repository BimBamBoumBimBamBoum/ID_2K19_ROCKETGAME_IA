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

    //tirY = FuseY;
    fill(255);
    shape(imaTirDeux, XtirDeux, YtirDeux, imaTirDeux.getWidth(), imaTirDeux.getHeight());
    YtirDeux = YtirDeux - 70;
  }

  void animTirDeux() {

    if ( YtirDeux <= (FuseYDeux-height)) {
      YtirDeux = FuseYDeux;
      XtirDeux = FuseXDeux;
      Piou.rewind();
      //Xsmo = random(0,width);
      //translate(random(0, width), 5);
    } else
    {
      if (song.isPlaying() == false) {
        Piou.play();
      }
    }
  }
}

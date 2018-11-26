class Tir {


  PShape imaTir;
  float Ztir;

  PShape TirBoum = loadShape("tir.svg");

  Tir(String fichier_tir, float tirX, float tirY, float tirZ) {
    imaTir = loadShape(fichier_tir);
    Xtir = tirX;
    Ytir = tirY;
    Ztir =  tirZ;
    Xtir = FuseX;
  }

  void dessinerTir() {

    //tirY = FuseY;
    shape(imaTir, Xtir, Ytir, imaTir.getWidth(), imaTir.getHeight());
    Ytir = Ytir - 70;
  }

  void animTir() {

    if ( Ytir <= (FuseY-height)) {
      Ytir = FuseY;
      Xtir = FuseX;
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

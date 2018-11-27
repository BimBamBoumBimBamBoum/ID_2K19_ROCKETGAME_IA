class Tir {
  PShape imaTir;
  int Xtir;
  int Ytir;

  Tir(String fichier_tir) {
  imaTir = loadShape(fichier_tir);
  Xtir=0;
  Ytir=0;

  }

  void dessinerTir() {
    shape(imaTir, Xtir, Ytir, imaTir.getWidth(), imaTir.getHeight());
  }

  void animTir() {
    Ytir=Ytir-30;
    if ( Ytir <= (FuseY-height)) {
      //ooh.rewind();
    } else
    {
        //ooh.play();
    }
  }
 
}

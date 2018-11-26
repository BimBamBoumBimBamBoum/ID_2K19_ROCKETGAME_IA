class Smoke {

  float Xsmo;
  float Ysmo;
  PShape imaSmo;
  float Zsmo;


  color couleur;
  int aleColor = (int)random(0, 3);

  PShape ElliSmoke = loadShape("Espace.svg");

  Smoke(String fichier_smoke, float SmoX, float SmoY, float SmoZ) {
    imaSmo = loadShape(fichier_smoke);
    Xsmo = SmoX;
    Ysmo = SmoY;
    Zsmo =  SmoZ;
    Xsmo = FuseX;
  }

  void dessinerElipse() {

    Ysmo = FuseY;

    imaSmo.disableStyle();
    switch(aleColor) {
    case 0:
      couleur = color(#1F1E1B);
      break;
    case 1:
      couleur = color(#DF0C1B);
      break;
    case 2:
      couleur = color(255);
      break;
    }

    fill(couleur);
    shape(imaSmo, Xsmo, Ysmo, 50, 50);
  }

  void animElipse() {

    if ( Ysmo < height) {
      Ysmo = Ysmo + 5;
      //Xsmo = random(0,width);
      //translate(random(0, width), 5);
    } else
    {     
      Ysmo = FuseY;
      Xsmo = FuseX;
    }
  }
}

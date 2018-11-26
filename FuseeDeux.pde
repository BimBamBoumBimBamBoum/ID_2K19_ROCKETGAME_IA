class FuseeDeux {

    PShape fuseDeux = loadShape("Fusee.svg");
  PShape corpsDeux = fuseDeux.getChild("Corps");
  PShape etingDeux;
  PShape etincDeux; 
  PShape etindDeux;

  float taille;


  int randomDeux;
  int randomdDeux;
  int randomcDeux;

  //Méthodes
  FuseeDeux() {
    FuseXDeux = 0+width/4*1;
    FuseYDeux = height - 100;
    tirX = FuseXDeux;
    tirY = FuseYDeux;
    fuseDeux.disableStyle();
    taille = 0.5;

    etingDeux = fuseDeux.getChild("Etincelle_G");
    etincDeux = fuseDeux.getChild("Etincelle_M");
    etindDeux = fuseDeux.getChild("Etincelle_D");
  }

  void dessinerFuseeDeux() {    

    randomDeux = (int)random(4);
    randomdDeux = (int)random(4);
    randomcDeux = (int)random(4);

    // Affiche un tir et le fait se deplacer en y
    //shape(tir, tirX, tirY, tir.getWidth(), tir.getHeight());
    //tirY = tirY - 15;

    // Affichage fusee
    fill(255);
    shape(corpsDeux, FuseXDeux, FuseYDeux, taille*fuseDeux.getWidth(), taille*fuseDeux.getHeight());

    if (randomDeux == 1) {
      shape(etingDeux, FuseXDeux, FuseYDeux, taille*fuseDeux.getWidth(), taille*fuseDeux.getHeight());
    } else {
      randomDeux = (int)random(3);
    }
    if (randomcDeux == 2) {
      shape(etincDeux, FuseXDeux, FuseYDeux, taille*fuseDeux.getWidth(), taille*fuseDeux.getHeight());
    } else {
      randomcDeux = (int)random(3);
    }
    if (randomdDeux == 3) {
      shape(etindDeux, FuseXDeux, FuseYDeux, taille*fuseDeux.getWidth(), taille*fuseDeux.getHeight());
    } else {
      randomdDeux = (int)random(3);
    }
  }
}

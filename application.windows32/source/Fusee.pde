class Fusee {

  PShape fuse = loadShape("Fusee.svg");
  PShape corps = fuse.getChild("Corps");
  PShape eting;
  PShape etinc; 
  PShape etind;

  float taille;



  int random;
  int randomd;
  int randomc;

  //Méthodes
  Fusee() {
    FuseX = 750;
    FuseY = 900;
    tirX = FuseX;
    tirY = FuseY;
    fuse.disableStyle();
    taille = 0.5;

    eting = fuse.getChild("Etincelle_G");
    etinc = fuse.getChild("Etincelle_M");
    etind = fuse.getChild("Etincelle_D");
  }

  void dessinerFusee() {    

    random = (int)random(4);
    randomd = (int)random(4);
    randomc = (int)random(4);

    // Affiche un tir et le fait se deplacer en y
    //shape(tir, tirX, tirY, tir.getWidth(), tir.getHeight());
    //tirY = tirY - 15;

    // Affichage fusee
    fill(223, 12, 27);
    shape(corps, FuseX, FuseY, taille*fuse.getWidth(), taille*fuse.getHeight());

    if (random == 1) {
      shape(eting, FuseX, FuseY, taille*fuse.getWidth(), taille*fuse.getHeight());
    } else {
      random = (int)random(3);
    }
    if (randomc == 2) {
      shape(etinc, FuseX, FuseY, taille*fuse.getWidth(), taille*fuse.getHeight());
    } else {
      randomc = (int)random(3);
    }
    if (randomd == 3) {
      shape(etind, FuseX, FuseY, taille*fuse.getWidth(), taille*fuse.getHeight());
    } else {
      randomd = (int)random(3);
    }


    // Controls
    if (end != true) {
      if (haut == true && FuseY > 500) {
        FuseY -= 7;
      }

      if (bas == true && FuseY < 950) {
        FuseY += 7;
      }

      if (gauche == true && FuseX > 50) {
        FuseX -= 7;
      }

      if (droite == true && FuseX < 950) {
        FuseX += 7;
      }
    }
  }
}

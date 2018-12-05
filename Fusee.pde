class Fusee {

  PShape fuse = loadShape("Fusee.svg");
  PShape corps = fuse.getChild("Corps");
  PShape eting;
  PShape etinc; 
  PShape etind;

  float taille;
  
  
  int FuseX;
  int FuseY;



  int random;
  int randomd;
  int randomc;

  //Méthodes
  Fusee() {
    FuseX=0;
    FuseY=0;
    tirX = FuseX;
    tirY = FuseY;
    fuse.disableStyle();
    taille = 0.5;

    eting = fuse.getChild("Etincelle_G");
    etinc = fuse.getChild("Etincelle_M");
    etind = fuse.getChild("Etincelle_D");
  }

  void dessinerFusee(int FuseX,int FuseY) {    

    random = (int)random(4);
    randomd = (int)random(4);
    randomc = (int)random(4);

    // Affichage fusee
    //fill(223, 12, 27);
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
  }
  
  
  
  // Correction deplacements 
  void animFusee() { 

   if (gazeTrack.getGazeX() > FuseX && FuseX < width-50){
      //droite = true;
      FuseX += 10;
    }
    if (gazeTrack.getGazeX() < FuseX && FuseX > 50){
      //gauche = true;
      FuseX -= 10;
    }
    if (gazeTrack.getGazeY() > FuseY && FuseY < height-50){
      //bas = true;
      FuseY += 10;
    }
    if (gazeTrack.getGazeY() < FuseY && FuseY > 500){
      //haut = true;
      FuseY -= 10;
    }
  }
}
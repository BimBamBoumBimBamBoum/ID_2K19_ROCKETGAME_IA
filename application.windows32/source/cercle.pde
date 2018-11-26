class cercle {

  //Atributs
  PShape image = loadShape("Espace.svg");
  PShape halo1;
  PShape halo2;
  PShape halo3;

  //Méthodes
  cercle() {

    halo1 = image;
    halo2 = image;
    halo3 = image;

    image.disableStyle();
  }

  void dessinerCercle() {

    // Dessine 3 halos

    fill(color(#595B65), 150);
    shape(halo1, 500, 1000, 510, 510);

    fill(color(#595B65), 100);
    shape(halo2, 500, 1000, 1000, 1000);

    fill(color(#595B65), 50);
    shape(halo3, 500, 1000, 1500, 1500);
  }
}

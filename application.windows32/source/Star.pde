class Star extends Etoiles {

  Star(float tr, float tx, float ty, color tc, float to) {

    super(0, tr, tx, ty, tc, to);
  }

  void Move() {
    location.x = location.x + random(-1, 1);
    location.y = location.y + random(-1, 1);

    constrain(location.x, 0, width);
    constrain(location.y, 0, height);
  }
}

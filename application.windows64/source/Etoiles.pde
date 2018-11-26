class Etoiles {

  float r;
  color c;
  float o;
  float spring = 0;
  float gravity = 0;
  float friction = -0.1;

  boolean active = false;
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  int id;
  Etoiles(float m, float tr, float tx, float ty, color tc, float to) {
    r = tr;
    c = tc;
    o = to;


    mass = m;
    location = new PVector(tx, ty);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
  Etoiles(float m, float tr, float tx, float ty, color tc, float to, int idin) {

    r = tr;
    c = tc;
    o = to;
    id = idin;


    mass = m;
    location = new PVector(tx, ty);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  void setPos(float tx, float ty) {
    location.x = tx;
    location.y = ty;
  }

  // Newton’s second law.
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void Draw() {
    fill(c, o);
    ellipse(location.x, location.y, r, r);
  }


  void collide() {
  }

  // Somewhat arbitrarily, we are deciding that an object bounces when it hits the edges of a window.
  void Move() {

    if (location.x > width) {
      location.x = width;
      velocity.x *= 0;
    } else if (location.x < 0) {
      velocity.x *= 0;
      location.x = 0;
      collide();
    }

    if (location.y > height) {
      velocity.y *= 0;
      location.y = height;
      collide();
    }
  }



  void Slide() {

    if (location.y > height) {
      location.y = location.y -10;
    }
  }
}

class Particle {
  float x;
  float y;
  float velocity = 0;
  float gravity = 0.1;
  boolean active = false;
  
  Particle(float x_, float y_) {
    x = x_;
    y = y_;
  }
  
  void display() {
    stroke(255);
    point(x, y);
  }
  
  void update() {
    if (active) {
      velocity += gravity;
      y += velocity;
    }
    else {
      int choice = int(random(100));
      if (choice <= 5) {
        active = true;
      }
    }
  }
}
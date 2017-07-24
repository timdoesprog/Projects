class Particle {
  PVector location;
  PVector velocity;
  PVector gravity = new PVector(0, 0.1);
  float l;
  
  Particle(float x, float y, float l_) {
    location = new PVector(x, y);
    velocity = PVector.random2D().setMag(1.5);
    l = l_;
  }
  
  void update() {
    velocity.add(gravity);
    location.add(velocity);
  }
  
  void display() {
    noStroke();
    fill(255);
    ellipse(location.x, location.y, l, l);
  }
}
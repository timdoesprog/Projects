class Particle {

  PVector location;
  PVector velocity = new PVector(0, 0);
  PVector acceleration = new PVector(0, 0);
  
  Particle(float x, float y) {
    location = new PVector(x, y);
  }
  
  void display() {
    stroke(255, 15);
    strokeWeight(4);
    point(location.x, location.y);
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void attracted(PVector target) {
    PVector force = PVector.sub(target, location);
    float distance = force.mag();
    float G = 0.667408;
    float strength = G / distance * distance;
    force.normalize();
    force.mult(strength);
    force.limit(0.1);
    acceleration.add(force);
    acceleration.limit(0.5);
  }
}
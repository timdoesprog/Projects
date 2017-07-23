class Ball {
  PVector location;
  PVector acceleration;
  PVector velocity;
  
  PVector gravity;
  int size;
  
  Ball(float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    gravity = new PVector(0, 0.1);
    size = 16;
  }
  
  void display() {
    noStroke();
    fill(255);
    ellipse(location.x, location.y, size, size);
  }
  
  void update() {
    applyForce(gravity);
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    
    bounce();
    checkSides();
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void bounce() {
    if (location.y > height - size/2) {
      velocity.y *= -1;
    }
  }
  
  void checkSides() {
    if (location.x >= width) {
      location.x = 0;
    }
    else if (location.x <= 0) {
      location.x = width;
    }
  }
  
  void airResistance() {
    PVector force = new PVector(acceleration.x *= -1, 0);
    applyForce(force);
  }
}
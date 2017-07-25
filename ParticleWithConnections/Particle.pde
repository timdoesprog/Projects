class Particle {
  PVector location;
  PVector velocity;
  int radius = 4;
  
  Particle(float x, float y) {
    location = new PVector(x, y);
    velocity = PVector.random2D().setMag(1);
  }
  
  void display() {
    noStroke();
    fill(255);
    ellipse(location.x, location.y, radius*2, radius*2);
  }
  
  void update() {
    location.add(velocity);
    checkEdges();
  }
  
  void checkEdges() {
    if (location.x > width - radius || location.x < 0 + radius) {
      velocity.x *= -1;
    }
    
    if (location.y > height - radius || location.y < 0 + radius) {
      velocity.y *= -1;
    }
  }
}
class Particle {
  PVector location;
  PVector velocity;
  int radius = 4;
  
  Particle(float x, float y) {
    location = new PVector(x, y);
    velocity = PVector.random2D().setMag(4);
  }
  
  void display() {
    noStroke();
    color c = img.pixels[int(location.x) + int(location.y) * width];
    fill(c);
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
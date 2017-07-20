class Bird {
  PVector location;
  PVector velocity;
  PVector gravity;
  PVector upward;
  int size = 12;
  boolean alive = true;
  
  Bird() {
    location = new PVector(50, height/2);
    velocity = new PVector(0, 0);
    gravity = new PVector(0, 0.2);
    upward = new PVector(0, -5);
  }
  
  void display() {
    noStroke();
    fill(252,130,195);
    ellipse(location.x, location.y, size*2, size*2);
  }
  
  void update() {
    velocity.add(gravity);
    velocity.limit(6);
    location.add(velocity);
  }
  
  void swing() {
    velocity.add(upward);
  }
  
  void checkForObstacles() {
    if (location.y <= 0 || location.y >= height) {
      alive = false;
      return;
    }
    for (Obstacle o : obstacles) {
      // square box collider
      if (location.x >= o.x + size && location.x <= o.x + o.size + size) {
        if (location.y > o.down || location.y < o.up) {
          alive = false;
        }
      }
    }
  }
}
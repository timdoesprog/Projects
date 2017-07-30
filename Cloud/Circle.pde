class Circle {
  PVector location;
  int growingCycles;
  int radius;
  int shade;
  
  Circle(PVector l) {
    location = l;
    growingCycles = int(random(1, 20));
    radius = int(random(2, 20));
    shade = int(random(220, 255));
  }
  
  void display() {
    noStroke();
    fill(shade);
    ellipse(location.x, location.y, radius*2, radius*2);
  }
  
  void update() {
    if (growingCycles > 0) {
      radius++;
      growingCycles--;
    }
  }
}
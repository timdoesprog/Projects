class Obstacle {
  float up;
  float down;
  float x;
  float size;
  float gap = 150;
  
  Obstacle() {
    up = random(75, height - 150);
    down = up + gap;
    x = width + 30;
    size = 40;
  }
  
  void display() {
    noStroke();
    fill(24,221,0);
    rect(x, 0, size, up);
    rect(x, down, size, height);
  }
  
  void update() {
    x -= 3;
  }
}
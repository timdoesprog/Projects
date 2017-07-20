class Raindrop {
  float x;
  float y;
  float z;
  float speed;
  float size;
  boolean visible = true;
  
  Raindrop(float x_, float y_) {
    x = x_;
    y = y_;
    z = random(1, 10);
    speed = map(z, 1, 10, 5, 1);
    size = map(z, 1, 10, 7, 3);
  }
  
  void display() {
    if (visible) {
      stroke(255);
      line(x, y, x, y + size);
    }
  }
  
  void update() {
    y += speed;
    if (y > height) {
      y = random(-100, -10);
      x = random(0, width);
      visible = true;
    }
  }
}
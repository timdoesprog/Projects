class Star {
  float x;
  float y;
  float z;
  
  Star() {
    x = random(-width, width);
    y = random(-height, height);
    z = random(width);
  }
  
  void display() {
    fill(255);
    noStroke();
    
    float sx = map(x/z, 0, 1, 0, width);
    float sy = map(y/z, 0, 1, 0, height);
    float size = map(z, 0, width, 16, 0);
    
    ellipse(sx, sy, size, size);
  }
  
  void update() {
    z -= 10;
    if (z <= 1) {
      z = width;
      x = random(-width, width);
      y = random(-height, height);
    }
  }
}
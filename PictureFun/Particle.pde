class Particle {
  PVector location;
  PVector velocity;
  int radius;
  int changeRate;
  color c;
  
  Particle(float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(0, 1);
    radius = 8;
    changeRate = int(random(1, 10));
    img.loadPixels();
    int index = int(location.x + location.y * width);
    c = color(img.pixels[index], 20);
  }
  
  void update() {
    location.add(velocity);
    changeRate--;
    if (changeRate <= 0) {
      changeRate = int(random(1, 10));
      img.loadPixels();
      int index = int(location.x + location.y * width);
      if (index < img.pixels.length) c = color(img.pixels[index], 20);
    }
  }
  
  void display() {
    noStroke();
    fill(c);
    ellipse(location.x, location.y, radius*2, radius*2);
  }
}
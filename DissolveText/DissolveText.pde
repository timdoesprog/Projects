ArrayList<Particle> particles = new ArrayList<Particle>();
color textColor = color(255);


void setup() {
  size(800, 480);
  background(51);
  // draw text
  fill(textColor);
  textSize(128);
  text("Valerija", 180, 200);
  // initialize points array with the right colors
  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int index = x + y * width;
      if (color(pixels[index]) == color(textColor)) {
        particles.add(new Particle(x, y));
      }
    }
  }
}

void draw() {
  background(51);
  
  for (Particle p : particles) {
    p.update();
    p.display();
  }
  
  // clean up when the particles reach the bottom of the window
  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = particles.get(i);
    if (p.y >= height) {
      particles.remove(i);
    }
  }
}
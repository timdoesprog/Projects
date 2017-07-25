PImage img;
Particle[] particles;


void setup() {
  size(322, 380);
  img = loadImage("flowers.jpg");
  particles = new Particle[40];
  background(51);
}


void draw() {
  img.loadPixels();
  for (int i = 0; i < particles.length; i++) {
    if (particles[i] != null) {
      particles[i].update();
      particles[i].display();
    }
  }
}

void mousePressed() {
  // mouse press will spawn particles
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle(mouseX, mouseY);
  }
}

void keyPressed() {
  if (key == ' ') {
    noLoop();
  }
}
Particle[] particles;
PImage img;


void setup() {
  size(1500, 844);
  background(51);
  img = loadImage("horizon.jpg");
  particles = new Particle[100];
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle(map(i, 0, particles.length - 1, 0, width), 0);
  }
}

void draw() {
  for (int i = 0; i < particles.length; i++) {
    particles[i].update();
    particles[i].display();
  }
}
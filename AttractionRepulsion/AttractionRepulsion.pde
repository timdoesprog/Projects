PVector[] attractors = new PVector[10];
Particle[] particles = new Particle[50];

void setup() {
  size(400, 400);
  for (int i = 0; i < attractors.length; i++) {
    attractors[i] = new PVector(random(width), random(height));
  }
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle(random(width), random(height));
  }
  background(51);
}

void draw() {
  stroke(255);
  strokeWeight(4);
  for (int i = 0; i < attractors.length; i++) {
    point(attractors[i].x, attractors[i].y);
  }
  for (int i = 0; i < particles.length; i++) {
    particles[i].display();
    particles[i].update();
    for (int j = 0; j < attractors.length; j++) {
      particles[i].attracted(attractors[j]);
   }
  }
}
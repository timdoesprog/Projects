Raindrop[] drops;
ArrayList<Particle> particles;


void setup() {
  size(1200, 400);
  drops = new Raindrop[500];
  for (int i = 0; i < drops.length; i++) {
    drops[i] = new Raindrop(random(width), random(-500, -10));
  }
  particles = new ArrayList<Particle>();
}

void draw() {
  background(51);
  for (int i = 0; i < drops.length; i++) {
    // uncomment to toggle mouse input
    //PVector mouse = new PVector(mouseX, mouseY);
    //PVector distanceVector = PVector.sub(mouse, new PVector(drops[i].x, drops[i].y));
    //float distance = distanceVector.mag();
    //if (distance < 50) {
    //  drops[i].visible = false;
    //}
    drops[i].update();
    drops[i].display();
    
    // when drops reach the bottom, spawn particles for a splash effect
    if (drops[i].y >= height - 5) {
      float l = map(drops[i].z, 1, 10, 4, 1);
      for (int j = 0; j < 3; j++) {
        particles.add(new Particle(drops[i].x, drops[i].y, l));
      }
    }
  }
  
  // Particle loop with cleanup when they leave the screen
  for (int i = particles.size() - 1; i >= 0; i--) {
    Particle p = particles.get(i);
    if (p.location.y > height) {
      particles.remove(i);
    }
    else {
      p.update();
      p.display();
    }
  }
}
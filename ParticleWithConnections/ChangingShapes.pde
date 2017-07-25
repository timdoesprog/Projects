class ChangingShapes {
  
  Particle[] particles;
  
  ChangingShapes(int s) {
    particles = new Particle[s];
    for (int i = 0; i < particles.length; i++) {
      particles[i] = new Particle(random(width), random(height));
    }
  }
  
  void start() {
    display();
    makeConnections();
  }
  
  void display() {
    for (int i = 0; i < particles.length; i++) {
      particles[i].update();
      particles[i].display();
    }
  }
  
  void makeConnections() {
    for (int i = 0; i < particles.length; i++) {
      for (int j = 0; j < particles.length; j++) {
        if (particles[i] != particles[j]) {
          float distance = PVector.dist(particles[i].location, particles[j].location);
          if (distance < 100) {
            stroke(255, 150);
            strokeWeight(4);
            line(particles[i].location.x, particles[i].location.y,
              particles[j].location.x, particles[j].location.y);
          }
        }
      }
    }
  }
}
class ChangingTriangles {
  Particle[] particles;
  
  ChangingTriangles(int s) {
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
      // poor man's way of selected the two nearest points
      // works about 50% of the time or so
      Particle closest = findClosest(particles[i]);
      Particle secondClosest = findClosest(closest);
      fill(255, 60);
      noStroke();
      triangle(particles[i].location.x, particles[i].location.y, 
        closest.location.x, closest.location.y,
        secondClosest.location.x, secondClosest.location.y);
    }
  }
  
  Particle findClosest(Particle p) {
    // get something to compare the other distances to
    Particle closest;
    if (p == particles[0]) {
      closest = particles[1];
    }
    else {
      closest = particles[0];
    }
    
    for (int i = 1; i < particles.length; i++) {
      if (particles[i] != p) {
        if (PVector.dist(particles[i].location, p.location) < 
          PVector.dist(closest.location, p.location)) {
            closest = particles[i];
        }
      }
    }
    return closest;
  }
}
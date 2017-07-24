class Organism {
  PVector location;
  PVector acceleration;
  PVector velocity;
  float maxSpeed;
  float maxForce;
  float r;
  float life;
  boolean alive;
  
  Organism(float x, float y) {
    location = new PVector(x, y);
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, -2);
    maxSpeed = random(4, 6);
    maxForce = random(0.1, 0.2);
    r = 6;
    life = 100;
    alive = true;
  }
  
  void display() {
    if (!alive) {
      return;
    }
    // angle for rotation
    float theta = velocity.heading() + PI/2;
    fill(255);
    noStroke();
    pushMatrix();
    translate(location.x,location.y);
    rotate(theta);
    beginShape();
    vertex(-r, r*2);
    vertex(0, -r*2);
    vertex(r, r*2);
    endShape(CLOSE);
    popMatrix();
    
    life -= 0.1;
    if (life <= 0) {
      alive = false;
    }
  }
  
  void update() {
  velocity.add(acceleration);
  velocity.limit(maxSpeed);
  location.add(velocity);
  acceleration.mult(0);
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void seek(PVector target) {
    PVector desired = PVector.sub(target, location);
    desired.setMag(maxSpeed);
    // desired - velocity
    PVector force = PVector.sub(desired, velocity);
    force.limit(maxForce);
    applyForce(force);
  }
  
  // Method for arriving at a target
  // basically Steering with slowing down when near the target
  void arrive(PVector target) {
    PVector desired = PVector.sub(target, location);
    float distance = desired.mag();
    
    if (distance < 100) {
      float speed = map(distance, 0, 100, 0, maxSpeed);
      desired.setMag(speed);
    }
    else {
      desired.setMag(maxSpeed);
    }
    
    // desired - velocity
    PVector force = PVector.sub(desired, velocity);
    force.limit(maxForce);
    applyForce(force);
  }
}
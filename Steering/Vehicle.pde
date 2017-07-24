class Vehicle {
  PVector location;
  PVector acceleration;
  PVector velocity;
  float maxSpeed;
  float maxForce;
  float r;
  
  Vehicle(float x, float y) {
    location = new PVector(x, y);
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, -2);
    maxSpeed = 4;
    maxForce = 0.1;
    r = 6;
  }
  
  void display() {
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
    
    PVector force = PVector.sub(desired, velocity);
    force.limit(maxForce);
    applyForce(force);
  }
}
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
    velocity = PVector.random2D();
    maxSpeed = random(4, 8);
    maxForce = random(0.1, 0.3);
    r = 6;
  }
  
  void display() {
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
  }
  
  void update() {
  velocity.add(acceleration);
  velocity.limit(maxSpeed);
  location.add(velocity);
  acceleration.mult(0);
  checkEdges();
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void checkEdges() {
    // factor is needed to insure no index out of bound error
    int factor = 5;
    if (location.x >= width - factor) {
      location.x = 0 + factor;
    }
    else if (location.x <= 0 + factor) {
      location.x = width - factor;
    }
    if (location.y >= height - factor) {
      location.y = 0 + factor;
    }
    else if (location.y <= 0 + factor) {
      location.y = height - factor;
    }
  }
  
  void seek(PVector target) {
    PVector desired = PVector.sub(target, location);
    desired.setMag(maxSpeed);
    // desired - velocity
    PVector force = PVector.sub(desired, velocity);
    force.limit(maxForce);
    applyForce(force);
  }
  
  void align() {
    PVector sum = new PVector(0, 0);
    int count = 0;
    
    for (Vehicle other : vehicles) {
      float distance = PVector.dist(location, other.location);
      // add vector to the sum if they are in a certain range
      if (distance > 0 && distance < 20) {
        sum.add(other.velocity);
        count++;
      }
    }
    
    if (count > 0) {
      // sum = desired velocity
      sum.div(count);
      sum.setMag(maxSpeed);
      PVector steer = PVector.sub(sum, velocity);
      steer.limit(maxForce);
      applyForce(steer);
    }
  }
  
  void seperate() {
    float desiredSeperation = r*6;
    PVector sum = new PVector(0, 0);
    int count = 0;
    
    for (Vehicle other : vehicles) {
      float distance = PVector.dist(location, other.location);
      if (distance > 0 && distance < desiredSeperation) {
        // Vector pointing away from neighbour
        PVector difference = PVector.sub(location, other.location);
        difference.normalize();
        // weight the vector by its distance to the vehicle
        difference.div(distance);
        sum.add(difference);
        count++;
      }
    }
    
    if (count > 0) {
      // sum = desired velocity
      sum.div(count);
      sum.setMag(maxSpeed);
      PVector steer = PVector.sub(sum, velocity);
      steer.limit(maxForce);
      applyForce(steer);
    }
  }
  
  void cohesion() {
    float neighbourDistance = 50;
    PVector sum = new PVector(0, 0);
    int count = 0;
    
    for (Vehicle other : vehicles) {
      float distance = PVector.dist(location, other.location);
      if (distance > 0 && distance < neighbourDistance) {
        sum.add(other.location);
        count++;
      }
    }
    
    if (count > 0) {
      sum.div(count);
      seek(sum);
    }
  }
}
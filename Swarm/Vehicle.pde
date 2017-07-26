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
}
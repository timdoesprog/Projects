Vehicle[] vehicles;


void setup() {
  size(800, 800);
  vehicles = new Vehicle[10];
  for (int i = 0; i < vehicles.length; i++) {
    vehicles[i] = new Vehicle(random(width), random(height));
  }
}

void draw() {
  background(51);
  PVector mouse = new PVector(mouseX, mouseY);
  // draw ellipse where the mouse is
  fill(255);
  noStroke();
  ellipse(mouse.x, mouse.y, 16, 16);
  
  for (Vehicle v : vehicles) {
    v.arrive(mouse);
    v.update();
    v.display();
  }
}
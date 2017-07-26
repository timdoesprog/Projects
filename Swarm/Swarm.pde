ArrayList<Vehicle> vehicles;


void setup() {
  size(1200, 800);
  vehicles = new ArrayList<Vehicle>();
}

void draw() {
  background(51);
  for (Vehicle v : vehicles) {
    v.update();
    v.display();
  }
}

void mousePressed() {
  vehicles.add(new Vehicle(mouseX, mouseY));
}

void mouseDragged() {
  vehicles.add(new Vehicle(mouseX, mouseY));
}
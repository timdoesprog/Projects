Field field;
ArrayList<Vehicle> vehicles;


void setup() {
  size(800, 600);
  field = new Field(10);
  vehicles = new ArrayList<Vehicle>();
}


void draw() {
  background(51);
  for (Vehicle v : vehicles) {
    v.update();
    v.follow(field);
    v.display();
  }
}

void keyPressed() {
  if (key == ' ') {
    field.init();
  }
}

void mousePressed() {
  vehicles.add(new Vehicle(mouseX, mouseY));
}

void mouseDragged() {
  vehicles.add(new Vehicle(mouseX, mouseY));
}
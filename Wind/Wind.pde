Ball b;

void setup() {
  size(800, 500);
  b = new Ball(width/2, 0);
}

void draw() {
  background(51);
  int choice = int(random(0, 100));
  if (choice <= 1) {
    b.applyForce(new PVector(0.5, 0));
    b.airResistance();
  }
  b.update();
  b.display();
}
ArrayList<Circle> circles;
int cycles = 100;


void setup() {
  size(900, 600);
  circles = new ArrayList<Circle>();
}

void draw() {
  background(51);
  for (int i = 0; i < circles.size(); i++) {
    Circle c = circles.get(i);
    c.update();
    c.display();
  }
  if (cycles > 0) {
    spawnCircles(circles);
    cycles--;
  }
}


void spawnCircles(ArrayList<Circle> circles) {
  if (circles.size() == 0) {
    circles.add(new Circle(new PVector(random(width), random(height))));
  }
  else {
    int choice = int(random(circles.size() - 1));
    Circle c = circles.get(choice);
    // random position inside the circle
    PVector randomPosition = PVector.random2D().setMag(c.radius - 1);
    randomPosition.add(c.location);
    circles.add(new Circle(randomPosition));
  }
}
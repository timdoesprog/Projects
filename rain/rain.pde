Raindrop[] drops;

void setup() {
  size(600, 400);
  drops = new Raindrop[500];
  for (int i = 0; i < drops.length; i++) {
    drops[i] = new Raindrop(random(width), random(-500, -10));
  }
}

void draw() {
  background(51);
  for (int i = 0; i < drops.length; i++) {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector distanceVector = PVector.sub(mouse, new PVector(drops[i].x, drops[i].y));
    float distance = distanceVector.mag();
    if (distance < 50) {
      drops[i].visible = false;
    }
    drops[i].display();
    drops[i].update();
  }
}
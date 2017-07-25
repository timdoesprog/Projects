ChangingShapes cs;
ChangingTriangles ct;


void setup() {
  size(800, 800);
  cs = new ChangingShapes(75);
  ct = new ChangingTriangles(75);
}

void draw() {
  background(51);
  // uncomment for changing shapes
  //cs.start();
  ct.start();
}
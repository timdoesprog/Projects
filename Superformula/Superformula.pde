float t = 0;

void setup() {
  size(500, 500);
  noFill();
  stroke(255);
  strokeWeight(2);
}

void draw() {
  background(51);
  translate(width/2, height/2);
  beginShape();
  
  for (float theta = 0; theta <= TWO_PI; theta += 0.01) {
    float rad = superformula(theta,
      2, // a
      2, // b
      sin(t) * 10, // m 
      1, // n1
      sin(t) * 1.5 + 0.5, // n2
      cos(t) * 1.5 + 0.5  // n3
    );
    float x = rad * cos(theta) * 50;
    float y = rad * sin(theta) * 50;
    vertex(x, y);
  }
  
  endShape();
  t += 0.01;
}


float superformula(float theta, float a, float b, float m, float n1, float n2, float n3) {
  return pow(pow(abs(cos(m * theta / 4.0) / a), n2)
    + pow(abs(sin(m * theta / 4.0) / b), n3), -1.0 / n1);
}
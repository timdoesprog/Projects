int cols, rows;
int scale = 20;
int w = 1200;
int h = 1500;

float flying = 0;

float[][] terrain;

void setup() {
  size(600, 600, P3D);
  cols = w / scale;
  rows = h / scale;
  terrain = new float[cols][rows];
}

void draw() {
  flying -= 0.09;
  
  float yOff = flying;
  for (int y = 0; y < rows; y++) {
    float xOff = 0;
    for (int x = 0; x < cols; x++) {
       terrain[x][y] = map(noise(xOff, yOff), 0, 1, -90, 90); 
       xOff += 0.2;
    }
    yOff += 0.2;
  }

  
  background(51);
  noFill();

  translate(width/2, height/2);
  rotateX(PI/3);
  
  translate(-w/2, -h/2);
  
  for (int y = 0; y < rows - 1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      // lighter at the top, darker at the bottom
      stroke(map(terrain[x][y], -90, 90, 0, 255));
      
      // different colors green blue and white
      //if (terrain[x][y] < -40) {
      //  stroke(47, 86, 233);
      //}
      //else if (terrain[x][y] < 20) {
      //  stroke(0, 117, 58);
      //}
      //else {
      //  stroke(255);
      //}
      vertex(x * scale, y * scale, terrain[x][y]);
      vertex(x * scale, (y + 1) * scale, terrain[x][y+1]);
    }
    endShape();
  }
  
}
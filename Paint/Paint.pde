color[][] colors = new color[600][700];
int toolbarSize = 100;
Paintbrush brush;


void setup() {
  size(600, 700);
  brush = new Paintbrush();
  // white background
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      colors[x][y] = color(255);
    }
  }
  drawToolbar();
}


void draw() {
  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int index = x + y * width;
      pixels[index] = colors[x][y];
    }
  }
  updatePixels();
  noStroke();
  fill(brush.paintColor);
  ellipse(mouseX, mouseY, brush.size*2, brush.size*2);
}


void mouseDragged() {
  brush.drawCircle();
}

void mousePressed() {
  brush.updateColor(mouseX, mouseY);
  brush.drawCircle();
}

void keyPressed() {
  // adjust brushsize with arrowKeys
  if (keyCode == UP) {
    brush.changeSize(1);
  }
  else if (keyCode == DOWN) {
    brush.changeSize(-1);
  }
}
color[][] colors = new color[600][700];
int toolbarSize = 100;
color paintbrushColor = color(0);
int brushSize = 8;


void drawToolbar() {
  for (int x = 0; x < width; x++) {
    for (int y = height - toolbarSize; y < height; y++) {
      // shaded toolbar
      color c = color(map(x, 0, width-1, 0, 255));
      colors[x][y] = c;
    }
  }
}


// changes the brush color depending on where the mouse clicked
void updateBrushColor(int x, int y) {
  if (y < height - toolbarSize) {
    return;
  }
  paintbrushColor = colors[x][y];
}


// draws a circle around the mouse position with a given radius
void drawCircle(int radius) {
  // dont draw on the tool bar
  if (mouseY >= height - toolbarSize) {
    return;
  }
  for (int x = mouseX - radius; x < mouseX + radius; x++) {
    for (int y = mouseY - radius; y <mouseY + radius; y++) {
      float distance = dist(mouseX, mouseY, x, y);
      if (distance <= radius) {
        // check for out of bond at the edges of the canvas
        if (x >= 0 && x < width && y >= 0 && y < height) {
          colors[x][y] = paintbrushColor;
        }
      }
    }
  }
  // so overlapping circles get deleted
  drawToolbar();
}


void setup() {
  size(600, 700);
  // white background
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      colors[x][y] = color(255);
    }
  }
  drawToolbar();
}

// testing

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
  fill(paintbrushColor);
  ellipse(mouseX, mouseY, brushSize*2, brushSize*2);
}


void mouseDragged() {
  drawCircle(brushSize);
}

void mousePressed() {
  updateBrushColor(mouseX, mouseY);
  drawCircle(brushSize);
}

void keyPressed() {
  // adjust brushsize with arrowKeys
  if (keyCode == UP) {
    if (brushSize >= 32) {
      return;
    }
    brushSize++;
  }
  else if (keyCode == DOWN) {
    if (brushSize <= 1) {
      return;
    }
    brushSize--;
  }
}
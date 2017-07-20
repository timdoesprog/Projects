class Paintbrush {
  int MAXSIZE = 32;
  int MINSIZE = 1;
  color paintColor = color(0);
  int size = 8;
  
  // changes the brush color depending on where the mouse clicked
  // only changes color when cursor is over the toolbar
  void updateColor(int x, int y) {
    if (y < height - toolbarSize) {
      return;
    }
    paintColor = colors[x][y];
  }
  
  void changeSize(int factor) {
    if (size >= MAXSIZE || size <= MINSIZE) {
      return;
    }
    size += factor;
  }
  
  // draws a circle around the mouse position with a given radius
  void drawCircle() {
    // dont draw on the tool bar
    if (mouseY >= height - toolbarSize) {
      return;
    }
    for (int x = mouseX - size; x < mouseX + size; x++) {
      for (int y = mouseY - size; y <mouseY + size; y++) {
        float distance = dist(mouseX, mouseY, x, y);
        if (distance <= size) {
          // check for out of bond at the edges of the canvas
          if (x >= 0 && x < width && y >= 0 && y < height) {
            // colors[x][y] = paintColor;
            colors[x][y] = overlayColor(colors[x][y]);
          }
        }
      }
    }
    // so overlapping circles get deleted
    drawToolbar();
  }
  
  color overlayColor(color current) {
    float r = (red(current) + red(paintColor)) / 2;
    float g = (green(current) + green(paintColor)) / 2;
    float b = (blue(current) + blue(paintColor)) / 2;
    return color(r, g, b);
  }
}
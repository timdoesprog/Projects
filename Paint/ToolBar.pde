// draws the toolbar at the bottom of the screen
// global toolbar size gives the height of the toolbar

void drawToolbar() {
  // gray scale
  for (int x = 0; x < width/4; x++) {
    for (int y = height - toolbarSize; y < height; y++) {
      color c = color(map(x, 0, (width-1)/4, 0, 255));
      colors[x][y] = c;
    }
  }
  // red scale
  for (int x = width/4; x < 2 * width/4; x++) {
    for (int y = height - toolbarSize; y < height; y++) {
      color c = color(map(x, width/4, 2*(width-1)/4, 0, 255), 0, 0);
      colors[x][y] = c;
    }
  }
  // green scale
  for (int x = 2 * width/4; x < 3 * width/4; x++) {
    for (int y = height - toolbarSize; y < height; y++) {
      color c = color(0, map(x, 2 * width/4, 3 * (width-1)/4, 0, 255), 0);
      colors[x][y] = c;
    }
  }
  // blue scale
  for (int x = 3 * width/4; x < width; x++) {
    for (int y = height - toolbarSize; y < height; y++) {
      color c = color(0, 0, map(x, 3 * width/4, width-1, 0, 255));
      colors[x][y] = c;
    }
  }
}